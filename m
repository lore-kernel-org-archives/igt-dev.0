Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8329DC4345F
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 13:27:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1509B10EDA5;
	Thu, 18 Apr 2024 13:27:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FTDmdZPt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2C710EDA5
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2024 13:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713446850; x=1744982850;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rhDTTca5iFcOmEIGUXS5foqUAWDP5T2xIkK0ssUx8B8=;
 b=FTDmdZPtTifqeLaCuXLF9UWQKNobtR/jTlTvWt3HzqtVlHPBnThcuE3+
 pJPTqM0wTBI8Pa9LJedrm0mUVdQsUxPAbtnZiRPACWlTet4wZMd9me1Rd
 jW1YaeGf2/pK65cJnYT8jAwpCVM3UyBpSQLIWE5Llw/uRUQUsF4ErJIA4
 m6s3QT1k0AA7gYdCYSAFfmQoFHoqRZ3E2J+YDDyYIHqHIVgLNPXccPBai
 n3ntm8KOYBpnH4jczEA240RY8Wh9MCNuJAB0fMjZjxIGAr33SnUxWbzip
 FubI44KZnhmsjasHvY7i4l9r2YYifi0sYpJdVXfE+ba2QFDO6s5n88MkV g==;
X-CSE-ConnectionGUID: r/zZKPT2TYadEQvjEuvQCQ==
X-CSE-MsgGUID: eNoGfC/rSmeicJ7bHeSjHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8918414"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="8918414"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 06:27:30 -0700
X-CSE-ConnectionGUID: WlJDb+TXQsi+wDQM7W5TJw==
X-CSE-MsgGUID: vjw3pA3yQL2Rx1UutiAXGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="46277733"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 06:27:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 06:27:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 06:27:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 06:27:28 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 06:27:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhwZheihLCgkpFeAShhskrZxUo3/SeeNLfm6OORrSPoDJxTNwQxxsLZW7PAmqreP802O5hvHFv69IRF7mjUn/o7gBC6iBkVFe1N1+U6lY2O9eLVP92OYAY97FssZJJPcBpzYDiVWgAgGm8wWAHWTylBgEjWLisDv7fnl+ks1h40Lc7VmbJhwhCWZE26FMNAXoEdxGihNC1em+bKevbOQS58m3JLbMjQDC9pjSokd42bvm8zuCBT/B+iP8YuUnf5hkWbjEYWNuYbed3qq81nGdjRvqFLWsIWPG5C5XeazmmG7Jk4CIYkCjG4sGjpf5bd/QzhdUfMwe8pIHFEY9c2pHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwGco2bUm+s+wlHhprbymsRZe34Vy0wpRCay/t5nxyo=;
 b=eAp7P38qNq6b/YV9S0lh0EJOidzlx36s+/c1Y1YedNObYEnxZ6BfsSvkAhESqNc3Jki6STONZsBLjvmHLiCv0e6hWiHe9LXulgQl//4jJo4M+wlMXogTyNgetj9h9r47nrE4y4NiliJYUAeKLrH2pc+LG1FWrNuw6i48eKBbozOEQicA63R6vEjTM1PGfXKb+2l3jrQcujaDSw+mR/jjkA8cI+brKlv6h6f9lLZFkE6z/XnF6i5rWUGxey/3cEJMpusZJ/bu8oFcnvJhV7bLMLVN+4KRGajMjzH46Dgjain2z0/BPVUXqXbvSgj7m1Wg9iWMGMYuTAY1nV8SaFn1mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by IA1PR11MB6172.namprd11.prod.outlook.com (2603:10b6:208:3e8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.38; Thu, 18 Apr
 2024 13:27:26 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::602d:c299:6d13:7e5a]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::602d:c299:6d13:7e5a%3]) with mapi id 15.20.7472.025; Thu, 18 Apr 2024
 13:27:26 +0000
Date: Thu, 18 Apr 2024 15:27:20 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t,v1 0/4] L3 bank mask
Message-ID: <ZiEfuLsKfFtoZ4LA@fdugast-desk.home>
References: <20240417145049.7-1-francois.dugast@intel.com>
 <sx44ek2wi3megbrlu5pxzny55n6didg7kwopygzzywgcjs5ic5@wq56mdm4s4wi>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <sx44ek2wi3megbrlu5pxzny55n6didg7kwopygzzywgcjs5ic5@wq56mdm4s4wi>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::12) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|IA1PR11MB6172:EE_
X-MS-Office365-Filtering-Correlation-Id: ffeeedbd-6aa0-4ea7-277c-08dc5fab49c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GibK8hA7uFdJI1ncvQuIymkG4/bE45HoitBuqc6Rh51TShf2w8BUwF+Bxea7lIW4t3tercm+vfuSL+sHxq7LutMlI7ur/lzhrJvqsRxb4T1/a0TGS9pse1MFM/R8icTTQiOPaAJX6IF+DpSWiuKI/GT/DbGqK3D9FF+vC1rKQMJEyuTj2/8KTpGfdIKiPcu6vjfXhyw52++MoD6ztGvhQDoxHMgQUjTYS90xciR5/5EvV/AQKxZRFoX+6PbFItyjXlC09ryBRMeg5LbtIxOMy1eCbF+2GzWgd5zaCMSzmwVn8Dp12/brGQv2Re7xq1n1Mn9pCcJ9kO1h8h/LeUmGNsmGrvMBDYVSKdHc1XSyLki85MBAIbvVa7HhKMr8U6igGf1hUXyE32e7Wb6XEboue0me6I3qqP/PU/Ymh9sZmPt2D1HSV7avyEv10XZpTShvVPTC3eWd+R7Zcp3GRmKfBay5DFPtjN+r30J7oSMxQc2C6IfpTyGtOWbXI5usMRo4+vWTs07Tneiqgv7b+efFbBoRxpotTxFF5lezSET3hOpruYymgnvYIb+Wu/uAPytdEJ0Xnouk0AfnLbD/JYwrgmCbVLrCjD5w9KTbfnwzQPwbN9wju4p4tX8HELaW2iZ1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oBMOXbHRJMJ1MVq2Brq8qXh01+trxAlbWBqGEGux0erR0WRcolcdFd2Y/BHd?=
 =?us-ascii?Q?fUh4YzFu+b5/+fBn2PCig0bVdan9InkEZaFJE6VV6xLi23jvIntOgb+66xNw?=
 =?us-ascii?Q?Uv4ll/PSS4c+YlBbtLBWPYaE+JhB8DWkuGbJTrjImO1JLD8I1uXQlGD/nX37?=
 =?us-ascii?Q?yz+CPnWGKP7wNHUN0QCQDa/wZJTFjPsEAsalf0G+smcQCrtQlLlmG8jSjMbC?=
 =?us-ascii?Q?YGWzyxOo36i5JGULKXDVXeJJBagSiz0Zj86pvrjWKAm3g2qOwtoiXt0XzFcN?=
 =?us-ascii?Q?LpyAnJksBChiAQb9HJDG0voSjCufRWJdX0AUfDaXPxTRM9H8kuzKM6MY8H0l?=
 =?us-ascii?Q?hBNWsR5e8i4GYqJ/9bfVsVMaKkHzJfwUhNRlpasYnOC4/mrutVKzVNN8+uGl?=
 =?us-ascii?Q?0iKI21WuR14SzSiWDFLadwFvJGlnnDskBVmH6mF1T/eU9IXMubNFn7/73xpK?=
 =?us-ascii?Q?nPGYZbjxPKDTgfAmauQNRYqpEfjeDeQJC+lIHAMmZXpvY/ZoeXZiKgiowwfU?=
 =?us-ascii?Q?lnS/7QrgeQs8S/U4QTAhgb7Vlrgex5UvnJb9OmqRM3KkErDJd1GI5atLNffj?=
 =?us-ascii?Q?lfdQjia2XGXL5zHji+ylDms46O4zTgMcnaSUKHs3mz4n1Ml/9huMU592lPYv?=
 =?us-ascii?Q?C2muH1vdiWhLjH8a6BnuzvQK0e3ZJkpyjuHrF2bCPPkjSJqeKTICevTiSE9+?=
 =?us-ascii?Q?A5bm1yEA3aztnXsGffXvXkqsvAkrxkMKMZiRuvZM+OHw7m31y5oYwpwbXXJa?=
 =?us-ascii?Q?qrcVseslNghsXLBITKVBr9qY8JnOiWrESKy0rBhxrfPfzP/001cvpHPpOu21?=
 =?us-ascii?Q?sdRP37R6tHHwW/REEW5DeW3viCUDNpFGcg3uVtPMm3xZha9Xs3Wgv99JADn2?=
 =?us-ascii?Q?+xp/T1Jr82YZ7n3kL2JUlt/t2EUTGJNJ8gHbDCZrvKEpfpsupZAFqUWi4WIN?=
 =?us-ascii?Q?qHQFV7UoR2J1suYhch+LLWZfF4I2ZzIUxlnLwrPWpsFnNdFgl48IYP5p9cIl?=
 =?us-ascii?Q?tlAPdul89SjDxinht24DSBCJAMuHB1BXq3iMIeVsB6yfA3BLkvCj4+uY/XXa?=
 =?us-ascii?Q?PALtQgU5zwi8kB5/p2BZbNdBTwG2ytYWhGb0V3WQyxIxcK9qcQG3w1WU+lx7?=
 =?us-ascii?Q?C2Lg9bBtnHI3ohW4dTDHPg9j8iYCE3Th5tfFQD49adh9/uTgZPcG5bjVDeAQ?=
 =?us-ascii?Q?QiEPZ858ItLDaTYRYCYIM/l6jexNd+MunDNiWW2Od+6CDBtGarrfRa4KSlaO?=
 =?us-ascii?Q?QmLEWmPYDQD+PwiqgPIzQb1/bxaT9NP+Y0bhTywck3WV3Gpxz7ntKOJeZXgZ?=
 =?us-ascii?Q?DnEXf3kW9C35uV6ajk5yAMmo0JVSDLR1JZ1B8d0ZnRvBYmI0yxb4bc/CqKSz?=
 =?us-ascii?Q?2FPuCxdtVMS40vC/Nlve6w9SUR+Feu185H9J9TLkiXYsYn/ivyEehW8dt1i7?=
 =?us-ascii?Q?J5IyRI50slq6HkNcQzDZDI4N7Aqslzqb63ntiyaW9vQLFX1aoxdpuQ0naYKA?=
 =?us-ascii?Q?/0ohDVDhzO8PPrJdEsgB39053ddxMBszasizS2JwbsTY4vBgTt2/eV/xN0Tv?=
 =?us-ascii?Q?usdJVwtOQanIMzGlNjKTVuzi+WPww58/EpStCwDeXyWZk304DXFLnq2kNGUK?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffeeedbd-6aa0-4ea7-277c-08dc5fab49c5
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 13:27:26.2974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YoEozKwZI1IZMd6W+NQ7LnkHFkczkCcJni24ROfBTSyS9EcSX+Xnuf2EvJGDhCrk4Fu5j73cXohjOCardipqpaRwxxo8GoBwVdaeERFN9To=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6172
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

Hi Lucas,

On Wed, Apr 17, 2024 at 11:07:54AM -0500, Lucas De Marchi wrote:
> On Wed, Apr 17, 2024 at 02:50:45PM GMT, Francois Dugast wrote:
> > Align the XeKMD header with the current version and add the L3 bank mask
> > topology query proposed in this KMD series:
> > https://patchwork.freedesktop.org/series/132075/
> > 
> > This series first includes some patches to align the XeKMD header which
> > have already been reviewed but not yet applied, from this other series:
> > https://patchwork.freedesktop.org/series/131816
> > 
> > Francois Dugast (4):
> >  drm-uapi/xe: Align header with drm-xe-next
> >  drm-uapi/xe: Define topology types as indexes rather than masks
> >  drm-uapi/xe: Expose the L3 bank mask
> 
> no, I don't think we want to merge these as is in this series. It can be
> used for premerge testing, but this is just reintroducing the same
> problem fixed in patch 1.

The first two patches were not meant to be merged with this series, I
should have made that clear in the cover letter.

> 
> I applied patch 1 locally and then did a diff with the current
> drm-xe-next:
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 4353595a4..0b709b374 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -518,9 +518,9 @@ struct drm_xe_query_topology_mask {
>         /** @gt_id: GT ID the mask is associated with */
>         __u16 gt_id;
> 
> -#define DRM_XE_TOPO_DSS_GEOMETRY       (1 << 0)
> -#define DRM_XE_TOPO_DSS_COMPUTE                (1 << 1)
> -#define DRM_XE_TOPO_EU_PER_DSS         (1 << 2)
> +#define DRM_XE_TOPO_DSS_GEOMETRY       1
> +#define DRM_XE_TOPO_DSS_COMPUTE                2
> +#define DRM_XE_TOPO_EU_PER_DSS         4
>         /** @type: type of mask */
>         __u16 type;
> 
> @@ -871,10 +871,12 @@ struct drm_xe_vm_destroy {
>   *  - %DRM_XE_VM_BIND_OP_PREFETCH
>   *
>   * and the @flags can be:
> - *  - %DRM_XE_VM_BIND_FLAG_READONLY
> - *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - Valid on a faulting VM only, do the
> + *  - %DRM_XE_VM_BIND_FLAG_READONLY - Setup the page tables as read-only
> + *    to ensure write protection
> + *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - On a faulting VM, do the
>   *    MAP operation immediately rather than deferring the MAP to the page
> - *    fault handler.
> + *    fault handler. This is implied on a non-faulting VM as there is no
> + *    fault handler to defer to.
>   *  - %DRM_XE_VM_BIND_FLAG_NULL - When the NULL flag is set, the page
>   *    tables are setup with a special bit which indicates writes are
>   *    dropped and all reads return zero. In the future, the NULL flags
> @@ -1085,19 +1087,6 @@ struct drm_xe_exec_queue_create {
>  #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY               0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY              0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE             1
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT    2
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT           4
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER           5
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY            6
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY       7
> -/* Monitor 128KB contiguous region with 4K sub-granularity */
> -#define     DRM_XE_ACC_GRANULARITY_128K                                0
> -/* Monitor 2MB contiguous region with 64KB sub-granularity */
> -#define     DRM_XE_ACC_GRANULARITY_2M                          1
> -/* Monitor 16MB contiguous region with 512KB sub-granularity */
> -#define     DRM_XE_ACC_GRANULARITY_16M                         2
> -/* Monitor 64MB contiguous region with 2M sub-granularity */
> -#define     DRM_XE_ACC_GRANULARITY_64M                         3
> 
>         /** @extensions: Pointer to the first extension struct, if any */
> 
> I seems we don't need patch 1 and 2. We only need the commit used to be
> closer to drm-xe-next.
> 
> include/drm-uapi/xe_drm.h should always and only be updated by copying
> from kernel from specific commits documented in the commit message.
> 
> WIP changes while the kernel side is not merged should be moved to
> another header. Traditionally we used LOCAL_* defines for that. But that
> comes with its own problems as it's more work to  go find them all and
> drop when we sync the headers.
> 
> What about doing this?
> 
> Add include/drm-uapi/local/ to -I in build system *before* the non-local
> one. Something like:
> 
> meson.build:
> 	inc = include_directories('include', 'include/drm-uapi/local' 'include/drm-uapi', 'include/linux-uapi', 'lib', 'lib/stubs/syscalls', '.')
> 
> Example content for
> include/drm-uapi/local/drm_xe.h:
> 	#pragma once
> 	#include_next <xe_drm.h>
> 
> 	/*
> 	 * Local definitions - delta with WIP UAPI while the upstream defines
> 	 * are not yet merged. These are supposed to conflict whenever the
> 	 * upstream header is updated and break the build. That is intended.
> 	 * Commit updating the upstream header should garbage collect these
> 	 * local definitions.
> 	 */
> 
> 	#ifdef DRM_XE_TOPO_L3_BANK
> 	#error "Already defined by upstream - remove"
> 	#define DRM_XE_TOPO_L3_BANK		3
> 	#endif
> 
> The ifdef + error could be optional as it's harmless (and allowed by
> compiler) to redefine it multiple times to the same value.
> 
> Thoughts?

Neither this solution nor the LOCAL_* defines have been in place for Xe
until now, so is there a particular reason to introduce it now? Not
questioning the benefit of doing it and I am all up for continuous
improvement, just wondering if I did something different here.

The proposal looks good, once it is in place it will be easy to add new
values. I prefer the stricter but cleaner ifdef + error to prevent
duplicates and to keep the local header to the minimum. But I will let
others chime in especially if there are lessons learned from i915.

> 
> If we don't want to decide on this and you only want to unblock this
> test for the kernel addition, then maybe just do the same LOCAL_
> approach currently being used. See e.g. lib/i915/i915_drm_local.h

Sure, will do for next versions until a solution is in place.

Thanks,
Francois

> 
> Lucas De Marchi
> 
> >  lib/xe/xe_query: Add L3 bank mask test
> > 
> > include/drm-uapi/xe_drm.h | 27 +++-------------
> > tests/intel/xe_query.c    | 66 +++++++++++++++++++++++++++++++++++++++
> > 2 files changed, 71 insertions(+), 22 deletions(-)
> > 
> > -- 
> > 2.34.1
> > 
