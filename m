Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D491C54791
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 17:30:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9721E10E433;
	Wed, 13 Mar 2024 17:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="If30zDLc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8B810E433
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 17:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710351019; x=1741887019;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=BRbrrbf2X4KbmA/dASao0ZCgjo6eTCtBJVx5cR9I29k=;
 b=If30zDLcZrvUtPc/YAY00JB4nJuDEh+boH+oEHnai3TvlfzR3VKb4Jkt
 Ree20q4jJEJZABI/EKD4zWIiGbz7RJYmqPCFmJOoVzZkcoG3mdDqZF/cc
 YLMhjUjOiPOYp7NorIyD/QeCQ1509ixm7+ixgqPAWGNXER7Z55vvYNKlz
 pdqPDFHfPsN3moK44B3vfPDHlUkwKi5UjwcDOj+qmmOtYM8f9xziJKvbA
 5R0JfVyqBTlqaIKS+V51P2DZwBlMEAGi8+dsQg6xqvZrro00nN35lzqka
 73lpzpAc4Il0VYQt3w4+CkrkoUnBIAGtKq/PcCqeervUwyD4tDhnR2Vx4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="15861449"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="15861449"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 10:30:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="12459556"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 10:30:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 10:30:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 10:30:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 10:30:15 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 10:30:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNBvM1FW99V86v8q7jzF6WnnP1Ht+vPeJ7FTuVExHZqRboD8B3VDlY/iz5oC8pbdQ6YIRb/dxmtEp0m8cOZG/hqraj25BebMZBv/NPWuisXbW5kuEl5jIxw8RuTgdEHHovilRGYBnAcAO3NkyRwT5sMohSfRfgujFcXq9M15mFGh5PdiFrm00Q9beRGGPna3oqvE4z8OAKy5vel3LreNkkQk7FCLgA0wt2aUYp+N+wPkVarrJlGLu7HOPK8eIOkVo/vs4ykaPQ6m2WQ1OHoB0mfytHObiG2N/DnHxFV335lkOpqtCITS1Wo1J5J2JrZt3mNjfJL7Vub2qfkRvAXZ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uepmhEdTx3NJiRd6vjeoXeTvyZ24ToZZWiB2Io7qT/Q=;
 b=mVrvNhsQkRJKDeM18rkdnDGEHapma3PZw5CFqWfCbWf4/84nIgxhd2quqp9k1Yx+lIZ1ZVkPeORfWdvPYaQDdvtM3dw6boU5dzIrLRMaBtsOjlh/11cPCDxzr1KfEVhbbZgBR+mpCqq6VHN3O+dWZ8dH6KNpk84c63KSfX1avWk2zGbgrYIfQtJNxB863Vrz7vSAOSxsgpWt32xJdw6yc668iIYO6jITp+txoVSoZwkvTzuNHHsPiOBlYzuwwb+ukcUSVP6F0NnbwFUB+o2ZJxm0zFKAkH6Yke9dVFtcQlub18O+tPnhkwx11Q8mO5x36JcLFNvxi0kCGIEIA7ueYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS0PR11MB7407.namprd11.prod.outlook.com (2603:10b6:8:135::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Wed, 13 Mar
 2024 17:30:12 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::2823:ea18:552f:fb09]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::2823:ea18:552f:fb09%7]) with mapi id 15.20.7386.014; Wed, 13 Mar 2024
 17:30:12 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240312174533.2417630-1-lucas.demarchi@intel.com>
References: <20240312174533.2417630-1-lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t] xe_live_ktest: Use xe_live_test kernel module
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Wed, 13 Mar 2024 14:30:06 -0300
Message-ID: <171035100667.15349.11201123748895892444@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:40::18) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS0PR11MB7407:EE_
X-MS-Office365-Filtering-Correlation-Id: 62ef6172-a7b7-4e1e-5e10-08dc43833cc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Nu7pY2qCaVqobN6sthDjOUeUXfpezEyQIxY4RQGjUE9mXgMCjGzWPLbwydJjIIzSm5ULT1ZG/BAa3nEGsd7M99KB1BOurPP5upaGr2xtB+NIrXnGGJkJUJ16e1iUGmHGj8UVx+ME26rAlg2h1N1SsgctdROHLjiVSXHQHJa9HO2Ly8p3tQC2cwld85Q1JppjHyY2AsGxMe7/pMlAoiIr0u6k8gvL1hv8Nvoq1xvShXH0f7SK9f1Qq0AyNU3YGJ8Wg17wOaZhWujnTtThlAcKa0EGm+yMCQ8G5U3dvHOmHmaolHIrd4kGOXL4d/1DjX87oV+nTufGqorA6z90RNLuflhiKdNHMYqS9oKLKf7I1znCEhmr9bc6k/fJcIiF1zoDbMooPbOnUFILwR5e+Tjbli1i/CUabsaOYlEBPUD65g7D+vbLH8vTfnmVZ9nADuoTP86qZPDyQesa1S0Qt4BszrG/TPdBxJyr2YvYMApIkhUUd8rxfmPyyHMf1sUmhFIH2FJZx2k9c/YFrvXe9mgI1SsIAMByCwgb39Np/aMiPraNF5PM2hvjMoD4zfRRPMAQADpjtkA6o2PYSYmk+YCIwWYzWBBqr/CLtgt+I6jOvA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHlVYXhDNXg0dzNUUGtiM20rYmRjK2ZJamphWXlLYWZZV0lPcTRieW56T2I3?=
 =?utf-8?B?ZlZDUFRUamRaQnhGOWhJM0tGUUVnUHdKQTd6RUpFd2xFYVkvRytudDcyaWQw?=
 =?utf-8?B?UnEvNEFjeU9FU1dOK1NlVTBEUkM2NUx4VVN1LytQa2JkRjNhUDNYbFF4dVFX?=
 =?utf-8?B?Sm5nZTRHbXhLdkQxTUVyQW5GNTZpbUdES1doTHNpdHg5MDNxdFJmcnFucXBU?=
 =?utf-8?B?U3l1WFNpaUFhdGplNU0vTy8yMWRWUDBDSEtpa0tUOVhWeDB5VTVEeFRpMGJz?=
 =?utf-8?B?QU1hNUEvemxsTi9TNlAyeEw5QWFjelFtT2xYempqM1FyRHJRdi9meCtKdmJM?=
 =?utf-8?B?WnZCRFBoTW50UjBscGdXbnJ5UHduMFBKSkRnbkEybkdCblNib3FjL0c3Q2JW?=
 =?utf-8?B?TUJkbXpPMUg5RXd1K0g4MEt2Mm9jWWdzckZtMXhTZldPOWJCeGtoQ1owMDZj?=
 =?utf-8?B?NVFVOXJIUFp2VUJ5TXlXbG1qRUNGcDFBdVh1WGtFYzgra1RjRzdxaDRGell0?=
 =?utf-8?B?UTk3NHdZeUZJekFKd2tQWEp3SFRKbFExd0dTRUJyRE51ekpISlMxSWJjUHdO?=
 =?utf-8?B?U2QzNmtRcUlmb1NFMFM3QUpmSHFkZmtZVmNOMGVSTXFaVmlBWTB0U1dkdERG?=
 =?utf-8?B?aGk1U0FreEhkaHB2eWU1NXhIMzdtbUt4a29qMVZoSExtSGdEU1VUYlh6RHY2?=
 =?utf-8?B?SjJlQVJsQTdGMVZZOEVXajE4a0dHY3d3cnVXNmNvckpyamNFYloxdHFYZEhi?=
 =?utf-8?B?ckJnUE12ZWhLT0pxSHY3QUxrd1JrRmJ6ZFlyWXVGRTJvZElBYnN1aFZseEVZ?=
 =?utf-8?B?aHVQbUxTRGF1a283TTRhWDVrTmQ5WjFqOGxXY3FlQ2xla09RRENIOFFuZTBW?=
 =?utf-8?B?RjRJK1dyUC9waUFBSGhlZFRmN1FJc3BGNFIrTm5MbWYrR1BvbU85K3pDNEs1?=
 =?utf-8?B?QUVBeWlTNUQ3R1I0RzVIQUs2S3FHVy84c3Y3cjAzenRzQm1RMXNnemcrT1Vq?=
 =?utf-8?B?cHdaK2JyUkJKTGl1MGFCak5wRy9vSi9pL3RXQ2tLVm9xM0c3aG9KbkFyUHFV?=
 =?utf-8?B?alR0MnlYNG9TQ25QeExvUGs5NjRCNHBDcnl4bFlranFKNEtRbDhEbVY0WTZi?=
 =?utf-8?B?bWN2dkc0cnV1UG9EVEFNajVDY2tmU3FuRmt3RTkrZ2pYYTV5SU9GS0RZbnRO?=
 =?utf-8?B?dVVwd04yR3ZwTDFMb1c3c0xVWjBhSS8vaDljNzFldEFvT2lITnVuRXVsR25j?=
 =?utf-8?B?Zzhob0RhUnFmRSs0TnFwYjdjSllKMFBsN1dlcWVMdTNCZVZiQ3BJVXN0a2VD?=
 =?utf-8?B?aGt3azhtOEFFQ2pzcWlUMHNER0FFV25yMGdxemx0NUdRWFlTUi9zVGZpT3pK?=
 =?utf-8?B?UXBGTjBBd00vc08rZ1Y1bkgzUHRYZWc4SWhEQUdNUHZrMDJKOGk1Q1BXZDk4?=
 =?utf-8?B?V0k3YkVjcmVVblprS1hIeDhremxqSE1FOG9FWHlKc3NQdExMdUxmTXA0UFQy?=
 =?utf-8?B?Rlp2UkQ0Nkc4bTBCd05RWS9CY3FMelpEcy9nWFhnSW5xbHBBdzBWY2t3WHlY?=
 =?utf-8?B?RkdOcmROdEtwUGRSOVN2NHVJRlo2cWtUbTRnZE9rSjI2ckFWd3ZQc3hzVFFJ?=
 =?utf-8?B?TklGZFdsRTMxZWtLYXQ5Sm8wcVZ4RlhWSzluTjZXTUF0L1A2THBJcUdOaWE2?=
 =?utf-8?B?Vk1VODE2cVR3U3cwYkhDVy92VzlSRFJjQ1hzQUNadXF3eHB5UmhtRW5tSUJC?=
 =?utf-8?B?bU1xMEUyYXJxaGFzeUxiekxnaSttaEdibldmSGs2d3lmMU9uTnFZaGRRcjVv?=
 =?utf-8?B?YXRqRW42eTU3NDZQa3FRTzJuM0tTN25qemdCSWhTQUJFNmNvUnVvNjRmTlZ4?=
 =?utf-8?B?UjNnb3dQVVZWL0p3bC9obENoQXpZNVFWSVFMa294V1FCK2VkRkpWc3AvcjVV?=
 =?utf-8?B?amZ2L1F2TUwwK0ZJSzdDd3g3di9BcTJIQUozUzlxREtsRkh2dm5POWJIY2lk?=
 =?utf-8?B?Z2VYTjJONHVDYkJaT0lMVVliZXV2QitvcXpJbVM2Qjc0U0V3MkRoT0Q4VU5l?=
 =?utf-8?B?RC9oZy9aajJhVGdzQnEzcER2Vks0bGdiZG5aUWljRHF0dmE5U2FNYUplcnQx?=
 =?utf-8?B?UTN5NzFUbE5EdnBhK3BrbUlWSS9XdDdNL3hhN0wxdnJWeFkyeElyMHZEdDlG?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62ef6172-a7b7-4e1e-5e10-08dc43833cc6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 17:30:12.0781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xOEzVIBb6xFjUW5uenuFwmtmBsa60dgox3th8gQXitFqoVwYbmOAUeUDTwLjDSF7fQNtX1RLc07QtptJSOn6Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7407
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

Quoting Lucas De Marchi (2024-03-12 14:45:33-03:00)
>https://patchwork.freedesktop.org/patch/582554/?series=3D131032&rev=3D1
>groups all the live tests into a single kernel module. Use that
>module to run any of the tests triggered by igt.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> tests/intel/xe_live_ktest.c | 17 ++++++-----------
> 1 file changed, 6 insertions(+), 11 deletions(-)
>
>diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
>index bb612bae3..08b80d4e0 100644
>--- a/tests/intel/xe_live_ktest.c
>+++ b/tests/intel/xe_live_ktest.c
>@@ -31,16 +31,11 @@
>  * Functionality: mocs
>  */
>=20
>-struct kunit_tests {
>-        const char *kunit;
>-        const char *name;
>-};
>-
>-static const struct kunit_tests live_tests[] =3D {
>-        { "xe_bo_test",                "xe_bo" },
>-        { "xe_dma_buf_test",        "xe_dma_buf" },
>-        { "xe_migrate_test",        "xe_migrate" },
>-        { "xe_mocs_test",        "xe_mocs" },
>+static const char *live_tests[] =3D {
>+        "xe_bo",
>+        "xe_dma_buf",
>+        "xe_migrate",
>+        "xe_mocs"

I would keep the trailing comma. :-)

With or without this nitpick,

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> };
>=20
> igt_main
>@@ -48,5 +43,5 @@ igt_main
>         int i;
>=20
>         for (i =3D 0; i < ARRAY_SIZE(live_tests); i++)
>-                igt_kunit(live_tests[i].kunit, live_tests[i].name, NULL);
>+                igt_kunit("xe_live_test", live_tests[i], NULL);
> }
>--=20
>2.43.0
>
