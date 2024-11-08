Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D52D64084
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 20:10:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8A010EA34;
	Fri,  8 Nov 2024 20:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V/Jc2LFt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FFF10EA38
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 20:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731096657; x=1762632657;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WYqF5W0MlfsS37Kb5Z2MsaRpGd/B0MMK99wai4N4Ucs=;
 b=V/Jc2LFtFZeJ7bD6vQ8TFbwgkqSRljJPp5FqEIcg7SBT4On+mibJq+X4
 54LV+3erhLhAtq2ra5lnJ8WRXdw11m0iaMbefUxm00seKoZVz0vxKneYh
 5c/UyDmWd4mrMXTDQiL5J8qBbZTGF2kvRxjnqirOSTo9JuXubW5ObsUKd
 fnLmjiDWOzaBJJtLLylk/yip/N8Zk+2c1NhCPuo7yrb1Js3OVaxoj/NmA
 KqK12WnBrT2RzBxbW77jDbk0hFPV31Yf1CTvqIPACC+i8R2UCRV1pw3Uc
 nbz+6HQEIhV8k4U6Qf6K+ycKdbPy8lCe3obBgRnXAUxLAVFumUzFV6vRI w==;
X-CSE-ConnectionGUID: nx23/xNyQ5mWGRNcGRklXA==
X-CSE-MsgGUID: go6HgSA0R5uR7RBhPxXmUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41557487"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41557487"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 12:10:56 -0800
X-CSE-ConnectionGUID: +9ggQxA0TOauRxL9HUkahQ==
X-CSE-MsgGUID: 4lDAPenTQBa2MxZOOLax5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="86507504"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 12:10:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 12:10:55 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 12:10:55 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 12:10:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDbPevxN2zODDDiWcr0Zaub69DV5SpCzELeXjliWg2QKcGxEeTCHAA8IG7sNwhxLrn+q9uBuU+23wTv8nzgP0q602ZdCJGJGxLNJnTa9FRduYuMy+yU//H0KN3OOfkfsmgh0lKbEi+cip9x0mSWkSOV+5fMmwdphjVMRhJ8+7iidJjh6Yv7PJvCMijrR1r4GoyhROi2TkoPMFD4cpfYkX4PPhwOZLFTDTWHyEl+ZHl3Ae6jq0cRv4M8axAvVKgEXPZM5ESVHixUGNqCXv72IfDz1PwWgUHtFNIocgWhwH3hV9cCdxcuJsZMxXwALLzF6TQq5Vu4s38xmZNI1Xb34CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgO+fnUi5m2N0szY6Gf8bLJcjblVFk9WXe7xh7Z8eS4=;
 b=DKBf/J13iTX/MCnlzSmlLIkNLrCQEwywwMJYuJ+SVzfK4pAWHIzWztxCmOoHMpOcR11dg9ZKYejsTqkTwolO4BAFxfY70xvP8MkGTei3fnhMqf2PyXbCWjqkaxcZrG07tHHc2EdVYDZDMsG2rHZqHQhf0me04U/5KpO1t6LqorQgeDosotbHBw6GB6bpvf9HJ1HcG7JeT1z491BCRyR7HGKSEQTAglZBJ9HbXFWg3yvfcUK7G8T+Ex6ZNA8MZ1oHmSLMMv11Joab339o/n3jb0oGchES1+YoEhYMClcLb1rieXzTheM8D0oBGabUdv/uXQ5McHbatK7SPaCRpNCa3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA2PR11MB4906.namprd11.prod.outlook.com (2603:10b6:806:fa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Fri, 8 Nov
 2024 20:10:52 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Fri, 8 Nov 2024
 20:10:52 +0000
Date: Fri, 8 Nov 2024 15:10:49 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 5/5] tests/intel/xe_fault_injection: Inject errors
 during vm bind IOCTL
Message-ID: <Zy5wSaUzcYgCHb4W@intel.com>
References: <20241108160021.1202234-1-francois.dugast@intel.com>
 <20241108160021.1202234-6-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241108160021.1202234-6-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR04CA0143.namprd04.prod.outlook.com
 (2603:10b6:303:84::28) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA2PR11MB4906:EE_
X-MS-Office365-Filtering-Correlation-Id: ba150a9b-2687-4e16-9e65-08dd003171fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1P8ue5Ht0shyJTsufi/HoWLCFe+gk/XaIPMS1GS9xa+OlhqF+Z6HeVjyfS1S?=
 =?us-ascii?Q?5y3BLvztqn57yaUG7+kK2l2+/escvtTXVmTY4FGkPSgZ5VmoLnwXtzXGHBVY?=
 =?us-ascii?Q?neUANelFR3c2TdVOHIBXcT5+e7O5JltOYYDjAcQ9Nyqwdw0mbKQYNd67a1fR?=
 =?us-ascii?Q?tGELia72rpWU+0SmDvtnvrNGO2+0n1KxlM5N9SM3BFN76j3V/jL8nva7Px/O?=
 =?us-ascii?Q?sTLK0cNR+HaMXzd3eAQD5ELA2BfI5mGC79KfK61JSU/mV4Lqz03TaSkhRTrJ?=
 =?us-ascii?Q?lKyd59sXYbveQKhQGJ0U4KXC5xOqdjzwU/jLE2aqW3zp86DNSNQBH+XG+aRT?=
 =?us-ascii?Q?/Sw/taIlILi14CBmeE4iZzhCYvyxE8nD+ZXZxmjDMWCbfbPOr6U0Vhu50+JG?=
 =?us-ascii?Q?wMLzbvL/C+wUGrpRA4/z66YeOyjsNllbjWfqAoY17tQs3dzP9JWEEg28AEyU?=
 =?us-ascii?Q?sU9hyEsvZOfUJbXYsCDbyWR0XeqpOWTshBEbHCOUGnVpjHEqKkS2xs/2ROmC?=
 =?us-ascii?Q?e/aXFJ21xTi+9V9aIy7E+3AivzCyiZSkmPRAf6vwzf5LtHPdM7ykPOgBsNa3?=
 =?us-ascii?Q?3vWph/3BhT+z3gB8BEnjyVMcnNGwdWXSgMRZ82vyIORe7URLLipUPAIcXfhP?=
 =?us-ascii?Q?qN8TL/mq7SnZMDsm11Zi+K9GL6IpKkdTchTbZrQCNUkYy5iPVaHRamquUVCI?=
 =?us-ascii?Q?q8v3mI9RzItjrDcxvwn3Ahtl41LbgC4kCtn0NLsKkiwd+qLT4PsxAr3Qcap8?=
 =?us-ascii?Q?SIz4hMF2w9EIyXQInnmLYhMM+0USHA3bRan/lZwBVQgr0lOglxYW8CUXOeqU?=
 =?us-ascii?Q?QjMh03PF9BtZoghyL16APOU9GhpZ1iHkAAMtDXu8i3I1Y5ZbcCZp4GBCNMmJ?=
 =?us-ascii?Q?RQVVOH/JKIJ+lfk74eiWp58fk7vxJrcoGAczEGRHW7Hbw4adOiw+ghOcNe1g?=
 =?us-ascii?Q?6dshqnfAYIZNaruDAEhRYLEUY3ztnVbO02qpaIxV9aBAHe+0vBCVF1BuccOb?=
 =?us-ascii?Q?dnhjRoAJZn0KpKC/f1uBgC/6iU+c5II2igWhL4jSqpUN46VGdiAda30LBeiR?=
 =?us-ascii?Q?wKnyC2LxW4HaffPt6DgNOMsxPoZG1iTLrNLhVXaUoWoV1VMJQRBgYcBnqMTJ?=
 =?us-ascii?Q?SbpXFzL2i8k+vRg2bMgjshJD2RR3ahjiom5/RGqsrAaC5i15Kd9NqoNGTFQM?=
 =?us-ascii?Q?qajqEAzdFbbHsB39e93GgRTBA7sVhUC8yfFJkuBRJvsfnyJnUBONQWXArX++?=
 =?us-ascii?Q?AN5EfiIgMpiF47fRoLtIAZGJr4F+k2zaaEBLrY3C1EEy7khm0sIdOd99EJcw?=
 =?us-ascii?Q?Veo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?igSP1Uyeq9ffWTkONDKHffpqIMs4Gnsv4T3Aq3yaixcb3E2yHoAXDquhq6zG?=
 =?us-ascii?Q?HvNmgWI20BcjUFtuq+R9SDwaA4niTxmetebqhe48HzWlgQG2WoA+kiE1KciT?=
 =?us-ascii?Q?mWO/klw8dQ/Per31FU80zOxa8bexkmjQnT/vlbMBZ06waNfNlRjvajtLjIed?=
 =?us-ascii?Q?lCzwCL+RtAVXpQfPnGDwD43QlrEWHc8g8YuHB6wfAOrXMYUJMpbXASkbrssA?=
 =?us-ascii?Q?PrUanteYbT+qWy/+Y6Yw+zempvqcJVcwhQgUL0+NGTlD+C8w/gZ+Plr4QDM6?=
 =?us-ascii?Q?FEAtOtyekQSQ6rxu1d1R42jfzwAiSz46L2tJs1ZL0T29Fi5PwIoS3zk2ApAn?=
 =?us-ascii?Q?RdXoMh42VeG4YLKJ+EUBlQb7NmfCFI7HMtWI3W3wMPpbtuTv3Yl3kQ4M3Y//?=
 =?us-ascii?Q?fuo5txxO69Xse/7CIZ/riBFfl4fo5CcaHPipYnNqlDG2yTKNkqq4KjRqrxdq?=
 =?us-ascii?Q?iGq6Yz+ZL9YryroU3dwUrMavisnTFzFw+e8UXkeWWUEE16fP+0mUfOwoLwJw?=
 =?us-ascii?Q?XXEDEWoSlF0Fy7Y5PaQZeT65uwVdzLdY+88Ypp1O8AFKKnXRPaWGTHFEQDi/?=
 =?us-ascii?Q?bX5JxossKU1u3+FK5pq1fnvCZZoSJBO2QKaEIQol54cDBVZtB4ENPOUEXKdM?=
 =?us-ascii?Q?FvdtZv82+KKFKkpYG0ycwFos3Cr55xJC1illxGpq1HaUt9nX2vi5t9MGqiRd?=
 =?us-ascii?Q?WKXsNrX/YrJW/oaBwTcrO6aiqKRU1BQX1ZYiTl/hkYNlhMXFQchBJsc3+6lG?=
 =?us-ascii?Q?Y5ooJaecjnasn3nlHFz/SB5Lru+tI94GuQvE+jKlFxm7TVKKd5kPnoOvgTxR?=
 =?us-ascii?Q?M3AP/epFEeQffDGwlRrpVdIKx7Sp1Sjq+EifIw5pW6ZOsd/H/7j/3adRynvj?=
 =?us-ascii?Q?ixXv6mULcGiF09JC89Xu+y+E44ueJqmvO3YJrftb0wTtJ2tHxag8+Tnfgc1u?=
 =?us-ascii?Q?Pr+o6H+KXjrKsWSj6oUmwOrMVG7W7gbOJ+N//5OOzNYgeOWwKorVflWU9br+?=
 =?us-ascii?Q?FBXQVcRFPwijkvifmpLuzqYDMaaeJmDxyyoIPaa0hT/6/NhXU66h8+XVDT1R?=
 =?us-ascii?Q?gSJyFZGroBgCOK+bKH+zSOWWP0OT5RadasvvGQ9R2J/PDgg7xFJmjriovVRK?=
 =?us-ascii?Q?h1ijd2zgi8oKej9mXJrnS8f35N6Ge4I+8RtAHDQLcALqGbcedqNIfrgrvG2Y?=
 =?us-ascii?Q?4CwnpavxmiqxGNTaAVyq3PQiB2umbgm7KsrhUWhbiFYK/dHtpAOW0p+iMuuq?=
 =?us-ascii?Q?EAmBnzka5sL8L9LIKn60QmLp0iU4ujF5NXD1/Ww/MWNkD67xjkyO/jYIOH2K?=
 =?us-ascii?Q?0bvorR5yD19kv1N9lbetn7T2nn2fP4SkoUAb8T20gTnkRlIVxEafep2KsD+q?=
 =?us-ascii?Q?/cgPvS5AHZin7d0BFdi3NWdsinFCDHRz23tDLEzf//p00poqAPl/U4IyilcZ?=
 =?us-ascii?Q?CIQsg3iJfpMxKAaVPoMR0cPEw+a76i83Ho2OerJQyPz36hdaBxR0E5qanXZ8?=
 =?us-ascii?Q?BlR45J8pTKG0WzPgwB/f9UXp+YTjjKLGzn5+6DACGlZs5nvBIvP6xi4tnUQT?=
 =?us-ascii?Q?arDFbTEUR21ENFvezBN0ByTzNMNgtiHMOqPhde0mh7o6pwB3TL/Pljza8nmS?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba150a9b-2687-4e16-9e65-08dd003171fc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 20:10:52.4793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sqfZ0IfyEPM32L98iaapy6jz+A1Xo/awnb4skRdQ+qB83Y9ZfGviZAtgYKwO3XoJtPKx1/HYGaYl3IVdQ0yxPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4906
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

On Fri, Nov 08, 2024 at 04:59:33PM +0100, Francois Dugast wrote:
> Use the fault injection infrastructure to make targeted internal KMD
> functions fail when executing xe_vm_bind_ioctl() so that more
> code paths are tested, such as error handling and unwinding.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  tests/intel/xe_fault_injection.c | 72 +++++++++++++++++++++++++++++++-
>  1 file changed, 71 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index eb80f6af8..43d3a2da0 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -17,10 +17,13 @@
>  #include "igt_device.h"
>  #include "igt_kmod.h"
>  #include "igt_sysfs.h"
> +#include "lib/igt_syncobj.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  
> -#define INJECT_ERRNO			-ENOMEM
> +#define INJECT_ERRNO	-ENOMEM
> +#define BO_ADDR		0x1a0000
> +#define BO_SIZE		(1024*1024)
>  
>  enum injection_list_action {
>  	INJECTION_LIST_ADD,
> @@ -189,6 +192,63 @@ vm_create_fail(int fd, const char function_name[], unsigned int flags)
>  	igt_assert_eq(simple_vm_create(fd, flags), 0);
>  }
>  
> +static int
> +simple_vm_bind(int fd, uint32_t vm)
> +{
> +	struct {
> +		uint32_t batch[16];
> +		uint64_t pad;
> +		uint32_t data;
> +	} *data;
> +	struct drm_xe_sync syncobj = {
> +		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.handle = syncobj_create(fd, 0),
> +	};
> +	struct drm_xe_vm_bind bind = {
> +		.vm_id = vm,
> +		.num_binds = 1,
> +		.bind.obj = 0,
> +		.bind.range = BO_SIZE,
> +		.bind.addr = BO_ADDR,
> +		.bind.op = DRM_XE_VM_BIND_OP_MAP_USERPTR,
> +		.bind.flags = 0,
> +		.num_syncs = 1,
> +		.syncs = (uintptr_t)&syncobj,
> +		.exec_queue_id = 0,
> +	};
> +
> +	data = aligned_alloc(xe_get_default_alignment(fd), BO_SIZE);
> +	bind.bind.obj_offset = to_user_pointer(data);
> +
> +	return igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
> +}
> +
> +/**
> + * SUBTEST: vm-bind-fail-%s
> + * Description: inject an error in function %arg[1] used in vm bind IOCTL to make it fail
> + * Functionality: fault
> + *
> + * arg[1]:
> + * @xe_vma_ops_alloc:			xe_vma_ops_alloc
> + * @vm_bind_ioctl_ops_execute:		vm_bind_ioctl_ops_execute
> + * @vm_bind_ioctl_ops_create:		vm_bind_ioctl_ops_create
> + */
> +static void
> +vm_bind_fail(int fd, const char function_name[])
> +{
> +	uint32_t vm = xe_vm_create(fd, 0, 0);
> +
> +	igt_assert_eq(simple_vm_bind(fd, vm), 0);
> +
> +	injection_list_do(INJECTION_LIST_ADD, function_name);
> +	set_retval(function_name, INJECT_ERRNO);
> +	igt_assert(simple_vm_bind(fd, vm) != 0);
> +	injection_list_do(INJECTION_LIST_REMOVE, function_name);
> +
> +	igt_assert_eq(simple_vm_bind(fd, vm), 0);
> +}
> +
>  igt_main
>  {
>  	int fd;
> @@ -218,6 +278,12 @@ igt_main
>  		{ "xe_vm_create_scratch", DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE },
>  		{ }
>  	};
> +	const struct section vm_bind_fail_functions[] = {
> +		{ "xe_vma_ops_alloc" },
> +		{ "vm_bind_ioctl_ops_create" },
> +		{ "vm_bind_ioctl_ops_execute" },
> +		{ }
> +	};
>  
>  	igt_fixture {
>  		igt_require(fail_function_injection_enabled());
> @@ -230,6 +296,10 @@ igt_main
>  		igt_subtest_f("vm-create-fail-%s", s->name)
>  			vm_create_fail(fd, s->name, s->flags);
>  
> +	for (const struct section *s = vm_bind_fail_functions; s->name; s++)
> +		igt_subtest_f("vm-bind-fail-%s", s->name)
> +			vm_bind_fail(fd, s->name);
> +
>  	igt_fixture {
>  		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
>  	}
> -- 
> 2.43.0
> 
