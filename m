Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D204C369B5
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 11:03:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072D510E31C;
	Mon, 14 Apr 2025 11:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mfBG29w6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F2010E31C
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 11:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744628593; x=1776164593;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=brkZHVfwTdha/YUKVNoTdDkyW38osK9VyXep3Ddq/PM=;
 b=mfBG29w6s4At4cRu03lIqPQe3wbO7GSx6qpyTipthPxkLTIts5M5GJ79
 NvkoaTLLGxREP+9SlBUQ4uN4Zr6IpGaCymnl1AO/phEe42NfzSCFdJQzh
 R8MEKMHCy+V4Ua+E/8vX2Izv0Lb6VOGHKv+lbTAZW18P9vZoB+6d3auIe
 W8nQYhn06Ne0EDborcyUnoJmMNpaboSnfVutKbvI+VKiGcuQWPskAty6N
 pwQiueqKwUdA6pLIttx6233CsU96JxHTNkTju49Go3gzG9rRe97dzedlu
 kwYgSFCZB3ZzDcilFqti+lzK9al8qlhtu93KKctCKpgFt+LbgpD350bgA w==;
X-CSE-ConnectionGUID: f2gmyePKQBSCS70Nksuc2A==
X-CSE-MsgGUID: UTENTAZNSWSAf3DHo1wYWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="68582254"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="68582254"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 04:03:13 -0700
X-CSE-ConnectionGUID: cOj7B2SlTEyQCQLlziMckQ==
X-CSE-MsgGUID: 44mGqixcQo2XWi5vnZs1RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="134629641"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 04:03:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 04:03:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 04:03:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 04:03:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tcm4Floftmd7f0LQT6OfrGtaVKKVvgto2VJlT1H4q6KudBN0tsV6XX3g8Cw/QyBMaVnv+4ugvsXOyazXX5o3/u2RSK02FU3VCbnoNpe4l7pasIpHcUkSCJJJyjeNm3rnpfMsh6dV5/M32TEm+9e0P8GutSN23O5ZVFS1XkfZYHm7Ylk6f+LeqWROuhbXX7LLVedjxT1VAcnvw66Wc77bxYJu5XcdPVF1QSaeYcOkc8URDxE887BaU6SO2aXc5v8ecIkHEygyoCRh69A4u/Kk5kupiNH5fUKyAIBCWHBphhza6Lcok7Uqg9Z6KOy6xY5MgNtBIsYFmElWQ91oZ1J+Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tp1JPFjZgFcG71nO+PhHMoNrR11gF2WeUiIVWVIaYyg=;
 b=Myjv8ZL4Ohbk6xq5o3AZ4T25UUl1FM512W3T3RqE9TIGqV05mpkTVygS3mhbVtUBpdI6A76BstPacNnQz5RiM3EI6MLX7y7mV46fWwEFa3j6Pl2ZEzbjt6J+xzF8Y95Q07AEQS/lYB3PuyzNmG34EKwcuhlgA1Mx/35xnkGWE1eRcFb8R4oYrm/dmR0YTA8kfO7tdqg0x8Ds9sG3NvI0cBuhtI1rqg6CHFvoyZVqER8MJ/2tdauzmWkZ9Fm5dNw4nmrGvR6dxq0ehxHbxQ8w7dgKxLveh9Cv1bTJXaLrV5xDXPuCsDFu99zJkPa7r7eI+Jo79ZKNFYT94dTHlcZSGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH0PR11MB5206.namprd11.prod.outlook.com (2603:10b6:510:3f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 11:02:55 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 11:02:55 +0000
Date: Mon, 14 Apr 2025 13:02:51 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 09/10] tests/intel/xe_wedged: Drop
 XE_SYSFS_DRIVER_REBIND usage
Message-ID: <Z_zrW1KOFXdJ4rOb@fdugast-desk>
References: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
 <20250410-lib-kmod-v1-9-84b1ad0b8075@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250410-lib-kmod-v1-9-84b1ad0b8075@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: WA2P291CA0041.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::27) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH0PR11MB5206:EE_
X-MS-Office365-Filtering-Correlation-Id: 32a2c9c3-e81c-4317-3491-08dd7b43e8df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1YUqn5yZWCGZy+bzVgiSAI7R8vIK4leHpe5s8/1FAn7ij2wFCYfSuabYn2Vy?=
 =?us-ascii?Q?YHeSjQ3kXn0bp/vOxhtIx6Y//ZUHn16xAggBI0PCrCSA9VJUYNNvUdLONKKt?=
 =?us-ascii?Q?lUobN9cfhSM8b7Lj7BaIgT0T4WIe6eKhr4ZHHCHslQUVVxtYSLJeoGxW8epu?=
 =?us-ascii?Q?J0UMxUSVHFsAL0+DINKFbuQiERjTyt5b9HjkOLaHcMbY/e5EqJp1VircsHtq?=
 =?us-ascii?Q?YGpwAE4TzChq7MtEM8/EY0enMpVI/hNOMwbS78ZJ3TlvM4friRfODj07OdrJ?=
 =?us-ascii?Q?tKymC5LVIApdcZabaiD8+iHBVCpBdI5HmINHFoe/XbNLDoNZ0DLY1S9NeKxo?=
 =?us-ascii?Q?lRycW0S9ykB9iGlsurY+lAWnawwduCqdC1ppkqmV5c6cBwInzbDW5VGhRflF?=
 =?us-ascii?Q?J4zifIATuH4qRprXLOPVkJwrwcOg5YNjwSjLfGzzHUPCQa3KIteQg1nwa/+8?=
 =?us-ascii?Q?1YomiWZ6fe6JsNwjSK0brDtM4yxDp0AAzSTaR2Q+d0B9UjcFYifKl54GUh/p?=
 =?us-ascii?Q?/HH8Fw7pyjBl6J2XFCr7MqrwzdcwvrDP/0IeOADsTwzNpyOq64kA5HixSRqh?=
 =?us-ascii?Q?Nsd83nbliBWXMNmCi6DsftiWWQXuHwjZXk3rv+SWPxZTJpx/nu57pkK6ZlX0?=
 =?us-ascii?Q?18jFCmpbBhzzjD0sTMFVChYhuoJTQj7M2uSxa5rRQALwX+A4DYX7rWFeh4CX?=
 =?us-ascii?Q?6hWm6Nub0pbXIqvrfDjvhEFwwIgQAj2+dlUzfEMaERV3Ygpf4lKkJE93Pu+j?=
 =?us-ascii?Q?eJ6sAljSMZSRug6Wn3ZJYAbavfYd2EREikLAmq5xYxUxO2C5KN8eDDJb9UTe?=
 =?us-ascii?Q?b1udo6DuUglsYQfSqIm8FblwHc+q374KOpvQThQ0m2iuxRPrQVNLAcMffy/L?=
 =?us-ascii?Q?HI1A5JRCsk7ukN0fSDaa6P5ToMPssJ37fVzy7rA4QclDQlKuH1eJGgKP5oJG?=
 =?us-ascii?Q?Mzs59jUBttmPO8/0633jbgZqjs9C80zqDvntVhCsfUTTIKPX/fr6dMJ8DmCj?=
 =?us-ascii?Q?RaMJbgpDLze7hph6QKD5aNJ5ZmyaIC+2/1zO+B6I+kl2o5v+KfPk93wK/5F6?=
 =?us-ascii?Q?IT7hrJae/msRM6AIiBNRTejDSfw63sC2GSILWXRN4BIEBGNH2ng94dEyQfh7?=
 =?us-ascii?Q?0hIjJAqBDbi/XaXfzEKOSeplHcxl9tYcyq1ZNRkf9MMU27Dy++EorwUU3227?=
 =?us-ascii?Q?7rNmDz09nQxb0ZCtDX4DOtGdWjQsL59zbOi1xNKcVMMwImU8DDYBnoXNd26+?=
 =?us-ascii?Q?0/W97FZ0xDcnxRjFDhLEyuIP1PVDIaeO9Qcnylrb/Yfk3GhtzSrB2/ZO1B3I?=
 =?us-ascii?Q?6ffWRTeoyS8mjx4oHFmN6G3531P72w/eYN0McyiIoqpFmGcCHex81AENsyXh?=
 =?us-ascii?Q?NDQ32GY7RzI8sLNqwYkbd6RKaCpIuEsUyZ1sfFYL8DXBSUpdBR0FY+fV1aDd?=
 =?us-ascii?Q?IRv8YVuk7s4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FE7vRjdOX5Xa54TwWGbeyULUVPqYdbBO1zrXozZfD49/vWkXw3953d2+W2NO?=
 =?us-ascii?Q?5JV6M0syGZFUZFsE7peItVYKlnC1BSUQxzDHBlDnIFxxtlkQKWDQiNvWZXmv?=
 =?us-ascii?Q?EaAjaDrIykwKVINX1OtprN3eF3ZAi6D0YpyzseXfMW7yo21Wnq1d5gXicT18?=
 =?us-ascii?Q?Fi+Mx/vyC5G6wOF/Rq+xMgvMVcl0NHX5Kk1whAJtxGzSdzqRBOYdz8y0srUd?=
 =?us-ascii?Q?Q+siXtjcCwSRzSZ7KXrr9z7IC0v6o/W8hs+mXSKVT4s5s4V6dqQkdDp+IiIl?=
 =?us-ascii?Q?p7dk8AkDrAcLSUhOtCajmKLnz9DWFXUL0d6GQ6B9CqkvTKvoqFuQzsfn9O4r?=
 =?us-ascii?Q?//5QOscNOEdGUt9K9R18XFx1k7Uj5H0pAnLslEmUpRduYpGbHsN8RqH6Rigi?=
 =?us-ascii?Q?uN2OYg3AgQ9I2x60cgbHTClTQ67/X+8IgfxKCiBLWqFAep8vCguoMhvjx+Es?=
 =?us-ascii?Q?1PTkKyB1xykBNUbIerhHIIwQe/9z/GGUQpKJWZRMNAw/NlBpqO+sCHHWeOi4?=
 =?us-ascii?Q?KcvyQsqD6GclZgG/XFoDUxShndEatm+QU3YaGX1yPyDqwABbLT5wQ67jLUhs?=
 =?us-ascii?Q?fb/2Dkt0HmdChdfj5YBjkTk4tFF0puVQFNGxCRE6KPSukeg830XzOvTAVilQ?=
 =?us-ascii?Q?o6IRARGtlCCaOWz7aLxaAz2o2SYZc7vq9TNIca6sWHBuQWojTD+fvClt9Vr0?=
 =?us-ascii?Q?lvt7N/JFaMSDaDYHwTC5B1+B6H+TCvGXllWAAwDbamUaCDODxhrtExj+zDsR?=
 =?us-ascii?Q?aVSwJ3T13lgUh09HWAk0E+Afjo8YNLFUqTle+INznR4ERVii/M43VpreBUJh?=
 =?us-ascii?Q?pICgMvEFHIh25NO40tBak44DSTqIm3HtQ26scDJj6uD0KNCc+pFrl0lME2YR?=
 =?us-ascii?Q?65ar5d0ONU7VbNxtslOyEsIJjIyJs+YrDGOargYbNejQKJX44Eiwqf2eiMfw?=
 =?us-ascii?Q?gvl0DJJAIYpHyQgvty7uZo+gA8kWrg3jhgCCa9O92R69eUImM2beDxfEXZQJ?=
 =?us-ascii?Q?1LgGZpcLT6rsa3BOifjgczm3LGWUn0COJ45EoGv9I8PBg9LT3URuxw+csmrg?=
 =?us-ascii?Q?mdIxXdBoiNyw7CnMUrgGJOXgoQmOTIPP4C6dcX1lMKisJdlOpK032n7+GOqN?=
 =?us-ascii?Q?ngzVZ+0rZIbrZXS1y+Ogl1+ESaDDL2fzEDZi+4RF+l3dFLJ9wZV9nv56+X37?=
 =?us-ascii?Q?7owMQNEON0InnTd131L5a2v6X+6UUT/FSx9HDjS0lTWmUtqZ3bGH9/jg78Zy?=
 =?us-ascii?Q?ISzEFHtqERNeaNFWeQAnWuO4T1BZDrlHMA/TNoRML0Q1cpQf3DdpQbANxzXk?=
 =?us-ascii?Q?KB7zxuVgukP7ggdAT2+bmTe+qFy2en6H47EgEZhyron1ODIWIgfx4o3eXMLb?=
 =?us-ascii?Q?vDcVGbVB18T5XDnhUMe/v2XG0M4vFiCHVeWV+tgxO65cscI7f/ktt4Cab0aF?=
 =?us-ascii?Q?eA0sW6VeAYoTdqHr4sCCwYRXT011HSs/LYpsGUPjD/27ZSKldmNEklUVbAI1?=
 =?us-ascii?Q?jUKg3qVybLCSXboCtWR0R880S7sUqnuUZgdeCGCMQ0Qcw1DwRFAFZcKDtroc?=
 =?us-ascii?Q?DBQGi3COpLpAf4jz5XX01aME1F+qjiYt17X4oQgGznvIItAbZBLE3Xm1PQEk?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a2c9c3-e81c-4317-3491-08dd7b43e8df
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 11:02:55.7838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Ocu4zw9jxQOaWMuhVH7Xc6ZF6etxKfX29geCnc6N9S3gasXnYuR/MFIRitwa4c2o5HHp/1AAChh8zA4INXS/gXc5AWkM7gjd5wGhAUhnaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5206
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

On Thu, Apr 10, 2025 at 03:48:38PM -0700, Lucas De Marchi wrote:
> Replace with XE_SYSFS_DRIVER_REBIND with igt_kmod_rebind().
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  tests/intel/xe_wedged.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index 22ff75367..1d2c510b7 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -228,7 +228,11 @@ igt_main
>  
>  		force_wedged(fd);
>  		igt_assert_neq(simple_ioctl(fd), 0);
> -		fd = xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_REBIND);
> +
> +		drm_close_driver(fd);
> +		igt_kmod_rebind("xe", pci_slot);
> +		fd = drm_open_driver(DRIVER_XE);
> +
>  		igt_assert_eq(simple_ioctl(fd), 0);
>  		xe_for_each_engine(fd, hwe)
>  			simple_exec(fd, hwe);
> @@ -266,7 +270,10 @@ igt_main
>  		 * Rebind the device and ensure proper operation is restored
>  		 * for all engines.
>  		 */
> -		fd = xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_REBIND);
> +		drm_close_driver(fd);
> +		igt_kmod_rebind("xe", pci_slot);
> +		fd = drm_open_driver(DRIVER_XE);
> +
>  		igt_assert_eq(simple_ioctl(fd), 0);
>  		xe_for_each_engine(fd, hwe)
>  			simple_exec(fd, hwe);
> @@ -299,8 +306,7 @@ igt_main
>  		}
>  
>  		/* Tests might have failed, force a rebind before exiting */
> -		fd = xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_REBIND);
> -
>  		drm_close_driver(fd);
> +		igt_kmod_rebind("xe", pci_slot);
>  	}
>  }
> 
> -- 
> 2.49.0
> 
