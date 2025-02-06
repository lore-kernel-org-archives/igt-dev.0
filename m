Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB21C02194
	for <igt-dev@archiver.kernel.org>; Thu,  6 Feb 2025 14:50:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8991910E3A7;
	Thu,  6 Feb 2025 14:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gPtWTNaY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9EE10E3A7
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Feb 2025 14:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738853457; x=1770389457;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=HrithQFs9Y6D1Spk/YzXRDGctqSReJK9Ro/+sR68jcQ=;
 b=gPtWTNaYDgTq5et7p+2lkpZTTyn6psvquaF+DQ13DUwJyrf0jWYhiaCq
 A3z04huVRoVBLEU9uqqK9zRJNOyUqn7ensA7BkhLvanD+AFv9LjSDoVjt
 J+rkUhG3wWm8Ix3lY1RXBqawOB7cMIjtLHbmQMDNwbsVF2LxRhbFYFvSs
 1t7kFsQ99ZZ93vh8p6TEYeGPI5XXL3YZqAKjY9yRFUU6+kMJufEf/NTPg
 Wrwebfx5c9ZWs8HFRE6GrKJ/4DKmk0jC0eRsY/BPbKmntN4IST1saOpt/
 ctJ240AZ1kuq/vcpIEqoJbLK4VJJ0dBt4MGRBeHUXE7yk8N/+HiNQ/kq4 w==;
X-CSE-ConnectionGUID: AEHVntENSvuGztFnuMRXpg==
X-CSE-MsgGUID: TVKSU36RSw2wWo6qKUfx7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39154383"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="39154383"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 06:50:57 -0800
X-CSE-ConnectionGUID: 8xlF+u0NS4+ZcYztUL661w==
X-CSE-MsgGUID: fKvSIkPrRT6gZVZ8CYDC3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="116187143"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 06:50:57 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 06:50:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 06:50:56 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 06:50:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xCgZXg09wa0eLA7I1lx0i2EVwCq4Io6xwLgUqcsxSUE1DsHYpeoU+qTNBj9gIq4VIvpUdTY+GjOSKwpuuA57CNwr8DRpcqVeTxZgCTzu4dgQSDICnkWIWsf2lzHkB9+AzpNvm4nPQvWtMT/n/oscZeCSyMuUqmUb537jR/xXAnGJZP69dpanMtjD6sN8AJlY+hlBOBFtqEytYnPNj9ffdysyyhUzNB4P3zPzi6qBSg1tkFGSDHZkNZukyvh1QUHm5Rxq5ffo2Y2DUjWdRklbjJwyZnvlvaXspixhqW2nu8xMffsO7PiUFSMh/nMzXENwvuMSCQCzMTrTPWg7G0Wcug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/bHXZ+H1+rNx8/EsZd1Y9Cl2T6wGE5SaIBLZFdAyMg=;
 b=TszuUn3DwZD0vRrSkdEVthJTw9GJMJJtCcZyt+F6izFnEuzJKbAxREiNl0H9xCTQHGCkR3/EAyGhyaxEdmcLtjIs51eaiOOuISRWoduaRqWnA3WYRDlJ2dFGVTR/h/UwF6E2nYgMcitOpZXAhAQ2YMg1+IiafngfHWobKVTt76uHGI3ILz/gInavcfEZxA0Qte9cW+6Z7bdXW6bV5xJXfDCPnvo66yFt3wHVkV2BN1KdUfjXIz/p15SoGtmuGdDezvzozNEFYN3cvUoTPUQzds2OI0wRBGSBLPojPglkhNLm2MoKP/7WeFI4nbvsEavnHxbwUq5y0epBla+/6dEAdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4957.namprd11.prod.outlook.com (2603:10b6:a03:2df::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 14:50:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8398.021; Thu, 6 Feb 2025
 14:50:54 +0000
Date: Thu, 6 Feb 2025 08:50:50 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] lib/igt_kmod: Stop unloading drm
Message-ID: <dxy2w3hpfv5xk4w4qqd7p4ere4set7n53be3vt46vvhtivywdi@7psis3di7riz>
References: <20250205030948.1965423-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250205030948.1965423-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0044.namprd03.prod.outlook.com
 (2603:10b6:303:8e::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4957:EE_
X-MS-Office365-Filtering-Correlation-Id: d508646e-d351-408c-01dd-08dd46bda7fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kaFaLnWT1sL6KsbNmpULx6sNWWZCcQZhNHOgZZodaN2vm0N+44Uf55diZQfV?=
 =?us-ascii?Q?afg1yzqfEu6S6mXZGFxGGXxn4nvs9z8ixFGrVSURV1/btdeto2jBKAISmyoh?=
 =?us-ascii?Q?jXh/RXG9vPFyc+uBqcgcC9etG/DxqmXnflbfVWjnz8M6DFzUepp+990OhfWx?=
 =?us-ascii?Q?wCeKxwgFWnRFs9zCt8saRlkcqzZkgJNh6bptSk/pusN6BmO8m48nTda/n7VN?=
 =?us-ascii?Q?OSJNupQnLPqcsFeGIPAqUFhnUACwDGvW+Nupu7eXKqFknxsl+X2+DlFEN32u?=
 =?us-ascii?Q?99YmnvSZoy5Y4Mku0hjYAw8Ii2fj/oKcdhkG0xv2RoTciuDzCqkIHGz5Psov?=
 =?us-ascii?Q?x627BuNE9NlIz4mTmR50wRyeGqDGWm5icriZPIdXs0ymvJEsX+usPbW+mMbi?=
 =?us-ascii?Q?osye2HBxDPEPObd6eA6SjqL03KvQzWwYoqA9xuMA+bsrWNlX0lMg2CB4fdCl?=
 =?us-ascii?Q?2WS+d+Y5CkwTB+/9/C1AkIAksQTYNXYrFB9ihySC/M110L8DNovL6rRvLmbf?=
 =?us-ascii?Q?iJkK80iK8RU5hy7+IYle1aAf9o1+H+RUeITrRRjiGCQ0k0WZlpa6eVK0Q6mh?=
 =?us-ascii?Q?TkGxE62iifSiaCLwbd/GhvwOMCP1ZGFMILh5Oo4uK40HGJnF89FeDw3VQRNA?=
 =?us-ascii?Q?7WnMQYsiiR9UCsy9SmruD7LqjGaZXPBOF0oo6jhdP4aPAv07vGv6rJvj/fJQ?=
 =?us-ascii?Q?rDk5FJxii712ovGVR8xaheMtL6Lst3UttnFZPssnKKs+UznMpBjtgy+LGddv?=
 =?us-ascii?Q?FazQZ10xyp9xVGA08aJ0lULhAaEo1BwaIPF1ZUx/8WBp15WSc/+VKTOpfPrp?=
 =?us-ascii?Q?AeVKxWI7KiCzesAQlnDcKW82MpTLxHnpWlxRitiFG9dqOWSNf0UnaMPx8kwe?=
 =?us-ascii?Q?C8qxl+wpnM78YBYrDuAkdweHQjQVQUZcU6pgng8+XFdpY+B7KmwQNAnK3He+?=
 =?us-ascii?Q?jl0QdRI1p3jWZsjJ0lYP+HwyKeNianu3ybRpcMlK3NGiQJD1lk1HEbPUhAtc?=
 =?us-ascii?Q?KUtGj/wAU26fe0oQfKndqTFx+9LnzxvocCEfSkxIkFzbJzBcdJ/6Zuvc3bO/?=
 =?us-ascii?Q?sY6X6a8f69cFpIxbVfloentKQ83JRy5E20l1oGctRuF6cXOjT/xCgzZ5bREh?=
 =?us-ascii?Q?Jnzee7ukI1qx22UwztOVzlGVEBIfHBy+yzDAvtVkkLTnT91D7pa66zgYPtq/?=
 =?us-ascii?Q?k5Y+oFzybms8zp3R1k6n9h8ix6xdnhmcTJw7oY/TlUv7zsWtANiT8KweTbqu?=
 =?us-ascii?Q?UDOh1oZvo5q3L8SLAIqJ31+fkG8xQnjwZdtKOK4cGwoHblWODXathuhQwMLU?=
 =?us-ascii?Q?64jqxRszL8HMBdAzvdoGQDjslJlstswgKykeyADPlY2U9g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KtKYEQgKDmb8gdSRG2GbbLlOtHMbYIE0zg7vg2ss/GBLvXBRuZaEQrJejvg1?=
 =?us-ascii?Q?s2dm9pgkB9a60Whio25wxYCy9CtioQ+4ppOAPraMVQe3+cIJ44DhSNCwIc6T?=
 =?us-ascii?Q?YOciLUIFipTsHC8vqx13ozka/0GIIejCHpciVYDccEVZgm+cyeda9HcTpvD4?=
 =?us-ascii?Q?gWGxPvLcjNW/eQoFZNpqRj6v+TAJfGpantn/ujuDgzKEun7R/5kSNbnrMnA2?=
 =?us-ascii?Q?VHCAnLBvUTLKz9Jr0tRYSV0/n06GGOr4rv/E6Dq6Mj2R1exEYvmJeL7k/1sE?=
 =?us-ascii?Q?nVlkezCTwmJe9H8wlZuEBqPWNQ1eEbMD5eYFo5lZTOqozSbwGh8XjIyeYeS9?=
 =?us-ascii?Q?p9yauAPoMbQCxI6WexEiP38rm8rgppRKwVSump2P40PghEd4Aj+0zds0hf97?=
 =?us-ascii?Q?f+huV3wMAl4gavZtFsgMv+FJ7TVnmAdpyEEBT9KEy7/tpxefE4Qa3VzRNYPb?=
 =?us-ascii?Q?4cD1ejbGJmPIue5Jyzp44TF6H75y2FHCOhe29QLp5C+KcZ9NIF/ChebWR6S/?=
 =?us-ascii?Q?vnh2xErlQV1CO/O+mUUPFG5BZ1rSs7pyum1lfndTdwaX7lK9/2XtYbgqg2I7?=
 =?us-ascii?Q?Ow+fxn8F5FKzaNGcBhdq14kaCtAsbRmmqUbICVcCohQXbumag8DxvrAFmODl?=
 =?us-ascii?Q?XBFnjjAzGipoKkaaX7CX38wacoJulga/zsfVIig/IE2gpR0/LfvQbPGsQRgk?=
 =?us-ascii?Q?lTTUPkQPQdnBaYmQDDYraY/LQQqwvVvN1TMUZt9m9NqY6UqQR/H4IX/celsB?=
 =?us-ascii?Q?HHpaGYwn9am+EHYuj0u4Q4bJTj2OkAWlHR7coqO2KAlx5a6rCtwrzadHzmoy?=
 =?us-ascii?Q?N0pyzB39nQX7CCD5dWmX26W+X2ctMCSWMnhLZ8nwQWeLZ1EU7WaDh0cBciq0?=
 =?us-ascii?Q?7v80z8A9qR7l4ut+hVVjDGgMbxlUR5b38F8zI3X8wt0WlL+21QBOiOJuJOiD?=
 =?us-ascii?Q?AL7+vGB6WdoSNZ4xPuwUcHz8pBTmZBdxNPTPsOjSQv4aGvyGCzzwDFn26Fhw?=
 =?us-ascii?Q?tK3lAgE8JoV5N8FvtKkPRlleD5CES3K4O9TsG2JQ4Znezt1LliGpZXdBLWID?=
 =?us-ascii?Q?aU+FJHmwi78K00z7ojl3FUtsudOQP5ZpYcY9MiiNRtXW2EI70p7TSSxGDt47?=
 =?us-ascii?Q?S2YPJJkQj81WnW9A/VVko3Knjr9LXrzhw3pu/Sng+jPZNnQ3pyF/HY5SKQ2+?=
 =?us-ascii?Q?XRT89+5Gq3k7sXYAdsw8fI6+ccAkxtYlazbmxvtkjORlHjUkFEq3s9GLBjWx?=
 =?us-ascii?Q?iXze30WDXAapnlITCXuZylfKe9VkWYI7OH/13wZAiJAHXetbWE4i7eCvZ6nF?=
 =?us-ascii?Q?5vwtCj21i/PecnzxDmLgzoggZUL7FLvXLQHusXzR1aZM8es9N+rsXk//DKRl?=
 =?us-ascii?Q?qDk6B+2ag9Rk9Xx+/93kj3XoXacWJWX2ecAZkHNnNVBTeNTQ+kQwJecjicql?=
 =?us-ascii?Q?usWYVDles9AjWNM14S4WS6+pHC3U588m347Tb3mXQGE/mCx1E/prNnieKbnn?=
 =?us-ascii?Q?4XBboWwwLz7v2/pm1hqBDAYd17flhNno8iS1aTY7rnUhQPl3DZT6T8jvpATr?=
 =?us-ascii?Q?d2C1SXqN81rjeovE3Jw0KfPppjDfbES/qJ6MldZASY6SMfGT+ipJY6OUKMa8?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d508646e-d351-408c-01dd-08dd46bda7fe
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 14:50:53.9405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CQaLrO+H3GpooYwjGH7rL0fb+wwpbveFzo3CKYhwjZLZy/N9WEWz91AQjr7wHTXQhuRMZ6ifs2FJSqWgR55p0RpSTZB0hUcYcU8Qo8VMFoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4957
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

On Tue, Feb 04, 2025 at 07:07:43PM -0800, Lucas De Marchi wrote:
>When testing i915, if there's another driver present, unloading i915 may
>cause the other driver to unload and let developers chasing ghosts when
>they think it was caused by i915.
>
>Hopefully fix the ATSM testing where AST driver is also bound to a
>a device.
>
>Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13292
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
>
>After this change, running i915_module_load@reload doesn't cause ast to
>be unloaded, but I couldn't check it really fixes the issue since I
>couldn't reproduce it.
>
> lib/igt_kmod.c | 7 -------
> 1 file changed, 7 deletions(-)
>
>diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>index d154701c6..524c1a632 100644
>--- a/lib/igt_kmod.c
>+++ b/lib/igt_kmod.c
>@@ -690,7 +690,6 @@ int igt_kmod_unbind(const char *mod_name)
>  * igt_intel_driver_unload:
>  *
>  * Unloads an Intel driver and its dependencies.
>- *
>  */
> int
> igt_intel_driver_unload(const char *driver)
>@@ -709,12 +708,6 @@ igt_intel_driver_unload(const char *driver)
> 	}
> 	free(who);
>
>-	if (igt_kmod_is_loaded("intel-gtt"))
>-		igt_kmod_unload("intel-gtt");
>-
>-	igt_kmod_unload("drm_kms_helper");
>-	igt_kmod_unload("drm");

another thing worth noting:  both intel-gtt and drm are built-in in our
CI builds, both for xe and i915. So those calls are actually moot.

The one that makes a difference is actually drm_kms_helper. That is
built as a module:

$ curl https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16075/kconfig.txt > /tmp/kconfig.txt
$ grep -e CONFIG_INTEL_GTT= -e CONFIG_DRM= -e CONFIG_DRM_KMS_HELPER= /tmp/kconfig.txt
CONFIG_INTEL_GTT=y
CONFIG_DRM=y
CONFIG_DRM_KMS_HELPER=m

Lucas De Marchi

>-
> 	if (igt_kmod_is_loaded(driver)) {
> 		igt_warn("%s.ko still loaded!\n", driver);
> 		return -EBUSY;
>-- 
>2.48.1
>
