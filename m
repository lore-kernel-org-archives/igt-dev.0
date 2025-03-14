Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A629DC282EC
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 14:19:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5995810E30F;
	Fri, 14 Mar 2025 14:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7C68U/o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB8E10E30F
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 14:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741961977; x=1773497977;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q0p9uB9Lp8abVsLBwH+V4UKMMSY8W00A9pcA29cz3ng=;
 b=G7C68U/oEqk8cBI0VUocw2Z0g6QK3RWn4znEdPOWTmW++HkJV81uoC7+
 UlWhp/sa7zHjXJCFbBG2cPVxEiT0pFabU7nRzTq/ON4Hbz0T70uMSTeCL
 lvDARmithdxzdjsNCjzs+oobOUGcGZUWUjuFBXiiJgHpv7LTM3V5w9iMS
 KHbvibsG/r7M3bg1idjpmu2i6Rt/FZiVrnHyPu2QX+gXHmMtTH6uJTnjD
 r/FCwS9NGE5mhYIOVtZNfCfd39ZFF0EeyJka2Ptg+TORuhm6fxytkAFXn
 b8ThtfVQ0Y9kEup2keH0lQkH3F9HTk+X85IT9S6HRAvRrBuw1b68yOQSl Q==;
X-CSE-ConnectionGUID: JXUa5MMtQEK4ipqrz4WnmQ==
X-CSE-MsgGUID: Sf2eByw+SC6l9JV4Ytao7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="60512929"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="60512929"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 07:19:37 -0700
X-CSE-ConnectionGUID: ssEI2XMDS8S0sBpIX4C7bQ==
X-CSE-MsgGUID: UpPq5UnhQWOZFWyvXJcg+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="126344666"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2025 07:19:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Mar 2025 07:19:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Mar 2025 07:19:36 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Mar 2025 07:19:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TAL+PaSkwBFx0//s0CSSaJb0KN6/nimEK6XdItiFLMHAe8dpQI+Z3tSnY3EtYsGi9w8eIV78X9OlwQBrfitV/a3dOVLnbZAIin5auNgeknDNJuY8lBU2t0vXRbGGPRpBA1sFvw3kjKgwwXnIh6MFQvzyqJOjl7N/d5wxxp5BUdkVOn0aXmdWlHS9Bat7cYwYuKFo26nZN3yovFiV2EbQW8USTan1+j2qXuuJrygBAUySvi/hLCjbuQu8zvfC/bM7ThsUX+YKrtdPOrphxiAnWeRHtwPui3a3bwuQpCjZUNeaeTJ6/O0Aw19L6efxiOrh07njKjiaFj5VMmC9XaGLLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMbs2CeFA7NQgwdfb5yznD4XaXBkrahnAvHxQnCU7cw=;
 b=yIzG8gnGRMF/l33p9RrnHb1LBeR5kviZ+mlfJFP3A/ifF3N52nAnDMqZyqiZNaRrndmMA7deq6VH+c4+E8/I5hiCD7Xbb7WmLXrATMCRx+egelcsg+4qCsAgW/6NTtz7NmpH4TExD7R+EACowzq1AwFMSiHQV1V7tvDR/umalfjl1jiQRzqCv2lviX3SjItfMCv8XcC2QRcfmcBb2YSwE+ZJuQucZ56EYkYpiOcMdI73h2YKC17eqEVowUqoqA5Yps6NL7YEsZyvxUYorZ4yojvL/MD1/nHxBO+Y+tQppYufJDhu8xo2Iei6B4TrsboCjgSeRJkSG2y/dI+Ome3Wng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Fri, 14 Mar
 2025 14:19:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.027; Fri, 14 Mar 2025
 14:19:33 +0000
Date: Fri, 14 Mar 2025 09:19:30 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/igt_kmod: Allow igt_kmod_unbind() on a
 specific device
Message-ID: <ws4gvntawwjz7u56ltgkrotur3tfwfdq3muekmtxb5ukekd46u@n33gdlohxnx2>
X-Patchwork-Hint: comment
References: <20250314095701.581686-1-francois.dugast@intel.com>
 <20250314095701.581686-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250314095701.581686-2-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR03CA0071.namprd03.prod.outlook.com
 (2603:10b6:303:b6::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7777:EE_
X-MS-Office365-Filtering-Correlation-Id: 12a7329d-0084-464f-5c32-08dd63033dd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VBiC0MPY5n6GTaSd3DArTsIeKFX5Uv09PldKu6tY6lrCY0Y1bmbSFmrpcVWw?=
 =?us-ascii?Q?jgUhsgPzR9WkER9aba/ko4DbegBKyVeTenzp0BPwBvpf78vMuKIID2HNDRLw?=
 =?us-ascii?Q?kFqAdFh3XoLAxNunVHmg1HDz0D2BAEPEVssry11K8ypK9LgteghKZ644AqaR?=
 =?us-ascii?Q?zfL9HV17IYWgX8OgU82aCSDyUSfKUsGse0WlBnltr+kAC7pI0nKnJrb/cPn0?=
 =?us-ascii?Q?t7KQae/HZX5YO+4cj9L0ee7I/WDIh+oILcV/DK5p6/d3DIsE1EAI21IC4Xmr?=
 =?us-ascii?Q?7ZbkBUM0MmEOC5utWGaAD0rI+sBYuXYJkQ9EXXmU5Rm547Pl/pvgMigKEVCH?=
 =?us-ascii?Q?+ly61mqBVoUjkIp5Tf/+/uZpN9rsEf2zi8YYB7b0tx1Rk2t6LOmssqCOhVRr?=
 =?us-ascii?Q?LxmkCNK6miXHYaAL3SnDvt3CqmUoYi0zPR257w66wRj58nheCbR+D4OiZE9L?=
 =?us-ascii?Q?uDbi/5rw+EYUvTATSJOVnaclZSL0p6B/kC5SOv1HGupiNkY8XCV64aF57vCM?=
 =?us-ascii?Q?iie+KCLBKl6nJkvxurhSNqNJQd7AIOf0A5UN66LAPoD7Qhaq4ouDH3kB+2lQ?=
 =?us-ascii?Q?UeIx/HQZ3mCLcGD59FC6iPnyiR0NEMGgWotaSkUkrunamnJ9MoleP8wr5RGg?=
 =?us-ascii?Q?pCXXwQkkQPpuuvNoDa8g30B0M02/KtFU+IuIrSIMQHUgRAM5IwRkmCO9VTF8?=
 =?us-ascii?Q?malH3xm8TVs4wz0Qj1XD4XrqgKHtuQPkt/cXAr/byWZbXopvKpAJPBYR9llH?=
 =?us-ascii?Q?L0+To/oUbMLHSTqN+tEdQ8LSM/4goWS5vAoSQOgmuJyw0GvieScdLOmGkwYU?=
 =?us-ascii?Q?97tK/6kmpzi3U/XIr1jZ9l0aQxHrm9DNs5SwtKnUKeI0xvX2s1f0yGNM+njR?=
 =?us-ascii?Q?6n+At/kakeiTMxvs28Vw+Mr+h5q2YS5gyPOD2yPOO4D8iqpk7GHerhSya4Ik?=
 =?us-ascii?Q?/F+lHGIWGQzCrddIrlrtQm1WH6Hvs3diwwbLQtI++KhLNCIQx5WmWHA6lRCk?=
 =?us-ascii?Q?Z4jSt72cvSRRI0M79h4nHFrabDoIl32Jogocu7LeFbATyjpvUR+HmkMNcro5?=
 =?us-ascii?Q?uoUusIrGy9FBfdC/og4HSfhQ44MI+skoUB1mtVhnwtjSYiTUDpczAj0nxban?=
 =?us-ascii?Q?EHhNmRx6Fj19MTKmsnYaFkf8dqnKiqqvh5wvPv2LJD2rxAtN8m8b65U7SQ5W?=
 =?us-ascii?Q?0SzByy2rgXI1K8L9wgB5N15An4dHh78N3RLtxE34n7s968ugqLwYsb2Oxcgi?=
 =?us-ascii?Q?6j3bsjctzSsSKIn/sjta7qxbU8qkeHXANQjePIMkIw1kO0Du/Anda0WDug2r?=
 =?us-ascii?Q?PyRNnaPJ0Qqn8DLaCmtO+mvUTQ/iPCmrMfr3HGCnfimp3LooHv6oVQhptqDs?=
 =?us-ascii?Q?HAkY+DB+Pa5dwdUstD9xN8ZSVHCX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?26C8jPMmHFj4upRGd6/GGBPOhcJ8zTsjhqPA4ChfTOUom4XtQw2qYxDx24TN?=
 =?us-ascii?Q?9vJCq1OxmkMHNAmGXvlEmhsJw5F4lUfJL/gnpog/gKpqiBQ87faW3H5yVqNg?=
 =?us-ascii?Q?lOWy7H8GodvR1qobx0NZikX8c8zQs1GrffavxOutkLx5S2V0PgNe6f+WG1rh?=
 =?us-ascii?Q?KhvYUGXiAsqfp0N1mlFZerv2xG4+xskDZ6kmmeQa+fmaMMdM68OhRrb3JmZM?=
 =?us-ascii?Q?DATalQuo+UkoX1WaTIR0L3aMaUNjYbBPnRL8YqyPSv1LxRX1I5tGlzezlzFC?=
 =?us-ascii?Q?owLaS16tiPT84KPV1NfvsialnwvyqAWBrZa6Jlwt1+qvC3gPBbPk0juWLX1P?=
 =?us-ascii?Q?V/R0VAYhtXLXUSA9LWA5uB9gVEWVVtY3yBnmH8tSSVXeqU2qrvX73GWHHle3?=
 =?us-ascii?Q?n3CZXzXfQ75lrnhAzHP8s6yAxX4RY2MixRyv6xwSYt8P+DIadOMCv+CsRwlR?=
 =?us-ascii?Q?T2E1Mrwz3P1TeNN3bgaD7Ky3P28ppjlJ9JL4E6y5t6kNcvaQLV3/M8G3tyNd?=
 =?us-ascii?Q?8DPyayvpmr33KfyHlTqfztiV3zTYiiGGkaC4RBw6l9i9caT9+M1fmRZkFX1j?=
 =?us-ascii?Q?v+fsrS5oVnp+zVQwDeI8Q33/mhLl+Ol7H7Kvbkqm6+FG694GTOLo0aF35n8z?=
 =?us-ascii?Q?et75WojB6GTWm6Btg2/5Y2AWO6mdq1pKiQRwYK6mNlFebcKy9RBRa7eTc0am?=
 =?us-ascii?Q?I+BItfX/jkFLpb/uYQ0R5BwVI0supMsnPHAm7R00C5lgKevgrmQzHbtH2b14?=
 =?us-ascii?Q?lw512LzgEob0Gx5+H3M2BcWK9n95Jc4sukwQL1AzlVLelHrZeI428oC/+f40?=
 =?us-ascii?Q?+lmp9zuoNuVJY64NaYZ7jWwFiNimg1INm6saBmMQMuO9EGKHxZKyG/a5t9Ny?=
 =?us-ascii?Q?0qgSBqLtco9071QFyZ2tpbQxa+6lmS+3rZwbc+dDz1zFmrrEtKBYzu+dYkqu?=
 =?us-ascii?Q?sICLAadgq02ifSZ7WaZRPYSOW4Vtasa49Om4iKAYxitDNAbQBnUARpD1Wbza?=
 =?us-ascii?Q?4ylg1tY8gHP7UBdxM1goFcm0k9khHesD/inMG3zKVklXKPoU6XMu4P2C//vX?=
 =?us-ascii?Q?cz7zjUEzsXSelkIQRFBUVzP8vWAr1skpQnRN393DafTsHMy3YoxafBhiimkB?=
 =?us-ascii?Q?/8YKput/jTrBLr0k41oHWaowm4epkxbkRq0v9dCxysMO2spgVjt6xWQM7x/0?=
 =?us-ascii?Q?bZl66VMQbG+9XUo2TrN8ItARHif/of7zpGoagB12QYqMGuxnWSgzIyBILvxZ?=
 =?us-ascii?Q?7rWRyokGcvQKNfbbbeAyDwq4sH0wg4UKBQt3bD22T1y1zvUKadLl38TRMf7+?=
 =?us-ascii?Q?iemrndxIsHpSpiEYCaKY+tidedwlrFF6hZyTrKcyO+MrC9vjHOrii2ljJb98?=
 =?us-ascii?Q?IaV5SkTdMRjcvo5BzteCkwesjRYdtRe2QDrYR7ow93RZ2vOvIyHWscawSY23?=
 =?us-ascii?Q?rjWIvWwgV+NuG3KwhBA6+zfAzZn4AJC0fENO9GzGVNX40ttR4Qt8yP5pmXoo?=
 =?us-ascii?Q?cu6G52v5+9SwvMmB8vciJHGKX01bvZC9XkTeIZOY7ijOuqOBkW3Lbj5bxvT5?=
 =?us-ascii?Q?mGR0J7bp82e1cWU2W2ZcdO1F5Jmumsc78ag7+5efTElO/d/qPRmsX7hC+5fB?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a7329d-0084-464f-5c32-08dd63033dd0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 14:19:33.1467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wUNgvwQb/HUzOZbQNv+hl79D93YaOMv3kwQpCM3tXA44c09t7AafFOI1fCJAFaQAlUwvlZ0r4CL8mldygYfu31YJXm1ssfmw/b9PnDZO9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7777
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

On Fri, Mar 14, 2025 at 10:55:04AM +0100, Francois Dugast wrote:
>It can be that multiple devices are bound but we want to unbind only
>one of them. Add an optional parameter so specificy which device.
>
>Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>---
> lib/igt_kmod.c | 15 ++++++++++-----
> lib/igt_kmod.h |  2 +-
> 2 files changed, 11 insertions(+), 6 deletions(-)
>
>diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>index 524c1a632..f00f7dd15 100644
>--- a/lib/igt_kmod.c
>+++ b/lib/igt_kmod.c
>@@ -633,7 +633,7 @@ int __igt_intel_driver_unload(char **who, const char *driver)
> 	}
>
> 	if (igt_kmod_is_loaded(driver)) {
>-		igt_kmod_unbind(driver);
>+		igt_kmod_unbind(driver, NULL);
>
> 		ret = igt_kmod_unload(driver);
> 		if (ret) {
>@@ -647,10 +647,14 @@ int __igt_intel_driver_unload(char **who, const char *driver)
> 	return 0;
> }
>
>-/*
>+/**
>+ * igt_kmod_unbind:
>+ *
>  * Unbind driver from devices. Currently supports only PCI bus
>+ * @mod_name: name of the module to unbind
>+ * @pci_device: if provided, unbind only this device, otherwise unbind all devices
>  */
>-int igt_kmod_unbind(const char *mod_name)
>+int igt_kmod_unbind(const char *mod_name, const char *pci_device)
> {
> 	char path[PATH_MAX];
> 	struct dirent *de;
>@@ -671,7 +675,8 @@ int igt_kmod_unbind(const char *mod_name)
> 		int devfd;
> 		bool ret;
>
>-		if (de->d_type != DT_LNK || !isdigit(de->d_name[0]))
>+		if (de->d_type != DT_LNK || !isdigit(de->d_name[0]) ||
>+		    (pci_device && strcmp(pci_device, de->d_name) != 0))

nit: I'd prefer to keep this in a separate `if` to make it easier to
read as the reason to continue is very different, i.e.:

		if (de->d_type != DT_LNK || !isdigit(de->d_name[0]))
			continue;

		if (pci_device && strcmp(pci_device, de->d_name) != 0))
			continue;

other than that, lgtm.

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

> 			continue;
>
> 		devfd = openat(dirfd(dir), de->d_name, O_RDONLY | O_CLOEXEC);
>@@ -718,7 +723,7 @@ igt_intel_driver_unload(const char *driver)
>
> int igt_xe_driver_unload(void)
> {
>-	igt_kmod_unbind("xe");
>+	igt_kmod_unbind("xe", NULL);
>
> 	igt_kmod_unload("xe");
> 	if (igt_kmod_is_loaded("xe"))
>diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
>index 193b95627..170a8df9d 100644
>--- a/lib/igt_kmod.h
>+++ b/lib/igt_kmod.h
>@@ -36,7 +36,7 @@ bool igt_kmod_has_param(const char *mod_name, const char *param);
> int igt_kmod_load(const char *mod_name, const char *opts);
> int igt_kmod_unload(const char *mod_name);
>
>-int igt_kmod_unbind(const char *mod_name);
>+int igt_kmod_unbind(const char *mod_name, const char *pci_device);
>
> int igt_audio_driver_unload(char **whom);
>
>-- 
>2.43.0
>
