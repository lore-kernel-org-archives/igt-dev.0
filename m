Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A0FD597A4
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 20:50:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3339210E0BA;
	Tue, 12 Nov 2024 20:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X6HCGWCY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3699A10E0BA
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 20:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731444641; x=1762980641;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qmIueGc+IP9VAIGx3kfVtgTUZCat7bayU0SkoxBWFI8=;
 b=X6HCGWCYBKT4VtQBPLydqp8oFLdqMktBEvTLnuH4ALmSc4Xy+MJ9qip8
 BoDTjarxrugK9p3LItcyimD7952XGMPgIlcWWjlG8Q5eTW3HR7BvT4p2h
 0vTXo3hN97tCDmueCFgvR1Qrz/PaDMJ+48tE0o/ZaLr2iStmMl49lW+z2
 B7WIDMLY9s2qzMLZ9uLfZqA4JiWU4q9KWYtwznOlBOzUkp1bTzltP89sC
 WMf+iDskabHaIcxea2PBahQTr75ifkLkAR3jFc5dsi5cQMDWCMv6ywh8x
 P+HXZ+P5ZiMtpDtZQzVD/t8RmdRY19jFmJKeD23adL5ozB/C+KwSXxUJO Q==;
X-CSE-ConnectionGUID: sl0f5/ErRx+YfgwirRgK5A==
X-CSE-MsgGUID: y2d51qCzREW9Qw1a+LYsLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="34171935"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="34171935"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 12:50:41 -0800
X-CSE-ConnectionGUID: s8lfIqQ4ROWV4Lh2IpghuA==
X-CSE-MsgGUID: BjLiv6JkTnKbhs1sD+gG1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="87550241"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 12:50:41 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 12:50:40 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 12:50:40 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 12:50:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/8NDLV7pI/dmejdPNsoX3EVMdA3sJI/MbQHOm+3P8r3/XgoREuU5uM/y76PJWaWv9Dk9CNepYApdvrhrRx80Uga43nhlVqDjNpaoYksLS2kGf7ppUX5wAxgyv2nlnOEU9W24mzZgEtEoOUgA3cz5xq6Z8PFd/fbp2sv8YMafYcpKNxD8DuIvb0zT+WUiguRnsAbM3Jq4RgykAikMcopp28uRBTVOKEVPCbFzGnYPUjZggADWitbcESyTQtXJwNK2oWOFKUkOf6oQDu+s3FVMdbkLqDPpTUy5vrriPgD1bO4XuU7puH2iXbTvbGn44YAilIh0Zd8/w1cpuf+nQliew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrNJDCVJdYmnRv/SUYhPwbpnCdNraHZdSehQYD7frio=;
 b=wV78wNn9CVP3OVFKXCr1zMu6/GUNZ0/NYtIEUv5l7Hu63o1MguXDPa5uHnI1xvV2S3KJaaXveJo7zVEpM63UA1DPERY0x7SCdvkV5hFjV23n6ER3pI7Ls3rdr8z/NOGeGGKt96T7hEwrdrXszzK2QFbFT/HCmPnJcfSO32YTHCqChZ+9kjN4fcvewCf03P5CUHv5J2yHGP72PxGMM8bX35/RN+pWakqGHgh3mOhRU+0pJa+YlkZhctsmn+ggOtijowOhyhsPdPp257lSBadLUcdCmZvPW8eOeqaG8B1MHp8iJbxYTXk6uWkKMhVSDP4sufTXb1iYwHLN8T0cJE+Lgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB8020.namprd11.prod.outlook.com (2603:10b6:8:114::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Tue, 12 Nov
 2024 20:50:36 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Tue, 12 Nov 2024
 20:50:36 +0000
Date: Tue, 12 Nov 2024 15:50:32 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t, v3 4/5] tests/intel/xe_fault_injection: Inject
 errors during vm create IOCTL
Message-ID: <ZzO_mMiYJ-BN52z2@intel.com>
References: <20241112133034.1919573-1-francois.dugast@intel.com>
 <20241112133034.1919573-5-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241112133034.1919573-5-francois.dugast@intel.com>
X-ClientProxiedBy: MW4P221CA0027.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::32) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 13292ccc-6dea-4297-bb98-08dd035ba876
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3ASOPUVhxSMWhCg1fU6+9YYy9bSylArSGZNwrTww6AUq46RxsE01mvZkG+wd?=
 =?us-ascii?Q?tdZsJf8blW0Sucfyv4FhpvQ7hKfo+4jh8FIQZ8blers6r7SnSXguz+gNO4ns?=
 =?us-ascii?Q?xTBWe22RpuGmXdEII1cW/WqaYn2bjENzQKMqRrqRejycQV1e/WTEfHC4ypRl?=
 =?us-ascii?Q?cBZH5u55T+u+mRUBa7xl/5OEZRZYvLdprz2jcJVQE6Oqd3ytZ9bV930pvL9B?=
 =?us-ascii?Q?dI1V3d8JNrTl7GKasiA2Rb5Df87E73FfcUv26bJHtvGRFyVE5a7O4BUWgJ7c?=
 =?us-ascii?Q?H30qUAeASCF+u2d7R9BbHKg5YToZg1RG8wJeDClCYTM0WEjK04nfZ/ZGygW2?=
 =?us-ascii?Q?lII6LLh6LN+t7in0OQYQLlFPzd1VEybx6ryaIcx80DNclKdA0t1I5LJk6iia?=
 =?us-ascii?Q?HnRHuWCAFwXVqQ4K+4cDHTKSogCmfKWPk+r6zPRacrANR48zFi5wvco3ySY0?=
 =?us-ascii?Q?2dOTscjUTo0WmPH0KUu/vEvcaa6Z/0cAFHKDxdbaEpscXM1b9B7oUbADb72Y?=
 =?us-ascii?Q?WQQD91DPf7QYkfc6nkQAoe2M8ATJBuH0ypkyWVvUVMxalT+1FUyrgAE78wEB?=
 =?us-ascii?Q?+h45YogtClwvCsD8f3TZERZx2tKPsjdM8TbtFEyaqtMNKXu4uyGtrmhRFuOA?=
 =?us-ascii?Q?TFeJxKTvviJlY/2Kwu5W/WYaZLNcS+WCIuQ/fpOc4rDjDOSv68+/zZTT6vP+?=
 =?us-ascii?Q?fwUDA8zUJcNXsSqll8wPvkbBVntwnBsIj0a5ISyamo/wnqAduzMUlz6Mu1Jv?=
 =?us-ascii?Q?xiiReurbCndQ3F0itvt+b6lA6VSCTN4PwYrSDg49K8FdIDgnIRzTNrj0eBfd?=
 =?us-ascii?Q?NOXUl+Y06xANk+G4T+XuBuWCSCARdI9YSjWlRJoZ5nH7iw/Nin/RJ2l1/h2J?=
 =?us-ascii?Q?RsSt48DPzyge/n+h33V8P+PB9xq4WSyykiJjysxI+T8bBVS21Z4FySDEb9fh?=
 =?us-ascii?Q?75oHtXRbdBXnCfISWQmwsDwV74fvvn88ucoWM2Lu1MpovGy4kKbjgLa/eAM8?=
 =?us-ascii?Q?b6GOQURPh9Vi9i4I1zjoCGFp2orbDjQ8oYuf3WuM0OfvuMJbFyKJF2wNQpZi?=
 =?us-ascii?Q?eFvqty5qKTYF5qo9br3Ts1QdRi6h9wznRucjr+PfNw9c5WqWhKjrdzEsnwNT?=
 =?us-ascii?Q?DUgZAZvwcJuWNtl0VFi202CHEP5Ub57ymkE7xrEGFZYSTD28UiswXNmYrrcZ?=
 =?us-ascii?Q?nLu/io2XsWV73zW4ZxHUHoHSE94ScHJnLH83wUzZ1K5YGaaehAjr+TD4U+Bn?=
 =?us-ascii?Q?4b1mnlsLO25PNRWkJxStJ7ksCxgix1l7iPoQmtzx9Zcg+PicO1u15ZS+dzXa?=
 =?us-ascii?Q?vWQC4n7q4Wb427Mzue195Q8b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uLoNvZtxZhlQLpy1INiBdq4nYJE1IihhQ+jrXzOfdn5PObSKm7FBIvz2TNZC?=
 =?us-ascii?Q?wgtZOA6IbmrhgiJ5VxW56IEnuttyViQ5/uoNNqoRDVgoT5RlcuFNSoPJJKg3?=
 =?us-ascii?Q?ih2YEYpajgX3pJI2EK7OTYne2MBVsV40tzJSu4+7Jtsc5BVLRmKjRtipiPal?=
 =?us-ascii?Q?kMVdQtWXLblpbTYLXVJhOPiADhbgvY5O8tE9ttEg/KVC1r9UFU30bB1o40y9?=
 =?us-ascii?Q?cpBW+Uy0/nWSplwTFJ//8wRUGacNaOEFSPJiTQOzJrktvBb8cLmyRqL9iTuP?=
 =?us-ascii?Q?xs2Mf+R1fXLZEQ9YixUB9+whyJi1LhfLEXoZk+DRDWS4NrYHP4SfUy7qIfy2?=
 =?us-ascii?Q?oxI3DS3T9B4B8NdOwz8znCcjG/L9FLvZ2J0uufqvddBVQ+ksYqMZidZ7LciG?=
 =?us-ascii?Q?0RMtsIMUsUCGMtxeeNodsG3jplEVSr9ervdSmf2nCK/h5TPkIjC0jCAla5iA?=
 =?us-ascii?Q?hKnxHLWUTdoEWXXb2mh9NaROisMGAdP2+xjaSOkOiZbaAtw+VJ6rbGwCSCf+?=
 =?us-ascii?Q?dqNlZpZ3pGfudg7Nco1L9uK2fM/0wiHvC8qQzBPwaiYEW5JQU6NDbfHx6cKb?=
 =?us-ascii?Q?lgkZduClOC+ORFeEXwLGyShP0yEBRIE3ANIGf7FL8PVhW2DgOoN1fhicIJ+8?=
 =?us-ascii?Q?q180+K0J+yxksO2lAXMXvubVJLyKf62Bhvam4atJCfSioQBYOYZS/NmZATJX?=
 =?us-ascii?Q?9dCQoLrMLTAeNH4HhD586oFpZ1Vcb4OdlSa8DMsHh3p8w7DtC3OYbTkIiuU6?=
 =?us-ascii?Q?6jea3mAX312wdbGD/MR3iAmqXrjYDf4YIKPWfHapGAEZBMjSN/A+llS8IymI?=
 =?us-ascii?Q?5EalokrEXw86BdW3xYuPd/sTl0XM/48lhPhr1et6kXovKfJ8j/zLkcCds+RC?=
 =?us-ascii?Q?X9OxykQ4bKTbnqlpzOPbgdYRXAzSpmA0Er3m+SrOj5xvbklGm871wg7ZRRUD?=
 =?us-ascii?Q?Bo2Ena4sgievRals3ZbbxDeHAmMD7/pFqeUEaltk3WOGmxG5SkhrVeY5fX1M?=
 =?us-ascii?Q?XBtcs+DwiTP5MmlTtO60QgEkgbB3jn6ZDrOZ375ev9uO94E/Uf2XZQ9bE6v+?=
 =?us-ascii?Q?uYG9kXQ1rFVW6Qalfr3BUVMFMHAY+/gTty0M2Cu+6+rQAyQVW+CNhgl5Rfqd?=
 =?us-ascii?Q?WsYhDM4YJQhKYYltA8BUl2y+wmEY0/ySSDZWDhbONM+VtzjPl1D23oZvSt1Z?=
 =?us-ascii?Q?f0czQY6rRYj/8Una3LtpA4rq51M5SHrEJ+68wwtmAWXjTx05mcP0OcMK0OpV?=
 =?us-ascii?Q?aesjsAVsjh9Iy7QMZ5AWl5lCgnh+EZdOtAl7wIlI8NsX08i66JNr1PRVFpr/?=
 =?us-ascii?Q?IPcHU2BWLjRP2adtbsBtZZmr1L0n23ucw8RmBoy8f+qEOfDevUcK8lcIOY4T?=
 =?us-ascii?Q?jiNc0Xn4SncDqcr3SlAc/rbDshZGYfoZOuFYCVxy5MMzHkc/2Nh5ZME+TpdX?=
 =?us-ascii?Q?T3xAcnobE5wgreOkbgT1KUvL+cczQzGnWDgPcdFo1v3G0qfVBlc9+Vk8UkFK?=
 =?us-ascii?Q?aFDFD7Bfr5KfVz3dqN1WWl3BOv2aL3DlSIU/QMvktwB95Vl5ure9KhMn0+dG?=
 =?us-ascii?Q?nRSZUKhhdga8YAMII80SUEkULX6KKs2WN3ppW8v2hkBqcJKy1N08HWO2G7fc?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13292ccc-6dea-4297-bb98-08dd035ba876
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 20:50:36.4339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XQBtKaMQXe80YruGcyv6GXXNWBLSEh3qCRIJrfWrJfQ6CbKj3L73mFuKFxZoPOyeEaOzv54jzvrGanhTMeEQ1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8020
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

On Tue, Nov 12, 2024 at 02:29:53PM +0100, Francois Dugast wrote:
> Use the fault injection infrastructure to make targeted internal KMD
> functions fail when executing xe_vm_create_ioctl() so that more code
> paths are tested, such as error handling and unwinding.
> 
> v2: Order function names alphabetically (Rodrigo Vivi)
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  tests/intel/xe_fault_injection.c | 55 ++++++++++++++++++++++++++++++--
>  1 file changed, 53 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index f99cc48c6..d321446b5 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -17,6 +17,8 @@
>  #include "igt_device.h"
>  #include "igt_kmod.h"
>  #include "igt_sysfs.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
>  
>  #define INJECT_ERRNO			-ENOMEM
>  
> @@ -154,13 +156,47 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
>  	injection_list_do(INJECTION_LIST_REMOVE, function_name);
>  }
>  
> +static int
> +simple_vm_create(int fd, unsigned int flags)
> +{
> +	struct drm_xe_vm_create create = {
> +		.flags = flags,
> +	};
> +
> +	return igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
> +}
> +
> +/**
> + * SUBTEST: vm-create-fail-%s
> + * Description: inject an error in function %arg[1] used in vm create IOCTL to make it fail
> + * Functionality: fault
> + *
> + * arg[1]:
> + * @xe_exec_queue_create_bind:	xe_exec_queue_create_bind
> + * @xe_pt_create:		xe_pt_create
> + * @xe_vm_create_scratch:	xe_vm_create_scratch
> + */
> +static void
> +vm_create_fail(int fd, const char function_name[], unsigned int flags)
> +{
> +	igt_assert_eq(simple_vm_create(fd, flags), 0);
> +
> +	injection_list_do(INJECTION_LIST_ADD, function_name);
> +	set_retval(function_name, INJECT_ERRNO);
> +	igt_assert(simple_vm_create(fd, flags) != 0);
> +	injection_list_do(INJECTION_LIST_REMOVE, function_name);
> +
> +	igt_assert_eq(simple_vm_create(fd, flags), 0);
> +}
> +
>  igt_main
>  {
>  	int fd;
>  	char pci_slot[NAME_MAX];
>  	const struct section {
>  		const char *name;
> -	} probe_function_sections[] = {
> +		unsigned int flags;
> +	} probe_fail_functions[] = {
>  		{ "wait_for_lmem_ready" },
>  		{ "xe_device_create" },
>  		{ "xe_ggtt_init_early" },
> @@ -176,16 +212,29 @@ igt_main
>  		{ "xe_wopcm_init" },
>  		{ }
>  	};
> +	const struct section vm_create_fail_functions[] = {
> +		{ "xe_exec_queue_create_bind", 0 },
> +		{ "xe_pt_create", 0 },
> +		{ "xe_vm_create_scratch", DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE },
> +		{ }
> +	};
>  
>  	igt_fixture {
>  		igt_require(fail_function_injection_enabled());
>  		fd = drm_open_driver(DRIVER_XE);
>  		igt_device_get_pci_slot_name(fd, pci_slot);
>  		setup_injection_fault();
> +	}
> +
> +	for (const struct section *s = vm_create_fail_functions; s->name; s++)
> +		igt_subtest_f("vm-create-fail-%s", s->name)
> +			vm_create_fail(fd, s->name, s->flags);
> +
> +	igt_fixture {
>  		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
>  	}
>  
> -	for (const struct section *s = probe_function_sections; s->name; s++)
> +	for (const struct section *s = probe_fail_functions; s->name; s++)
>  		igt_subtest_f("inject-fault-probe-function-%s", s->name)
>  			inject_fault_probe(fd, pci_slot, s->name);
>  
> @@ -193,4 +242,6 @@ igt_main
>  		drm_close_driver(fd);
>  		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_BIND);
>  	}
> +
> +
>  }
> -- 
> 2.43.0
> 
