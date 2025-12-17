Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDF2D65559
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 13:16:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7155510EC76;
	Wed, 17 Dec 2025 13:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OUd7RkUv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B9710EC76
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 13:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765977398; x=1797513398;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lc/4pjvOOj97XbW4Lr46QrG5e6V7iMWfWypbCz1Rolk=;
 b=OUd7RkUvJ9ZUJ1BDowaogOGX340rhioTPRToaesZQ0ahHI9rVI1XYJOj
 CR7ZHAPhKau/dcHGuxE0Ib5FONYPxBTJ0Bo9m0nJPq4WM0eVpCyk/0Lck
 sBGJz0cx7OHAORAd4SLeMBogaajb3m3OtU7BZhx3RyBddqPSzqtlGqFVD
 UOiVhjJoKdbuB63JzzqDjX7x8NhrRs0xxraPomqA2TFHvNDayCt/hBnmv
 2dpIptgBPG6oaGXmFuNtI7CM6a5GKpWv1pyuJIQm2MWyz0U3/ZiQejqWv
 fNOtit3GeTfAj4P32XPDlBV/CORGRCOp4E4KjdQggFGG27E5nOG81Ft09 A==;
X-CSE-ConnectionGUID: b9GtnPH5SOGXPEIOZYLvwQ==
X-CSE-MsgGUID: k31bM28ET36CBO7gvJ4PHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67852311"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="67852311"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 05:16:37 -0800
X-CSE-ConnectionGUID: fK+JBnhcRuOIauxPmuBE5g==
X-CSE-MsgGUID: jvdYaRmOR7+oPJLu6KbwKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="199107805"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 05:16:37 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 05:16:36 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 05:16:36 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 05:16:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZYsGx8UxpqfsCWM5dPIjXJo5XEqsMw0GeJMvu0QzTWfspJr3wlBvUSQLFqM3iSvokfK4S3SayBFbQPogf1MQ2+N0GY6pnHDPgaQd5v0cjmU0AeQzOp3E2nSnITTnTBsVvYodhb0T8BsBkEBwTPVabYLk1CdHY4MLd8DfqvZJsT5Cjw4T0csJjZCjNJ/68qEsZ6xzmGHjD0iN98uuWuEYbFuIJ76oYpErTA2nKBRFmLHHl2v51zh7hejh8h3fxUzNHAqWIpft+5+dFhVqjyxZCM0qfrcXag7lhbbonVQauYyKGkpJbRaYyPJgoX7JPTZ/eAxsOFWTQJljjVqpEOwnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9rv+wbuWD+S8xPYY1HHsFwDOlsHYKaiP3FKrgyXmMM=;
 b=Yu9saEIQQIfc+zhZhgr9nEv1NBgh9fkNXcFYxCoAu9bGslLnqOZ/BYZDFwqOd3Vs26VEtRdHVhspPHWnGwlexbdpVMSU3iImTFC7a0YzDz3G1AVUCNcWT1DQdrucMYAhyKXjhVMxEKWFEB+sJWgGTu8noc+Aluc4RxVBKrv1VHd96xV5IcfJp84u/pVAM9TDeUxhK7z0i8N3vUTJrvY5/6WRBiV64EiY15vMD4BIdiYdZhcTD5hflWawG8nRwMEg0dOqMNdaLq726EMWn2QuAeRAwveHZdfRaIFX4vL/qd5DB2yeQUMmBAWhCLSHkl3zDEMbji4tWLPghH8pIOTyqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by MN2PR11MB4758.namprd11.prod.outlook.com (2603:10b6:208:260::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 13:16:24 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 13:16:23 +0000
Date: Wed, 17 Dec 2025 14:16:18 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] tests/xe/xe_fault_injection: Remove probe function
 wait_for_lmem_ready
Message-ID: <aUKtIv_46MarVsJS@fdugast-desk>
References: <20251217131406.2441143-3-balasubramani.vivekanandan@intel.com>
 <20251217131406.2441143-4-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251217131406.2441143-4-balasubramani.vivekanandan@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DB9PR05CA0021.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::26) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|MN2PR11MB4758:EE_
X-MS-Office365-Filtering-Correlation-Id: 92bba89c-d5a4-4b88-34da-08de3d6e799b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DTbj2JobXfT1HqSWU0r2tnzFayB+txfDOwkbiuB8Y4vovOVwCuf629VZbm3V?=
 =?us-ascii?Q?NyDRV9IV9tt+l9XzVlUa3QyROK2WF3bbuiImJTXRnJzCn7Fls6kExWmpU1cJ?=
 =?us-ascii?Q?3OdKTrAjGaj1TA+yBFtInnrpJzak1w/3GvjclCdd3NVd7M+u4sf4YDIBdhZK?=
 =?us-ascii?Q?eP/X31Gqv3r3CXe6Rlpu9zgGUAX3JIrgLiS4rk3Ytd/4nHo2EN5vghfKsZGZ?=
 =?us-ascii?Q?hg+F+1fqCeLI1P8ZVL0RY1Nc2I1Mjx0pN+F+NNQj3oVyyMtNAgZPuAPgpCHJ?=
 =?us-ascii?Q?c4CfxU/AMzwB4oUkmyWI7aZTMcGzliHkEfnwgBisVy5oFZ5I5D+n0zoPAO5k?=
 =?us-ascii?Q?fvIxO+flZa17HqA6DsjMoPpAga4Y45mMSdjBj0hWOccSrRPr1jHFnsyhqyv6?=
 =?us-ascii?Q?6Z81dfpY8Nnmo/lkPFyA4YMT/9qpApGGbwbOLT3pHwsTtOf9wp/TmxvgaIWG?=
 =?us-ascii?Q?EXOEPQcYa1VSK8llv7Genqj1eN+OebJQ2mZ1kazc+Ip7j9ALJrfMeFgwl0SN?=
 =?us-ascii?Q?6KClo6vKScJMwqVF4IpFtHXDONXoT4N1R0WrY3mRGzOrt3jy7FZI8funQpK6?=
 =?us-ascii?Q?MZyo1EqkgmZ47pxzRN0kdOvlQZ8ZSSBdgUfmp1IFHwYs0jGrmBMH4TwmXQUo?=
 =?us-ascii?Q?aYlykPUtUeFbwPlgInks4j8C3FZKEpLC/dYzobcqoWhFPPuk/e1h2p8A6tLW?=
 =?us-ascii?Q?sL56azUVQUqdgJqdJlUUcX9QI+QqIpIDMPRws/wFIH+m4BSYH0K/jdpu9azP?=
 =?us-ascii?Q?jyYDQhRYlX9BTCGvxYZyfh1YrLbS+v/nH4o6YtHRwggmBKcdRgcR4N22hVTZ?=
 =?us-ascii?Q?tClLkiblumZp1C1qlG6m3KqPBtv93z/bmA5LGK++A2eywZTMDSBflYajN/fP?=
 =?us-ascii?Q?AENCL/kjVlgjb/f6gii7Lr+XQCRJY9P8oIggEgZKayc0TKVIUvkKTGl0ICXA?=
 =?us-ascii?Q?2wcr8qzb38ox485n5q3asopbPWVEZmIBcKpMdNKj5Ynkadm4Apnn2xwmTczj?=
 =?us-ascii?Q?jLVwDM607SPmXw9ZdRufRM7yr7pFfHW1UBDaUkZy21KOukiY5oaO901W4YVy?=
 =?us-ascii?Q?hDhtT46PmhCW86RofWR7PNEGawYUX2F5iaFMSPc4kqTJWYAhAkEw928/FVHr?=
 =?us-ascii?Q?EWP80MA/yDsL4sEz25Y67evb8Hk1tDocu2k37O8IoY9o/ayCQ0kwL7I+hcwx?=
 =?us-ascii?Q?eIe8/y74eT93hTl4Z79xBkffoZ+0/xy/qlU8h8WvkaLgoZRDatV5Nd2Hc4+Z?=
 =?us-ascii?Q?/5lPVBkApNjvkEzbt9PrLaLyMzIPvIVvYGxMOVDcvfOQj0Zs5IEY6ZHcdmsk?=
 =?us-ascii?Q?11SMsT5F65Lz+OZ+t4pcqjmcLZcAeIEdEUiYn4ev9vRmw+P0MroOJXdv7SPD?=
 =?us-ascii?Q?14XNtquKe7kCw2gf3qQ5f/+KJAYJWxkSkVZd3Lg57xvzQtt20PfcPHQk8yN6?=
 =?us-ascii?Q?VQ1UxyMCsZsDaz0+xPIoaLDE/ZlSK0nf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/HECzDN5zMAY+VaTGy0ke4dYEjwXeKeYAXBtFReFKP+2hNC1nKplPntv9G1L?=
 =?us-ascii?Q?2J1f7wWvzI0LpgZRM9av1bpKlab+Ph1cMuVljNEFLxlIai1xnDqyGjHaKDD0?=
 =?us-ascii?Q?fT2uZe4hV/grANmW4BHcEKJaVn0Gf+NmYFhWN79AsrJUo0AlSD/peG97xJnV?=
 =?us-ascii?Q?xJnblFIWnWD9rVsnowcGkEG8riqcFxKbn7zQR3fFVRYJr3v7CM17iWIoHIxk?=
 =?us-ascii?Q?JakYdiSRH1RSJi1Azytchl2MWP0IglIFfAjsnUDlvwxkTujzxop45wXzRQl8?=
 =?us-ascii?Q?eSzIoZ4nQ8RmDN1++N4WAXSHKVROChum3maC+p7dz50ScfJKX5HG+F2zW8tj?=
 =?us-ascii?Q?t7EfdNmtsOOYnjTd//ats+ujfVdj8nlGI3GEPyUcFDtEJhFrUijNmVR/fHnp?=
 =?us-ascii?Q?0CIfBr8mf68i3RLuQLKRPPVFI7fnf8J4l7R+zIiV5QxeJ4oRn9jam52X2Vsh?=
 =?us-ascii?Q?b30xZ3+FaLwvwN5THhotT/GMa6ObII9TUOcctsLWd0I59j+aBGcBpxI+gOdj?=
 =?us-ascii?Q?JY0ypRAKeOzzo25jzu0zgCAyYCdp2PV/3bmWkhNjXNoCFlLyutlNryCMzorE?=
 =?us-ascii?Q?wxA30QbYOCzPtT6GU5TIA1GBmoLFZ+BkmYiV/IgCxpxi8uxiaIyqJp0P8QBl?=
 =?us-ascii?Q?+fRjDPdaEDTVPEUes4gcTcnd3Vm2l609HDNmwUuH4nLoNv1oHjusGfc9o1hC?=
 =?us-ascii?Q?FN4gBQlfRoeAVLXjieKZHf2pcrMaObiiQeTXBrKxAy33st2fIpveL/gZrZRi?=
 =?us-ascii?Q?oQLd0eVwcAs+dPmhhP2bgT9zoEcwX0ngBnrQFiRmA3lNw/KWBybLZIDYT0oy?=
 =?us-ascii?Q?LJRvGBUnYP9fdWZoKVNubpLP4g1Aow9UfzywC5yU2dXBiuYwxRMBcYkz2r/l?=
 =?us-ascii?Q?uBGfcfGymwvGUnZDwkAxRodE7wLZe2mKt6t4xa2HUVdGzfKggBSJKO419RIj?=
 =?us-ascii?Q?0ZDNBpQ4HnyPaNQPyvviA7usMJtT7E38JikCuupFoeHkA4fyEcXohwDoR0Nk?=
 =?us-ascii?Q?wwjtU6sGkbjtQNosg+rJ4Zki6JhLOJwwYp6dYv7uEDMaRO/yHV2QI7VFsWms?=
 =?us-ascii?Q?rYNxRi9eNxLZ2BgCIbDbXNTharyp9MbSbuSPfH2aKIdcRSms4+mzX8PokiB9?=
 =?us-ascii?Q?HKDzludUQh3wM/K4M6Y4T5M0rGYWqDvRigQwQtQ/Ad0Zg1kMLa4ctcxdr35e?=
 =?us-ascii?Q?KBOYPqsd8bvfe2Ia028omiqdu7fHuVkOP6jmoCLhJQReUyCfwlq/knXvUKeu?=
 =?us-ascii?Q?u6D4TJyKsQ5+YxLtu2NTo0d98IyvFXXo3v6oDeM1j2ZorD3dpdu9aXfXYGbL?=
 =?us-ascii?Q?WOkvYrR76saiieYwWy1l8WpzM+z1vCcMytMjBcrLupSLEVffqs1mqNO/Muse?=
 =?us-ascii?Q?VuILCtQMzNXyV3+n/iPZLlNZViotFJHkLoIIykiIn+NfgcJ82YdGQUfWEOX6?=
 =?us-ascii?Q?XvNAtZCPnDHO9a5grgSc05kF5c/c/SXujEc71ubJwEOCJtLuRNjmIxQaOYQM?=
 =?us-ascii?Q?sdc7QVeR+F6kwkjDlBqGuayKpR5BWqWO3LbbZgiPvcFCerUTUIrxJbRPQFm5?=
 =?us-ascii?Q?lvSA9ygCsx69Bg+ydzT8Wwbt6QPCQhA8qWn5cA0qqq/BwMn2eOHSp7E7DI+a?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92bba89c-d5a4-4b88-34da-08de3d6e799b
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 13:16:23.0724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z2cZ5mTsNUx5befGmfRCpp9QqWzOCDgbr/b+/LmuQUzHcqKPqhFd3i1jlEXl6HhEyLp1OPyAXi+fDLdWepB11c8KuGy1Ucjk6a7jXQpjVrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4758
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

On Wed, Dec 17, 2025 at 06:44:08PM +0530, Balasubramani Vivekanandan wrote:
> wait_for_lmem_ready function is removed from the driver probe. Discard
> it from here as well.
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  tests/intel/xe_fault_injection.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 013b4dc9a..f3bfc4b40 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -242,7 +242,6 @@ static void ignore_fail_dump_in_dmesg(const char function_name[], bool enable)
>   *
>   * arg[1]:
>   * @guc_wait_ucode:			guc_wait_ucode
> - * @wait_for_lmem_ready:		wait_for_lmem_ready
>   * @xe_add_hw_engine_class_defaults:	xe_add_hw_engine_class_defaults
>   * @xe_device_create:			xe_device_create
>   * @xe_device_probe_early:		xe_device_probe_early
> @@ -567,7 +566,6 @@ int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
>  		bool pf_only;
>  	} probe_fail_functions[] = {
>  		{ "guc_wait_ucode", 0, true },
> -		{ "wait_for_lmem_ready" },
>  		{ "xe_add_hw_engine_class_defaults" },
>  		{ "xe_device_create" },
>  		{ "xe_device_probe_early" },
> -- 
> 2.43.0
> 
