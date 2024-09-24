Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EC0CF9C6B
	for <igt-dev@archiver.kernel.org>; Tue, 24 Sep 2024 14:08:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7536A10E6F6;
	Tue, 24 Sep 2024 14:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aCUzqMvK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3464810E6F6
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Sep 2024 14:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727186890; x=1758722890;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ph+ZTYKswRMc0kF8RYjkw1uc89fVq04NW/UXasrCfZY=;
 b=aCUzqMvKcu21HLMyWBsWQrauinn1sXGg6vpMcH+fT6QZPVapswjGlAGU
 8fx7lQkwlLA5P9uNjdJMIe9dIOBZfHi08RJc5nygEZYCVRP4rqAmeiGAe
 /FfsSbybyOrd7SxO8eY1bjgxlByz8QILz3ujR3fMz5d3c3D1B6aq6t8af
 FTDjK5Sa8Ri4a6oNADI4b9+0dEgQzZoP90vz51cQCjUmIA6tWWK+8dPKB
 CUoHJVHnCmIMBfiz+/XjMd77YYX2oI2KA/Evl+t2a84WtTBU6mibBAatF
 YAcOnIcUTh3MvhYIEQndjlFQVV+IsxtVZBbNYeKUCpE0IZCnQ2WMOARa7 A==;
X-CSE-ConnectionGUID: XojJOEjJSW+vxNvqEXJ64w==
X-CSE-MsgGUID: 6TxeqerqQA+DnsjuPQggWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26057709"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="26057709"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 07:08:08 -0700
X-CSE-ConnectionGUID: a0OwLPmdR3eZJIEcA9KBYw==
X-CSE-MsgGUID: uHbglUCjSgur6gTzuQUBdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="71719930"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Sep 2024 07:08:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 07:08:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 24 Sep 2024 07:08:06 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 24 Sep 2024 07:08:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0TE3uFpGkfLFjbTd3sHB9Tfa2L71jXnOOGYZFx+Br77w2WuK7dLHlkFfPNEvNgjvnCFJXnFumsRq9R/FHAN0OMSZS/xbthcjuLXvDuy8TWI12P5GiT4JLLxaBXQofwmATxUDPgU3K0+l8bF+Lz04xijc0kW+ddTs1/ExPBFsJY5v5jRTi6yRX+1Gis1zukSnjHLQnxIsEApDPL39s6PxAGLsKjeluo18bJMRRNqRs0DBgTWbn+ijvcickVPxElhqf0fwWTzXnlrZ45QX8Dk5N2UVDHpNQcIl29jCbV5IE6n1TjHRG2MNJ60XU0iRERBObUEe9kA9OzTH7iDm2E68Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckQQTI6BTIt2owdnd4pHaYogileXfLouj5Xa8RHV3bE=;
 b=xvy3IRyiWlvDwoBkaKiIwkU9Y1vMkGbP0W0POmiDcEk/A0trqI2cu2U0GBHaRHipMXfqrZg6iNam0nq51uyv6P7t06RlqIP6IpmEoPRae5BfDrGqbgxytrpQ39hNHU6GPlVNjE4wv6YdRzVRZOiO4SbaLMIuKSQMtZFAJfT9jyY2OB2O62dzM8mj0rQIitSSzOFKjpzkJJSs1/xiS1A3ok2cz/F1g4WDZHKH+AipsQfeBkqe6BP4XP7WWbxGKJ0vYUPjvhLgnrR43KP/WeptCjvuE3I3WcRLuIZrsoBJqKeX1ARoUW2So7zPrbE7sJn7cxPQKC3r4EsbQyYQ+L9UIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB6621.namprd11.prod.outlook.com (2603:10b6:a03:477::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.23; Tue, 24 Sep
 2024 14:08:04 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 14:08:04 +0000
Date: Tue, 24 Sep 2024 09:08:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 5/5] lib/igt_gt: Stop passing fd == -1 in
 igt_open_forcewake_handle()
Message-ID: <mn26pszojoeuqka6cfhc7k3f6dl3xhlqibuvfuvwroxibthj2d@3r6l6xpnesun>
References: <20240923221146.125848-1-lucas.demarchi@intel.com>
 <20240923221146.125848-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240923221146.125848-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0197.namprd03.prod.outlook.com
 (2603:10b6:303:b8::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB6621:EE_
X-MS-Office365-Filtering-Correlation-Id: 072581d4-dfc9-40e3-0f9f-08dcdca24e88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j2PO358wrFO9d+4iSweukIt2Zzw7bzrBHsfO/NwxOUInORa6xmcpIRhoXcMd?=
 =?us-ascii?Q?UqD5K4Qfw+JDK7ozh5tnNjfYfr0P1G2fDdV12n0Ldbo43Rz6FC+BMpvAmdLP?=
 =?us-ascii?Q?+bjyaTMu6XlNJbskZ1nMc2dubOgf4yABTXKXhApLwVsv+0FPu5I8sqhPMxxH?=
 =?us-ascii?Q?rwHMuKeQqKYyN+cFpJs5x7Lya7w7yoPRybII5zpXX7yheVuajbPAvi1yq5Op?=
 =?us-ascii?Q?sPEiYYl6MUcDRqxJXWGUXFgLhHbCqTWETwxHHkZGLxbfaST+6H1xvGDYWZ0C?=
 =?us-ascii?Q?2UxgRhNuWvMrv+T5CnAVIrGtDSIrCAm9vFSvMEr/q3aHrQcWx8NqMF+K5ihk?=
 =?us-ascii?Q?jGCXX8M92TEs8RXRx7V88Xrtv0/k8p+jTfk7udDGwmkcl9lYfirDSLajl8At?=
 =?us-ascii?Q?nYouVLk1i/IaB4VvYajJDtmpH+HqjnDuRcRsynmIgNytvoaulqAuo6xcld1b?=
 =?us-ascii?Q?nYKBKo8MCKpGUzOVHy4kbA1nLnp+9rQRHlZ8fh0XGr0Vkpr052A9axtmZx7V?=
 =?us-ascii?Q?hYozZhS86bwsHKDE0UguFXjixoqvmpfeAq3csyDVylDhHc2+fbW/JejrTM6M?=
 =?us-ascii?Q?bvwJhZ1Mlb5Uesrm+9beXyVlfcqAxPK3B9nXIc+oxWuixyLIlfEHDVuER+xH?=
 =?us-ascii?Q?yQyZU8F9h3OF5eoyMW4JkYQ3xfE6Atuh/6he1gMCIFqX6ONLMgngw9AN07el?=
 =?us-ascii?Q?Y2hHlIrDtdQfmeCqFWLlqRiEK6VR+BwNAvh5bFO0CkYe0gHDVr0uSEzGTOWA?=
 =?us-ascii?Q?639NU9t29HRSETDr5FhOC9gmz3BHMnfCPKogBRfwsstoC8OEErAznXkrXNZA?=
 =?us-ascii?Q?3oguNjPa0HdvN3aKBNlm7src0AN/egR1vlm4K/DdjrMqeib56NF0E3V1odNd?=
 =?us-ascii?Q?MBK8eaMTSrucS9QhY5D4vFYmX0XF8LspkHOLgeruNwtAjSYMzgNK7L8mS5Jq?=
 =?us-ascii?Q?DYM6R68a5Zlzl2UUFgXQtWdbPfHfd2cY2sQc/DDos55MqWdcv3Bo8eXE6a+0?=
 =?us-ascii?Q?/kH39hOn7fByz3oBbpC7TyzLwS2XtDPUP/V2uzfyfkJiz5ANTejOpgkCWFiW?=
 =?us-ascii?Q?3sM3bfgymQO/hIZZZy9a4jxIbH7y01VM2XWI9ZyRFG36ApW869bgBFesc2jq?=
 =?us-ascii?Q?AXH244QPizhXtQWLYUtO4iF9M29H+fEjCctk526X9WhbbHr4QiA/dDHoy81J?=
 =?us-ascii?Q?1nlC8/KwTKl5URJN1WTSP0Tii2CJiKXc+oCBp9CkJTxIEPIXqEckz08lNp1x?=
 =?us-ascii?Q?Tx567jmBdkELyYiqW8Vf6r0uq4a6dGPD9f7R2gIDyQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pwepoaT3YXRuEz9gHIfDrlcmVbebKFKGlO8UGHVkTWWz9gCY75BNwaqrE5Bm?=
 =?us-ascii?Q?blmfixfsHzWa2XMYZ+HvJNCi+OYfBINpEq6dr2K+sxCw8BELE3h7Rmd0ybHf?=
 =?us-ascii?Q?GNELrjQMwESVTVQ6HZ3AgrQRGDA84g0N0C3E1+w3oj0vIKH3s3cMeEAZ+UEY?=
 =?us-ascii?Q?RAuKjdAWUO+E+/70wTmcKEcew5j1E3l0mwOqysZk3vUyU+Lpw2XAvibOMGvi?=
 =?us-ascii?Q?SqpVw0BqHgFmfFSm98agBI70Exp9SzmTnKE1SqWkmjY1uYIkFdEocxgXGRWC?=
 =?us-ascii?Q?spSYCmULEgxJl3byx+PWNHslsl1CBReu9zNPlSsduVEt1HrXYKnTM9atQ5E7?=
 =?us-ascii?Q?3FnnF1i3Q9pSnL4QP3UO0lQ+BcbRurjMgnKZgYMJA+BYz8PvYLotyT4mIJ3L?=
 =?us-ascii?Q?Hf7CHh/1HWu8+qItAFs2/3VdQA9ugu2s7Cs5s6uWwFoa+f0GF6GYw9tnA4Tp?=
 =?us-ascii?Q?bsAs7rL2DzC0RhLweieyvFmFDsXdm5vV+QmptFGa3DLm5KQusmaCjldOsnzz?=
 =?us-ascii?Q?RSFO6e6scuKkDGkG0ZcGeBeU3j0yVfWLscfv+/k9/R50THAXqSvjnZrtYTql?=
 =?us-ascii?Q?k0p0hZnOa0rxOLiwc3Wsm4fS/sPqkLrMDe10Nun7e6RyDzB5zuj0Qw/7QPkW?=
 =?us-ascii?Q?GWyPNsfUiYgfUyQ5rer+pHvUZ4IKMh/NYelRNOUKJsEURCGAjGF0yCeWKx4y?=
 =?us-ascii?Q?W8X/JXAidI9k9ITM99fZBK3iQc5ydPDOneVOWhYY0uBRx/pWVDHA9aOsFdGu?=
 =?us-ascii?Q?Tbf+V2mgQmmy54QVJuJAbs9xzWT4fwqEJw2WYIiIdYpKRn6ALG5bZCkZ9MeK?=
 =?us-ascii?Q?lCnYI0P72pPilgxJpqt3VhfFAHsa4+UU4n3GwfMZU1GwpHXAD7G9oXnmQj8o?=
 =?us-ascii?Q?UxKYMyXS3nyjJINu3ywHJjy1kT3E/i40E3RJ/9pftBx9iQIcF7pUYOo+H/i/?=
 =?us-ascii?Q?Wj6l0K9+J2CnaKKCE8+npzxhbIIuBeWFcX3toOnIkrlwUpMJ0NmTLHPKxWmF?=
 =?us-ascii?Q?bUMKZl6HI4/URTUwyfCm42fyMr9LJ0efTkaJZisCIo1ghkFrEKvCNVXnPfK0?=
 =?us-ascii?Q?hmNFM9k01qfJAfINg07JR09qrtvIK/mue2qDyuxGNzOYsvBSmjcbTbX2pdEQ?=
 =?us-ascii?Q?deRTh+7cUwmccnWNvicTBrxanjEq10D+vBEV8QYZTsistIvKp0KF25iYObBA?=
 =?us-ascii?Q?TDwEZu4u+73Qepmd6P+6/yoSv4eIFOTlt3PYynbuLPN3t4OU8eYYnfwUFNP/?=
 =?us-ascii?Q?LYpy7UCw/JVmOk79vxfqYF0J/HS+fdU8+Af40+/Wn75hXi8JEzpoSiiPRJS8?=
 =?us-ascii?Q?4HWLXfUBTAjZ5AfFyn9hyRXgYg/XZzbMK2xU+ZmV8FTQzkoC/jZxpQrpJ7lT?=
 =?us-ascii?Q?DYSqwlgjEA3KpzFPMlifbewnxLiQsi31nz27/4l7hZCZ8dhKFk0nAMW815H1?=
 =?us-ascii?Q?Kp0BocfqwvnM04ZveoWwwH1hJan2BH1V4P7aeA0EBxuqjKoJ2nUbFbvCA4V8?=
 =?us-ascii?Q?Ad2KDb5wNdaMXtlSeiqLssVS6JcQsm0vJIJDB6YhwmIlZwP13H68rnK44s+S?=
 =?us-ascii?Q?zm8GOckDeBXcjKpRZcwPzwmbgQpQsG8GAXIt1vrlkkRb9IWdfoiqzX6LvayX?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 072581d4-dfc9-40e3-0f9f-08dcdca24e88
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 14:08:04.1842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EF57n3EMhZOEWaSybYgKMwwwxQOzFxk/SYMhLTLzN7RdDLT72hwvzqagQNRUrwxAJWwyX+CD2Y4qigtlP5/TVM0mp0LJbfnxjVJHB5nll+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6621
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

Next version I will do s/passing/handling/ in the commit message since
that's what it really is doing.

Lucas De Marchi


On Mon, Sep 23, 2024 at 05:11:46PM GMT, Lucas De Marchi wrote:
>If something like -1 is needed, then
>igt_open_forcewake_handle_for_pcidev() should be used.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> lib/igt_gt.c | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>
>diff --git a/lib/igt_gt.c b/lib/igt_gt.c
>index c9fd9164f..ba4163c97 100644
>--- a/lib/igt_gt.c
>+++ b/lib/igt_gt.c
>@@ -493,6 +493,7 @@ void igt_stop_hang_helper(void)
>
> /**
>  * igt_open_forcewake_handle:
>+ * @fd: drm fd - i915 or xe
>  *
>  * This functions opens the debugfs forcewake file and so prevents the GT from
>  * suspending. The reference is automatically dropped when the is closed.
>@@ -509,8 +510,10 @@ int igt_open_forcewake_handle(int fd)
>
> 	if (is_xe_device(fd))
> 		fn = "forcewake_all";
>-	else
>+	else if (is_i915_device(fd))
> 		fn = "i915_forcewake_user";
>+	else
>+		return -1;
>
> 	return igt_debugfs_open(fd, fn, O_RDONLY);
> }
>-- 
>2.46.1
>
