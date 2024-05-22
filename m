Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6B2C25B79
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 16:19:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14CE10E1BB;
	Wed, 22 May 2024 16:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ED8lPmsL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5903C10E1BB
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 16:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716394760; x=1747930760;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jrVZYwsrk2OKlfLsMAO19CCV8h5oBhqpKCnFgSAwN4c=;
 b=ED8lPmsLDbUe9c9CXiD3k/dZ14Ofx/wHMWMFp5qbRuj5ffxPz19ipZmb
 VL52CrD3d3/3tRYo9HTrlnA9pMaTxu08knrC7YedZrYqcJo9UkuwN4aJJ
 jbcXmYIK4YDQ0uXJsHV0b4Ix+Eki9sUagRMZb2zprQ6nQnE2ysl4JfOk9
 X8bHeWBpqePILankil+QUir98VNOi37n8vk6N2b+ZJ5sBk4VvrrIABqQz
 bUyv6Xmm5rKABKHenjyWcD64ajeuKB33EKnZ1KvCD+QDFQAJ2Tx1q2zFG
 l6vZ4e7kDr++YLPYgbHd9hEs+UHkmRH7Wb/lpj24i2D+NSmhbqiJysuFL Q==;
X-CSE-ConnectionGUID: WxL0SE7cQGqyHOGRdDCT7Q==
X-CSE-MsgGUID: VFz490dSQAyAy/kymFpC0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12443835"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="12443835"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 09:19:19 -0700
X-CSE-ConnectionGUID: bisZROyoRmuqggU9mVNqCA==
X-CSE-MsgGUID: oDz3eTjiQ+KrZHg5JhBJ9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="37732954"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 09:19:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 09:19:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 09:19:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 09:19:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 09:19:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dptmibjh2cLwbXQUD8NSs41/OIoSkk269NgHe4hUTfm1EMJt6o/uf7WJ6CH+TkKR+7dbPRMb7puP1uPVmceVnqKiugHnwf5NfHfDBI7Hhl+z31Z56fWTgaDMIj7IZB5qhH+YqUFvfBJbmj0VSQPziunp8DR/fk85q5Kr6IcrPDzqsJ0LeONS+TVKKtj9IhmD/iNJffPo6aJH17G1nyRaa/azSFOoJvWBKdq/OSj+rWzsy/zP+TADXlHvBI5I/wCFWM0/moWJeeOrhvB21G66AmqFOLBJNM04UJGpQHHRyKVaUoIWHotVcHzUlSl08DpUChBpfgAtqDQ4oIiGrNr1TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ExYAzaBwm8sBfQyBPAEhc/xo+ChkDB12z6bS1piYXY=;
 b=Vr/yG3IRPPlaXRb1yM4gjevKQCISDXs6BzkM19L3paqhfGxAG6NCQX5af4Znjz6xh/eSqzU6ySC152PtyWj1ejNyG3c1RJiNkMjuyjO+dTZAlr1ipP38B+ELzllx0Y6bNl53VrSdMcFg89/o5nHTvlIl/1xvnErFzTn+n8akJ7jNRl2s9FMDyt4rdd4Y4h955YusUzPMGTQBrEyHicb1z/O3AXhF0Aw5dzPkiMBYH+mwJpiFQTLg93kAIr9am1jq3pvCkgPxUjDpBsYVtCmVquKUv3koOdeScVqyANMjZVJPnu+2Ah0DV9dT91Z1N63ft1IyOBNCEr6T7zPvPt8lcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6244.namprd11.prod.outlook.com (2603:10b6:208:3e6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.21; Wed, 22 May
 2024 16:19:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 16:19:11 +0000
Date: Wed, 22 May 2024 12:19:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 09/10] lib: sync i915_pciids.h with kernel commit
 cfa7772880f8
Message-ID: <Zk4a--oPBPyXpGdp@intel.com>
References: <cover.1716373923.git.jani.nikula@intel.com>
 <1169624c0eec31debb23f582cb6e319f496d2aed.1716373923.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1169624c0eec31debb23f582cb6e319f496d2aed.1716373923.git.jani.nikula@intel.com>
X-ClientProxiedBy: BY5PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:a03:180::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6244:EE_
X-MS-Office365-Filtering-Correlation-Id: 5128f8fb-8955-4fdc-da7a-08dc7a7ae9c4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Bm7zVErD2mY9mibvtm8sickrjJuzG30ejRfytQUgcQmKtquXJ6mSB3k/8RNV?=
 =?us-ascii?Q?pgVf/5DzjaB2I/qkEIN/3alEYETHppgk11XQNHbyRUIYCh96Gj2ABNjdPBiM?=
 =?us-ascii?Q?zSCMhjrjMBRwuevB0aosE3+cLXKvUH3Ilm6fBgblvxb5I4yAGJ5yq2WghhP/?=
 =?us-ascii?Q?Ldi/8UscnEEM0AFkSIUXqg+JdVRzLstCUHxbTsOEQHwjgeGxfNLPBDFWG9Dk?=
 =?us-ascii?Q?WW74Rd7XssMwh/pveVBxHkcp9Ziq8fq+mXJBWRnmlu/o6+3uXSgaGOavdRKG?=
 =?us-ascii?Q?OiuCaQLQMc3iYPsvoHso/c9XQCaybG6ilzawGQUgfY5vrhyLXF9qJAYdvKNV?=
 =?us-ascii?Q?naYy9jL/xUkzuJV6OqL5B7es5zTtPrudNVirobm9voDG69w0yAXueO8bIJ35?=
 =?us-ascii?Q?B0z62H6hYmrMeFg9l4wmal9wO3yejEL6XYknsVN/EFrjHdDp8jiXe0Cn+IGG?=
 =?us-ascii?Q?bs0zD+BSAbziBgw3nK7vNzLfzoqOj5vHXGyYZL9uvNVdi8jaKCmTcoVBTwmO?=
 =?us-ascii?Q?0k2r+WdC2xHvOVlBKsOBDU895/Au1olrHlq6IDCJ8nVFUvubc8j4ifE3W2V7?=
 =?us-ascii?Q?6fwnLX0oc1Bgjsy6bbe+Jac49vUvX1bRESZtWvgrpZ2FrMxC0d/TjGWaUiom?=
 =?us-ascii?Q?mo3nAaZvpsr58JXzkhhCx14BfZ1ovuZmfp41WcrgKb63rrqrmAa24FpyP17v?=
 =?us-ascii?Q?gq8FF66NrqX+w4dRzV0q+tQhacgP9jy3Kn5ljsMvzULqn6ds06XpVaYu3+3B?=
 =?us-ascii?Q?uyvqz6CbNR2lJCtu20esLToOWd9z7h6Xocs9lz4ueRS3XwA4CSfpUPlxhMAN?=
 =?us-ascii?Q?XEoJ/JDal7Dp4yvf7em5g2euAeHz0dhwpuhuQtMk4tBPtvNZhM2kszz+vkBl?=
 =?us-ascii?Q?JTT42bdU2IkNMBUhND9YcmQj8szP2yN8tWBKudX048Wwpu1JgL2+CkjVL+eX?=
 =?us-ascii?Q?fagE3PAJSPVxUKw2RLlgwUW3y1aXrvCDbOMgB/iao5+tb4YC4r6GmQW7pHDc?=
 =?us-ascii?Q?6WnxG18lz2qY6h1lMwIM0BnFNZ3fMw4/7NeZ9T8Mb8Q12ZunBguuPCRkx9rC?=
 =?us-ascii?Q?YlnRJJDSgy/Vx1InT5KLTh9kxsAMhEJ5438WNlF0iScsGFfEInb/54kaSTEA?=
 =?us-ascii?Q?Rv7tSZC5Jn/I4A+FvJhkqOjLL9GXlRw271vufhmkXiLLjuupkUl2hIHS5KAA?=
 =?us-ascii?Q?CUl8EDBC73S3L+1CeoTXStoVJ/sCxi5JAWjaEuJATa+IC6rcSBJhnoLU/Bpv?=
 =?us-ascii?Q?KzUFC3yxmwgdHR6lbiV89WtJTW62qO4OwzWD5819zw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/hvwLZ4qViRLSctkLtXeIG2JBh+HcbC2LwA8EA6T61jKLaxdnIFG3v6WFSy8?=
 =?us-ascii?Q?rYYvhYYXJY3sbrsoXLmXl/17T8NiO29ilMrsv+KoyzFkxUkTh82tQdLfQCCE?=
 =?us-ascii?Q?FL5Y1oSbxmFSkSW+RU6t+Jt1vIWor6UEqmMtOHjsPEMaC2x7XU2pljGMYrwP?=
 =?us-ascii?Q?jR3f+G1o97Dy4O1BujAqrPyNHOKGI1mxINENwsFTC5JRes7kh7rtW38NYa0u?=
 =?us-ascii?Q?BvOBsR6DmTYhLCbqJHo5jiZUPNANXBUiLuffE2XYcwOxsjsL2CEgfef6B/Be?=
 =?us-ascii?Q?ytGusm724imx/OZQzU/0VCf7rhvQzUS2BPbQTLG6TlXI8fbPMFvR2y926ptq?=
 =?us-ascii?Q?JQyU62sp1ARLujecW1XI45YqQ+11YWEz7h2LhqRg6Wn/l1bJPftXVATv9DNa?=
 =?us-ascii?Q?siiWrVWIUhWwXbTLETtkV58mil6I3lE9sLHrjg2/3oA2iDlMsnGc08OJime3?=
 =?us-ascii?Q?x3tkgzfwWMWk36WrqMO+p2S7S/4iPH2I5Z0opzU8XPhi/nQrr1FIsKI0eVJx?=
 =?us-ascii?Q?e4NDb2T2/1WA7opIqdRRiGy9ZDPF4faAVBWeGHggJXjNpWziASoPP3BjMdo0?=
 =?us-ascii?Q?yZTLiVlDUijbN79ReN72NXNnz3zIbkHzlXwLCIbqIPCD3oYx8lmZNo2JUD/6?=
 =?us-ascii?Q?jt54po474IYyOlN/3fk+jtWXKFLVzV1b4AM4xDd4Zd3HrBHN/zX1HOionqX2?=
 =?us-ascii?Q?Wx93cQaeaW4Tq+8X9Sb8Jlin8/3tgqePcK3WbxAbaO11IFcoHbGnk0AgsmJx?=
 =?us-ascii?Q?W59Jjmz5niZgE42mU1LycxTmdFZ7hbfyrk3+Xsoyo4fuavK40dWD/PZbdx5m?=
 =?us-ascii?Q?KS9TI7az4/GwjA7VG3NiKSb0pGE2F7UvQANh1esZqIk7/4MpzgqUkXDFURGc?=
 =?us-ascii?Q?7rbvNSIu/KsfNefBLxRH03cE/KsOmbfKO8IS+fxVUe4d5n+p9Xkk7PVV2KZh?=
 =?us-ascii?Q?PICdd9ox7xFoh/i+uRA/dylzMoRr6D+XHvJZ4azvDcx6J0MzPApBi2DJ50pm?=
 =?us-ascii?Q?T4Cq35xkumQSoNzFeAZNVQQDHSkRUFy0Ri2j7JhPJFFnh64c4si9hNgMA4Tq?=
 =?us-ascii?Q?/r0Y4UvC8lKUFAzJZFeXA0ZFIQgPuNt8xny7EvD+mCEsytsGt6FedxBVbgEh?=
 =?us-ascii?Q?X+4cyqy87lI56sbW+JoKiRPvoPJfrieSlKuoud5ZZ39A9elhe+aE6UWzo2pg?=
 =?us-ascii?Q?uFafkEZAFTh/zAI8X2NhOmJ5eynhtt6J6awendPTuQBMZQ4C8pgUMIK+YNfs?=
 =?us-ascii?Q?VNePXE9CKB9+M/kG6dYPpegydrN+U2nPLmx9GwTvLzxzP/gKs3566yCC60hH?=
 =?us-ascii?Q?Is/0GTec9GwIN70SACjVi3eXc/3L04U0oVVwj1yrwEwj5GV02MmXQLHOY8bY?=
 =?us-ascii?Q?fNqPVKg+MO4Ml/zXgkfuuwzK7IiHPs8hfI+ZY8ZZatYO9lFk0SSP9P4f/+LH?=
 =?us-ascii?Q?TQbqv9k8XtNeNr3YOpBpwE8ny8nCpL9T/Z6OE7WKszfoBaAQEGAH7M7wzQJu?=
 =?us-ascii?Q?bZGWF8tDCJ5qIYqRvP3hOtwGCJCjTKcXqxZSvL8nBI2kJUKmR/meFbGq4j0t?=
 =?us-ascii?Q?StUU1G2mFT5LPOTeol5ooubx/yKndnjCJ3XNEzlTCZXYnZE/c24SovvwlXxa?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5128f8fb-8955-4fdc-da7a-08dc7a7ae9c4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 16:19:11.1054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KZZvvIo0sVTpBqOh8LyTPr0l5Djuxz99Vn4jXe6Rn8DDUEOvYU4t2KCl4KfNzxsb4vTk//UCpytaoEHlcCvrew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6244
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

On Wed, May 22, 2024 at 01:35:22PM +0300, Jani Nikula wrote:
> Synchronize i915_pciids.h with kernel commit:
> 
> cfa7772880f8 ("drm/i915/pciids: switch to xe driver style PCI ID macros")
> 
> and update the macro usage in intel_device_info.c and perf.c. In the
> latter, directly take advantage of the possibility to pass in the macro
> to use.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  lib/i915/perf.c         |   21 +-
>  lib/i915_pciids.h       | 1348 +++++++++++++++++++--------------------
>  lib/intel_device_info.c |  148 ++---
>  3 files changed, 755 insertions(+), 762 deletions(-)
> 
> diff --git a/lib/i915/perf.c b/lib/i915/perf.c
> index 9333edfebb5b..4b00ba5de9d4 100644
> --- a/lib/i915/perf.c
> +++ b/lib/i915/perf.c
> @@ -155,16 +155,15 @@ unsupported_i915_perf_platform(struct intel_perf *perf)
>  	return NULL;
>  }
>  
> +#define ID(id) (id)
> +
>  static bool
>  is_acm_gt1(const struct intel_perf_devinfo *devinfo)
>  {
> -#undef INTEL_VGA_DEVICE
> -#define INTEL_VGA_DEVICE(_id, _info) _id
>  	static const uint32_t devids[] = {
> -		INTEL_DG2_G11_IDS(NULL),
> -		INTEL_ATS_M75_IDS(NULL),
> +		INTEL_DG2_G11_IDS(ID),
> +		INTEL_ATS_M75_IDS(ID),
>  	};
> -#undef INTEL_VGA_DEVICE
>  	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
>  		if (devids[i] == devinfo->devid)
>  			return true;
> @@ -176,12 +175,9 @@ is_acm_gt1(const struct intel_perf_devinfo *devinfo)
>  static bool
>  is_acm_gt2(const struct intel_perf_devinfo *devinfo)
>  {
> -#undef INTEL_VGA_DEVICE
> -#define INTEL_VGA_DEVICE(_id, _info) _id
>  	static const uint32_t devids[] = {
> -		INTEL_DG2_G12_IDS(NULL),
> +		INTEL_DG2_G12_IDS(ID),
>  	};
> -#undef INTEL_VGA_DEVICE
>  	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
>  		if (devids[i] == devinfo->devid)
>  			return true;
> @@ -193,13 +189,10 @@ is_acm_gt2(const struct intel_perf_devinfo *devinfo)
>  static bool
>  is_acm_gt3(const struct intel_perf_devinfo *devinfo)
>  {
> -#undef INTEL_VGA_DEVICE
> -#define INTEL_VGA_DEVICE(_id, _info) _id
>  	static const uint32_t devids[] = {
> -		INTEL_DG2_G10_IDS(NULL),
> -		INTEL_ATS_M150_IDS(NULL),
> +		INTEL_DG2_G10_IDS(ID),
> +		INTEL_ATS_M150_IDS(ID),
>  	};
> -#undef INTEL_VGA_DEVICE

nice clean-up

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


>  	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
>  		if (devids[i] == devinfo->devid)
>  			return true;
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index 04f6ca3dc5c1..3e39d644ebaa 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -35,752 +35,752 @@
>   * Don't use C99 here because "class" is reserved and we want to
>   * give userspace flexibility.
>   */
> -#define INTEL_VGA_DEVICE(id, info) {		\
> -	0x8086,	id,				\
> -	~0, ~0,					\
> -	0x030000, 0xff0000,			\
> +#define INTEL_VGA_DEVICE(id, info) { \
> +	0x8086,	id, \
> +	~0, ~0, \
> +	0x030000, 0xff0000, \
>  	(unsigned long) info }
>  
> -#define INTEL_QUANTA_VGA_DEVICE(info) {		\
> -	0x8086,	0x16a,				\
> -	0x152d,	0x8990,				\
> -	0x030000, 0xff0000,			\
> +#define INTEL_QUANTA_VGA_DEVICE(info) { \
> +	0x8086,	0x16a, \
> +	0x152d,	0x8990, \
> +	0x030000, 0xff0000, \
>  	(unsigned long) info }
>  
> -#define INTEL_I810_IDS(info)					\
> -	INTEL_VGA_DEVICE(0x7121, info), /* I810 */		\
> -	INTEL_VGA_DEVICE(0x7123, info), /* I810_DC100 */	\
> -	INTEL_VGA_DEVICE(0x7125, info)  /* I810_E */
> +#define INTEL_I810_IDS(MACRO__, ...) \
> +	MACRO__(0x7121, ## __VA_ARGS__), /* I810 */ \
> +	MACRO__(0x7123, ## __VA_ARGS__), /* I810_DC100 */ \
> +	MACRO__(0x7125, ## __VA_ARGS__)  /* I810_E */
>  
> -#define INTEL_I815_IDS(info)					\
> -	INTEL_VGA_DEVICE(0x1132, info)  /* I815*/
> +#define INTEL_I815_IDS(MACRO__, ...) \
> +	MACRO__(0x1132, ## __VA_ARGS__)  /* I815*/
>  
> -#define INTEL_I830_IDS(info)				\
> -	INTEL_VGA_DEVICE(0x3577, info)
> +#define INTEL_I830_IDS(MACRO__, ...) \
> +	MACRO__(0x3577, ## __VA_ARGS__)
>  
> -#define INTEL_I845G_IDS(info)				\
> -	INTEL_VGA_DEVICE(0x2562, info)
> +#define INTEL_I845G_IDS(MACRO__, ...) \
> +	MACRO__(0x2562, ## __VA_ARGS__)
>  
> -#define INTEL_I85X_IDS(info)				\
> -	INTEL_VGA_DEVICE(0x3582, info), /* I855_GM */ \
> -	INTEL_VGA_DEVICE(0x358e, info)
> +#define INTEL_I85X_IDS(MACRO__, ...) \
> +	MACRO__(0x3582, ## __VA_ARGS__), /* I855_GM */ \
> +	MACRO__(0x358e, ## __VA_ARGS__)
>  
> -#define INTEL_I865G_IDS(info)				\
> -	INTEL_VGA_DEVICE(0x2572, info) /* I865_G */
> +#define INTEL_I865G_IDS(MACRO__, ...) \
> +	MACRO__(0x2572, ## __VA_ARGS__) /* I865_G */
>  
> -#define INTEL_I915G_IDS(info)				\
> -	INTEL_VGA_DEVICE(0x2582, info), /* I915_G */ \
> -	INTEL_VGA_DEVICE(0x258a, info)  /* E7221_G */
> +#define INTEL_I915G_IDS(MACRO__, ...) \
> +	MACRO__(0x2582, ## __VA_ARGS__), /* I915_G */ \
> +	MACRO__(0x258a, ## __VA_ARGS__)  /* E7221_G */
>  
> -#define INTEL_I915GM_IDS(info)				\
> -	INTEL_VGA_DEVICE(0x2592, info) /* I915_GM */
> +#define INTEL_I915GM_IDS(MACRO__, ...) \
> +	MACRO__(0x2592, ## __VA_ARGS__) /* I915_GM */
>  
> -#define INTEL_I945G_IDS(info)				\
> -	INTEL_VGA_DEVICE(0x2772, info) /* I945_G */
> +#define INTEL_I945G_IDS(MACRO__, ...) \
> +	MACRO__(0x2772, ## __VA_ARGS__) /* I945_G */
>  
> -#define INTEL_I945GM_IDS(info)				\
> -	INTEL_VGA_DEVICE(0x27a2, info), /* I945_GM */ \
> -	INTEL_VGA_DEVICE(0x27ae, info)  /* I945_GME */
> +#define INTEL_I945GM_IDS(MACRO__, ...) \
> +	MACRO__(0x27a2, ## __VA_ARGS__), /* I945_GM */ \
> +	MACRO__(0x27ae, ## __VA_ARGS__)  /* I945_GME */
>  
> -#define INTEL_I965G_IDS(info)				\
> -	INTEL_VGA_DEVICE(0x2972, info), /* I946_GZ */	\
> -	INTEL_VGA_DEVICE(0x2982, info),	/* G35_G */	\
> -	INTEL_VGA_DEVICE(0x2992, info),	/* I965_Q */	\
> -	INTEL_VGA_DEVICE(0x29a2, info)	/* I965_G */
> +#define INTEL_I965G_IDS(MACRO__, ...) \
> +	MACRO__(0x2972, ## __VA_ARGS__), /* I946_GZ */ \
> +	MACRO__(0x2982, ## __VA_ARGS__),	/* G35_G */ \
> +	MACRO__(0x2992, ## __VA_ARGS__),	/* I965_Q */ \
> +	MACRO__(0x29a2, ## __VA_ARGS__)	/* I965_G */
>  
> -#define INTEL_G33_IDS(info)				\
> -	INTEL_VGA_DEVICE(0x29b2, info), /* Q35_G */ \
> -	INTEL_VGA_DEVICE(0x29c2, info),	/* G33_G */ \
> -	INTEL_VGA_DEVICE(0x29d2, info)	/* Q33_G */
> +#define INTEL_G33_IDS(MACRO__, ...) \
> +	MACRO__(0x29b2, ## __VA_ARGS__), /* Q35_G */ \
> +	MACRO__(0x29c2, ## __VA_ARGS__),	/* G33_G */ \
> +	MACRO__(0x29d2, ## __VA_ARGS__)	/* Q33_G */
>  
> -#define INTEL_I965GM_IDS(info)				\
> -	INTEL_VGA_DEVICE(0x2a02, info),	/* I965_GM */ \
> -	INTEL_VGA_DEVICE(0x2a12, info)  /* I965_GME */
> +#define INTEL_I965GM_IDS(MACRO__, ...) \
> +	MACRO__(0x2a02, ## __VA_ARGS__),	/* I965_GM */ \
> +	MACRO__(0x2a12, ## __VA_ARGS__)  /* I965_GME */
>  
> -#define INTEL_GM45_IDS(info)				\
> -	INTEL_VGA_DEVICE(0x2a42, info) /* GM45_G */
> +#define INTEL_GM45_IDS(MACRO__, ...) \
> +	MACRO__(0x2a42, ## __VA_ARGS__) /* GM45_G */
>  
> -#define INTEL_G45_IDS(info)				\
> -	INTEL_VGA_DEVICE(0x2e02, info), /* IGD_E_G */ \
> -	INTEL_VGA_DEVICE(0x2e12, info), /* Q45_G */ \
> -	INTEL_VGA_DEVICE(0x2e22, info), /* G45_G */ \
> -	INTEL_VGA_DEVICE(0x2e32, info), /* G41_G */ \
> -	INTEL_VGA_DEVICE(0x2e42, info), /* B43_G */ \
> -	INTEL_VGA_DEVICE(0x2e92, info)	/* B43_G.1 */
> -
> -#define INTEL_PNV_G_IDS(info) \
> -	INTEL_VGA_DEVICE(0xa001, info)
> -
> -#define INTEL_PNV_M_IDS(info) \
> -	INTEL_VGA_DEVICE(0xa011, info)
> -
> -#define INTEL_PNV_IDS(info) \
> -	INTEL_PNV_G_IDS(info), \
> -	INTEL_PNV_M_IDS(info)
> -
> -#define INTEL_ILK_D_IDS(info) \
> -	INTEL_VGA_DEVICE(0x0042, info)
> -
> -#define INTEL_ILK_M_IDS(info) \
> -	INTEL_VGA_DEVICE(0x0046, info)
> -
> -#define INTEL_ILK_IDS(info) \
> -	INTEL_ILK_D_IDS(info), \
> -	INTEL_ILK_M_IDS(info)
> -
> -#define INTEL_SNB_D_GT1_IDS(info) \
> -	INTEL_VGA_DEVICE(0x0102, info), \
> -	INTEL_VGA_DEVICE(0x010A, info)
> -
> -#define INTEL_SNB_D_GT2_IDS(info) \
> -	INTEL_VGA_DEVICE(0x0112, info), \
> -	INTEL_VGA_DEVICE(0x0122, info)
> -
> -#define INTEL_SNB_D_IDS(info) \
> -	INTEL_SNB_D_GT1_IDS(info), \
> -	INTEL_SNB_D_GT2_IDS(info)
> -
> -#define INTEL_SNB_M_GT1_IDS(info) \
> -	INTEL_VGA_DEVICE(0x0106, info)
> -
> -#define INTEL_SNB_M_GT2_IDS(info) \
> -	INTEL_VGA_DEVICE(0x0116, info), \
> -	INTEL_VGA_DEVICE(0x0126, info)
> -
> -#define INTEL_SNB_M_IDS(info) \
> -	INTEL_SNB_M_GT1_IDS(info), \
> -	INTEL_SNB_M_GT2_IDS(info)
> -
> -#define INTEL_SNB_IDS(info) \
> -	INTEL_SNB_D_IDS(info), \
> -	INTEL_SNB_M_IDS(info)
> -
> -#define INTEL_IVB_M_GT1_IDS(info) \
> -	INTEL_VGA_DEVICE(0x0156, info) /* GT1 mobile */
> -
> -#define INTEL_IVB_M_GT2_IDS(info) \
> -	INTEL_VGA_DEVICE(0x0166, info) /* GT2 mobile */
> -
> -#define INTEL_IVB_M_IDS(info) \
> -	INTEL_IVB_M_GT1_IDS(info), \
> -	INTEL_IVB_M_GT2_IDS(info)
> -
> -#define INTEL_IVB_D_GT1_IDS(info) \
> -	INTEL_VGA_DEVICE(0x0152, info), /* GT1 desktop */ \
> -	INTEL_VGA_DEVICE(0x015a, info)  /* GT1 server */
> -
> -#define INTEL_IVB_D_GT2_IDS(info) \
> -	INTEL_VGA_DEVICE(0x0162, info), /* GT2 desktop */ \
> -	INTEL_VGA_DEVICE(0x016a, info)  /* GT2 server */
> -
> -#define INTEL_IVB_D_IDS(info) \
> -	INTEL_IVB_D_GT1_IDS(info), \
> -	INTEL_IVB_D_GT2_IDS(info)
> -
> -#define INTEL_IVB_IDS(info) \
> -	INTEL_IVB_M_IDS(info), \
> -	INTEL_IVB_D_IDS(info)
> -
> -#define INTEL_IVB_Q_IDS(info) \
> -	INTEL_QUANTA_VGA_DEVICE(info) /* Quanta transcode */
> -
> -#define INTEL_HSW_ULT_GT1_IDS(info) \
> -	INTEL_VGA_DEVICE(0x0A02, info), /* ULT GT1 desktop */ \
> -	INTEL_VGA_DEVICE(0x0A06, info), /* ULT GT1 mobile */ \
> -	INTEL_VGA_DEVICE(0x0A0A, info), /* ULT GT1 server */ \
> -	INTEL_VGA_DEVICE(0x0A0B, info)  /* ULT GT1 reserved */
> -
> -#define INTEL_HSW_ULX_GT1_IDS(info) \
> -	INTEL_VGA_DEVICE(0x0A0E, info) /* ULX GT1 mobile */
> -
> -#define INTEL_HSW_GT1_IDS(info) \
> -	INTEL_HSW_ULT_GT1_IDS(info), \
> -	INTEL_HSW_ULX_GT1_IDS(info), \
> -	INTEL_VGA_DEVICE(0x0402, info), /* GT1 desktop */ \
> -	INTEL_VGA_DEVICE(0x0406, info), /* GT1 mobile */ \
> -	INTEL_VGA_DEVICE(0x040A, info), /* GT1 server */ \
> -	INTEL_VGA_DEVICE(0x040B, info), /* GT1 reserved */ \
> -	INTEL_VGA_DEVICE(0x040E, info), /* GT1 reserved */ \
> -	INTEL_VGA_DEVICE(0x0C02, info), /* SDV GT1 desktop */ \
> -	INTEL_VGA_DEVICE(0x0C06, info), /* SDV GT1 mobile */ \
> -	INTEL_VGA_DEVICE(0x0C0A, info), /* SDV GT1 server */ \
> -	INTEL_VGA_DEVICE(0x0C0B, info), /* SDV GT1 reserved */ \
> -	INTEL_VGA_DEVICE(0x0C0E, info), /* SDV GT1 reserved */ \
> -	INTEL_VGA_DEVICE(0x0D02, info), /* CRW GT1 desktop */ \
> -	INTEL_VGA_DEVICE(0x0D06, info), /* CRW GT1 mobile */	\
> -	INTEL_VGA_DEVICE(0x0D0A, info), /* CRW GT1 server */ \
> -	INTEL_VGA_DEVICE(0x0D0B, info), /* CRW GT1 reserved */ \
> -	INTEL_VGA_DEVICE(0x0D0E, info)  /* CRW GT1 reserved */
> -
> -#define INTEL_HSW_ULT_GT2_IDS(info) \
> -	INTEL_VGA_DEVICE(0x0A12, info), /* ULT GT2 desktop */ \
> -	INTEL_VGA_DEVICE(0x0A16, info), /* ULT GT2 mobile */	\
> -	INTEL_VGA_DEVICE(0x0A1A, info), /* ULT GT2 server */ \
> -	INTEL_VGA_DEVICE(0x0A1B, info)  /* ULT GT2 reserved */ \
> -
> -#define INTEL_HSW_ULX_GT2_IDS(info) \
> -	INTEL_VGA_DEVICE(0x0A1E, info) /* ULX GT2 mobile */ \
> -
> -#define INTEL_HSW_GT2_IDS(info) \
> -	INTEL_HSW_ULT_GT2_IDS(info), \
> -	INTEL_HSW_ULX_GT2_IDS(info), \
> -	INTEL_VGA_DEVICE(0x0412, info), /* GT2 desktop */ \
> -	INTEL_VGA_DEVICE(0x0416, info), /* GT2 mobile */ \
> -	INTEL_VGA_DEVICE(0x041A, info), /* GT2 server */ \
> -	INTEL_VGA_DEVICE(0x041B, info), /* GT2 reserved */ \
> -	INTEL_VGA_DEVICE(0x041E, info), /* GT2 reserved */ \
> -	INTEL_VGA_DEVICE(0x0C12, info), /* SDV GT2 desktop */ \
> -	INTEL_VGA_DEVICE(0x0C16, info), /* SDV GT2 mobile */ \
> -	INTEL_VGA_DEVICE(0x0C1A, info), /* SDV GT2 server */ \
> -	INTEL_VGA_DEVICE(0x0C1B, info), /* SDV GT2 reserved */ \
> -	INTEL_VGA_DEVICE(0x0C1E, info), /* SDV GT2 reserved */ \
> -	INTEL_VGA_DEVICE(0x0D12, info), /* CRW GT2 desktop */ \
> -	INTEL_VGA_DEVICE(0x0D16, info), /* CRW GT2 mobile */ \
> -	INTEL_VGA_DEVICE(0x0D1A, info), /* CRW GT2 server */ \
> -	INTEL_VGA_DEVICE(0x0D1B, info), /* CRW GT2 reserved */ \
> -	INTEL_VGA_DEVICE(0x0D1E, info)  /* CRW GT2 reserved */
> -
> -#define INTEL_HSW_ULT_GT3_IDS(info) \
> -	INTEL_VGA_DEVICE(0x0A22, info), /* ULT GT3 desktop */ \
> -	INTEL_VGA_DEVICE(0x0A26, info), /* ULT GT3 mobile */ \
> -	INTEL_VGA_DEVICE(0x0A2A, info), /* ULT GT3 server */ \
> -	INTEL_VGA_DEVICE(0x0A2B, info), /* ULT GT3 reserved */ \
> -	INTEL_VGA_DEVICE(0x0A2E, info)  /* ULT GT3 reserved */
> -
> -#define INTEL_HSW_GT3_IDS(info) \
> -	INTEL_HSW_ULT_GT3_IDS(info), \
> -	INTEL_VGA_DEVICE(0x0422, info), /* GT3 desktop */ \
> -	INTEL_VGA_DEVICE(0x0426, info), /* GT3 mobile */ \
> -	INTEL_VGA_DEVICE(0x042A, info), /* GT3 server */ \
> -	INTEL_VGA_DEVICE(0x042B, info), /* GT3 reserved */ \
> -	INTEL_VGA_DEVICE(0x042E, info), /* GT3 reserved */ \
> -	INTEL_VGA_DEVICE(0x0C22, info), /* SDV GT3 desktop */ \
> -	INTEL_VGA_DEVICE(0x0C26, info), /* SDV GT3 mobile */ \
> -	INTEL_VGA_DEVICE(0x0C2A, info), /* SDV GT3 server */ \
> -	INTEL_VGA_DEVICE(0x0C2B, info), /* SDV GT3 reserved */ \
> -	INTEL_VGA_DEVICE(0x0C2E, info), /* SDV GT3 reserved */ \
> -	INTEL_VGA_DEVICE(0x0D22, info), /* CRW GT3 desktop */ \
> -	INTEL_VGA_DEVICE(0x0D26, info), /* CRW GT3 mobile */ \
> -	INTEL_VGA_DEVICE(0x0D2A, info), /* CRW GT3 server */ \
> -	INTEL_VGA_DEVICE(0x0D2B, info), /* CRW GT3 reserved */ \
> -	INTEL_VGA_DEVICE(0x0D2E, info)  /* CRW GT3 reserved */
> -
> -#define INTEL_HSW_IDS(info) \
> -	INTEL_HSW_GT1_IDS(info), \
> -	INTEL_HSW_GT2_IDS(info), \
> -	INTEL_HSW_GT3_IDS(info)
> -
> -#define INTEL_VLV_IDS(info) \
> -	INTEL_VGA_DEVICE(0x0f30, info), \
> -	INTEL_VGA_DEVICE(0x0f31, info), \
> -	INTEL_VGA_DEVICE(0x0f32, info), \
> -	INTEL_VGA_DEVICE(0x0f33, info)
> -
> -#define INTEL_BDW_ULT_GT1_IDS(info) \
> -	INTEL_VGA_DEVICE(0x1606, info), /* GT1 ULT */ \
> -	INTEL_VGA_DEVICE(0x160B, info)  /* GT1 Iris */
> -
> -#define INTEL_BDW_ULX_GT1_IDS(info) \
> -	INTEL_VGA_DEVICE(0x160E, info) /* GT1 ULX */
> -
> -#define INTEL_BDW_GT1_IDS(info) \
> -	INTEL_BDW_ULT_GT1_IDS(info), \
> -	INTEL_BDW_ULX_GT1_IDS(info), \
> -	INTEL_VGA_DEVICE(0x1602, info), /* GT1 ULT */ \
> -	INTEL_VGA_DEVICE(0x160A, info), /* GT1 Server */ \
> -	INTEL_VGA_DEVICE(0x160D, info)  /* GT1 Workstation */
> -
> -#define INTEL_BDW_ULT_GT2_IDS(info) \
> -	INTEL_VGA_DEVICE(0x1616, info), /* GT2 ULT */ \
> -	INTEL_VGA_DEVICE(0x161B, info)  /* GT2 ULT */
> -
> -#define INTEL_BDW_ULX_GT2_IDS(info) \
> -	INTEL_VGA_DEVICE(0x161E, info) /* GT2 ULX */
> -
> -#define INTEL_BDW_GT2_IDS(info) \
> -	INTEL_BDW_ULT_GT2_IDS(info), \
> -	INTEL_BDW_ULX_GT2_IDS(info), \
> -	INTEL_VGA_DEVICE(0x1612, info), /* GT2 Halo */	\
> -	INTEL_VGA_DEVICE(0x161A, info), /* GT2 Server */ \
> -	INTEL_VGA_DEVICE(0x161D, info)  /* GT2 Workstation */
> -
> -#define INTEL_BDW_ULT_GT3_IDS(info) \
> -	INTEL_VGA_DEVICE(0x1626, info), /* ULT */ \
> -	INTEL_VGA_DEVICE(0x162B, info)  /* Iris */ \
> -
> -#define INTEL_BDW_ULX_GT3_IDS(info) \
> -	INTEL_VGA_DEVICE(0x162E, info)  /* ULX */
> -
> -#define INTEL_BDW_GT3_IDS(info) \
> -	INTEL_BDW_ULT_GT3_IDS(info), \
> -	INTEL_BDW_ULX_GT3_IDS(info), \
> -	INTEL_VGA_DEVICE(0x1622, info), /* ULT */ \
> -	INTEL_VGA_DEVICE(0x162A, info), /* Server */ \
> -	INTEL_VGA_DEVICE(0x162D, info)  /* Workstation */
> -
> -#define INTEL_BDW_ULT_RSVD_IDS(info) \
> -	INTEL_VGA_DEVICE(0x1636, info), /* ULT */ \
> -	INTEL_VGA_DEVICE(0x163B, info)  /* Iris */
> -
> -#define INTEL_BDW_ULX_RSVD_IDS(info) \
> -	INTEL_VGA_DEVICE(0x163E, info) /* ULX */
> -
> -#define INTEL_BDW_RSVD_IDS(info) \
> -	INTEL_BDW_ULT_RSVD_IDS(info), \
> -	INTEL_BDW_ULX_RSVD_IDS(info), \
> -	INTEL_VGA_DEVICE(0x1632, info), /* ULT */ \
> -	INTEL_VGA_DEVICE(0x163A, info), /* Server */ \
> -	INTEL_VGA_DEVICE(0x163D, info)  /* Workstation */
> -
> -#define INTEL_BDW_IDS(info) \
> -	INTEL_BDW_GT1_IDS(info), \
> -	INTEL_BDW_GT2_IDS(info), \
> -	INTEL_BDW_GT3_IDS(info), \
> -	INTEL_BDW_RSVD_IDS(info)
> -
> -#define INTEL_CHV_IDS(info) \
> -	INTEL_VGA_DEVICE(0x22b0, info), \
> -	INTEL_VGA_DEVICE(0x22b1, info), \
> -	INTEL_VGA_DEVICE(0x22b2, info), \
> -	INTEL_VGA_DEVICE(0x22b3, info)
> -
> -#define INTEL_SKL_ULT_GT1_IDS(info) \
> -	INTEL_VGA_DEVICE(0x1906, info), /* ULT GT1 */ \
> -	INTEL_VGA_DEVICE(0x1913, info)  /* ULT GT1.5 */
> -
> -#define INTEL_SKL_ULX_GT1_IDS(info) \
> -	INTEL_VGA_DEVICE(0x190E, info), /* ULX GT1 */ \
> -	INTEL_VGA_DEVICE(0x1915, info)  /* ULX GT1.5 */
> -
> -#define INTEL_SKL_GT1_IDS(info)	\
> -	INTEL_SKL_ULT_GT1_IDS(info), \
> -	INTEL_SKL_ULX_GT1_IDS(info), \
> -	INTEL_VGA_DEVICE(0x1902, info), /* DT  GT1 */ \
> -	INTEL_VGA_DEVICE(0x190A, info), /* SRV GT1 */ \
> -	INTEL_VGA_DEVICE(0x190B, info), /* Halo GT1 */ \
> -	INTEL_VGA_DEVICE(0x1917, info)  /* DT  GT1.5 */
> -
> -#define INTEL_SKL_ULT_GT2_IDS(info) \
> -	INTEL_VGA_DEVICE(0x1916, info), /* ULT GT2 */ \
> -	INTEL_VGA_DEVICE(0x1921, info)  /* ULT GT2F */
> -
> -#define INTEL_SKL_ULX_GT2_IDS(info) \
> -	INTEL_VGA_DEVICE(0x191E, info) /* ULX GT2 */
> -
> -#define INTEL_SKL_GT2_IDS(info)	\
> -	INTEL_SKL_ULT_GT2_IDS(info), \
> -	INTEL_SKL_ULX_GT2_IDS(info), \
> -	INTEL_VGA_DEVICE(0x1912, info), /* DT  GT2 */ \
> -	INTEL_VGA_DEVICE(0x191A, info), /* SRV GT2 */ \
> -	INTEL_VGA_DEVICE(0x191B, info), /* Halo GT2 */ \
> -	INTEL_VGA_DEVICE(0x191D, info)  /* WKS GT2 */
> -
> -#define INTEL_SKL_ULT_GT3_IDS(info) \
> -	INTEL_VGA_DEVICE(0x1923, info), /* ULT GT3 */ \
> -	INTEL_VGA_DEVICE(0x1926, info), /* ULT GT3e */ \
> -	INTEL_VGA_DEVICE(0x1927, info)  /* ULT GT3e */
> -
> -#define INTEL_SKL_GT3_IDS(info) \
> -	INTEL_SKL_ULT_GT3_IDS(info), \
> -	INTEL_VGA_DEVICE(0x192A, info), /* SRV GT3 */ \
> -	INTEL_VGA_DEVICE(0x192B, info), /* Halo GT3e */ \
> -	INTEL_VGA_DEVICE(0x192D, info)  /* SRV GT3e */
> -
> -#define INTEL_SKL_GT4_IDS(info) \
> -	INTEL_VGA_DEVICE(0x1932, info), /* DT GT4 */ \
> -	INTEL_VGA_DEVICE(0x193A, info), /* SRV GT4e */ \
> -	INTEL_VGA_DEVICE(0x193B, info), /* Halo GT4e */ \
> -	INTEL_VGA_DEVICE(0x193D, info) /* WKS GT4e */
> -
> -#define INTEL_SKL_IDS(info)	 \
> -	INTEL_SKL_GT1_IDS(info), \
> -	INTEL_SKL_GT2_IDS(info), \
> -	INTEL_SKL_GT3_IDS(info), \
> -	INTEL_SKL_GT4_IDS(info)
> -
> -#define INTEL_BXT_IDS(info) \
> -	INTEL_VGA_DEVICE(0x0A84, info), \
> -	INTEL_VGA_DEVICE(0x1A84, info), \
> -	INTEL_VGA_DEVICE(0x1A85, info), \
> -	INTEL_VGA_DEVICE(0x5A84, info), /* APL HD Graphics 505 */ \
> -	INTEL_VGA_DEVICE(0x5A85, info)  /* APL HD Graphics 500 */
> -
> -#define INTEL_GLK_IDS(info) \
> -	INTEL_VGA_DEVICE(0x3184, info), \
> -	INTEL_VGA_DEVICE(0x3185, info)
> -
> -#define INTEL_KBL_ULT_GT1_IDS(info) \
> -	INTEL_VGA_DEVICE(0x5906, info), /* ULT GT1 */ \
> -	INTEL_VGA_DEVICE(0x5913, info)  /* ULT GT1.5 */
> -
> -#define INTEL_KBL_ULX_GT1_IDS(info) \
> -	INTEL_VGA_DEVICE(0x590E, info), /* ULX GT1 */ \
> -	INTEL_VGA_DEVICE(0x5915, info)  /* ULX GT1.5 */
> -
> -#define INTEL_KBL_GT1_IDS(info)	\
> -	INTEL_KBL_ULT_GT1_IDS(info), \
> -	INTEL_KBL_ULX_GT1_IDS(info), \
> -	INTEL_VGA_DEVICE(0x5902, info), /* DT  GT1 */ \
> -	INTEL_VGA_DEVICE(0x5908, info), /* Halo GT1 */ \
> -	INTEL_VGA_DEVICE(0x590A, info), /* SRV GT1 */ \
> -	INTEL_VGA_DEVICE(0x590B, info) /* Halo GT1 */
> -
> -#define INTEL_KBL_ULT_GT2_IDS(info) \
> -	INTEL_VGA_DEVICE(0x5916, info), /* ULT GT2 */ \
> -	INTEL_VGA_DEVICE(0x5921, info)  /* ULT GT2F */
> -
> -#define INTEL_KBL_ULX_GT2_IDS(info) \
> -	INTEL_VGA_DEVICE(0x591E, info)  /* ULX GT2 */
> -
> -#define INTEL_KBL_GT2_IDS(info)	\
> -	INTEL_KBL_ULT_GT2_IDS(info), \
> -	INTEL_KBL_ULX_GT2_IDS(info), \
> -	INTEL_VGA_DEVICE(0x5912, info), /* DT  GT2 */ \
> -	INTEL_VGA_DEVICE(0x5917, info), /* Mobile GT2 */ \
> -	INTEL_VGA_DEVICE(0x591A, info), /* SRV GT2 */ \
> -	INTEL_VGA_DEVICE(0x591B, info), /* Halo GT2 */ \
> -	INTEL_VGA_DEVICE(0x591D, info) /* WKS GT2 */
> -
> -#define INTEL_KBL_ULT_GT3_IDS(info) \
> -	INTEL_VGA_DEVICE(0x5926, info) /* ULT GT3 */
> -
> -#define INTEL_KBL_GT3_IDS(info) \
> -	INTEL_KBL_ULT_GT3_IDS(info), \
> -	INTEL_VGA_DEVICE(0x5923, info), /* ULT GT3 */ \
> -	INTEL_VGA_DEVICE(0x5927, info) /* ULT GT3 */
> -
> -#define INTEL_KBL_GT4_IDS(info) \
> -	INTEL_VGA_DEVICE(0x593B, info) /* Halo GT4 */
> +#define INTEL_G45_IDS(MACRO__, ...) \
> +	MACRO__(0x2e02, ## __VA_ARGS__), /* IGD_E_G */ \
> +	MACRO__(0x2e12, ## __VA_ARGS__), /* Q45_G */ \
> +	MACRO__(0x2e22, ## __VA_ARGS__), /* G45_G */ \
> +	MACRO__(0x2e32, ## __VA_ARGS__), /* G41_G */ \
> +	MACRO__(0x2e42, ## __VA_ARGS__), /* B43_G */ \
> +	MACRO__(0x2e92, ## __VA_ARGS__)	/* B43_G.1 */
> +
> +#define INTEL_PNV_G_IDS(MACRO__, ...) \
> +	MACRO__(0xa001, ## __VA_ARGS__)
> +
> +#define INTEL_PNV_M_IDS(MACRO__, ...) \
> +	MACRO__(0xa011, ## __VA_ARGS__)
> +
> +#define INTEL_PNV_IDS(MACRO__, ...) \
> +	INTEL_PNV_G_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_PNV_M_IDS(MACRO__, ## __VA_ARGS__)
> +
> +#define INTEL_ILK_D_IDS(MACRO__, ...) \
> +	MACRO__(0x0042, ## __VA_ARGS__)
> +
> +#define INTEL_ILK_M_IDS(MACRO__, ...) \
> +	MACRO__(0x0046, ## __VA_ARGS__)
> +
> +#define INTEL_ILK_IDS(MACRO__, ...) \
> +	INTEL_ILK_D_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_ILK_M_IDS(MACRO__, ## __VA_ARGS__)
> +
> +#define INTEL_SNB_D_GT1_IDS(MACRO__, ...) \
> +	MACRO__(0x0102, ## __VA_ARGS__), \
> +	MACRO__(0x010A, ## __VA_ARGS__)
> +
> +#define INTEL_SNB_D_GT2_IDS(MACRO__, ...) \
> +	MACRO__(0x0112, ## __VA_ARGS__), \
> +	MACRO__(0x0122, ## __VA_ARGS__)
> +
> +#define INTEL_SNB_D_IDS(MACRO__, ...) \
> +	INTEL_SNB_D_GT1_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_SNB_D_GT2_IDS(MACRO__, ## __VA_ARGS__)
> +
> +#define INTEL_SNB_M_GT1_IDS(MACRO__, ...) \
> +	MACRO__(0x0106, ## __VA_ARGS__)
> +
> +#define INTEL_SNB_M_GT2_IDS(MACRO__, ...) \
> +	MACRO__(0x0116, ## __VA_ARGS__), \
> +	MACRO__(0x0126, ## __VA_ARGS__)
> +
> +#define INTEL_SNB_M_IDS(MACRO__, ...) \
> +	INTEL_SNB_M_GT1_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_SNB_M_GT2_IDS(MACRO__, ## __VA_ARGS__)
> +
> +#define INTEL_SNB_IDS(MACRO__, ...) \
> +	INTEL_SNB_D_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_SNB_M_IDS(MACRO__, ## __VA_ARGS__)
> +
> +#define INTEL_IVB_M_GT1_IDS(MACRO__, ...) \
> +	MACRO__(0x0156, ## __VA_ARGS__) /* GT1 mobile */
> +
> +#define INTEL_IVB_M_GT2_IDS(MACRO__, ...) \
> +	MACRO__(0x0166, ## __VA_ARGS__) /* GT2 mobile */
> +
> +#define INTEL_IVB_M_IDS(MACRO__, ...) \
> +	INTEL_IVB_M_GT1_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_IVB_M_GT2_IDS(MACRO__, ## __VA_ARGS__)
> +
> +#define INTEL_IVB_D_GT1_IDS(MACRO__, ...) \
> +	MACRO__(0x0152, ## __VA_ARGS__), /* GT1 desktop */ \
> +	MACRO__(0x015a, ## __VA_ARGS__)  /* GT1 server */
> +
> +#define INTEL_IVB_D_GT2_IDS(MACRO__, ...) \
> +	MACRO__(0x0162, ## __VA_ARGS__), /* GT2 desktop */ \
> +	MACRO__(0x016a, ## __VA_ARGS__)  /* GT2 server */
> +
> +#define INTEL_IVB_D_IDS(MACRO__, ...) \
> +	INTEL_IVB_D_GT1_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_IVB_D_GT2_IDS(MACRO__, ## __VA_ARGS__)
> +
> +#define INTEL_IVB_IDS(MACRO__, ...) \
> +	INTEL_IVB_M_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_IVB_D_IDS(MACRO__, ## __VA_ARGS__)
> +
> +#define INTEL_IVB_Q_IDS(MACRO__, ...) \
> +	INTEL_QUANTA_VGA_DEVICE(__VA_ARGS__) /* Quanta transcode */
> +
> +#define INTEL_HSW_ULT_GT1_IDS(MACRO__, ...) \
> +	MACRO__(0x0A02, ## __VA_ARGS__), /* ULT GT1 desktop */ \
> +	MACRO__(0x0A06, ## __VA_ARGS__), /* ULT GT1 mobile */ \
> +	MACRO__(0x0A0A, ## __VA_ARGS__), /* ULT GT1 server */ \
> +	MACRO__(0x0A0B, ## __VA_ARGS__)  /* ULT GT1 reserved */
> +
> +#define INTEL_HSW_ULX_GT1_IDS(MACRO__, ...) \
> +	MACRO__(0x0A0E, ## __VA_ARGS__) /* ULX GT1 mobile */
> +
> +#define INTEL_HSW_GT1_IDS(MACRO__, ...) \
> +	INTEL_HSW_ULT_GT1_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_HSW_ULX_GT1_IDS(MACRO__, ## __VA_ARGS__), \
> +	MACRO__(0x0402, ## __VA_ARGS__), /* GT1 desktop */ \
> +	MACRO__(0x0406, ## __VA_ARGS__), /* GT1 mobile */ \
> +	MACRO__(0x040A, ## __VA_ARGS__), /* GT1 server */ \
> +	MACRO__(0x040B, ## __VA_ARGS__), /* GT1 reserved */ \
> +	MACRO__(0x040E, ## __VA_ARGS__), /* GT1 reserved */ \
> +	MACRO__(0x0C02, ## __VA_ARGS__), /* SDV GT1 desktop */ \
> +	MACRO__(0x0C06, ## __VA_ARGS__), /* SDV GT1 mobile */ \
> +	MACRO__(0x0C0A, ## __VA_ARGS__), /* SDV GT1 server */ \
> +	MACRO__(0x0C0B, ## __VA_ARGS__), /* SDV GT1 reserved */ \
> +	MACRO__(0x0C0E, ## __VA_ARGS__), /* SDV GT1 reserved */ \
> +	MACRO__(0x0D02, ## __VA_ARGS__), /* CRW GT1 desktop */ \
> +	MACRO__(0x0D06, ## __VA_ARGS__), /* CRW GT1 mobile */ \
> +	MACRO__(0x0D0A, ## __VA_ARGS__), /* CRW GT1 server */ \
> +	MACRO__(0x0D0B, ## __VA_ARGS__), /* CRW GT1 reserved */ \
> +	MACRO__(0x0D0E, ## __VA_ARGS__)  /* CRW GT1 reserved */
> +
> +#define INTEL_HSW_ULT_GT2_IDS(MACRO__, ...) \
> +	MACRO__(0x0A12, ## __VA_ARGS__), /* ULT GT2 desktop */ \
> +	MACRO__(0x0A16, ## __VA_ARGS__), /* ULT GT2 mobile */ \
> +	MACRO__(0x0A1A, ## __VA_ARGS__), /* ULT GT2 server */ \
> +	MACRO__(0x0A1B, ## __VA_ARGS__)  /* ULT GT2 reserved */ \
> +
> +#define INTEL_HSW_ULX_GT2_IDS(MACRO__, ...) \
> +	MACRO__(0x0A1E, ## __VA_ARGS__) /* ULX GT2 mobile */ \
> +
> +#define INTEL_HSW_GT2_IDS(MACRO__, ...) \
> +	INTEL_HSW_ULT_GT2_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_HSW_ULX_GT2_IDS(MACRO__, ## __VA_ARGS__), \
> +	MACRO__(0x0412, ## __VA_ARGS__), /* GT2 desktop */ \
> +	MACRO__(0x0416, ## __VA_ARGS__), /* GT2 mobile */ \
> +	MACRO__(0x041A, ## __VA_ARGS__), /* GT2 server */ \
> +	MACRO__(0x041B, ## __VA_ARGS__), /* GT2 reserved */ \
> +	MACRO__(0x041E, ## __VA_ARGS__), /* GT2 reserved */ \
> +	MACRO__(0x0C12, ## __VA_ARGS__), /* SDV GT2 desktop */ \
> +	MACRO__(0x0C16, ## __VA_ARGS__), /* SDV GT2 mobile */ \
> +	MACRO__(0x0C1A, ## __VA_ARGS__), /* SDV GT2 server */ \
> +	MACRO__(0x0C1B, ## __VA_ARGS__), /* SDV GT2 reserved */ \
> +	MACRO__(0x0C1E, ## __VA_ARGS__), /* SDV GT2 reserved */ \
> +	MACRO__(0x0D12, ## __VA_ARGS__), /* CRW GT2 desktop */ \
> +	MACRO__(0x0D16, ## __VA_ARGS__), /* CRW GT2 mobile */ \
> +	MACRO__(0x0D1A, ## __VA_ARGS__), /* CRW GT2 server */ \
> +	MACRO__(0x0D1B, ## __VA_ARGS__), /* CRW GT2 reserved */ \
> +	MACRO__(0x0D1E, ## __VA_ARGS__)  /* CRW GT2 reserved */
> +
> +#define INTEL_HSW_ULT_GT3_IDS(MACRO__, ...) \
> +	MACRO__(0x0A22, ## __VA_ARGS__), /* ULT GT3 desktop */ \
> +	MACRO__(0x0A26, ## __VA_ARGS__), /* ULT GT3 mobile */ \
> +	MACRO__(0x0A2A, ## __VA_ARGS__), /* ULT GT3 server */ \
> +	MACRO__(0x0A2B, ## __VA_ARGS__), /* ULT GT3 reserved */ \
> +	MACRO__(0x0A2E, ## __VA_ARGS__)  /* ULT GT3 reserved */
> +
> +#define INTEL_HSW_GT3_IDS(MACRO__, ...) \
> +	INTEL_HSW_ULT_GT3_IDS(MACRO__, ## __VA_ARGS__), \
> +	MACRO__(0x0422, ## __VA_ARGS__), /* GT3 desktop */ \
> +	MACRO__(0x0426, ## __VA_ARGS__), /* GT3 mobile */ \
> +	MACRO__(0x042A, ## __VA_ARGS__), /* GT3 server */ \
> +	MACRO__(0x042B, ## __VA_ARGS__), /* GT3 reserved */ \
> +	MACRO__(0x042E, ## __VA_ARGS__), /* GT3 reserved */ \
> +	MACRO__(0x0C22, ## __VA_ARGS__), /* SDV GT3 desktop */ \
> +	MACRO__(0x0C26, ## __VA_ARGS__), /* SDV GT3 mobile */ \
> +	MACRO__(0x0C2A, ## __VA_ARGS__), /* SDV GT3 server */ \
> +	MACRO__(0x0C2B, ## __VA_ARGS__), /* SDV GT3 reserved */ \
> +	MACRO__(0x0C2E, ## __VA_ARGS__), /* SDV GT3 reserved */ \
> +	MACRO__(0x0D22, ## __VA_ARGS__), /* CRW GT3 desktop */ \
> +	MACRO__(0x0D26, ## __VA_ARGS__), /* CRW GT3 mobile */ \
> +	MACRO__(0x0D2A, ## __VA_ARGS__), /* CRW GT3 server */ \
> +	MACRO__(0x0D2B, ## __VA_ARGS__), /* CRW GT3 reserved */ \
> +	MACRO__(0x0D2E, ## __VA_ARGS__)  /* CRW GT3 reserved */
> +
> +#define INTEL_HSW_IDS(MACRO__, ...) \
> +	INTEL_HSW_GT1_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_HSW_GT2_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_HSW_GT3_IDS(MACRO__, ## __VA_ARGS__)
> +
> +#define INTEL_VLV_IDS(MACRO__, ...) \
> +	MACRO__(0x0f30, ## __VA_ARGS__), \
> +	MACRO__(0x0f31, ## __VA_ARGS__), \
> +	MACRO__(0x0f32, ## __VA_ARGS__), \
> +	MACRO__(0x0f33, ## __VA_ARGS__)
> +
> +#define INTEL_BDW_ULT_GT1_IDS(MACRO__, ...) \
> +	MACRO__(0x1606, ## __VA_ARGS__), /* GT1 ULT */ \
> +	MACRO__(0x160B, ## __VA_ARGS__)  /* GT1 Iris */
> +
> +#define INTEL_BDW_ULX_GT1_IDS(MACRO__, ...) \
> +	MACRO__(0x160E, ## __VA_ARGS__) /* GT1 ULX */
> +
> +#define INTEL_BDW_GT1_IDS(MACRO__, ...) \
> +	INTEL_BDW_ULT_GT1_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_BDW_ULX_GT1_IDS(MACRO__, ## __VA_ARGS__), \
> +	MACRO__(0x1602, ## __VA_ARGS__), /* GT1 ULT */ \
> +	MACRO__(0x160A, ## __VA_ARGS__), /* GT1 Server */ \
> +	MACRO__(0x160D, ## __VA_ARGS__)  /* GT1 Workstation */
> +
> +#define INTEL_BDW_ULT_GT2_IDS(MACRO__, ...) \
> +	MACRO__(0x1616, ## __VA_ARGS__), /* GT2 ULT */ \
> +	MACRO__(0x161B, ## __VA_ARGS__)  /* GT2 ULT */
> +
> +#define INTEL_BDW_ULX_GT2_IDS(MACRO__, ...) \
> +	MACRO__(0x161E, ## __VA_ARGS__) /* GT2 ULX */
> +
> +#define INTEL_BDW_GT2_IDS(MACRO__, ...) \
> +	INTEL_BDW_ULT_GT2_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_BDW_ULX_GT2_IDS(MACRO__, ## __VA_ARGS__), \
> +	MACRO__(0x1612, ## __VA_ARGS__), /* GT2 Halo */ \
> +	MACRO__(0x161A, ## __VA_ARGS__), /* GT2 Server */ \
> +	MACRO__(0x161D, ## __VA_ARGS__)  /* GT2 Workstation */
> +
> +#define INTEL_BDW_ULT_GT3_IDS(MACRO__, ...) \
> +	MACRO__(0x1626, ## __VA_ARGS__), /* ULT */ \
> +	MACRO__(0x162B, ## __VA_ARGS__)  /* Iris */ \
> +
> +#define INTEL_BDW_ULX_GT3_IDS(MACRO__, ...) \
> +	MACRO__(0x162E, ## __VA_ARGS__)  /* ULX */
> +
> +#define INTEL_BDW_GT3_IDS(MACRO__, ...) \
> +	INTEL_BDW_ULT_GT3_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_BDW_ULX_GT3_IDS(MACRO__, ## __VA_ARGS__), \
> +	MACRO__(0x1622, ## __VA_ARGS__), /* ULT */ \
> +	MACRO__(0x162A, ## __VA_ARGS__), /* Server */ \
> +	MACRO__(0x162D, ## __VA_ARGS__)  /* Workstation */
> +
> +#define INTEL_BDW_ULT_RSVD_IDS(MACRO__, ...) \
> +	MACRO__(0x1636, ## __VA_ARGS__), /* ULT */ \
> +	MACRO__(0x163B, ## __VA_ARGS__)  /* Iris */
> +
> +#define INTEL_BDW_ULX_RSVD_IDS(MACRO__, ...) \
> +	MACRO__(0x163E, ## __VA_ARGS__) /* ULX */
> +
> +#define INTEL_BDW_RSVD_IDS(MACRO__, ...) \
> +	INTEL_BDW_ULT_RSVD_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_BDW_ULX_RSVD_IDS(MACRO__, ## __VA_ARGS__), \
> +	MACRO__(0x1632, ## __VA_ARGS__), /* ULT */ \
> +	MACRO__(0x163A, ## __VA_ARGS__), /* Server */ \
> +	MACRO__(0x163D, ## __VA_ARGS__)  /* Workstation */
> +
> +#define INTEL_BDW_IDS(MACRO__, ...) \
> +	INTEL_BDW_GT1_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_BDW_GT2_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_BDW_GT3_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_BDW_RSVD_IDS(MACRO__, ## __VA_ARGS__)
> +
> +#define INTEL_CHV_IDS(MACRO__, ...) \
> +	MACRO__(0x22b0, ## __VA_ARGS__), \
> +	MACRO__(0x22b1, ## __VA_ARGS__), \
> +	MACRO__(0x22b2, ## __VA_ARGS__), \
> +	MACRO__(0x22b3, ## __VA_ARGS__)
> +
> +#define INTEL_SKL_ULT_GT1_IDS(MACRO__, ...) \
> +	MACRO__(0x1906, ## __VA_ARGS__), /* ULT GT1 */ \
> +	MACRO__(0x1913, ## __VA_ARGS__)  /* ULT GT1.5 */
> +
> +#define INTEL_SKL_ULX_GT1_IDS(MACRO__, ...) \
> +	MACRO__(0x190E, ## __VA_ARGS__), /* ULX GT1 */ \
> +	MACRO__(0x1915, ## __VA_ARGS__)  /* ULX GT1.5 */
> +
> +#define INTEL_SKL_GT1_IDS(MACRO__, ...) \
> +	INTEL_SKL_ULT_GT1_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_SKL_ULX_GT1_IDS(MACRO__, ## __VA_ARGS__), \
> +	MACRO__(0x1902, ## __VA_ARGS__), /* DT  GT1 */ \
> +	MACRO__(0x190A, ## __VA_ARGS__), /* SRV GT1 */ \
> +	MACRO__(0x190B, ## __VA_ARGS__), /* Halo GT1 */ \
> +	MACRO__(0x1917, ## __VA_ARGS__)  /* DT  GT1.5 */
> +
> +#define INTEL_SKL_ULT_GT2_IDS(MACRO__, ...) \
> +	MACRO__(0x1916, ## __VA_ARGS__), /* ULT GT2 */ \
> +	MACRO__(0x1921, ## __VA_ARGS__)  /* ULT GT2F */
> +
> +#define INTEL_SKL_ULX_GT2_IDS(MACRO__, ...) \
> +	MACRO__(0x191E, ## __VA_ARGS__) /* ULX GT2 */
> +
> +#define INTEL_SKL_GT2_IDS(MACRO__, ...) \
> +	INTEL_SKL_ULT_GT2_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_SKL_ULX_GT2_IDS(MACRO__, ## __VA_ARGS__), \
> +	MACRO__(0x1912, ## __VA_ARGS__), /* DT  GT2 */ \
> +	MACRO__(0x191A, ## __VA_ARGS__), /* SRV GT2 */ \
> +	MACRO__(0x191B, ## __VA_ARGS__), /* Halo GT2 */ \
> +	MACRO__(0x191D, ## __VA_ARGS__)  /* WKS GT2 */
> +
> +#define INTEL_SKL_ULT_GT3_IDS(MACRO__, ...) \
> +	MACRO__(0x1923, ## __VA_ARGS__), /* ULT GT3 */ \
> +	MACRO__(0x1926, ## __VA_ARGS__), /* ULT GT3e */ \
> +	MACRO__(0x1927, ## __VA_ARGS__)  /* ULT GT3e */
> +
> +#define INTEL_SKL_GT3_IDS(MACRO__, ...) \
> +	INTEL_SKL_ULT_GT3_IDS(MACRO__, ## __VA_ARGS__), \
> +	MACRO__(0x192A, ## __VA_ARGS__), /* SRV GT3 */ \
> +	MACRO__(0x192B, ## __VA_ARGS__), /* Halo GT3e */ \
> +	MACRO__(0x192D, ## __VA_ARGS__)  /* SRV GT3e */
> +
> +#define INTEL_SKL_GT4_IDS(MACRO__, ...) \
> +	MACRO__(0x1932, ## __VA_ARGS__), /* DT GT4 */ \
> +	MACRO__(0x193A, ## __VA_ARGS__), /* SRV GT4e */ \
> +	MACRO__(0x193B, ## __VA_ARGS__), /* Halo GT4e */ \
> +	MACRO__(0x193D, ## __VA_ARGS__) /* WKS GT4e */
> +
> +#define INTEL_SKL_IDS(MACRO__, ...) \
> +	INTEL_SKL_GT1_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_SKL_GT2_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_SKL_GT3_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_SKL_GT4_IDS(MACRO__, ## __VA_ARGS__)
> +
> +#define INTEL_BXT_IDS(MACRO__, ...) \
> +	MACRO__(0x0A84, ## __VA_ARGS__), \
> +	MACRO__(0x1A84, ## __VA_ARGS__), \
> +	MACRO__(0x1A85, ## __VA_ARGS__), \
> +	MACRO__(0x5A84, ## __VA_ARGS__), /* APL HD Graphics 505 */ \
> +	MACRO__(0x5A85, ## __VA_ARGS__)  /* APL HD Graphics 500 */
> +
> +#define INTEL_GLK_IDS(MACRO__, ...) \
> +	MACRO__(0x3184, ## __VA_ARGS__), \
> +	MACRO__(0x3185, ## __VA_ARGS__)
> +
> +#define INTEL_KBL_ULT_GT1_IDS(MACRO__, ...) \
> +	MACRO__(0x5906, ## __VA_ARGS__), /* ULT GT1 */ \
> +	MACRO__(0x5913, ## __VA_ARGS__)  /* ULT GT1.5 */
> +
> +#define INTEL_KBL_ULX_GT1_IDS(MACRO__, ...) \
> +	MACRO__(0x590E, ## __VA_ARGS__), /* ULX GT1 */ \
> +	MACRO__(0x5915, ## __VA_ARGS__)  /* ULX GT1.5 */
> +
> +#define INTEL_KBL_GT1_IDS(MACRO__, ...) \
> +	INTEL_KBL_ULT_GT1_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_KBL_ULX_GT1_IDS(MACRO__, ## __VA_ARGS__), \
> +	MACRO__(0x5902, ## __VA_ARGS__), /* DT  GT1 */ \
> +	MACRO__(0x5908, ## __VA_ARGS__), /* Halo GT1 */ \
> +	MACRO__(0x590A, ## __VA_ARGS__), /* SRV GT1 */ \
> +	MACRO__(0x590B, ## __VA_ARGS__) /* Halo GT1 */
> +
> +#define INTEL_KBL_ULT_GT2_IDS(MACRO__, ...) \
> +	MACRO__(0x5916, ## __VA_ARGS__), /* ULT GT2 */ \
> +	MACRO__(0x5921, ## __VA_ARGS__)  /* ULT GT2F */
> +
> +#define INTEL_KBL_ULX_GT2_IDS(MACRO__, ...) \
> +	MACRO__(0x591E, ## __VA_ARGS__)  /* ULX GT2 */
> +
> +#define INTEL_KBL_GT2_IDS(MACRO__, ...) \
> +	INTEL_KBL_ULT_GT2_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_KBL_ULX_GT2_IDS(MACRO__, ## __VA_ARGS__), \
> +	MACRO__(0x5912, ## __VA_ARGS__), /* DT  GT2 */ \
> +	MACRO__(0x5917, ## __VA_ARGS__), /* Mobile GT2 */ \
> +	MACRO__(0x591A, ## __VA_ARGS__), /* SRV GT2 */ \
> +	MACRO__(0x591B, ## __VA_ARGS__), /* Halo GT2 */ \
> +	MACRO__(0x591D, ## __VA_ARGS__) /* WKS GT2 */
> +
> +#define INTEL_KBL_ULT_GT3_IDS(MACRO__, ...) \
> +	MACRO__(0x5926, ## __VA_ARGS__) /* ULT GT3 */
> +
> +#define INTEL_KBL_GT3_IDS(MACRO__, ...) \
> +	INTEL_KBL_ULT_GT3_IDS(MACRO__, ## __VA_ARGS__), \
> +	MACRO__(0x5923, ## __VA_ARGS__), /* ULT GT3 */ \
> +	MACRO__(0x5927, ## __VA_ARGS__) /* ULT GT3 */
> +
> +#define INTEL_KBL_GT4_IDS(MACRO__, ...) \
> +	MACRO__(0x593B, ## __VA_ARGS__) /* Halo GT4 */
>  
>  /* AML/KBL Y GT2 */
> -#define INTEL_AML_KBL_GT2_IDS(info) \
> -	INTEL_VGA_DEVICE(0x591C, info),  /* ULX GT2 */ \
> -	INTEL_VGA_DEVICE(0x87C0, info) /* ULX GT2 */
> +#define INTEL_AML_KBL_GT2_IDS(MACRO__, ...) \
> +	MACRO__(0x591C, ## __VA_ARGS__),  /* ULX GT2 */ \
> +	MACRO__(0x87C0, ## __VA_ARGS__) /* ULX GT2 */
>  
>  /* AML/CFL Y GT2 */
> -#define INTEL_AML_CFL_GT2_IDS(info) \
> -	INTEL_VGA_DEVICE(0x87CA, info)
> +#define INTEL_AML_CFL_GT2_IDS(MACRO__, ...) \
> +	MACRO__(0x87CA, ## __VA_ARGS__)
>  
>  /* CML GT1 */
> -#define INTEL_CML_GT1_IDS(info)	\
> -	INTEL_VGA_DEVICE(0x9BA2, info), \
> -	INTEL_VGA_DEVICE(0x9BA4, info), \
> -	INTEL_VGA_DEVICE(0x9BA5, info), \
> -	INTEL_VGA_DEVICE(0x9BA8, info)
> +#define INTEL_CML_GT1_IDS(MACRO__, ...) \
> +	MACRO__(0x9BA2, ## __VA_ARGS__), \
> +	MACRO__(0x9BA4, ## __VA_ARGS__), \
> +	MACRO__(0x9BA5, ## __VA_ARGS__), \
> +	MACRO__(0x9BA8, ## __VA_ARGS__)
>  
> -#define INTEL_CML_U_GT1_IDS(info) \
> -	INTEL_VGA_DEVICE(0x9B21, info), \
> -	INTEL_VGA_DEVICE(0x9BAA, info), \
> -	INTEL_VGA_DEVICE(0x9BAC, info)
> +#define INTEL_CML_U_GT1_IDS(MACRO__, ...) \
> +	MACRO__(0x9B21, ## __VA_ARGS__), \
> +	MACRO__(0x9BAA, ## __VA_ARGS__), \
> +	MACRO__(0x9BAC, ## __VA_ARGS__)
>  
>  /* CML GT2 */
> -#define INTEL_CML_GT2_IDS(info)	\
> -	INTEL_VGA_DEVICE(0x9BC2, info), \
> -	INTEL_VGA_DEVICE(0x9BC4, info), \
> -	INTEL_VGA_DEVICE(0x9BC5, info), \
> -	INTEL_VGA_DEVICE(0x9BC6, info), \
> -	INTEL_VGA_DEVICE(0x9BC8, info), \
> -	INTEL_VGA_DEVICE(0x9BE6, info), \
> -	INTEL_VGA_DEVICE(0x9BF6, info)
> -
> -#define INTEL_CML_U_GT2_IDS(info) \
> -	INTEL_VGA_DEVICE(0x9B41, info), \
> -	INTEL_VGA_DEVICE(0x9BCA, info), \
> -	INTEL_VGA_DEVICE(0x9BCC, info)
> -
> -#define INTEL_CML_IDS(info) \
> -	INTEL_CML_GT1_IDS(info), \
> -	INTEL_CML_GT2_IDS(info), \
> -	INTEL_CML_U_GT1_IDS(info), \
> -	INTEL_CML_U_GT2_IDS(info)
> -
> -#define INTEL_KBL_IDS(info) \
> -	INTEL_KBL_GT1_IDS(info), \
> -	INTEL_KBL_GT2_IDS(info), \
> -	INTEL_KBL_GT3_IDS(info), \
> -	INTEL_KBL_GT4_IDS(info), \
> -	INTEL_AML_KBL_GT2_IDS(info)
> +#define INTEL_CML_GT2_IDS(MACRO__, ...) \
> +	MACRO__(0x9BC2, ## __VA_ARGS__), \
> +	MACRO__(0x9BC4, ## __VA_ARGS__), \
> +	MACRO__(0x9BC5, ## __VA_ARGS__), \
> +	MACRO__(0x9BC6, ## __VA_ARGS__), \
> +	MACRO__(0x9BC8, ## __VA_ARGS__), \
> +	MACRO__(0x9BE6, ## __VA_ARGS__), \
> +	MACRO__(0x9BF6, ## __VA_ARGS__)
> +
> +#define INTEL_CML_U_GT2_IDS(MACRO__, ...) \
> +	MACRO__(0x9B41, ## __VA_ARGS__), \
> +	MACRO__(0x9BCA, ## __VA_ARGS__), \
> +	MACRO__(0x9BCC, ## __VA_ARGS__)
> +
> +#define INTEL_CML_IDS(MACRO__, ...) \
> +	INTEL_CML_GT1_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_CML_GT2_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_CML_U_GT1_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_CML_U_GT2_IDS(MACRO__, ## __VA_ARGS__)
> +
> +#define INTEL_KBL_IDS(MACRO__, ...) \
> +	INTEL_KBL_GT1_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_KBL_GT2_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_KBL_GT3_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_KBL_GT4_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_AML_KBL_GT2_IDS(MACRO__, ## __VA_ARGS__)
>  
>  /* CFL S */
> -#define INTEL_CFL_S_GT1_IDS(info) \
> -	INTEL_VGA_DEVICE(0x3E90, info), /* SRV GT1 */ \
> -	INTEL_VGA_DEVICE(0x3E93, info), /* SRV GT1 */ \
> -	INTEL_VGA_DEVICE(0x3E99, info)  /* SRV GT1 */
> -
> -#define INTEL_CFL_S_GT2_IDS(info) \
> -	INTEL_VGA_DEVICE(0x3E91, info), /* SRV GT2 */ \
> -	INTEL_VGA_DEVICE(0x3E92, info), /* SRV GT2 */ \
> -	INTEL_VGA_DEVICE(0x3E96, info), /* SRV GT2 */ \
> -	INTEL_VGA_DEVICE(0x3E98, info), /* SRV GT2 */ \
> -	INTEL_VGA_DEVICE(0x3E9A, info)  /* SRV GT2 */
> +#define INTEL_CFL_S_GT1_IDS(MACRO__, ...) \
> +	MACRO__(0x3E90, ## __VA_ARGS__), /* SRV GT1 */ \
> +	MACRO__(0x3E93, ## __VA_ARGS__), /* SRV GT1 */ \
> +	MACRO__(0x3E99, ## __VA_ARGS__)  /* SRV GT1 */
> +
> +#define INTEL_CFL_S_GT2_IDS(MACRO__, ...) \
> +	MACRO__(0x3E91, ## __VA_ARGS__), /* SRV GT2 */ \
> +	MACRO__(0x3E92, ## __VA_ARGS__), /* SRV GT2 */ \
> +	MACRO__(0x3E96, ## __VA_ARGS__), /* SRV GT2 */ \
> +	MACRO__(0x3E98, ## __VA_ARGS__), /* SRV GT2 */ \
> +	MACRO__(0x3E9A, ## __VA_ARGS__)  /* SRV GT2 */
>  
>  /* CFL H */
> -#define INTEL_CFL_H_GT1_IDS(info) \
> -	INTEL_VGA_DEVICE(0x3E9C, info)
> +#define INTEL_CFL_H_GT1_IDS(MACRO__, ...) \
> +	MACRO__(0x3E9C, ## __VA_ARGS__)
>  
> -#define INTEL_CFL_H_GT2_IDS(info) \
> -	INTEL_VGA_DEVICE(0x3E94, info),  /* Halo GT2 */ \
> -	INTEL_VGA_DEVICE(0x3E9B, info) /* Halo GT2 */
> +#define INTEL_CFL_H_GT2_IDS(MACRO__, ...) \
> +	MACRO__(0x3E94, ## __VA_ARGS__),  /* Halo GT2 */ \
> +	MACRO__(0x3E9B, ## __VA_ARGS__) /* Halo GT2 */
>  
>  /* CFL U GT2 */
> -#define INTEL_CFL_U_GT2_IDS(info) \
> -	INTEL_VGA_DEVICE(0x3EA9, info)
> +#define INTEL_CFL_U_GT2_IDS(MACRO__, ...) \
> +	MACRO__(0x3EA9, ## __VA_ARGS__)
>  
>  /* CFL U GT3 */
> -#define INTEL_CFL_U_GT3_IDS(info) \
> -	INTEL_VGA_DEVICE(0x3EA5, info), /* ULT GT3 */ \
> -	INTEL_VGA_DEVICE(0x3EA6, info), /* ULT GT3 */ \
> -	INTEL_VGA_DEVICE(0x3EA7, info), /* ULT GT3 */ \
> -	INTEL_VGA_DEVICE(0x3EA8, info)  /* ULT GT3 */
> -
> -#define INTEL_CFL_IDS(info)	   \
> -	INTEL_CFL_S_GT1_IDS(info), \
> -	INTEL_CFL_S_GT2_IDS(info), \
> -	INTEL_CFL_H_GT1_IDS(info), \
> -	INTEL_CFL_H_GT2_IDS(info), \
> -	INTEL_CFL_U_GT2_IDS(info), \
> -	INTEL_CFL_U_GT3_IDS(info), \
> -	INTEL_AML_CFL_GT2_IDS(info)
> +#define INTEL_CFL_U_GT3_IDS(MACRO__, ...) \
> +	MACRO__(0x3EA5, ## __VA_ARGS__), /* ULT GT3 */ \
> +	MACRO__(0x3EA6, ## __VA_ARGS__), /* ULT GT3 */ \
> +	MACRO__(0x3EA7, ## __VA_ARGS__), /* ULT GT3 */ \
> +	MACRO__(0x3EA8, ## __VA_ARGS__)  /* ULT GT3 */
> +
> +#define INTEL_CFL_IDS(MACRO__, ...) \
> +	INTEL_CFL_S_GT1_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_CFL_S_GT2_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_CFL_H_GT1_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_CFL_H_GT2_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_CFL_U_GT2_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_CFL_U_GT3_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_AML_CFL_GT2_IDS(MACRO__, ## __VA_ARGS__)
>  
>  /* WHL/CFL U GT1 */
> -#define INTEL_WHL_U_GT1_IDS(info) \
> -	INTEL_VGA_DEVICE(0x3EA1, info), \
> -	INTEL_VGA_DEVICE(0x3EA4, info)
> +#define INTEL_WHL_U_GT1_IDS(MACRO__, ...) \
> +	MACRO__(0x3EA1, ## __VA_ARGS__), \
> +	MACRO__(0x3EA4, ## __VA_ARGS__)
>  
>  /* WHL/CFL U GT2 */
> -#define INTEL_WHL_U_GT2_IDS(info) \
> -	INTEL_VGA_DEVICE(0x3EA0, info), \
> -	INTEL_VGA_DEVICE(0x3EA3, info)
> +#define INTEL_WHL_U_GT2_IDS(MACRO__, ...) \
> +	MACRO__(0x3EA0, ## __VA_ARGS__), \
> +	MACRO__(0x3EA3, ## __VA_ARGS__)
>  
>  /* WHL/CFL U GT3 */
> -#define INTEL_WHL_U_GT3_IDS(info) \
> -	INTEL_VGA_DEVICE(0x3EA2, info)
> +#define INTEL_WHL_U_GT3_IDS(MACRO__, ...) \
> +	MACRO__(0x3EA2, ## __VA_ARGS__)
>  
> -#define INTEL_WHL_IDS(info) \
> -	INTEL_WHL_U_GT1_IDS(info), \
> -	INTEL_WHL_U_GT2_IDS(info), \
> -	INTEL_WHL_U_GT3_IDS(info)
> +#define INTEL_WHL_IDS(MACRO__, ...) \
> +	INTEL_WHL_U_GT1_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_WHL_U_GT2_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_WHL_U_GT3_IDS(MACRO__, ## __VA_ARGS__)
>  
>  /* CNL */
> -#define INTEL_CNL_PORT_F_IDS(info) \
> -	INTEL_VGA_DEVICE(0x5A44, info), \
> -	INTEL_VGA_DEVICE(0x5A4C, info), \
> -	INTEL_VGA_DEVICE(0x5A54, info), \
> -	INTEL_VGA_DEVICE(0x5A5C, info)
> -
> -#define INTEL_CNL_IDS(info) \
> -	INTEL_CNL_PORT_F_IDS(info), \
> -	INTEL_VGA_DEVICE(0x5A40, info), \
> -	INTEL_VGA_DEVICE(0x5A41, info), \
> -	INTEL_VGA_DEVICE(0x5A42, info), \
> -	INTEL_VGA_DEVICE(0x5A49, info), \
> -	INTEL_VGA_DEVICE(0x5A4A, info), \
> -	INTEL_VGA_DEVICE(0x5A50, info), \
> -	INTEL_VGA_DEVICE(0x5A51, info), \
> -	INTEL_VGA_DEVICE(0x5A52, info), \
> -	INTEL_VGA_DEVICE(0x5A59, info), \
> -	INTEL_VGA_DEVICE(0x5A5A, info)
> +#define INTEL_CNL_PORT_F_IDS(MACRO__, ...) \
> +	MACRO__(0x5A44, ## __VA_ARGS__), \
> +	MACRO__(0x5A4C, ## __VA_ARGS__), \
> +	MACRO__(0x5A54, ## __VA_ARGS__), \
> +	MACRO__(0x5A5C, ## __VA_ARGS__)
> +
> +#define INTEL_CNL_IDS(MACRO__, ...) \
> +	INTEL_CNL_PORT_F_IDS(MACRO__, ## __VA_ARGS__), \
> +	MACRO__(0x5A40, ## __VA_ARGS__), \
> +	MACRO__(0x5A41, ## __VA_ARGS__), \
> +	MACRO__(0x5A42, ## __VA_ARGS__), \
> +	MACRO__(0x5A49, ## __VA_ARGS__), \
> +	MACRO__(0x5A4A, ## __VA_ARGS__), \
> +	MACRO__(0x5A50, ## __VA_ARGS__), \
> +	MACRO__(0x5A51, ## __VA_ARGS__), \
> +	MACRO__(0x5A52, ## __VA_ARGS__), \
> +	MACRO__(0x5A59, ## __VA_ARGS__), \
> +	MACRO__(0x5A5A, ## __VA_ARGS__)
>  
>  /* ICL */
> -#define INTEL_ICL_PORT_F_IDS(info) \
> -	INTEL_VGA_DEVICE(0x8A50, info), \
> -	INTEL_VGA_DEVICE(0x8A52, info), \
> -	INTEL_VGA_DEVICE(0x8A53, info), \
> -	INTEL_VGA_DEVICE(0x8A54, info), \
> -	INTEL_VGA_DEVICE(0x8A56, info), \
> -	INTEL_VGA_DEVICE(0x8A57, info), \
> -	INTEL_VGA_DEVICE(0x8A58, info),	\
> -	INTEL_VGA_DEVICE(0x8A59, info),	\
> -	INTEL_VGA_DEVICE(0x8A5A, info), \
> -	INTEL_VGA_DEVICE(0x8A5B, info), \
> -	INTEL_VGA_DEVICE(0x8A5C, info), \
> -	INTEL_VGA_DEVICE(0x8A70, info), \
> -	INTEL_VGA_DEVICE(0x8A71, info)
> -
> -#define INTEL_ICL_IDS(info) \
> -	INTEL_ICL_PORT_F_IDS(info), \
> -	INTEL_VGA_DEVICE(0x8A51, info), \
> -	INTEL_VGA_DEVICE(0x8A5D, info)
> +#define INTEL_ICL_PORT_F_IDS(MACRO__, ...) \
> +	MACRO__(0x8A50, ## __VA_ARGS__), \
> +	MACRO__(0x8A52, ## __VA_ARGS__), \
> +	MACRO__(0x8A53, ## __VA_ARGS__), \
> +	MACRO__(0x8A54, ## __VA_ARGS__), \
> +	MACRO__(0x8A56, ## __VA_ARGS__), \
> +	MACRO__(0x8A57, ## __VA_ARGS__), \
> +	MACRO__(0x8A58, ## __VA_ARGS__), \
> +	MACRO__(0x8A59, ## __VA_ARGS__), \
> +	MACRO__(0x8A5A, ## __VA_ARGS__), \
> +	MACRO__(0x8A5B, ## __VA_ARGS__), \
> +	MACRO__(0x8A5C, ## __VA_ARGS__), \
> +	MACRO__(0x8A70, ## __VA_ARGS__), \
> +	MACRO__(0x8A71, ## __VA_ARGS__)
> +
> +#define INTEL_ICL_IDS(MACRO__, ...) \
> +	INTEL_ICL_PORT_F_IDS(MACRO__, ## __VA_ARGS__), \
> +	MACRO__(0x8A51, ## __VA_ARGS__), \
> +	MACRO__(0x8A5D, ## __VA_ARGS__)
>  
>  /* EHL */
> -#define INTEL_EHL_IDS(info) \
> -	INTEL_VGA_DEVICE(0x4541, info), \
> -	INTEL_VGA_DEVICE(0x4551, info), \
> -	INTEL_VGA_DEVICE(0x4555, info), \
> -	INTEL_VGA_DEVICE(0x4557, info), \
> -	INTEL_VGA_DEVICE(0x4570, info), \
> -	INTEL_VGA_DEVICE(0x4571, info)
> +#define INTEL_EHL_IDS(MACRO__, ...) \
> +	MACRO__(0x4541, ## __VA_ARGS__), \
> +	MACRO__(0x4551, ## __VA_ARGS__), \
> +	MACRO__(0x4555, ## __VA_ARGS__), \
> +	MACRO__(0x4557, ## __VA_ARGS__), \
> +	MACRO__(0x4570, ## __VA_ARGS__), \
> +	MACRO__(0x4571, ## __VA_ARGS__)
>  
>  /* JSL */
> -#define INTEL_JSL_IDS(info) \
> -	INTEL_VGA_DEVICE(0x4E51, info), \
> -	INTEL_VGA_DEVICE(0x4E55, info), \
> -	INTEL_VGA_DEVICE(0x4E57, info), \
> -	INTEL_VGA_DEVICE(0x4E61, info), \
> -	INTEL_VGA_DEVICE(0x4E71, info)
> +#define INTEL_JSL_IDS(MACRO__, ...) \
> +	MACRO__(0x4E51, ## __VA_ARGS__), \
> +	MACRO__(0x4E55, ## __VA_ARGS__), \
> +	MACRO__(0x4E57, ## __VA_ARGS__), \
> +	MACRO__(0x4E61, ## __VA_ARGS__), \
> +	MACRO__(0x4E71, ## __VA_ARGS__)
>  
>  /* TGL */
> -#define INTEL_TGL_GT1_IDS(info) \
> -	INTEL_VGA_DEVICE(0x9A60, info), \
> -	INTEL_VGA_DEVICE(0x9A68, info), \
> -	INTEL_VGA_DEVICE(0x9A70, info)
> -
> -#define INTEL_TGL_GT2_IDS(info) \
> -	INTEL_VGA_DEVICE(0x9A40, info), \
> -	INTEL_VGA_DEVICE(0x9A49, info), \
> -	INTEL_VGA_DEVICE(0x9A59, info), \
> -	INTEL_VGA_DEVICE(0x9A78, info), \
> -	INTEL_VGA_DEVICE(0x9AC0, info), \
> -	INTEL_VGA_DEVICE(0x9AC9, info), \
> -	INTEL_VGA_DEVICE(0x9AD9, info), \
> -	INTEL_VGA_DEVICE(0x9AF8, info)
> -
> -#define INTEL_TGL_IDS(info) \
> -	INTEL_TGL_GT1_IDS(info), \
> -	INTEL_TGL_GT2_IDS(info)
> +#define INTEL_TGL_GT1_IDS(MACRO__, ...) \
> +	MACRO__(0x9A60, ## __VA_ARGS__), \
> +	MACRO__(0x9A68, ## __VA_ARGS__), \
> +	MACRO__(0x9A70, ## __VA_ARGS__)
> +
> +#define INTEL_TGL_GT2_IDS(MACRO__, ...) \
> +	MACRO__(0x9A40, ## __VA_ARGS__), \
> +	MACRO__(0x9A49, ## __VA_ARGS__), \
> +	MACRO__(0x9A59, ## __VA_ARGS__), \
> +	MACRO__(0x9A78, ## __VA_ARGS__), \
> +	MACRO__(0x9AC0, ## __VA_ARGS__), \
> +	MACRO__(0x9AC9, ## __VA_ARGS__), \
> +	MACRO__(0x9AD9, ## __VA_ARGS__), \
> +	MACRO__(0x9AF8, ## __VA_ARGS__)
> +
> +#define INTEL_TGL_IDS(MACRO__, ...) \
> +	INTEL_TGL_GT1_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_TGL_GT2_IDS(MACRO__, ## __VA_ARGS__)
>  
>  /* RKL */
> -#define INTEL_RKL_IDS(info) \
> -	INTEL_VGA_DEVICE(0x4C80, info), \
> -	INTEL_VGA_DEVICE(0x4C8A, info), \
> -	INTEL_VGA_DEVICE(0x4C8B, info), \
> -	INTEL_VGA_DEVICE(0x4C8C, info), \
> -	INTEL_VGA_DEVICE(0x4C90, info), \
> -	INTEL_VGA_DEVICE(0x4C9A, info)
> +#define INTEL_RKL_IDS(MACRO__, ...) \
> +	MACRO__(0x4C80, ## __VA_ARGS__), \
> +	MACRO__(0x4C8A, ## __VA_ARGS__), \
> +	MACRO__(0x4C8B, ## __VA_ARGS__), \
> +	MACRO__(0x4C8C, ## __VA_ARGS__), \
> +	MACRO__(0x4C90, ## __VA_ARGS__), \
> +	MACRO__(0x4C9A, ## __VA_ARGS__)
>  
>  /* DG1 */
> -#define INTEL_DG1_IDS(info) \
> -	INTEL_VGA_DEVICE(0x4905, info), \
> -	INTEL_VGA_DEVICE(0x4906, info), \
> -	INTEL_VGA_DEVICE(0x4907, info), \
> -	INTEL_VGA_DEVICE(0x4908, info), \
> -	INTEL_VGA_DEVICE(0x4909, info)
> +#define INTEL_DG1_IDS(MACRO__, ...) \
> +	MACRO__(0x4905, ## __VA_ARGS__), \
> +	MACRO__(0x4906, ## __VA_ARGS__), \
> +	MACRO__(0x4907, ## __VA_ARGS__), \
> +	MACRO__(0x4908, ## __VA_ARGS__), \
> +	MACRO__(0x4909, ## __VA_ARGS__)
>  
>  /* ADL-S */
> -#define INTEL_ADLS_IDS(info) \
> -	INTEL_VGA_DEVICE(0x4680, info), \
> -	INTEL_VGA_DEVICE(0x4682, info), \
> -	INTEL_VGA_DEVICE(0x4688, info), \
> -	INTEL_VGA_DEVICE(0x468A, info), \
> -	INTEL_VGA_DEVICE(0x468B, info), \
> -	INTEL_VGA_DEVICE(0x4690, info), \
> -	INTEL_VGA_DEVICE(0x4692, info), \
> -	INTEL_VGA_DEVICE(0x4693, info)
> +#define INTEL_ADLS_IDS(MACRO__, ...) \
> +	MACRO__(0x4680, ## __VA_ARGS__), \
> +	MACRO__(0x4682, ## __VA_ARGS__), \
> +	MACRO__(0x4688, ## __VA_ARGS__), \
> +	MACRO__(0x468A, ## __VA_ARGS__), \
> +	MACRO__(0x468B, ## __VA_ARGS__), \
> +	MACRO__(0x4690, ## __VA_ARGS__), \
> +	MACRO__(0x4692, ## __VA_ARGS__), \
> +	MACRO__(0x4693, ## __VA_ARGS__)
>  
>  /* ADL-P */
> -#define INTEL_ADLP_IDS(info) \
> -	INTEL_VGA_DEVICE(0x46A0, info), \
> -	INTEL_VGA_DEVICE(0x46A1, info), \
> -	INTEL_VGA_DEVICE(0x46A2, info), \
> -	INTEL_VGA_DEVICE(0x46A3, info), \
> -	INTEL_VGA_DEVICE(0x46A6, info), \
> -	INTEL_VGA_DEVICE(0x46A8, info), \
> -	INTEL_VGA_DEVICE(0x46AA, info), \
> -	INTEL_VGA_DEVICE(0x462A, info), \
> -	INTEL_VGA_DEVICE(0x4626, info), \
> -	INTEL_VGA_DEVICE(0x4628, info), \
> -	INTEL_VGA_DEVICE(0x46B0, info), \
> -	INTEL_VGA_DEVICE(0x46B1, info), \
> -	INTEL_VGA_DEVICE(0x46B2, info), \
> -	INTEL_VGA_DEVICE(0x46B3, info), \
> -	INTEL_VGA_DEVICE(0x46C0, info), \
> -	INTEL_VGA_DEVICE(0x46C1, info), \
> -	INTEL_VGA_DEVICE(0x46C2, info), \
> -	INTEL_VGA_DEVICE(0x46C3, info)
> +#define INTEL_ADLP_IDS(MACRO__, ...) \
> +	MACRO__(0x46A0, ## __VA_ARGS__), \
> +	MACRO__(0x46A1, ## __VA_ARGS__), \
> +	MACRO__(0x46A2, ## __VA_ARGS__), \
> +	MACRO__(0x46A3, ## __VA_ARGS__), \
> +	MACRO__(0x46A6, ## __VA_ARGS__), \
> +	MACRO__(0x46A8, ## __VA_ARGS__), \
> +	MACRO__(0x46AA, ## __VA_ARGS__), \
> +	MACRO__(0x462A, ## __VA_ARGS__), \
> +	MACRO__(0x4626, ## __VA_ARGS__), \
> +	MACRO__(0x4628, ## __VA_ARGS__), \
> +	MACRO__(0x46B0, ## __VA_ARGS__), \
> +	MACRO__(0x46B1, ## __VA_ARGS__), \
> +	MACRO__(0x46B2, ## __VA_ARGS__), \
> +	MACRO__(0x46B3, ## __VA_ARGS__), \
> +	MACRO__(0x46C0, ## __VA_ARGS__), \
> +	MACRO__(0x46C1, ## __VA_ARGS__), \
> +	MACRO__(0x46C2, ## __VA_ARGS__), \
> +	MACRO__(0x46C3, ## __VA_ARGS__)
>  
>  /* ADL-N */
> -#define INTEL_ADLN_IDS(info) \
> -	INTEL_VGA_DEVICE(0x46D0, info), \
> -	INTEL_VGA_DEVICE(0x46D1, info), \
> -	INTEL_VGA_DEVICE(0x46D2, info), \
> -	INTEL_VGA_DEVICE(0x46D3, info), \
> -	INTEL_VGA_DEVICE(0x46D4, info)
> +#define INTEL_ADLN_IDS(MACRO__, ...) \
> +	MACRO__(0x46D0, ## __VA_ARGS__), \
> +	MACRO__(0x46D1, ## __VA_ARGS__), \
> +	MACRO__(0x46D2, ## __VA_ARGS__), \
> +	MACRO__(0x46D3, ## __VA_ARGS__), \
> +	MACRO__(0x46D4, ## __VA_ARGS__)
>  
>  /* RPL-S */
> -#define INTEL_RPLS_IDS(info) \
> -	INTEL_VGA_DEVICE(0xA780, info), \
> -	INTEL_VGA_DEVICE(0xA781, info), \
> -	INTEL_VGA_DEVICE(0xA782, info), \
> -	INTEL_VGA_DEVICE(0xA783, info), \
> -	INTEL_VGA_DEVICE(0xA788, info), \
> -	INTEL_VGA_DEVICE(0xA789, info), \
> -	INTEL_VGA_DEVICE(0xA78A, info), \
> -	INTEL_VGA_DEVICE(0xA78B, info)
> +#define INTEL_RPLS_IDS(MACRO__, ...) \
> +	MACRO__(0xA780, ## __VA_ARGS__), \
> +	MACRO__(0xA781, ## __VA_ARGS__), \
> +	MACRO__(0xA782, ## __VA_ARGS__), \
> +	MACRO__(0xA783, ## __VA_ARGS__), \
> +	MACRO__(0xA788, ## __VA_ARGS__), \
> +	MACRO__(0xA789, ## __VA_ARGS__), \
> +	MACRO__(0xA78A, ## __VA_ARGS__), \
> +	MACRO__(0xA78B, ## __VA_ARGS__)
>  
>  /* RPL-U */
> -#define INTEL_RPLU_IDS(info) \
> -	INTEL_VGA_DEVICE(0xA721, info), \
> -	INTEL_VGA_DEVICE(0xA7A1, info), \
> -	INTEL_VGA_DEVICE(0xA7A9, info), \
> -	INTEL_VGA_DEVICE(0xA7AC, info), \
> -	INTEL_VGA_DEVICE(0xA7AD, info)
> +#define INTEL_RPLU_IDS(MACRO__, ...) \
> +	MACRO__(0xA721, ## __VA_ARGS__), \
> +	MACRO__(0xA7A1, ## __VA_ARGS__), \
> +	MACRO__(0xA7A9, ## __VA_ARGS__), \
> +	MACRO__(0xA7AC, ## __VA_ARGS__), \
> +	MACRO__(0xA7AD, ## __VA_ARGS__)
>  
>  /* RPL-P */
> -#define INTEL_RPLP_IDS(info) \
> -	INTEL_VGA_DEVICE(0xA720, info), \
> -	INTEL_VGA_DEVICE(0xA7A0, info), \
> -	INTEL_VGA_DEVICE(0xA7A8, info), \
> -	INTEL_VGA_DEVICE(0xA7AA, info), \
> -	INTEL_VGA_DEVICE(0xA7AB, info)
> +#define INTEL_RPLP_IDS(MACRO__, ...) \
> +	MACRO__(0xA720, ## __VA_ARGS__), \
> +	MACRO__(0xA7A0, ## __VA_ARGS__), \
> +	MACRO__(0xA7A8, ## __VA_ARGS__), \
> +	MACRO__(0xA7AA, ## __VA_ARGS__), \
> +	MACRO__(0xA7AB, ## __VA_ARGS__)
>  
>  /* DG2 */
> -#define INTEL_DG2_G10_IDS(info) \
> -	INTEL_VGA_DEVICE(0x5690, info), \
> -	INTEL_VGA_DEVICE(0x5691, info), \
> -	INTEL_VGA_DEVICE(0x5692, info), \
> -	INTEL_VGA_DEVICE(0x56A0, info), \
> -	INTEL_VGA_DEVICE(0x56A1, info), \
> -	INTEL_VGA_DEVICE(0x56A2, info), \
> -	INTEL_VGA_DEVICE(0x56BE, info), \
> -	INTEL_VGA_DEVICE(0x56BF, info)
> -
> -#define INTEL_DG2_G11_IDS(info) \
> -	INTEL_VGA_DEVICE(0x5693, info), \
> -	INTEL_VGA_DEVICE(0x5694, info), \
> -	INTEL_VGA_DEVICE(0x5695, info), \
> -	INTEL_VGA_DEVICE(0x56A5, info), \
> -	INTEL_VGA_DEVICE(0x56A6, info), \
> -	INTEL_VGA_DEVICE(0x56B0, info), \
> -	INTEL_VGA_DEVICE(0x56B1, info), \
> -	INTEL_VGA_DEVICE(0x56BA, info), \
> -	INTEL_VGA_DEVICE(0x56BB, info), \
> -	INTEL_VGA_DEVICE(0x56BC, info), \
> -	INTEL_VGA_DEVICE(0x56BD, info)
> -
> -#define INTEL_DG2_G12_IDS(info) \
> -	INTEL_VGA_DEVICE(0x5696, info), \
> -	INTEL_VGA_DEVICE(0x5697, info), \
> -	INTEL_VGA_DEVICE(0x56A3, info), \
> -	INTEL_VGA_DEVICE(0x56A4, info), \
> -	INTEL_VGA_DEVICE(0x56B2, info), \
> -	INTEL_VGA_DEVICE(0x56B3, info)
> -
> -#define INTEL_DG2_IDS(info) \
> -	INTEL_DG2_G10_IDS(info), \
> -	INTEL_DG2_G11_IDS(info), \
> -	INTEL_DG2_G12_IDS(info)
> -
> -#define INTEL_ATS_M150_IDS(info) \
> -	INTEL_VGA_DEVICE(0x56C0, info), \
> -	INTEL_VGA_DEVICE(0x56C2, info)
> -
> -#define INTEL_ATS_M75_IDS(info) \
> -	INTEL_VGA_DEVICE(0x56C1, info)
> -
> -#define INTEL_ATS_M_IDS(info) \
> -	INTEL_ATS_M150_IDS(info), \
> -	INTEL_ATS_M75_IDS(info)
> +#define INTEL_DG2_G10_IDS(MACRO__, ...) \
> +	MACRO__(0x5690, ## __VA_ARGS__), \
> +	MACRO__(0x5691, ## __VA_ARGS__), \
> +	MACRO__(0x5692, ## __VA_ARGS__), \
> +	MACRO__(0x56A0, ## __VA_ARGS__), \
> +	MACRO__(0x56A1, ## __VA_ARGS__), \
> +	MACRO__(0x56A2, ## __VA_ARGS__), \
> +	MACRO__(0x56BE, ## __VA_ARGS__), \
> +	MACRO__(0x56BF, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G11_IDS(MACRO__, ...) \
> +	MACRO__(0x5693, ## __VA_ARGS__), \
> +	MACRO__(0x5694, ## __VA_ARGS__), \
> +	MACRO__(0x5695, ## __VA_ARGS__), \
> +	MACRO__(0x56A5, ## __VA_ARGS__), \
> +	MACRO__(0x56A6, ## __VA_ARGS__), \
> +	MACRO__(0x56B0, ## __VA_ARGS__), \
> +	MACRO__(0x56B1, ## __VA_ARGS__), \
> +	MACRO__(0x56BA, ## __VA_ARGS__), \
> +	MACRO__(0x56BB, ## __VA_ARGS__), \
> +	MACRO__(0x56BC, ## __VA_ARGS__), \
> +	MACRO__(0x56BD, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G12_IDS(MACRO__, ...) \
> +	MACRO__(0x5696, ## __VA_ARGS__), \
> +	MACRO__(0x5697, ## __VA_ARGS__), \
> +	MACRO__(0x56A3, ## __VA_ARGS__), \
> +	MACRO__(0x56A4, ## __VA_ARGS__), \
> +	MACRO__(0x56B2, ## __VA_ARGS__), \
> +	MACRO__(0x56B3, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_IDS(MACRO__, ...) \
> +	INTEL_DG2_G10_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G11_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G12_IDS(MACRO__, ## __VA_ARGS__)
> +
> +#define INTEL_ATS_M150_IDS(MACRO__, ...) \
> +	MACRO__(0x56C0, ## __VA_ARGS__), \
> +	MACRO__(0x56C2, ## __VA_ARGS__)
> +
> +#define INTEL_ATS_M75_IDS(MACRO__, ...) \
> +	MACRO__(0x56C1, ## __VA_ARGS__)
> +
> +#define INTEL_ATS_M_IDS(MACRO__, ...) \
> +	INTEL_ATS_M150_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
>  
>  /* MTL */
> -#define INTEL_MTL_IDS(info) \
> -	INTEL_VGA_DEVICE(0x7D40, info), \
> -	INTEL_VGA_DEVICE(0x7D41, info), \
> -	INTEL_VGA_DEVICE(0x7D45, info), \
> -	INTEL_VGA_DEVICE(0x7D51, info), \
> -	INTEL_VGA_DEVICE(0x7D55, info), \
> -	INTEL_VGA_DEVICE(0x7D60, info), \
> -	INTEL_VGA_DEVICE(0x7D67, info), \
> -	INTEL_VGA_DEVICE(0x7DD1, info), \
> -	INTEL_VGA_DEVICE(0x7DD5, info)
> +#define INTEL_MTL_IDS(MACRO__, ...) \
> +	MACRO__(0x7D40, ## __VA_ARGS__), \
> +	MACRO__(0x7D41, ## __VA_ARGS__), \
> +	MACRO__(0x7D45, ## __VA_ARGS__), \
> +	MACRO__(0x7D51, ## __VA_ARGS__), \
> +	MACRO__(0x7D55, ## __VA_ARGS__), \
> +	MACRO__(0x7D60, ## __VA_ARGS__), \
> +	MACRO__(0x7D67, ## __VA_ARGS__), \
> +	MACRO__(0x7DD1, ## __VA_ARGS__), \
> +	MACRO__(0x7DD5, ## __VA_ARGS__)
>  
>  #endif /* _I915_PCIIDS_H */
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index 4d05307ce3d7..30aca2abd7be 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -516,106 +516,106 @@ static const struct intel_device_info intel_lunarlake_info = {
>  };
>  
>  static const struct pci_id_match intel_device_match[] = {
> -	INTEL_I810_IDS(&intel_i810_info),
> -	INTEL_I815_IDS(&intel_i815_info),
> +	INTEL_I810_IDS(INTEL_VGA_DEVICE, &intel_i810_info),
> +	INTEL_I815_IDS(INTEL_VGA_DEVICE, &intel_i815_info),
>  
> -	INTEL_I830_IDS(&intel_i830_info),
> -	INTEL_I845G_IDS(&intel_i845_info),
> -	INTEL_I85X_IDS(&intel_i855_info),
> -	INTEL_I865G_IDS(&intel_i865_info),
> +	INTEL_I830_IDS(INTEL_VGA_DEVICE, &intel_i830_info),
> +	INTEL_I845G_IDS(INTEL_VGA_DEVICE, &intel_i845_info),
> +	INTEL_I85X_IDS(INTEL_VGA_DEVICE, &intel_i855_info),
> +	INTEL_I865G_IDS(INTEL_VGA_DEVICE, &intel_i865_info),
>  
> -	INTEL_I915G_IDS(&intel_i915_info),
> -	INTEL_I915GM_IDS(&intel_i915m_info),
> -	INTEL_I945G_IDS(&intel_i945_info),
> -	INTEL_I945GM_IDS(&intel_i945m_info),
> +	INTEL_I915G_IDS(INTEL_VGA_DEVICE, &intel_i915_info),
> +	INTEL_I915GM_IDS(INTEL_VGA_DEVICE, &intel_i915m_info),
> +	INTEL_I945G_IDS(INTEL_VGA_DEVICE, &intel_i945_info),
> +	INTEL_I945GM_IDS(INTEL_VGA_DEVICE, &intel_i945m_info),
>  
> -	INTEL_G33_IDS(&intel_g33_info),
> -	INTEL_PNV_G_IDS(&intel_pineview_g_info),
> -	INTEL_PNV_M_IDS(&intel_pineview_m_info),
> +	INTEL_G33_IDS(INTEL_VGA_DEVICE, &intel_g33_info),
> +	INTEL_PNV_G_IDS(INTEL_VGA_DEVICE, &intel_pineview_g_info),
> +	INTEL_PNV_M_IDS(INTEL_VGA_DEVICE, &intel_pineview_m_info),
>  
> -	INTEL_I965G_IDS(&intel_i965_info),
> -	INTEL_I965GM_IDS(&intel_i965m_info),
> +	INTEL_I965G_IDS(INTEL_VGA_DEVICE, &intel_i965_info),
> +	INTEL_I965GM_IDS(INTEL_VGA_DEVICE, &intel_i965m_info),
>  
> -	INTEL_G45_IDS(&intel_g45_info),
> -	INTEL_GM45_IDS(&intel_gm45_info),
> +	INTEL_G45_IDS(INTEL_VGA_DEVICE, &intel_g45_info),
> +	INTEL_GM45_IDS(INTEL_VGA_DEVICE, &intel_gm45_info),
>  
> -	INTEL_ILK_D_IDS(&intel_ironlake_info),
> -	INTEL_ILK_M_IDS(&intel_ironlake_m_info),
> +	INTEL_ILK_D_IDS(INTEL_VGA_DEVICE, &intel_ironlake_info),
> +	INTEL_ILK_M_IDS(INTEL_VGA_DEVICE, &intel_ironlake_m_info),
>  
> -	INTEL_SNB_D_IDS(&intel_sandybridge_info),
> -	INTEL_SNB_M_IDS(&intel_sandybridge_m_info),
> +	INTEL_SNB_D_IDS(INTEL_VGA_DEVICE, &intel_sandybridge_info),
> +	INTEL_SNB_M_IDS(INTEL_VGA_DEVICE, &intel_sandybridge_m_info),
>  
> -	INTEL_IVB_D_IDS(&intel_ivybridge_info),
> -	INTEL_IVB_M_IDS(&intel_ivybridge_m_info),
> +	INTEL_IVB_D_IDS(INTEL_VGA_DEVICE, &intel_ivybridge_info),
> +	INTEL_IVB_M_IDS(INTEL_VGA_DEVICE, &intel_ivybridge_m_info),
>  
> -	INTEL_HSW_GT1_IDS(&intel_haswell_gt1_info),
> -	INTEL_HSW_GT2_IDS(&intel_haswell_gt2_info),
> -	INTEL_HSW_GT3_IDS(&intel_haswell_gt3_info),
> +	INTEL_HSW_GT1_IDS(INTEL_VGA_DEVICE, &intel_haswell_gt1_info),
> +	INTEL_HSW_GT2_IDS(INTEL_VGA_DEVICE, &intel_haswell_gt2_info),
> +	INTEL_HSW_GT3_IDS(INTEL_VGA_DEVICE, &intel_haswell_gt3_info),
>  
> -	INTEL_VLV_IDS(&intel_valleyview_info),
> +	INTEL_VLV_IDS(INTEL_VGA_DEVICE, &intel_valleyview_info),
>  
> -	INTEL_BDW_GT1_IDS(&intel_broadwell_gt1_info),
> -	INTEL_BDW_GT2_IDS(&intel_broadwell_gt2_info),
> -	INTEL_BDW_GT3_IDS(&intel_broadwell_gt3_info),
> -	INTEL_BDW_RSVD_IDS(&intel_broadwell_unknown_info),
> +	INTEL_BDW_GT1_IDS(INTEL_VGA_DEVICE, &intel_broadwell_gt1_info),
> +	INTEL_BDW_GT2_IDS(INTEL_VGA_DEVICE, &intel_broadwell_gt2_info),
> +	INTEL_BDW_GT3_IDS(INTEL_VGA_DEVICE, &intel_broadwell_gt3_info),
> +	INTEL_BDW_RSVD_IDS(INTEL_VGA_DEVICE, &intel_broadwell_unknown_info),
>  
> -	INTEL_CHV_IDS(&intel_cherryview_info),
> +	INTEL_CHV_IDS(INTEL_VGA_DEVICE, &intel_cherryview_info),
>  
> -	INTEL_SKL_GT1_IDS(&intel_skylake_gt1_info),
> -	INTEL_SKL_GT2_IDS(&intel_skylake_gt2_info),
> -	INTEL_SKL_GT3_IDS(&intel_skylake_gt3_info),
> -	INTEL_SKL_GT4_IDS(&intel_skylake_gt4_info),
> +	INTEL_SKL_GT1_IDS(INTEL_VGA_DEVICE, &intel_skylake_gt1_info),
> +	INTEL_SKL_GT2_IDS(INTEL_VGA_DEVICE, &intel_skylake_gt2_info),
> +	INTEL_SKL_GT3_IDS(INTEL_VGA_DEVICE, &intel_skylake_gt3_info),
> +	INTEL_SKL_GT4_IDS(INTEL_VGA_DEVICE, &intel_skylake_gt4_info),
>  
> -	INTEL_BXT_IDS(&intel_broxton_info),
> +	INTEL_BXT_IDS(INTEL_VGA_DEVICE, &intel_broxton_info),
>  
> -	INTEL_KBL_GT1_IDS(&intel_kabylake_gt1_info),
> -	INTEL_KBL_GT2_IDS(&intel_kabylake_gt2_info),
> -	INTEL_KBL_GT3_IDS(&intel_kabylake_gt3_info),
> -	INTEL_KBL_GT4_IDS(&intel_kabylake_gt4_info),
> -	INTEL_AML_KBL_GT2_IDS(&intel_kabylake_gt2_info),
> +	INTEL_KBL_GT1_IDS(INTEL_VGA_DEVICE, &intel_kabylake_gt1_info),
> +	INTEL_KBL_GT2_IDS(INTEL_VGA_DEVICE, &intel_kabylake_gt2_info),
> +	INTEL_KBL_GT3_IDS(INTEL_VGA_DEVICE, &intel_kabylake_gt3_info),
> +	INTEL_KBL_GT4_IDS(INTEL_VGA_DEVICE, &intel_kabylake_gt4_info),
> +	INTEL_AML_KBL_GT2_IDS(INTEL_VGA_DEVICE, &intel_kabylake_gt2_info),
>  
> -	INTEL_GLK_IDS(&intel_geminilake_info),
> +	INTEL_GLK_IDS(INTEL_VGA_DEVICE, &intel_geminilake_info),
>  
> -	INTEL_CFL_S_GT1_IDS(&intel_coffeelake_gt1_info),
> -	INTEL_CFL_S_GT2_IDS(&intel_coffeelake_gt2_info),
> -	INTEL_CFL_H_GT1_IDS(&intel_coffeelake_gt1_info),
> -	INTEL_CFL_H_GT2_IDS(&intel_coffeelake_gt2_info),
> -	INTEL_CFL_U_GT2_IDS(&intel_coffeelake_gt2_info),
> -	INTEL_CFL_U_GT3_IDS(&intel_coffeelake_gt3_info),
> -	INTEL_WHL_U_GT1_IDS(&intel_coffeelake_gt1_info),
> -	INTEL_WHL_U_GT2_IDS(&intel_coffeelake_gt2_info),
> -	INTEL_WHL_U_GT3_IDS(&intel_coffeelake_gt3_info),
> -	INTEL_AML_CFL_GT2_IDS(&intel_coffeelake_gt2_info),
> +	INTEL_CFL_S_GT1_IDS(INTEL_VGA_DEVICE, &intel_coffeelake_gt1_info),
> +	INTEL_CFL_S_GT2_IDS(INTEL_VGA_DEVICE, &intel_coffeelake_gt2_info),
> +	INTEL_CFL_H_GT1_IDS(INTEL_VGA_DEVICE, &intel_coffeelake_gt1_info),
> +	INTEL_CFL_H_GT2_IDS(INTEL_VGA_DEVICE, &intel_coffeelake_gt2_info),
> +	INTEL_CFL_U_GT2_IDS(INTEL_VGA_DEVICE, &intel_coffeelake_gt2_info),
> +	INTEL_CFL_U_GT3_IDS(INTEL_VGA_DEVICE, &intel_coffeelake_gt3_info),
> +	INTEL_WHL_U_GT1_IDS(INTEL_VGA_DEVICE, &intel_coffeelake_gt1_info),
> +	INTEL_WHL_U_GT2_IDS(INTEL_VGA_DEVICE, &intel_coffeelake_gt2_info),
> +	INTEL_WHL_U_GT3_IDS(INTEL_VGA_DEVICE, &intel_coffeelake_gt3_info),
> +	INTEL_AML_CFL_GT2_IDS(INTEL_VGA_DEVICE, &intel_coffeelake_gt2_info),
>  
> -	INTEL_CML_GT1_IDS(&intel_cometlake_gt1_info),
> -	INTEL_CML_GT2_IDS(&intel_cometlake_gt2_info),
> -	INTEL_CML_U_GT1_IDS(&intel_cometlake_gt1_info),
> -	INTEL_CML_U_GT2_IDS(&intel_cometlake_gt2_info),
> +	INTEL_CML_GT1_IDS(INTEL_VGA_DEVICE, &intel_cometlake_gt1_info),
> +	INTEL_CML_GT2_IDS(INTEL_VGA_DEVICE, &intel_cometlake_gt2_info),
> +	INTEL_CML_U_GT1_IDS(INTEL_VGA_DEVICE, &intel_cometlake_gt1_info),
> +	INTEL_CML_U_GT2_IDS(INTEL_VGA_DEVICE, &intel_cometlake_gt2_info),
>  
> -	INTEL_CNL_IDS(&intel_cannonlake_info),
> +	INTEL_CNL_IDS(INTEL_VGA_DEVICE, &intel_cannonlake_info),
>  
> -	INTEL_ICL_IDS(&intel_icelake_info),
> +	INTEL_ICL_IDS(INTEL_VGA_DEVICE, &intel_icelake_info),
>  
> -	INTEL_EHL_IDS(&intel_elkhartlake_info),
> -	INTEL_JSL_IDS(&intel_jasperlake_info),
> +	INTEL_EHL_IDS(INTEL_VGA_DEVICE, &intel_elkhartlake_info),
> +	INTEL_JSL_IDS(INTEL_VGA_DEVICE, &intel_jasperlake_info),
>  
> -	INTEL_TGL_GT1_IDS(&intel_tigerlake_gt1_info),
> -	INTEL_TGL_GT2_IDS(&intel_tigerlake_gt2_info),
> -	INTEL_RKL_IDS(&intel_rocketlake_info),
> +	INTEL_TGL_GT1_IDS(INTEL_VGA_DEVICE, &intel_tigerlake_gt1_info),
> +	INTEL_TGL_GT2_IDS(INTEL_VGA_DEVICE, &intel_tigerlake_gt2_info),
> +	INTEL_RKL_IDS(INTEL_VGA_DEVICE, &intel_rocketlake_info),
>  
> -	INTEL_DG1_IDS(&intel_dg1_info),
> -	INTEL_DG2_IDS(&intel_dg2_info),
> +	INTEL_DG1_IDS(INTEL_VGA_DEVICE, &intel_dg1_info),
> +	INTEL_DG2_IDS(INTEL_VGA_DEVICE, &intel_dg2_info),
>  
> -	INTEL_ADLS_IDS(&intel_alderlake_s_info),
> -	INTEL_RPLS_IDS(&intel_raptorlake_s_info),
> -	INTEL_ADLP_IDS(&intel_alderlake_p_info),
> -	INTEL_RPLU_IDS(&intel_alderlake_p_info),
> -	INTEL_RPLP_IDS(&intel_alderlake_p_info),
> -	INTEL_ADLN_IDS(&intel_alderlake_n_info),
> +	INTEL_ADLS_IDS(INTEL_VGA_DEVICE, &intel_alderlake_s_info),
> +	INTEL_RPLS_IDS(INTEL_VGA_DEVICE, &intel_raptorlake_s_info),
> +	INTEL_ADLP_IDS(INTEL_VGA_DEVICE, &intel_alderlake_p_info),
> +	INTEL_RPLU_IDS(INTEL_VGA_DEVICE, &intel_alderlake_p_info),
> +	INTEL_RPLP_IDS(INTEL_VGA_DEVICE, &intel_alderlake_p_info),
> +	INTEL_ADLN_IDS(INTEL_VGA_DEVICE, &intel_alderlake_n_info),
>  
> -	INTEL_ATS_M_IDS(&intel_ats_m_info),
> +	INTEL_ATS_M_IDS(INTEL_VGA_DEVICE, &intel_ats_m_info),
>  
> -	INTEL_MTL_IDS(&intel_meteorlake_info),
> +	INTEL_MTL_IDS(INTEL_VGA_DEVICE, &intel_meteorlake_info),
>  
>  	INTEL_PVC_IDS(&intel_pontevecchio_info),
>  
> -- 
> 2.39.2
> 
