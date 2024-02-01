Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C655C4828D
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 20:35:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311F810E3A4;
	Thu,  1 Feb 2024 20:35:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RaCjr3yI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7EFB10E3A4
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 20:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706819745; x=1738355745;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=l4jpsS1Dz1MRwQfSWFjPjp5a3agLDduyjtM2pQJ1pPE=;
 b=RaCjr3yIIpa3Asq0Vo6MLCwnmmQe2hy/DoBw+shmy3P27AYWX4MKuUQU
 yAZ7LdeYozEszAFxpWUOspNR4/7bBdFRE3X9KGK61D3xJBX+W3qBUzpLd
 H2MJ7wQygDnISROF3g/xkguaUH0FR1u6brua64WwbrPAxXR0AX5JLJ5xl
 5uanEcEiXbY+LR/vlpXry0b8k7nNAm+SO3fcldryipAhzH2tox8ef33ac
 ooOfCGGQx/YcT5H1FWg19PDpBRlgNGUybjTnB1okKCOqGTIPCMdcofmre
 VQS/xQU+NaEUY/OQWJTc/jZAIdmiFOKLkyU3IREuuH/OMmSDrTQ4KEOGu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="407715119"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="407715119"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 12:35:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="4519529"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 12:35:45 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 12:35:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 12:35:44 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 12:35:44 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 12:35:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mo4F/h3dUp1txaj+xxeh/WNIQDzjkCOh6+Km8RPXzYP67/IqXnNEyyzeDX5FjHkOq5XHlaJsp1rGdjDC/P1l/G+E2IFJlpdnEFfVvuPD4IyPxnJ3LdEfmWk2RN9A6dlEr5rTXWsgEC0YKut5vhKsA+B4oygp8Im418TJ/SY1OJJyjl+ri5f/h86mZp4hu5Hmu4YBFptRYsatr8PP3BHTNQ6kiU3xWc7X9G1MohbJEFBSvC0sssFtbQmPi5TyTARscVswwa9TxZjOXHZKYzpBZM2xMzv9KQT97BrpzJvq3sz5ygjIP1EGQ8X5oDTIk7cxBWKBKHvFZ7ZscE97HljVaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKCCQpIp0vsHhnZRZcUlwrj86s71dtoPmwpISRGIGfE=;
 b=SF+Qk/0LMb9ZaCty7Pvz0H3WH5VKCtJ+Z7jEIIluMllA504KH6gwDYr0YZ2GvpFwFETjyj3tMvTXRomKC8VE+RD553Fs+eYemCpAmM9mNSCBPQj3l/7Tzouljio95aaRnWbR6u9Gr39DZDnQXXF47+I/NPifhdcAS4cBboZFsODDlF/iZSeHdFI4uBbYFn7e4SH8fcZeaIUrxow9ykzXSBC+ET1NoTYlgqN5ySYk9w9J8szkfre5hNOfpi2yDmtt0DmPkd4X4zdxHRoumWFXqNTTrKNnHcGyABOXWQWDeEbHlzv9Y7l5KMSc0G7rtNO0UozQot/EoPxSBq6FBoU5Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB8269.namprd11.prod.outlook.com (2603:10b6:a03:478::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Thu, 1 Feb
 2024 20:35:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.025; Thu, 1 Feb 2024
 20:35:34 +0000
Date: Thu, 1 Feb 2024 14:35:32 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 fdinfo: drive-by changes
Message-ID: <eq3lqzrqxkwunlhauesjlk2pqkdxb5zxlhmsb37byvoi376rxm@ywovtkc2zrfb>
References: <20240201004744.352041-1-lucas.demarchi@intel.com>
 <170675928583.878359.9222919154293268966@5338d5abeb45>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <170675928583.878359.9222919154293268966@5338d5abeb45>
X-ClientProxiedBy: SJ0PR05CA0069.namprd05.prod.outlook.com
 (2603:10b6:a03:332::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f0ea02a-6548-46e4-2c73-08dc23655782
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CG6+elX2MiiBQICqfXoadcaaNjczdT8Cngec0xm0dhZqw3bYJDFkVJo+9OJrWfnUhId1N8T/SaMigRBr8mo5y5E5sEzIb9Zzwe/fqA4euH24r6OHQwP7GmQk9gV8ac+9Hj7881Wkw3runl8/wDMr4LwOnbBevig2T3lUD3roarZVlo1usqGmdz3YNK+l0d0VzSThs8jf6FKAtx2H7xkOvBRUnfcI1Z/zUZ+N9nHRBAQQctyXPvkc4ZRIeuQ5JNpHk/qONaHvBG/HzkwTFxcVm7gTPkDPJKxgGlYPdVtbljQGEoC8LKri0xEKBkTqnFbaOfmKyFrFIK/y+ljLySbY6MH7tfv+uq9V/G9n3xDSQejOddabinB0yYLfm+U2J30+v4GbUAXasVss3wT4VibpjuPa7IuhHipEtC30PKMbOhCkJbAGSbngzh080+to4OkmwABCNgItl2hm2mGPOGQIYNKNOEgUdLLfTyVBoxsrnt6yUFN5D0j0e0cRhTWECKxC4bg/NHMbR4ZYwQGSLLBCCyWbvK9T9j1A8BJoC6idnrvrgiR5CuannblQgH/iF+oNgTkmubBRWh6i8MA9TY/pa6f5ZlBx9ceMabBEwtfFmrHaqB2WfVVyhMVftRduZhn7LhnghWbl8qndc4JX9BcFUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(346002)(366004)(39860400002)(396003)(376002)(230922051799003)(230173577357003)(230273577357003)(64100799003)(451199024)(186009)(1800799012)(6506007)(41300700001)(33716001)(38100700002)(82960400001)(86362001)(66946007)(6916009)(8936002)(478600001)(316002)(6512007)(966005)(66556008)(66476007)(5660300002)(26005)(6486002)(2906002)(83380400001)(9686003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fQk9dhRtbho8ZgPjE6Sg1wYs3r9fnPRDKgKM9960lH+fAKzbU+ORE/UF9tld?=
 =?us-ascii?Q?SIOC7RBAzAkk128YhNUm0Kf6DiDwLrrzuYamreapF0fbCSWdVKiU8QwTx5jx?=
 =?us-ascii?Q?OKarrmYgqtfu8X7OfD/qGg+VVZvqhtL+twSS1UZb94TURGoZGswbx71Uxq2+?=
 =?us-ascii?Q?+k0GiMDQJiCiMoqNDi5hEHzWmG8piymzzt1HV0vx2FqPXKzps1Yit5Dkh4RG?=
 =?us-ascii?Q?4sq9CJJ4yIGSyW5BUZRxox/rt4mqYTYwTO4wvoKwXrcrlbbPqKXrns8GJMiz?=
 =?us-ascii?Q?hVtmfF5U3uik0Zu29zYjIo5Ic5in1gbpEqBEP2eeT/wQSzB/Yq+RK+mn0AQK?=
 =?us-ascii?Q?BNfHZoM63grB7aTSM4OJe294uolnwhK4hbaJpkGyUCMJHUBZMuZZiNNV1ZD+?=
 =?us-ascii?Q?aiW1AEp0O9+54pGPwfGX90QqNfd6Ifm4IlflL3Ggy6Qn+tBvbMLttt1qIgyV?=
 =?us-ascii?Q?W8Y1/cKTmhMCSeeYnZ1NbKZohBRAI+e6FQa9vxJojaanT+qUWntlYHWifLLx?=
 =?us-ascii?Q?JpH2PLdZwl5t3FWv7LmVE6LtqSLqI01XPYluSHE5HnAChyIMvQjKFTyBxg+r?=
 =?us-ascii?Q?QUuOcKjQinB/dTa6RQOp4VP9n30Qj3K1YTyvakdi0/sctvoqHOyZBVjudpUx?=
 =?us-ascii?Q?Sf7CGbR12pFEgimMqEWOu+ctXIkz8op+j+UlPsftpuAKOzNHlJ76gfhOdKho?=
 =?us-ascii?Q?wW6QP9dKG1bphCdgbjGXXoXUdO280sgaS7xRQulkgsG/q3gPMpcvZFx+dh10?=
 =?us-ascii?Q?rHn72mZy2rXosRsl1DgHWVbC9XVISMAm4sN7W50Jn45CEsFYHsfeCjCxzmZi?=
 =?us-ascii?Q?m8gJyQnavLiKXJxDvHzh1CYbb1+56TpJhcTT00xOz9K76KKe4NPc3rSsakbe?=
 =?us-ascii?Q?yRMmQxU0Mgwq17KDZATRuZwQQGP1FXbHOOdtiYBFYGLshPDjyEb8jNGGO1Mh?=
 =?us-ascii?Q?YU4tlW9C1g1wmGySvBo7jD3B0eh1gUCGs05Ko3nFNK3MAHxYAVDT5RYMLYTP?=
 =?us-ascii?Q?MXzyoOVX2ZsyUXhBmLIKi8oYhthdsXtFf9mKY13/i1J5c7ZERCljhpl5rNB/?=
 =?us-ascii?Q?8LLae483JcKZWGGfXKupjYyuG0HnV4MrFMMHqnn9Rh43s8GIFQzjUVx4aON7?=
 =?us-ascii?Q?c1i/FZmGF+tSlVwzAZnjv5hNfn27mN7RZiGF84honqgquUrjagpMvb4XrM4R?=
 =?us-ascii?Q?uAQ6EkAxagzdz6VQSkia1aGs66ZscRmcy+G49K7eBkrYniHIbFwpN5rkuh7s?=
 =?us-ascii?Q?0iCDhDttYdgEHYITg9GcV2ePX+0ZcARSEJ2AEl9TtxclVYg15RU9L0KFm27V?=
 =?us-ascii?Q?lFXf9pHdp78g7FkN/m8kge2AEQNP124KekFatNvkMm2AgLAnBRXfNDYYDEaD?=
 =?us-ascii?Q?9H+/HmLhCSFgbLRgSKKI98GcNmb9FRz+IMbaLYtY7aV3JoUFOP0Qe5z+mfiA?=
 =?us-ascii?Q?ViuNR7p4FTvJDYDVEvC4Cy5gpUcV+OqlhqJ1BAm/kUr0iyTSk2+fROd6Rol1?=
 =?us-ascii?Q?AdWjzfeaQ5fvbQ+GSwVfcYIjt8AtI0PmZfILXsRW7MW1um+S66MnC4pKLvpZ?=
 =?us-ascii?Q?0i4ivsf/azaeXkbpcn4jqoWPxSa3E1EtNEY25JZ/ddGlPaP67CEK5zgSm8lG?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0ea02a-6548-46e4-2c73-08dc23655782
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 20:35:34.8648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2El/wg+YRgPQuOeJpHmyuKDRkAQEZYy0Cwu2wvS9dv4ydr2k6B3GJMWcGLEc8ib6V8RXVhUbApM4vfPEPQ/kDb9vddaEo6Lvf6dwb3VCD0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8269
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

On Thu, Feb 01, 2024 at 03:48:05AM -0000, Patchwork wrote:
>== Series Details ==
>
>Series: fdinfo: drive-by changes
>URL   : https://patchwork.freedesktop.org/series/129394/
>State : failure
>
>== Summary ==
>
>CI Bug Log - changes from IGT_7699_full -> IGTPW_10616_full
>====================================================
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with IGTPW_10616_full absolutely need to be
>  verified manually.
>
>  If you think the reported changes have nothing to do with the changes
>  introduced in IGTPW_10616_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in CI.
>
>  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10616/index.html
>
>Participating hosts (8 -> 8)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in IGTPW_10616_full:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-4:
>    - shard-dg1:          [PASS][1] -> [FAIL][2]
>   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/shard-dg1-18/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-4.html
>   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10616/shard-dg1-19/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-4.html


unrelated change. Pushed, thanks for the review.

Lucas De Marchi
