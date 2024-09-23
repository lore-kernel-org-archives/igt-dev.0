Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00678CF9C71
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 20:58:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A627510E49A;
	Mon, 23 Sep 2024 20:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="asypAZDz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D0710E49A
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 20:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727125118; x=1758661118;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QZV81+mj9X0xztkjkQSon/KeZNBhhK4Yusuloeh8NKg=;
 b=asypAZDzgqfE2LXjfq+HMQzkk/CTD83tfor2j+MiTxibJkEl8ZNwLGCg
 DKF9R5xqwBmDjZkdrq4fzLogcXc1wP/HSNJNEYj1lU7jTbBFlAa8/pht4
 cs5xzSHAU+ZuNllMbo82VfBS5GPh9KqGaohH9gVgGJNNLZN9kvsIkkH3r
 6kfXYl4AJwQTT/cH6B+vJxQuw+s6NN2J2v0XWjm0EDIoJPc45uBT1sg3N
 BBGpDeWfz+FYX7dgrizu0w+nTRkCgoKk2xaqvsUEJbSnQ4Cj4Nk07ST1c
 mJGZ9JYu4NzhhHpI5l8rTgRuhHweVV2alYrgnFWqBgZ/BlteT/N2Uo78M g==;
X-CSE-ConnectionGUID: vz9wETLZQBuQmWOoa6o2Bg==
X-CSE-MsgGUID: i9WFdJT0ScWU/eqmCja/oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37458568"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="37458568"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 13:58:37 -0700
X-CSE-ConnectionGUID: 8XuYObX/QUqeY5IZmuVYEA==
X-CSE-MsgGUID: gRWlMlecQd+gdHpN3CrFxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="75298709"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Sep 2024 13:58:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 13:58:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 13:58:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 23 Sep 2024 13:58:36 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Sep 2024 13:58:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLOAqnp3X/yRKxzbsFOVwzqywhltjX2EvGe0DTS7iqdPPjbN0cvrILdTLwuH2xWIctYQSMzJIPxNsRscklaGr3W4tAHAOaEWpE/j5POl+XCd04wi4CRzo2IsTQgm/kQlWM1DVpuKDkx2w3vQMW8b4SYi6bLp9xQpoTREh8MyShAwPTH9XnlhZ+j/MI352d0xCZPe8Y8iA0G11nHXVdMsiWJQ6eoepC9XGZ4iJFUwdZGdzh6RqOq9xQiOnIlppGAMlbjxbfgvyRvRfvP9GVButLhU6lK8Z+FmkUMTErUkqDUh0fHAgut56/mxpuAV0mnEzW9AVms9KtdNYHJn3lApYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APo6ucJ15QrYisrkz+7uxb/8/BIxYWOKQtK7qa8CqSI=;
 b=s1TxCtRMqjYvggNuzNMWK49nv/LHsr03WI5XIO7jj9BZ/t6IZKK/WoFFS3ViI9WwMMUrCLunZsTl4Du6kNtW2SPzcVLkKyFWRP0ev+ioEX278TXM1MILrj4IEkLPxHISBL+FWcIWGCCY4ehMmjWXZgDUQJuBckgLW86bU0syI/Udg7fi6vpebkd7x043vHdbUK4+w5jZvcQnNuH+mMWfayso3WBLdBMQX486nNewXxYlj61pq4EPyyBxsvrweuk0JcfAmq/St3DfbxS+wSisVSu6e3yNEAXXtoZtVwxvbyok837ihOYOPz46k5IA3BTb8+quYEkFkEBllUjms1kqjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6880.namprd11.prod.outlook.com (2603:10b6:510:228::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 20:58:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 20:58:33 +0000
Date: Mon, 23 Sep 2024 15:58:30 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/6] tests/kms_frontbuffer_tracking: Simplify
 tiling vs. platform tests
Message-ID: <h6j5vvozdx7nbrrfliqvkhccc6jhiikl4krnabegd74ebwvrx7@z7xgxyrktbzr>
References: <20240923204557.32123-1-ville.syrjala@linux.intel.com>
 <20240923204557.32123-3-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240923204557.32123-3-ville.syrjala@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0283.namprd04.prod.outlook.com
 (2603:10b6:303:89::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6880:EE_
X-MS-Office365-Filtering-Correlation-Id: 1384febc-48d2-4958-1e39-08dcdc127c4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?XxynoFpJfU+WOtQgVYnCa11hwbShgT5GWoil5e+yW9+y1FoZMUXhNsPZIh?=
 =?iso-8859-1?Q?Vn2NGeI0n+41fPt6WJf/voIjvhvLs6KokOvmN+oo5tNHUf6YQ2qRkA1+JZ?=
 =?iso-8859-1?Q?hVtTsqXweObwu940e78pGiDotM7ilGjaGzoPCFxkKy0t9fkpmTT/gJdecq?=
 =?iso-8859-1?Q?/+qoQ/NtB1DDFkWNXv/i53BbwcjBH06vhpZS7dcgz/0g8oB2MMJWIgLHQW?=
 =?iso-8859-1?Q?DEyHHxpeP7rZ46tFhtS5t0X23pekPudGcL/1TmAyZKraYanvuFNgt3HhiQ?=
 =?iso-8859-1?Q?CukOHcjXsLL7LKppvhtXv3bMSNR15iiES0L1y8IrXvXHB8ShGijCBXf8ER?=
 =?iso-8859-1?Q?JCTVNr807eo0uSNbsgdB9Zpx+nz7xo6dA30hf2rq5n5gepKOfNhz43X2Fp?=
 =?iso-8859-1?Q?UCH1zxazoW6B8HUL6TOVctMYPn0DWHdwFsSVFLGxk8W/XEXLOyStnD5aBm?=
 =?iso-8859-1?Q?gBLPAzrLcMBo47wiJlpVFR+WXlqgu+2RuoNW0hP+rAwvgZFKphD3uxGJvO?=
 =?iso-8859-1?Q?BrDA8qYeJs7BjKxbc9IZQmSnOrrzeMY8Qrffa8E/i6l0pO52U9hduX/mBU?=
 =?iso-8859-1?Q?aBzCKShQoVhrB8mrLTekNgSKb4i4BYkY6+JF2iLh2pcau4EGwDQILMQXom?=
 =?iso-8859-1?Q?T/asCyGDVTTkeoYao66NonAPH4yexkbfrJJ98DgWZkjNUD99jy+n5B5TzU?=
 =?iso-8859-1?Q?elvtUNOnmjYBVWvn7li8HJLiRi1G74+1X/pMRM9dZPJp6yXYlhZVANTDQj?=
 =?iso-8859-1?Q?aXW3NFx4dxtVi82VmoW+YLQoOy9drdJNGSXlRhx7WXqzjaQmOnHJTmyDlG?=
 =?iso-8859-1?Q?/KT7u00hhRDVSugY1daFWTTMC2tu3YPN/umSAVkm9pkeQPqLVtDKEyHpYy?=
 =?iso-8859-1?Q?4VCHesl62lXi7odvxiSDzIEBVqg0lmtJErkSiRK5lyDh035idssMXp05Gw?=
 =?iso-8859-1?Q?pGHiVMAeUcsYXOIhRxGnM3J9NkkrI8/PC+pujeP0ShMnEsZVdXAoV8HNnR?=
 =?iso-8859-1?Q?NwoIkzmilwmnDfjQ1rpIUsfGorSncBMDXk+I28meg28sNkdGz/ZHWWMuNO?=
 =?iso-8859-1?Q?ZuBaI3yY2vz1vH9pFe8TfXGTZFzCiUBvpgNljB28Jv367E/dI2BN35QlQP?=
 =?iso-8859-1?Q?7GYBjqZT4mL/Y0VC8TAamo90woN+gc7vg/JMgHEV5NTp7qCacUSm0bprof?=
 =?iso-8859-1?Q?pMr6w7coWzqqfoKR7JUy1Pv+d8AhzIWEMBWkRbh65dMtbR67umifh1Jaw0?=
 =?iso-8859-1?Q?Wj7sMyNDRn0UJTulzPVXgDU+uOTatyAiPYbXkHzaLLv/r/UM1AoTaOzR2T?=
 =?iso-8859-1?Q?v5c57vX0TAZxZ0psJ4OhszYhYGMkNPY3pghZQ3G0PPhL/uLbv2R2NVjN3u?=
 =?iso-8859-1?Q?2yaPBWP7OKVV69LIuaHkLaOj321GE6+g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?h33XM1KZO5X2Lr2lOcoOhetnKYNkcCuKR3FJPwKvj8JxpmY6uIXSbmCCSW?=
 =?iso-8859-1?Q?sfG//dumbwQ1nKROFDw2eRyxKB8r7krTS7h14/InYz25+5HtR6R6iBXLDS?=
 =?iso-8859-1?Q?rIIn7So9N5RVLLBKw+gR+conlAmjPm4ozM7WVhcZ2tkZe5T3PcfBbAYKRS?=
 =?iso-8859-1?Q?NbYr8V8VgN6HKI7pt23r9mg+MCzOmQ1TRmZWHeeMNIRX25lp4tyW5Fe86G?=
 =?iso-8859-1?Q?p44EWEzKL0jl92gHMles8GNXpqeJRIQ0dqn1dsY41ncZOb0hDAdKMf44Z/?=
 =?iso-8859-1?Q?31XwRN92ybdfWbkWBnJkY5kVjar+dUkRVR1CkHWAzq0Bjr/beEFIlGe4rl?=
 =?iso-8859-1?Q?XrleCIiYM/OvlVfQXNIyUGZc86IGy3qJnrF5yNmAfZdLjnc1HSS6rQ913L?=
 =?iso-8859-1?Q?y4FXuH7hatonp6SozaZxr3yxJEWOrw46wYNrWyTihofglJ5bm7qH1j2XPa?=
 =?iso-8859-1?Q?b7bRiN30tdmfZTyaf/jmHuO41OCRMgAHhnA27OIfirIK/aMcurxTGqGVTO?=
 =?iso-8859-1?Q?iCimN2ZuKRkDgBicu2X7JLQjIJe3EzlqlccpmWG+vHjCqfC9rTzHc4D2uv?=
 =?iso-8859-1?Q?jEVQTooegYWNfszY6i82nwi3nPvhJ2Ooa+jW6AMWP+yh3x1mrsZG2OBqBy?=
 =?iso-8859-1?Q?W8cget6hqWIA/FvBsde1HJibfe0zrc0qdmd/umDyA1ec+K9tcO7jalGW6C?=
 =?iso-8859-1?Q?2ToVJqBZorPpCEaG70linT+vEcTYmNKLUmwN4QpBBJ5hxRl6Fc1p/k67Oo?=
 =?iso-8859-1?Q?IaNhlT+p5ZNw63odNxw0TJJzR+JoCbNgXt3fR4grHLzNhfTWxYoV+Hz1e+?=
 =?iso-8859-1?Q?F/Fw8MB8ulkgHoRIJ01fj+dewWYB1W008QU9ReS/2q0qhwif7z6cqevvt9?=
 =?iso-8859-1?Q?vzqMMlp+qXc4KFSl8zGbO6N39/xLVfokoVFwYMkrLHPNkNffyZPrqG8xYy?=
 =?iso-8859-1?Q?/QhKCjb4OamvI4ndVHxTMRvu63X0RODQw7RrIinvIFC+PJfAoxTesuiewB?=
 =?iso-8859-1?Q?CCysnGCm8WIvzToxGfnJI18wDGB4p2ueEDHUblNw0qli8Iu8sE7WndTDJh?=
 =?iso-8859-1?Q?hy7DsN4QkBpV1N/kM0quCoGnhP7HRX8EZZIxraPu8X9fVbvq2qGSGXiwLt?=
 =?iso-8859-1?Q?ETpq9JSd62pvQqouCP5dqaVXRje0bWp9Zf/5MvdUBrKT3hjs1dXWzNGWq2?=
 =?iso-8859-1?Q?COFZSpeo5qzGhGIGOdf3GiFrsvhy4KpDWDNd1uKV2ZBBai+KwjjoiCIoI+?=
 =?iso-8859-1?Q?8rTpPKwsINCOZiQdokI5A+RvXZak4BmiD68cvjWU5xeMO0tkOF0ylyQQOO?=
 =?iso-8859-1?Q?+UoMjICKxcU29BpmXmgFssZXsu3mdscfW3gnrbDXKYIcKo4FtB0bpshIlQ?=
 =?iso-8859-1?Q?zy1u8PInle8zP5D6O9pmZQzzBn3v9mArmYRjca/2vhkAKxF5z34bAjZ03H?=
 =?iso-8859-1?Q?DQZQ2lp6UL3Arv3nmhxe9BRtdA12Nm5gk10b16BTa3mYJ1b1y1KwpKxCkH?=
 =?iso-8859-1?Q?kNmIFUedqup5IHdeUQRtn18y8nTM2FuYvZZv5kEBqbCoZOUFd97JkhI63a?=
 =?iso-8859-1?Q?B6RCo8sb1IKdqlIYjCCRHyLm3Vqc/44KVWHH6TPKkJ8iTgRrr6+B7grc0i?=
 =?iso-8859-1?Q?GHaLGUQ1v5xPmM1yfmrVDqW+p7NzaCM6X4JtyNIArUC1DSrexN/7MKww?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1384febc-48d2-4958-1e39-08dcdc127c4f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 20:58:33.4852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XYZ+mukSWwrXrdXwS/3ngN6z6WUDgaRwCX0Dw1OOE7tvTpxCg7KslmIQl35Wnfm1qqRdB+XW9G0Pf4TVeVYbJuHWPnCIeKheo5k6uObXrCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6880
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

On Mon, Sep 23, 2024 at 11:45:53PM GMT, Ville Syrjälä wrote:
>From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
>The gen12+ check seems pointless when we already check for
>4tile specifically, so just get rid of it. Also drop the
>redundant comments.
>
>Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> tests/intel/kms_frontbuffer_tracking.c | 6 +-----
> 1 file changed, 1 insertion(+), 5 deletions(-)
>
>diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
>index f1bef9ab85ff..0646af62e51c 100644
>--- a/tests/intel/kms_frontbuffer_tracking.c
>+++ b/tests/intel/kms_frontbuffer_tracking.c
>@@ -4766,17 +4766,13 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>
> 					igt_require(igt_draw_supports_method(drm.fd, t.method));
>
>-					/* Tiling Y is only supported on GEN9+ */
> 					if (t.tiling == TILING_Y) {
> 						igt_require(AT_LEAST_GEN(drm.devid, 9));
> 						igt_require(!intel_get_device_info(drm.devid)->has_4tile);
> 					}
>
>-					/* Tiling 4 is only supported on GEN12+ */
>-					if (t.tiling == TILING_4) {
>-						igt_require(AT_LEAST_GEN(drm.devid, 12));
>+					if (t.tiling == TILING_4)
> 						igt_require(intel_get_device_info(drm.devid)->has_4tile);
>-					}
>
> 					if (tiling_is_valid(t.feature, t.tiling))
> 						draw_subtest(&t);
>-- 
>2.44.2
>
