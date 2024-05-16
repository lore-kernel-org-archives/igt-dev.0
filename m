Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E73C25B74
	for <igt-dev@archiver.kernel.org>; Thu, 16 May 2024 16:21:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521A410E275;
	Thu, 16 May 2024 16:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jfgr7CDn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD1E10E275
 for <igt-dev@lists.freedesktop.org>; Thu, 16 May 2024 16:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715876516; x=1747412516;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nKJd9EbY5wyqCwEw2EZEZS8s5lAQRWvUrr9IDUBnYGQ=;
 b=Jfgr7CDnZWTVnH/2pEQSEAD/7r6eCl2sGyFEBsTow/m3VvziArdes0us
 SkdlBDN2CcElem2ZbM3Bhx3ksn3+1vDhOOdEfmTfV7Oan2Yr0GbDBxPkk
 HOrAUzlbr/icBrX7iHGDmgw79TyC2jWhbJVlEA/ShCSvmunK94xI8r3fp
 KOY11oJoElXmUyWtBL4MDCjq+3EpjM/n40cxH8oyHJAM9qAAcUgU0nAAS
 SvQndlQsXUcAVjobbOQFwf9v/AFWDcxT6kmBGYnmc5eVI4JiGX12eJJjF
 SdCXqAxRYszuw9Q2HMoLsDtYSYXyFtoouwE0ILiBObeTqiZkJYA29oVNL A==;
X-CSE-ConnectionGUID: 7AG0dIxGTsehEfY33l2RNQ==
X-CSE-MsgGUID: 8wPCT7WvSNuoUsxGGRJXPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11843108"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="11843108"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 09:21:55 -0700
X-CSE-ConnectionGUID: FQ31MLPMQyGtARLQPxs7SA==
X-CSE-MsgGUID: iBpBUQqSSvWuHAr8kqwyyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="31486241"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 09:21:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 09:21:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 16 May 2024 09:21:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 09:21:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MC7a0yOVb4W1eeAUVGrtRAAjt6NhgZR0PIGOtynMdox141EyK47a2Dv9bZL0gnRbIIja6j7b0XoJ74cbHDslT+cGzaJ2jgeMUX4NnG8hbzAUsOFEWFCbxvYCsBuax21UlqPhyB2iG3VcZuM9RVQid2RqbEvJUe/qxMRjXkbV/2zuHVbG2f86l0VtR+aYdihCp8VYL77CcOGRVBgEz4661FK1RXqJj7S20vEXr1WeqlZv9w3/1g529qpTlagBXVkZf5AvWQ016PVOzAhymCNvyQqK3LX1g2zsTabmr2JvQOcrtqiQ9z4yTSTnjZlEqiHomsLAsaMihqoOXoXVa1aWcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Poo4l4lhf2uemaz6yBbybRCcGuvzQXVitMqy66+654=;
 b=QfL/XSzSJaPAq3ntgD5AzZx/WilwyPio/lTwhsMmd50CZrAvcpCJvLvWEtY3keSOxu6kHcqVo1pIL1yvJapmaSUe1J4I5ONBexxzTfy3UUPBLsJqdm1vlWM51is/slDn6cKIBcKWk0RrZ42qmzpqSlgnvNhnU49GcxLEAd3LeMRX3xzKrdzoA768s91LfiL1fwOOdUZrfr9xmP1j0zw2tKByoWdxLCleOmK2RDn7ug6NH3clhUsKq3kJLqalXHdVmwGBGQgTrkljtwTDECGAN0Lrb4JYywJW+UhOCyC0A0pg0GXYF4BS8dXJNfNuNoMo7Rb1zOZKy5gvM0/Odbd8fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Thu, 16 May
 2024 16:21:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 16:21:49 +0000
Date: Thu, 16 May 2024 11:21:45 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <janga.rahul.kumar@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <ramadevi.gandi@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_pm: Disable display for mocs-rpm test
Message-ID: <knii2c3mppj6gcz33qfvevgm7fe5x5563m56jg3bb2qsa7praa@gnjlqbfee7wn>
References: <20240516104513.2685597-1-janga.rahul.kumar@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240516104513.2685597-1-janga.rahul.kumar@intel.com>
X-ClientProxiedBy: MW2PR2101CA0026.namprd21.prod.outlook.com
 (2603:10b6:302:1::39) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7777:EE_
X-MS-Office365-Filtering-Correlation-Id: f223702a-bb67-4622-48b5-08dc75c449c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FHZd0Tg3pr/UlWv85dpZQxZPXDUBiLQ912iDyXtYh9kRiphBFaDOC4w/U7m4?=
 =?us-ascii?Q?1N+wUvxC8UNXDatvIINim0/dX+jcGjZYKPnTKkTraOFC5J0QzxyArn8kDj6+?=
 =?us-ascii?Q?AbSiFuUVr025V7UoTT4A3XPys+CJcZa0tVh9dUIHIXAFXLMoixuqLCy1Om4J?=
 =?us-ascii?Q?55Neu06W/KJD/U1vOV9BESblT+izfPlajlLIYeLgY4aG7MFhaL5JCzlHMfVw?=
 =?us-ascii?Q?bk/D6z8xeD5T8TMmKF2yPOygIDhkijIJlkFL9Wd6386nyfK+u0nf2id7hQRW?=
 =?us-ascii?Q?drBlsqRF5Wrdm951s34XCOZDzogpVuHxJyKNb/6Sa2FENEP7vvOQ/QB1LcAG?=
 =?us-ascii?Q?fLQHyScA2X+oojaiiKidicYgqjL9Jcfg6ksz6s7gHrvu2N2NWZTHA12+fbb1?=
 =?us-ascii?Q?KSLX7JqG4dEW8WWNbmvqE4jaaEOwfV/RZRUFHLZy8l3njQdlnRB5pramAuI+?=
 =?us-ascii?Q?4E7Sx7H0e2M1TDhC/S00X9+2/okBXGtO9OX3UHDam6dElM/QQ1l3VH/RLJGo?=
 =?us-ascii?Q?PQGiW8w85MFsHYOXstRyRxuPAsR3ZtuzHJB9EF7cqm9GFlBR2ItfZVxPu1HG?=
 =?us-ascii?Q?yvzszW0+eZhkhV837kgUpqZBri8aDL7IvOROpRm1OWP600NdlHdpevDNDgLX?=
 =?us-ascii?Q?uwLlRsveuMQHDe84/1AZfmmCqhNGNhhJAeTq1jSLLZVRcJWFuisiDA35Eyzl?=
 =?us-ascii?Q?wYBcE2CAIYZCSEHtz9Ioh6wmC5RjscXRCZhcC5Y+x6WchxjOMM3YrjDfnUQM?=
 =?us-ascii?Q?IXWYL08Gfn5PzNBqcF5ellIBi3BOc8ekXYwm8lHrYQX1AogVRyxzw7gQe2Cl?=
 =?us-ascii?Q?VX7NYBBBoUz4+XkY9MTqjXJ4m7EcuQlfK8xBZsLnwaKq+cA2gJRhsDzuEtMA?=
 =?us-ascii?Q?RTJvhhT7h8kUxL0rJa6I12NzCKBcAT2Ncx1weqMRLY0DSmjABjOE4NbFHQBp?=
 =?us-ascii?Q?iqxjr1yN91koullkn8k5g9s8YeIkzvBBRvqItGPQ1tDc1AkqDVwTtRYjCg6h?=
 =?us-ascii?Q?zMwOV26Yi7O6mpOjAuZv2aJkn3Z50tue5jGQnjNARv5xyzoAYBIFTtoFI8+4?=
 =?us-ascii?Q?FF+7Lam+RwoUCPKgsm9fHhCLBSq3OSqnYyfpMukbW79Runs0Bf/8MHpN9irg?=
 =?us-ascii?Q?d/WWbRr54s+WsZ9dE4nNhkULCFKJa+H3Ni20Am/nZ50whUdSSG4SuyQ9IhDD?=
 =?us-ascii?Q?Jrj703SBVB+JblEz25WsBga8WswzdCwaLKKf7cBJyNxoJnIPF0PNHNmhqls?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AGdp9yJQ/xXNyWZ1sVHMNA5ZKzlaxdRLOiucqmhEJQ3wIsKVK74cXI0h5GNL?=
 =?us-ascii?Q?okD2ts1RutEI4JwlxdQR0AnX/tnQm/IqfrXvMNXSEjthAYdkXif/uZ6ANi7U?=
 =?us-ascii?Q?s0DTd8asA2eH8JDokP81kvm1H3uASweIeYXKDNxXDzvSz8/XB13j2LbH7N2w?=
 =?us-ascii?Q?z1yJUJ3W1VbT59uhoWqP3daoOKcU0MpASUNtW1t4FjHB7RNbg25rCYtqJTAT?=
 =?us-ascii?Q?aktTWBUjtlfKoA9/QUYtlqzHtp8UId0bWUtlpK1mTY4udM2M9IXlSrgiw8pK?=
 =?us-ascii?Q?ZPITgGia2ruOW5d57W7DjeNSsedz3g6UZ8IhKEfv47Ex7dME2uWVT4eEtF/X?=
 =?us-ascii?Q?ntut42Q72XfKy96W5Qs0VgHNVs+wOFFt4dVnsilsGfrp9SoJCMdOtdeXbORe?=
 =?us-ascii?Q?zotHpilWzJaKWlAXZ9tS94x/jk7neQmo55jVn6pidbimgdilRQz2nW4od6PT?=
 =?us-ascii?Q?EIrJn1uCrdlIrdK9ngVZRKJrJ8Nxuuc811I0UgfoJYRA1hwDkwcX6+6Wv2JV?=
 =?us-ascii?Q?RY4cmHGeSeMjYAvKEgdpUrOpxXjkdMzeramX4n5lV3b7Fx/UjLqefCPnHyYH?=
 =?us-ascii?Q?Jm8cte9mz8YWmBCwo+K6mrIQbSedHd3F9Yr3LeTeQ954YcIZLNmJTfhP7yHp?=
 =?us-ascii?Q?S9wwS5PKjl5D3rU0Ii8r0geQ6pRl3kLkVuClPUvsgGysSV/9oVI2eYMmJYzG?=
 =?us-ascii?Q?wG8VXuw0yGX0xo9HBkLqIgkzpPwKteLhBhpKqdyl5HhCwU1gOiX5xgv16Qa1?=
 =?us-ascii?Q?VKp7Jf8SWKvUGVTcFiKUyTD8YGsGK4EJqUoOawLs4CC+vsaVfjEmQraTPx2g?=
 =?us-ascii?Q?YvQ0OeAfAi7I2xyjegiXxt1sAF8anBtnndYuBu9lK2XkyDndG0OD4nPm4q2O?=
 =?us-ascii?Q?Pn7t9TF+2cMuy8r2MwOqoN/wgtCpMpBqnQVGJ1LqW2REsg/Qb/N4WNOFPzSe?=
 =?us-ascii?Q?HQ6Vp0UZiVWLStcErMhv+Ps78kVh/3vKjo25eTgvoXzrXE9Q7YkT8METbidZ?=
 =?us-ascii?Q?zsanwHUl+VzkN2ufB+hALPHFJXg7BweBsuTAi572omTgprekviiASy2Ctwai?=
 =?us-ascii?Q?t8XNJzQ8BR0fJN3bLKL1JwevQKCDM68gfaviAFpLIEBNKH/FviXuJUasMNeA?=
 =?us-ascii?Q?nHi1XMCPp8xzKFxjRjb5qs75Cbw5AAc+d/cqfkwaxPSPctdcM95JHptk9LSD?=
 =?us-ascii?Q?0tCPB40sWLsP020iA/tkKsfm6dgj9krt1Ry1b2h4WQcwkDL8SBcQ9hFIo4LC?=
 =?us-ascii?Q?L7ehq/2R8tYYn6Ol2+HoWC4PhBIWFtnqPTXH6PHCT2WxLqHFAbXLJ9wZ5yEv?=
 =?us-ascii?Q?pJTDmzCdYpGokuYsdwib3kdG7o2cn1cI7Vzqi/YhgC3BkITwaTaL1syp9SYA?=
 =?us-ascii?Q?PEIjdywqx2fRK8GAFLqw5qH9OIjD97zfHZC852lCtT0hvJ/hmCm1FK6cWhRY?=
 =?us-ascii?Q?LSIGKLGJg3/NI6iFEoU2V9TKnUXHEsDKfEe1OVONaaUdmG6RsXJCwqxu7dIS?=
 =?us-ascii?Q?o1mWpYTN3WJ631cS1dDX0tXTUAG8t8SI+SmP0vFlDYyJtpvyj18PAxEHsngK?=
 =?us-ascii?Q?dAvpgGlwlaOve5BZcQaf5Yt+VBPLsWnXj84CtVX4R5QEMnGfjDiYhHy7ZaC+?=
 =?us-ascii?Q?0A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f223702a-bb67-4622-48b5-08dc75c449c8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 16:21:49.3373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vNQe2+3/jPIQRw61GTAKJD9u4sW1sQF0GnGSaeFpF255LGKZ8z2pd7RUyQr6dj1MAO9ZKyHmJiNX0BJbSXrQwcjVuwJ03Cn/0UlHPMlhjEk=
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

On Thu, May 16, 2024 at 04:15:13PM GMT, janga.rahul.kumar@intel.com wrote:
>From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>
>If display is enabled, the always-on components will always keeps
>runtime pm references, unless you put DPMS_OFF.
>
>Cc: Badal Nilawar <badal.nilawar@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

I think this is

	Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1818

right?

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> tests/intel/xe_pm.c | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>
>diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
>index 9cb00c7f1..b4a8c4d15 100644
>--- a/tests/intel/xe_pm.c
>+++ b/tests/intel/xe_pm.c
>@@ -835,8 +835,11 @@ igt_main
> 			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
> 		}
>
>-		igt_subtest("mocs-rpm")
>+		igt_subtest("mocs-rpm") {
>+			dpms_on_off(device, DRM_MODE_DPMS_OFF);
> 			test_mocs_suspend_resume(device, NO_SUSPEND);
>+			dpms_on_off(device, DRM_MODE_DPMS_ON);
>+		}
> 	}
>
> 	igt_fixture {
>-- 
>2.25.1
>
