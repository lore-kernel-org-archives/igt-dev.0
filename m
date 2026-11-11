Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAE0606A321
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 18:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y6Diejgm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C8210E0E1;
	Wed, 11 Nov 2026 18:48:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CFB10E3B9
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 18:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794422863; x=1825958863;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QwhCC5vjPf7icht35oPG3zkxh4xop4ZuJcSuPTZddCY=;
 b=Y6DiejgmHRrOzJjhvBzjKK+IKpWfp/6PBlZEDEy7WRcvKy0WLVO64uTa
 Qp7cwvGCgW39gLP8kYqlQsrAjSTAo77ksmXpVTiSKzbQngAW2AacmYPEH
 xTCGljbtgOhvd0KUkbTIfFElPE+eOqek/9Qfv52QxoizBoj8XgNh9GjPh
 rBw6qmdcLNf8YkLbR5nw9AM1//PbdfUqcVbQxUpVB4FRGfnmL/3YZUBN1
 mPSWpic/SeGl6OQ1WGGlOJvcYZ/Qm7j0y5IEPvKd5ZBFhFYidghYkjS9S
 490290UFewF6NTp943+2+suH1X6re706Ap5dGBJHN4jgbfh1LUiq9zvuI g==;
X-CSE-ConnectionGUID: hi3nhG6JTZ6N8i0zUnOyYA==
X-CSE-MsgGUID: hK/CcJV9QAqQuc7TYpwn2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3121163"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3121163"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 10:47:42 -0800
X-CSE-ConnectionGUID: +3XudBw7TTGZ1olGZnkOzQ==
X-CSE-MsgGUID: 43dlHhE6QeWIq0ZB1CZD7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8335931"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 10:47:42 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 10:47:41 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 10:47:41 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 10:47:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OeBoF2q/5xkjtYh9Is3o3oEy6xzUkUvGKzLKBTtapErbxRKJkYJ51rMFqEf5oyB8cNhAHlA7Va7DG6ZHL6XvMy7u1X/Jf5C7TVNS+UNA0N6uJcZzFfsvGmnPbdkIETvIrcdw8pKGZYapp/407tyefusH/PMvflSsA1NtVK5tfAgY4AZIQy76zRs6wOgbPLOg/6kLHVtto3riSsiTax83hCdp4PAxv76RnIEvQq2wHD1rkzaBzX4hMJ9B436p7cR/G6z0sTiB++u8timhNFKTcoVyqMUMfsnosfP2NxJblZvxlUhkrFFFQZN8EGqdxUsAcKhkdS2/uQlijdvpg8Q7Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWX1Z+SukIrTguCO99nacWKPSf8Tnxc9WJeFe6TRb4Y=;
 b=l96jkMoBfJXdfZlRXFKx/nr1BcM6V5kJRKjJTB+CagxpMSe6743rAMOxe9ZSTN5gWditKGmYuuj5XsafXlm2NNaM4vXPu1ludfq0m7IqlrRz7QPGusayMn7yINBeUV7cXcEehzhpUNOF+5aY8jEtfk9vW3nyVh4oqd/+jOhmzDe0mD1YMuvfGe6wd82LNl+8PAO7gzDEbgOmHic6mEQq2X0rm2P3Zu4iubyH6gz1lLMqg8FUNPDZBDrs98EId1WxuMe6ReCBOnkhN8tgIeAuRfFmjEPb8Zz8XZhr8rjHM9pudgZTFx8uOe7Oed9Q3oxK+aC46kPJk3uvYOkShT6yhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH3PPF4EB9556A6.namprd11.prod.outlook.com (2603:10b6:518:1::d1f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 18:45:37 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 18:45:36 +0000
Date: Wed, 11 Nov 2026 13:45:27 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>, <ravi.kishore.koppuravuri@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_pm: Validate root-port D3cold entry
 on system suspend
Message-ID: <avS3gcuObbGGHPbT@intel.com>
References: <20261102095802.3419285-1-karthik.poosa@intel.com>
 <20261102095802.3419285-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261102095802.3419285-2-karthik.poosa@intel.com>
X-ClientProxiedBy: BY3PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:217::26) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|PH3PPF4EB9556A6:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f8c8a73-a0c1-480a-d5ce-08df4023f8e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|261009223027099003|3023799007|261022105027099003|261022075727099003|261021121427099003|261021123027099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|56012099006|10067099003|11063799006|4143699003|5023799004;
X-Microsoft-Antispam-Message-Info: RKOwvxl1c/vUETKjri7ZTkCMRy+I8zf56YwRkLxGYG5j946pQMo3h8DaucMDfkk7tCRhDpNsHHvMGKxg2Y4KCrqiFJ5kNakn1/nHEqa6+lWRo+pATyiyz9N3vYPj8TIbLb5X/JqoaCPMH2+wHIgGW7k+FMQTy2D/wFUuD6+XUHWEl0ASAhMQTToG+yV55b1S9gAfR7SUQKz2DyqIPzVmQS0QXtlBL1ohxJwqAr/pXBrfRQSIicCBBGiRPLx7ms4dZnc5NolFsbDLXcK7J/MJnBTi8RalQuacC24hAwqoKRzp9+8RMS/gF3tgVH66+0VsYhe2QihcmUF1JiwSg0ILT8g17b4NDw2ILDIXegpxXh6pv2v42ZUlBSfC0ukxRVIjkMUWg4/1zFhNQZgjRScWHScjikd2VeDJPk6ePWBOFW6xWhI447XH+ZmspP+HsEANDeoUl4Lqeff3V5cJDVWLeIQsYx6iIQz0FBzqooIV838tI5vuYi/KEkkGtcgnO2WpGulRVy+u+lAqFqgGlF9Zx3LwtGMvKApwMXjdJ+uyxtf0o+7tDke+fR+RcpAfjWGRFAJJYjZmRclZiql4Ny0+vgX508DKoOn6qT5bIStYYNlCwbRyBdLZ90xQlshhiqs133Js+VmvH2juzW7m0RqP0IlVu3E7O6+cPDma7p0acL0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(261009223027099003)(3023799007)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(56012099006)(10067099003)(11063799006)(4143699003)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+N/bot/RiY8pEtpF+Rn41/pfSJ3YxF+L7+Y5zW4Q6p1zQ39r1QhYvTz9T4TI?=
 =?us-ascii?Q?/Ey2O+nhc+TGLLXWp6Es1mKn0hiA8f9NZBdbBMWSRc394tm3IRxDtUol+VOB?=
 =?us-ascii?Q?vdi3F32NQWP1uQdyCst+EzG6UD+eTBQ62YApzZ51yJjgtIpXl4qaEO+0RIcB?=
 =?us-ascii?Q?nc52Pu5IBMD9NOUmuuNtTyjNBaknOB375Mi67PB0YLZhwtKARj2G0SHMPre/?=
 =?us-ascii?Q?6Xol5S4PXIwfKNRmHPKXGXu3jek5U/sf2Xjr3Q7wW5PJbc/6MgVZvil1nhNK?=
 =?us-ascii?Q?AJznRh2WrpS95DGvMYMrfYVdt9LjN0VOW5OEKH2z8CDWcvAr6aJsT6vWTrj5?=
 =?us-ascii?Q?i1I10hxNOFw4cVBKT4r2MgBZzpmiKUtZW4xbCwam89QItjixXcos7ulAZ7Hn?=
 =?us-ascii?Q?eAVzVEX5n718prgBat0s1PjTQQPBBFdwhdLRegiGWGJUJQ0BVNfPSLMq2jn0?=
 =?us-ascii?Q?CFPZuPKZbboGpeMRuPGBV2qpk8xZ2vyjJI2npOeBhsSe695xaOWL6XfZ0ED0?=
 =?us-ascii?Q?XNWK0u8XfTRIyvTZ63bvGdiBqFUwGJD7zgBeC4px9LUGfQznD9OZZj9+AnmX?=
 =?us-ascii?Q?5qmAPr65MagaUmRDIDvKOgTd8XlNCtTOlTPAOUTwP7qDkMWd/UxBkLyhBIv0?=
 =?us-ascii?Q?s0X97CIro/F2xkazFy093NsOi8ABWmh8vLHk/5SogzTXEu2XMurJCmBSbG80?=
 =?us-ascii?Q?DqLz6xFHGcEqlFYTM9nDnthFdeR0jd5nSyUFds/EBOIV4WrwO9TEDNiyNmxR?=
 =?us-ascii?Q?9uQ7qXudOwIUhqEkGLdD2DhDrAgiyYirwKf4Br2RlGOTnrOkV/Zjgt/b/wW5?=
 =?us-ascii?Q?HSV2/ucxEx+973rT72GcMPlG+f6LRZ/JQeVVeSR+YXH73fOASdWEa+JfnA87?=
 =?us-ascii?Q?JtzrbGvU4geqjGcel9sOPFfs+YEtD/hFMsYoPFTOgqOfs1kpP3c1E9kcmtqN?=
 =?us-ascii?Q?di2yvW3eqz8KttbHGZN0Rz0REKJRg2U3N/dVuSghvXHf06zSTpDj9ZuHkyZ4?=
 =?us-ascii?Q?CKMLgnssCoxpG562BfrtyTaa7WBy5Q5Km9P13dybHAbY4EHOP41CGXl2rby0?=
 =?us-ascii?Q?t6ffcdlARcujijrzyZOa8W2QG1WcRIEk2W3/PSvjyckMGfltLGR+pobL4C1/?=
 =?us-ascii?Q?FLQl4tIh8gHXjINg+iqsqQZ5N7HdHbAMAGkKdB6SE087vx6INt+Rz3b6qi1v?=
 =?us-ascii?Q?Xn5Rvm9oOhYCrBsNhzZKqnClFXcDqBBBS+Eak9tPPLeji+zRScuhNbKPYdpN?=
 =?us-ascii?Q?MKgrv9bU/eSIa2YLLJVp209b5rniHrShDjWjDp8OcKcqGfJj8PoTzRvAy9ab?=
 =?us-ascii?Q?S46Bi5pDffau/JnlmEnr9KkUt3qWZ1mt8JIYZDWnjgdXuTKILf8N5GMZhmht?=
 =?us-ascii?Q?dKO9RTT9hLlfjXA4kyX/YwBnDSd8ndr1xqG5oFejvhQwWWhzGamsx7C9K9g6?=
 =?us-ascii?Q?DaxYJ/ABDUg/CGUn3bFgvURXyAPE8j6+jIbAdDSX41fnmo/8/BMXHSc1LT/+?=
 =?us-ascii?Q?54SH/5WQijP7HtAfzH/FQ9oGT2j8j066JUgoS5xbxgoyHCkAvChvp06r8VM2?=
 =?us-ascii?Q?nrgj0nPA7Txw7mrixQqqxVU6EGq5YSQw4OKHd3AgD7UD4qO0qxeNxwFLhXLF?=
 =?us-ascii?Q?dyH8GjoM4aECUjh+EqtzyAkdtAZvMfPAPOz8MpH/3il9Puv+7WHvVa404dnt?=
 =?us-ascii?Q?3ot554o89JnGnezpEF6hagwNFwCAxWDnvBpn7uXIq44C9wfR0T+2wVEeIDmo?=
 =?us-ascii?Q?lo/vwSs5zw=3D=3D?=
X-Exchange-RoutingPolicyChecked: xHwL5tYLCHvRym5A4el3g2MdDCgZYpsoEwBZOhLLk3/LmyRkmGtZlvJlmbkf7gJD46exwqrLdX7Ndr/MdnfyxhJ7TyMglWjgWCgV1yq87GAuKyR216g0Bj6/r8mtq5aaIZog6j/ZyTjdb/6fImEgkMvYIzOppYOrDhLQVhNsnEuULA91zSwGkjRuXHgNO3Hs/0gCbqMeMbP4g+rYOAATytsT3kzhJAlkU3wxu+i6k9ISU62KL9bQtHO3TChLjWmtbFgd/Sen6zeOkXJPP3azgvJ1j5NLPLkgCYUNElZ2Ina2ralgeR8I8/l5Akdy0x+mP4WI5E8ITwKrHPGcZdwG+A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8c8a73-a0c1-480a-d5ce-08df4023f8e7
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 18:45:35.9080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uOWJ0AeqW6RoimaFKNO53qV+A9/c5KsGUSF7BO/c1IxHs9/Ja5NBFJjzmk/sXVzJz/LapM15y9nPAaEPv3G34g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF4EB9556A6
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 03:28:02PM +0530, Karthik Poosa wrote:
> When D3cold is supported and allowed, check the root port's ACPI
> transition log across system suspend and resume for a D0 -> D3cold
> transition. Skip the transition assertion if the root port is already
> in D3cold at suspend entry.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Assisted-by: LLM
> ---
>  tests/intel/xe_pm.c | 234 +++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 221 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 543f46f5b..2eb70a383 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -12,8 +12,10 @@
>   */
>  
>  #include <dirent.h>
> +#include <errno.h>
>  #include <limits.h>
>  #include <fcntl.h>
> +#include <stdio.h>
>  #include <string.h>
>  #include <sys/ioctl.h>
>  
> @@ -63,6 +65,9 @@ typedef struct {
>  
>  uint64_t orig_threshold;
>  int fw_handle = -1;
> +static int fd_kmsg = -1;
> +static char d3cold_kmsg_entry[512];
> +static bool acpi_d3cold_debug_enabled_by_test;
>  
>  static pthread_mutex_t suspend_lock = PTHREAD_MUTEX_INITIALIZER;
>  static pthread_cond_t suspend_cond = PTHREAD_COND_INITIALIZER;
> @@ -192,6 +197,120 @@ static void cleanup_d3(device_t device)
>  	dpms_on_off(device, DRM_MODE_DPMS_ON);
>  }
>  
> +static int count_kmsg_entries(int kmsg, const char *entry)
> +{
> +	char buf[4096];
> +	char *kmsg_entry, *p;
> +	const unsigned char *src;
> +	size_t entry_len = strlen(entry);
> +	int count = 0;
> +	ssize_t len;
> +
> +	igt_assert(entry_len <= (SIZE_MAX - 1) / 4);
> +	kmsg_entry = malloc(4 * entry_len + 1);
> +	igt_assert(kmsg_entry);
> +
> +	/* Match /dev/kmsg's escaping of backslashes and non-printable bytes. */
> +	for (src = (const unsigned char *)entry, p = kmsg_entry; *src; src++) {
> +		if (*src < ' ' || *src >= 127 || *src == '\\')
> +			p += sprintf(p, "\\x%02x", (unsigned int)*src);
> +		else
> +			*p++ = *src;
> +	}
> +	*p = '\0';
> +
> +	errno = 0;
> +	while ((len = read(kmsg, buf, sizeof(buf) - 1)) > 0) {
> +		buf[len] = '\0';
> +		if (strstr(buf, kmsg_entry)) {
> +			igt_debug("Found dmesg entry: %s\n", buf);
> +			count++;
> +		}
> +	}
> +
> +	free(kmsg_entry);
> +
> +	if (len == 0)
> +		return count;
> +
> +	igt_assert_f(len == -1 && (errno == EAGAIN || errno == EWOULDBLOCK),
> +		     "Unexpected /dev/kmsg read result len=%zd errno=%d\n", len, errno);
> +
> +	return count;
> +}
> +
> +static void build_rp_d3cold_kmsg_str(struct pci_device *pci_root, char *buf, size_t len)
> +{
> +	char path[PATH_MAX], fw_path[256];
> +	ssize_t n;
> +	int fd;
> +
> +	snprintf(path, sizeof(path),
> +		 "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/firmware_node/path",
> +		 pci_root->domain, pci_root->bus, pci_root->dev, pci_root->func);
> +
> +	fd = open(path, O_RDONLY);
> +	igt_require_fd(fd);
> +	n = read(fd, fw_path, sizeof(fw_path) - 1);
> +	igt_assert_lte(0, (int)n);
> +	fw_path[n] = '\0';
> +	if (n > 0 && fw_path[n - 1] == '\n')
> +		fw_path[n - 1] = '\0';
> +	close(fd);
> +
> +	snprintf(buf, len, "%s: PM: Power state change: D0 -> D3cold", fw_path);

I'm a bit confused by this message and the order, but I will trust
more your tests...

> +}
> +
> +#define ACPI_DYNDDBG_CONTROL "/sys/kernel/debug/dynamic_debug/control"
> +#define ACPI_D3COLD_DYNDDBG_QUERY \
> +	"file drivers/acpi/device_pm.c format \"Power state change: %s -> %s\""
> +
> +static bool acpi_d3cold_debug_is_enabled(void)
> +{
> +	char line[1024];
> +	FILE *fp;
> +	bool enabled = false;
> +
> +	fp = fopen(ACPI_DYNDDBG_CONTROL, "r");
> +	if (!fp)
> +		return false;
> +
> +	while (fgets(line, sizeof(line), fp)) {
> +		char *message = strstr(line, "Power state change: %s -> %s");
> +		char *flags = strchr(line, '=');
> +
> +		if (message && flags && flags < message && memchr(flags, 'p', message - flags)) {
> +			enabled = true;
> +			break;
> +		}
> +	}
> +
> +	fclose(fp);
> +	return enabled;
> +}
> +
> +static bool set_acpi_d3cold_debug(bool enable)
> +{
> +	FILE *fp;
> +	int ret;
> +
> +	fp = fopen(ACPI_DYNDDBG_CONTROL, "w");
> +	if (!fp)
> +		return false;
> +
> +	ret = fprintf(fp, "%s %sp\n", ACPI_D3COLD_DYNDDBG_QUERY, enable ? "+" : "-");
> +	if (fclose(fp))
> +		return false;
> +
> +	return ret > 0;
> +}
> +
> +static void restore_acpi_d3cold_debug(int sig)
> +{
> +	if (acpi_d3cold_debug_enabled_by_test)
> +		set_acpi_d3cold_debug(false);
> +}
> +
>  static bool in_d3(device_t device, enum igt_acpi_d_state state)
>  {
>  	uint16_t val;
> @@ -228,6 +347,85 @@ static void close_fw_handle(int sig)
>  	close(fw_handle);
>  }
>  
> +static void close_d3cold_kmsg_handle(int sig)
> +{
> +	if (fd_kmsg < 0)
> +		return;
> +
> +	close(fd_kmsg);
> +	fd_kmsg = -1;
> +}
> +
> +static void start_d3cold_kmsg_logging(void)
> +{
> +	igt_require_fd(fd_kmsg);
> +	igt_assert_neq(lseek(fd_kmsg, 0, SEEK_END), -1);
> +}
> +
> +static void check_d3cold_kmsg_count(void)
> +{
> +	int count;
> +
> +	igt_require_fd(fd_kmsg);
> +	count = count_kmsg_entries(fd_kmsg, d3cold_kmsg_entry);
> +	igt_info("Root port D3cold entry count=%d\n", count);
> +	igt_assert_f(count > 0,
> +		     "No root port D3cold entry detected during system suspend\n");
> +}
> +
> +static bool d3cold_validation_enabled(device_t device)
> +{
> +	uint32_t d3cold_allowed;
> +
> +	if (!igt_pm_acpi_d3cold_supported(device.pci_root))
> +		return false;
> +
> +	igt_pm_get_d3cold_allowed(device.pci_slot_name, &d3cold_allowed);
> +
> +	return d3cold_allowed;
> +}
> +
> +static void prepare_d3cold_kmsg(device_t device)
> +{
> +	igt_require_f(d3cold_validation_enabled(device),
> +		      "D3Cold validation requires a D3Cold-capable root port and d3cold_allowed=1\n");
> +
> +	if (fd_kmsg < 0) {
> +		build_rp_d3cold_kmsg_str(device.pci_root, d3cold_kmsg_entry,
> +					 sizeof(d3cold_kmsg_entry));
> +		fd_kmsg = open("/dev/kmsg", O_RDONLY | O_NONBLOCK);
> +		igt_require_fd(fd_kmsg);
> +	}
> +
> +	if (!acpi_d3cold_debug_is_enabled()) {
> +		igt_require_f(set_acpi_d3cold_debug(true),
> +			      "ACPI D3Cold dynamic debug is unavailable\n");
> +		acpi_d3cold_debug_enabled_by_test = true;
> +		igt_require_f(acpi_d3cold_debug_is_enabled(),
> +			      "Failed to enable ACPI D3Cold dynamic debug\n");
> +	}
> +}
> +
> +static void suspend_check_d3cold(device_t device, enum igt_suspend_state s_state,
> +				 enum igt_suspend_test test)
> +{
> +	igt_require_f(d3cold_validation_enabled(device),
> +		      "D3Cold validation requires a D3Cold-capable root port and d3cold_allowed=1\n");

This makes all the generic suspend subtests skip on machines without d3cold.
Please ensure this is only called or checked in d3cold related tests

> +
> +	if (igt_pm_get_acpi_real_d_state(device.pci_root) == IGT_ACPI_D3Cold) {
> +		igt_info("Root port already in D3cold at suspend entry; skip transition check\n");
> +		igt_system_suspend_autoresume(s_state, test);
> +		return;
> +	}
> +
> +	prepare_d3cold_kmsg(device);
> +
> +	/* Seek to end before suspend so only new messages are scanned */
> +	start_d3cold_kmsg_logging();
> +	igt_system_suspend_autoresume(s_state, test);
> +	check_d3cold_kmsg_count();
> +}
> +
>  #define MAX_VMAS 2
>  
>  static void*
> @@ -578,7 +776,7 @@ child_exec(void *arguments)
>  static void
>  test_exec(device_t device, int n_exec_queues, int n_execs,
>  		  enum igt_suspend_state s_state, enum igt_acpi_d_state d_state,
> -		  unsigned int flags)
> +		  unsigned int flags, bool validate_d3cold)
>  {
>  	enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
>  				     SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
> @@ -587,6 +785,10 @@ test_exec(device_t device, int n_exec_queues, int n_execs,
>  	pthread_t threads[65]; /* MAX_ENGINES + 1 */
>  	child_exec_args args;
>  
> +	if (validate_d3cold && n_execs > 1 && s_state != NO_SUSPEND) {
> +		prepare_d3cold_kmsg(device);
> +	}
> +
>  	xe_for_each_engine(device.fd_xe, eci) {
>  		args.device = device;
>  		args.eci = eci;
> @@ -607,7 +809,10 @@ test_exec(device_t device, int n_exec_queues, int n_execs,
>  	}
>  
>  	if (n_execs > 1 && s_state != NO_SUSPEND) {
> -		igt_system_suspend_autoresume(s_state, test);
> +		if (validate_d3cold)
> +			suspend_check_d3cold(device, s_state, test);
> +		else
> +			igt_system_suspend_autoresume(s_state, test);
>  
>  		pthread_mutex_lock(&suspend_lock);
>  		pthread_cond_broadcast(&suspend_cond);
> @@ -845,7 +1050,7 @@ static void test_mocs_suspend_resume(device_t device, enum igt_suspend_state s_s
>  				enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
>  					SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
>  
> -				igt_system_suspend_autoresume(s_state, test);
> +				suspend_check_d3cold(device, s_state, test);
>  			}
>  		}
>  		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
> @@ -981,7 +1186,7 @@ int igt_main()
>  		igt_device_get_pci_slot_name(device.fd_xe, device.pci_slot_name);
>  
>  		/* Always perform initial once-basic exec checking for health */
> -		test_exec(device, 1, 1, NO_SUSPEND, NO_RPM, 0);
> +		test_exec(device, 1, 1, NO_SUSPEND, NO_RPM, 0, false);
>  
>  		igt_pm_get_d3cold_allowed(device.pci_slot_name, &d3cold_allowed);
>  		has_runtime_pm = igt_setup_runtime_pm(device.fd_xe);
> @@ -989,6 +1194,8 @@ int igt_main()
>  		device.res = drmModeGetResources(device.fd_xe);
>  
>  		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
> +		igt_install_exit_handler(close_d3cold_kmsg_handle);
> +		igt_install_exit_handler(restore_acpi_d3cold_debug);
>  		update_debug_mask_if_ci(DRM_UT_KMS);
>  		errno = 0;
>  	}
> @@ -997,28 +1204,28 @@ int igt_main()
>  		igt_subtest_f("%s-basic", s->name) {
>  			enum igt_suspend_test test = s->state == SUSPEND_STATE_DISK ?
>  				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
> -			igt_system_suspend_autoresume(s->state, test);
> +			suspend_check_d3cold(device, s->state, test);

s4 shouldn't check for d3cold... I believe not even s3... so, let's limit
the scope of this test

>  		}
>  
>  		igt_subtest_f("%s-basic-exec", s->name) {
> -			test_exec(device, 1, 2, s->state, NO_RPM, 0);
> +			test_exec(device, 1, 2, s->state, NO_RPM, 0, true);
>  		}
>  
>  		igt_subtest_f("%s-exec-after", s->name) {
>  			enum igt_suspend_test test = s->state == SUSPEND_STATE_DISK ?
>  				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
>  
> -			igt_system_suspend_autoresume(s->state, test);
> -			test_exec(device, 1, 2, NO_SUSPEND, NO_RPM, 0);
> +			suspend_check_d3cold(device, s->state, test);
> +			test_exec(device, 1, 2, NO_SUSPEND, NO_RPM, 0, false);
>  		}
>  
>  		igt_subtest_f("%s-multiple-execs", s->name) {
> -			test_exec(device, 16, 32, s->state, NO_RPM, 0);
> +			test_exec(device, 16, 32, s->state, NO_RPM, 0, true);
>  		}
>  
>  		for (const struct vm_op *op = vm_op; op->name; op++) {
>  			igt_subtest_f("%s-vm-bind-%s", s->name, op->name) {
> -				test_exec(device, 16, 32, s->state, NO_RPM, op->flags);
> +				test_exec(device, 16, 32, s->state, NO_RPM, op->flags, true);
>  			}
>  		}
>  
> @@ -1026,7 +1233,8 @@ int igt_main()
>  			igt_subtest_f("%s-%s-basic-exec", s->name, d->name) {
>  				igt_require_f(has_runtime_pm, "Runtime PM not available\n");
>  				igt_assert(setup_d3(device, d->state));
> -				test_exec(device, 1, 2, s->state, NO_RPM, 0);
> +				test_exec(device, 1, 2, s->state, NO_RPM, 0,
> +					  d->state == IGT_ACPI_D3Cold);
>  				cleanup_d3(device);
>  			}
>  		}
> @@ -1050,7 +1258,7 @@ int igt_main()
>  		igt_subtest_f("%s-basic-exec", d->name) {
>  			igt_require_f(has_runtime_pm, "Runtime PM not available\n");
>  			igt_assert(setup_d3(device, d->state));
> -			test_exec(device, 1, 1, NO_SUSPEND, d->state, 0);
> +			test_exec(device, 1, 1, NO_SUSPEND, d->state, 0, false);
>  			cleanup_d3(device);
>  		}
>  
> @@ -1065,7 +1273,7 @@ int igt_main()
>  		igt_subtest_f("%s-multiple-execs", d->name) {
>  			igt_require_f(has_runtime_pm, "Runtime PM not available\n");
>  			igt_assert(setup_d3(device, d->state));
> -			test_exec(device, 16, 32, NO_SUSPEND, d->state, 0);
> +			test_exec(device, 16, 32, NO_SUSPEND, d->state, 0, false);
>  			cleanup_d3(device);
>  		}
>  
> -- 
> 2.25.1
> 
