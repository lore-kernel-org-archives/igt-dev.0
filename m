Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 291D2C3DA42
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 16:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F266810E2D3;
	Wed, 17 Jul 2024 16:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HchkhV+K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B00310E2D5
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 16:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721233516; x=1752769516;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=h0Nw0vdQrmzkPNWZwAnFHyBKeFL9kchBgNUyl4U8rGM=;
 b=HchkhV+KJEA8OfVV8nt8oe6tpaSmU7CmdmQwwov2VZ8787VQd5NoUu3j
 Hyvt4TNjvbLTVUBoSokYYZmrund2aM3qIfLeZva9rhzU/dSfdLMk1MAP4
 qVXojGYgZx1Zb+ek8KTu/HN1iJOXjf9NVV0EaKsj3rvue82VDAg+e5lJs
 pP+rGurKCiIkHjvTogw+sJMB3vu/3bbTplclMVIt08QB7wIZm2TLCfrrf
 9tsntWL0DSwzh4kzL70bU9Qg9V5555O0Kzm82fnhHPf9rxHaqOSJ0ZRMp
 e7jalkNiCD7ciyWCsUIGePWpoRg8Kjj+LdPoGyO+Wb0mGX49U9emHRcj+ w==;
X-CSE-ConnectionGUID: KQurbA0pQ5yxlL6soQ6Zjw==
X-CSE-MsgGUID: +Qqs7MZEQYK6+EtQ3LTpfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18702565"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="18702565"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 09:25:15 -0700
X-CSE-ConnectionGUID: Bq8hHRQxRTWCtwGKmBN85g==
X-CSE-MsgGUID: ppMI+DIPSq+roLSlvG92hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="54770912"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 09:25:16 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 09:25:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 09:25:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 09:25:14 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 09:25:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBU7ogFwlHDg4WU8Ygey1gxJLNVGmy+IUjat4i0NvJRQCLxpZn06v+P5+JKLyBMT6K7R20txJ3hGO4aWdX2qfuVL/IJ8klFn8zLlfk2wnV/XB2lyE2biWXD8rxH4wxX7pyAQE7tYb5U3Pea75W9T41oFSZIw14gVdX6K0/GLqAF0P+BcFZFKrbpLrJ1/+arken+fTDr0/C6mMBVnswW5ZypPNqLxQzf9m9jCJ6/AXqxqPlJvBJX2zWTYWRM2xVDjHadnoZfgDKnXRVbTayUnDDeSthqjeDR4n/0beq7uGFoaCOyIslSK54nEPrbcRnHSWTATM89ZHL6VGNaL89cebA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyIJ/PLgRUpnk4le+a+4kyT6/kGxUOmrTaTkHErWGRc=;
 b=ICBOjMHGSalM4FZtkVVR+fe2Ajxl7orRk9E9MgS2FxvPo7glFzFV/XoQSynMY8CZvxpOa8vOUVruk4qT4kpAjZe0Js868kmHl4pb6dIUiO2e61NiT/eYs/34apBsTmxbqK9Xfu0fASQu2g74LFZNiKh9ekwmsFtSSeZ1UAljcsC32LUWoRWY35AXjRzJxkUFlz6Ltu3f0Bln4NqJWy2ZQjQ1roPO395e5r5U6IMhtpAmjjS3ixN26vQAckuQQKjGtRQNUa8arCB3NouAnbi34BliI2YUMF/7frC1fJ3gLpzy3bqb3H8XqeMP1umEcSIgc5znDoggQ9ZMzroSzMV3ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA3PR11MB7653.namprd11.prod.outlook.com (2603:10b6:806:306::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Wed, 17 Jul
 2024 16:25:05 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.7784.016; Wed, 17 Jul 2024
 16:25:05 +0000
Date: Wed, 17 Jul 2024 18:24:58 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/1] tests/intel/xe_exec_mix_modes: Add new tests
 for parallel execution
Message-ID: <ZpfwWmkWK59Wi_-U@fdugast-desk>
References: <20240717123120.1065167-1-francois.dugast@intel.com>
 <20240717123120.1065167-2-francois.dugast@intel.com>
 <ZpfLe93zxRyLZsa1@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZpfLe93zxRyLZsa1@DUT025-TGLU.fm.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: MI1P293CA0025.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::11) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA3PR11MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: 76be7b88-8fde-4fdf-262b-08dca67d048d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?DJEmdDs8StsyD6szgXyw9lHZqknGYz4xqUKswi7XAsCOPXwkJ4eOKBd5OO?=
 =?iso-8859-1?Q?6tHwFD3N5TXfESna4SlobuaBDvLHGsKKdXEQboIMwue3TKzcSnb+R9ajV2?=
 =?iso-8859-1?Q?Y+ZLXI4DOsz5+cnTHJZ4DoFBVjS96wnRTQspmpV4VK0T5vcfz8bMg6gBY9?=
 =?iso-8859-1?Q?zLNgwvmKWZPNwdD51dfX89Xpo+8D/8wcRUDbi/9boB1lH0/hPNEdboVmp3?=
 =?iso-8859-1?Q?ofyZRRhuGPRlzePEp5Musg1CP0e63MHk+34h4bVNZgxZS/If14CHdkD/yo?=
 =?iso-8859-1?Q?AottE77FmqH2bvGHN3DeEIWoNbAkYdtvSREAn7GLezMqzw8WnF+EQPdyfK?=
 =?iso-8859-1?Q?xAyZ11CYujFhWOi0EPoLxD1fPEc+I7rkYwUXNauPdLYvfiH6pyzEVOir3G?=
 =?iso-8859-1?Q?WqF55947vJvWManUt6S4ui8swDQcSAEorugb6bOcr6zEvJKAMJ6E3nhvfq?=
 =?iso-8859-1?Q?T3oXgkyj+CPepo1Z4jxI2P1sdKGw3Bir0195h32sqLdWHcnGA/hTRj9DB6?=
 =?iso-8859-1?Q?EQcDAs7LxY7NijkZNVI6Qo8qluAgiYwjJximBYDi7Ee/lqB3/cDiGTN5Zc?=
 =?iso-8859-1?Q?1eXx7aVcoZ3Bfgnpd5alvNIWAUJIq41ctTS8G1X5cluen3xbvCK8tukEUO?=
 =?iso-8859-1?Q?hy29pnyyQSSK34aeHYiMT1LHm+dldnzOg4kQQxY3wvqyLq2/6hDbTYvo6R?=
 =?iso-8859-1?Q?JzkgGZq9iraizOFYg7viGtynqTsFn/NOKzPySTVSW/OgfpHgUL/yla7rj4?=
 =?iso-8859-1?Q?4hhqA3Tg6njGiRPMTgXmel/XZSiw4d1pgv/TI/zOED1LwIh9NO0lf7zLaX?=
 =?iso-8859-1?Q?kfQDbEi4VDUyarvhCwfRonF2l+XcYnkMLj+CFUke4IpdcfmJCspVfFXiZk?=
 =?iso-8859-1?Q?FAaCsV0elmGDN9GVzZA8fd1IwvNP4K8ipowAyW+HAyNo6CPC+AgvHi0z+N?=
 =?iso-8859-1?Q?iI5WYFcVriEzCTKz0lpWGof8BXHYAY6EoLEWDDUrRMzVFCmVPLZJ6p9KSN?=
 =?iso-8859-1?Q?FC6u6P4nRexDeq4Yme7K7x4bxZEUM8+00fPyjeLY2abHuzlblHbwWVwQZJ?=
 =?iso-8859-1?Q?4qgvUQvsgpJzYI7BXr6mQaCw7AfOqgrEJv5gmSr5M5MZztFyVE+qtL5ctU?=
 =?iso-8859-1?Q?YBs7iZMsyYVReIj84ex68ug5NP9z/hEwiJhrl+ScbGkk/Bj8wtsWAuSdqn?=
 =?iso-8859-1?Q?hkrSUqk73wH3lUmKgMRjyJOOU9udXogvH8cdpsTYjHK/m6tlzURcoCLtsd?=
 =?iso-8859-1?Q?JPGPHSlOFrvj5Coqc5KbJlBX5BgFm4Bj4H4B1RfoYmcFK35aXydz3q+haI?=
 =?iso-8859-1?Q?FOXDv7U5lU4qlC6IaJhvw1qT8pWDkJT0fFOOaAUQPL1rO323jkzlpwXKhy?=
 =?iso-8859-1?Q?1V3/BYNc7MWAcys+JvQdb5M94WwaCysg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9MwigeJ1lHzvv8bUf83Jjsth9TReAfULRHpbSGR8irWpTnvn4NhAtnu9D6?=
 =?iso-8859-1?Q?6WErDeKxyZ6ftRnF1SlPpcR3ozfCdv+ZutnNbuS9qd3HtA+Jrcc1UTp5Pr?=
 =?iso-8859-1?Q?I91VaOHGLQPqrUmZpSBOaEuIu8myqAAU1GNQr1X7f9HyR5HwT8aeWXV7eP?=
 =?iso-8859-1?Q?tun94uZWcAM7GRjgxuZ/x+x2IW1U7RlQkU34A/EGYaYGYl/qwDc5s2chAI?=
 =?iso-8859-1?Q?3p+92e3lZcAyfqFArDu3o7tquXxGsA92T+Aju/5UgDTNU2pb7+B53h3dvI?=
 =?iso-8859-1?Q?84Lp6ITglqpYtEHzov7AEc2spD4fv3+dS7Rr5r5VSZZOqRgYuYoG1OZjgg?=
 =?iso-8859-1?Q?1/J5rBQ4NYAYQ7Yfz0oQ3S7efwQvWaalDhhdqtZPSm1R7CxQX6RNJDdvZh?=
 =?iso-8859-1?Q?craFaNpZj6CkZfRh+yjcC2tvF7S8yF8bpfm0pQ3U+aBdUpshcjOmIPBnVl?=
 =?iso-8859-1?Q?cn304ptFwje0s2UbFgPBEXEEcf3JbFwmvfffenO9e0kfC1jK838s6GHYCK?=
 =?iso-8859-1?Q?6ppxDgImS3eJEwvB/3DH06QuNP7DH4kUV5WPIvjWytarWqVXwLT/zbkp1z?=
 =?iso-8859-1?Q?T+t/f8UyhMo35m0DnPvBh1LzaYBQ9NZAmY82Z27x2OLmE4FZH2GakjrBKZ?=
 =?iso-8859-1?Q?Zx/Py2ZiMIymuz24Qo2I2CfTMurd3z9WcXpWVL14y2OpKPJDtnW7pUkKd7?=
 =?iso-8859-1?Q?qH1TF/+HuMMpUXIPmxZRi6lF9RZE8nlzKk1+n4n/FnX7es4N6kb36BWUIh?=
 =?iso-8859-1?Q?y2OU2ytI7FeZ1MG+q8excp1efzhdk7+4VeERw1k7dPd4lODz2+sMinLpIn?=
 =?iso-8859-1?Q?W0it1KsISgZiZfhtA0T6ELNe3UvcyPGjAu7PRR6mBreLx5NZ+VJ6/k15Nt?=
 =?iso-8859-1?Q?HeD2tef2hddBmfZF4ehKyiqj3U6EtQPjJomKicBrsmmK4mTli1RQitQHCq?=
 =?iso-8859-1?Q?QwqB9y/gyi4WFXtVNnKfcA7Bfl0nYfyzsZE4MwQMS9R98e1Le+WoTnWbb3?=
 =?iso-8859-1?Q?LH9iiHL10kvYgnMHT0MTZTT6DmDk7g6RQh7oPr5iiP8nvft+ZKE/QDvc4R?=
 =?iso-8859-1?Q?cab8utdiuXpq1XTdgyjULds9tgaaV3mppcBxGafQh4HwszqHhjFrsKeUP5?=
 =?iso-8859-1?Q?KjSP3sWPuz+5PyJjGFMHe4kLYspPj18wXR41Oa2pSI+hO+i8lg1NktYrvF?=
 =?iso-8859-1?Q?3WHeIf767RFWrX4EKgATk3sAMDzU8VCMV6q+aWQylCVN+d0sYmq4XF4iCI?=
 =?iso-8859-1?Q?ezrtH3OuPkFj5ZBQ/V1eO0WBX3AvaxJL3k/KWFtsAfWKlcY3Y9uk6MzM84?=
 =?iso-8859-1?Q?IjvEkvEVw+O83XMTzCyIdoxuBTkfGanSdFL49GGMu/IB2iMJWunGyoq1ml?=
 =?iso-8859-1?Q?Dkt8B54dniYBG5ZRc/D62JBFJOKcClEo1hCoEgxnHYMOfP9v2R2U4HFe4a?=
 =?iso-8859-1?Q?A9QQJ6Rb4WLZPl7rw095T1iVspj4Ls48C1VGzxkH1s9N92PmDHaIKuwr5z?=
 =?iso-8859-1?Q?zBI7hsxtknFVjbi9IytXDSqXdE0Z6YN8zm/+1IuzQ9/ZsQk8BEXi6NwVMF?=
 =?iso-8859-1?Q?cKLLL9tG0fGhCJY2BsCVlvzBIWeVpp6nf64+M8hTDW6kOnqlUlN9fF47I/?=
 =?iso-8859-1?Q?M8BOTKKb/rBLUpRQUhVGjStUiQstqGQaJVpfUabHrg2oTepJfnegihOg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76be7b88-8fde-4fdf-262b-08dca67d048d
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 16:25:05.8867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d+sKxNcIjmiAeRiUxwcJ2m3Qbx8u6rGgECcYQpb8B7e5JsR4kRD+tXHqGfdccS6rbymtYyo6CM3wjBQPnSDr8n6/5eLo+gTT2JnAtllf8vU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7653
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

On Wed, Jul 17, 2024 at 01:47:39PM +0000, Matthew Brost wrote:
> On Wed, Jul 17, 2024 at 02:30:48PM +0200, Francois Dugast wrote:
> > Test parallel execution of LR and dma fence jobs on the same device.
> > 
> > Add the following tests:
> > * "exec-simple-batch-store-lr"
> > * "exec-simple-batch-store-dma-fence"
> > * "exec-spinner-interrupted-lr"
> > * "exec-spinner-interrupted-dma-fence"
> > 
> 
> Really good test, a couple of nits / questions.

Thanks for the review.

> 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  tests/intel/xe_exec_mix_modes.c | 277 ++++++++++++++++++++++++++++++++
> >  tests/meson.build               |   1 +
> >  2 files changed, 278 insertions(+)
> >  create mode 100644 tests/intel/xe_exec_mix_modes.c
> > 
> > diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_modes.c
> > new file mode 100644
> > index 000000000..44265b220
> > --- /dev/null
> > +++ b/tests/intel/xe_exec_mix_modes.c
> > @@ -0,0 +1,277 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +/**
> > + * TEST: Test the parallel submission of jobs in LR and dma fence modecs
> > + * Category: Core
> > + * Mega feature: General Core features
> > + * Sub-category: CMD submission
> > + * Functionality: fault mode
> > + * GPU requirements: GPU needs support for DRM_XE_VM_CREATE_FLAG_FAULT_MODE
> > + */
> > +
> > +#include <fcntl.h>
> > +
> > +#include "igt.h"
> > +#include "lib/igt_syncobj.h"
> > +#include "lib/intel_reg.h"
> > +#include "xe_drm.h"
> > +
> > +#include "xe/xe_ioctl.h"
> > +#include "xe/xe_query.h"
> > +#include "xe/xe_spin.h"
> > +#include <string.h>
> > +
> > +#define FLAG_EXEC_MODE_LR	(0x1 << 0)
> > +#define FLAG_JOB_TYPE_SIMPLE	(0x1 << 1)
> > +
> > +#define NUM_INTERRUPTING_JOBS	5
> > +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> > +#define ONE_SEC			MS_TO_NS(1000)
> > +#define VM_DATA			0
> > +#define SPIN_DATA		1
> > +#define EXEC_DATA		2
> > +#define DATA_COUNT		3
> > +
> > +struct data {
> > +	struct xe_spin spin;
> > +	uint32_t batch[16];
> > +	uint64_t vm_sync;
> > +	uint32_t data;
> > +	uint64_t exec_sync;
> > +	uint64_t addr;
> > +};
> > +
> > +static void store_dword_batch(struct data *data, uint64_t addr, int value)
> > +{
> > +	int b;
> > +	uint64_t batch_offset = (char *)&(data->batch) - (char *)data;
> > +	uint64_t batch_addr = addr + batch_offset;
> > +	uint64_t sdi_offset = (char *)&(data->data) - (char *)data;
> > +	uint64_t sdi_addr = addr + sdi_offset;
> > +
> > +	b = 0;
> > +	data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> > +	data->batch[b++] = sdi_addr;
> > +	data->batch[b++] = sdi_addr >> 32;
> > +	data->batch[b++] = value;
> > +	data->batch[b++] = MI_BATCH_BUFFER_END;
> > +	igt_assert(b <= ARRAY_SIZE(data->batch));
> > +
> > +	data->addr = batch_addr;
> > +}
> > +
> > +enum engine_execution_mode {
> > +	EXEC_MODE_LR,
> > +	EXEC_MODE_DMA_FENCE,
> > +};
> > +
> > +enum job_type {
> > +	SIMPLE_BATCH_STORE,
> > +	SPINNER_INTERRUPTED,
> > +};
> > +
> > +static void
> > +run_job(int fd, struct drm_xe_engine_class_instance *hwe,
> > +	enum engine_execution_mode engine_execution_mode,
> > +	enum job_type job_type)
> > +{
> > +	struct drm_xe_sync sync[1] = {
> > +		{ .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> > +	};
> > +	struct drm_xe_exec exec = {
> > +		.num_batch_buffer = 1,
> > +		.num_syncs = 1,
> > +		.syncs = to_user_pointer(&sync),
> > +	};
> > +	struct drm_xe_ext_set_property ext = {
> > +		.base.next_extension = 0,
> > +		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> > +		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
> > +		.value = 2, /* High priority */
> > +	};
> 
> I don't understand why setting High priority here. Can you explain?

No reason for it, it was a left over from earlier experiments and will
be removed in the next version.

> 
> > +	struct data *data;
> > +	uint32_t vm;
> > +	uint32_t exec_queue;
> > +	size_t bo_size;
> > +	int value = 0x123456;
> > +	uint64_t addr = 0x100000;
> > +	uint32_t bo = 0;
> > +	unsigned int vm_flags = 0;
> > +	struct xe_spin_opts spin_opts = { .preempt = true };
> > +	const uint64_t duration_ns = NSEC_PER_SEC / 2; /* 500ms */
> > +	struct timespec tv;
> > +
> > +	if (engine_execution_mode == EXEC_MODE_LR) {
> > +		sync[0].type = DRM_XE_SYNC_TYPE_USER_FENCE;
> > +		sync[0].timeline_value = USER_FENCE_VALUE;
> > +		vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE;
> > +	} else if (engine_execution_mode == EXEC_MODE_DMA_FENCE) {
> > +		sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
> > +		sync[0].handle = syncobj_create(fd, 0);
> > +	}
> > +
> > +	vm = xe_vm_create(fd, vm_flags, 0);
> > +	bo_size = sizeof(*data) * DATA_COUNT;
> > +	bo_size = xe_bb_size(fd, bo_size);
> > +	bo = xe_bo_create(fd, vm, bo_size,
> > +			  vram_if_possible(fd, hwe->gt_id),
> > +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +	data = xe_bo_map(fd, bo, bo_size);
> > +	if (engine_execution_mode == EXEC_MODE_LR)
> > +		sync[0].addr = to_user_pointer(&data[VM_DATA].vm_sync);
> > +	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, &sync[0], 1);
> > +
> > +	store_dword_batch(data, addr, value);
> > +	if (engine_execution_mode == EXEC_MODE_LR) {
> > +		xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
> > +		sync[0].addr = addr + (char *)&data[EXEC_DATA].exec_sync - (char *)data;
> > +	} else if (engine_execution_mode == EXEC_MODE_DMA_FENCE) {
> > +		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> > +		syncobj_reset(fd, &sync[0].handle, 1);
> > +		sync[0].flags &= DRM_XE_SYNC_FLAG_SIGNAL;
> > +	}
> > +	exec_queue = xe_exec_queue_create(fd, vm, hwe, to_user_pointer(&ext));
> > +	exec.exec_queue_id = exec_queue;
> > +
> > +	if (job_type == SPINNER_INTERRUPTED) {
> > +		spin_opts.addr = addr + (char *)&data[SPIN_DATA].spin - (char *)data;
> > +		spin_opts.ctx_ticks = duration_to_ctx_ticks(fd, 0, duration_ns);
> > +		xe_spin_init(&data[SPIN_DATA].spin, &spin_opts);
> > +		if (engine_execution_mode == EXEC_MODE_LR)
> > +		    sync[0].addr = addr + (char *)&data[SPIN_DATA].exec_sync - (char *)data;
> 
> Identation looks off here.

Will fix.

> 
> > +		exec.address = spin_opts.addr;
> > +	} else if (job_type == SIMPLE_BATCH_STORE) {
> > +		exec.address = data->addr;
> > +	}
> > +	xe_exec(fd, &exec);
> > +
> > +	if (job_type == SPINNER_INTERRUPTED) {
> > +		enum engine_execution_mode interrupting_engine_execution_mode;
> > +		if (engine_execution_mode == EXEC_MODE_LR)
> > +			interrupting_engine_execution_mode = EXEC_MODE_DMA_FENCE;
> > +		else if (engine_execution_mode == EXEC_MODE_DMA_FENCE)
> > +			interrupting_engine_execution_mode = EXEC_MODE_LR;
> > +		xe_spin_wait_started(&data[SPIN_DATA].spin);
> > +		igt_gettime(&tv);
> > +		for (int i = 0; i < NUM_INTERRUPTING_JOBS; i++)
> > +		{
> > +			run_job(fd, hwe, interrupting_engine_execution_mode, SIMPLE_BATCH_STORE);
> > +			/**
> > +			 * Executing a SIMPLE_BATCH_STORE job takes significantly less time than
> > +			 * duration_ns.
> > +			 * When a spinner is running in LR mode, the interrupting job preempts it
> > +			 * in KMD and should complete fast, shortly after starting the spinner.
> > +			 * When a spinner is running in dma fence mode, the interrupting job waits
> > +			 * in KMD and should complete shortly after the spinner has ended.
> > +			 * The checks below are to verify preempting/waiting happens as expected
> > +			 * depending on the execution mode.
> > +			 */
> > +			if (engine_execution_mode == EXEC_MODE_LR)
> > +				igt_assert(igt_nsec_elapsed(&tv) < 0.5 * duration_ns);
> > +			else if (engine_execution_mode == EXEC_MODE_DMA_FENCE)
> > +				igt_assert(igt_nsec_elapsed(&tv) > duration_ns);
> > +		}
> > +	}
> 
> Should we also run the 'NUM_INTERRUPTING_JOBS' loop here? i.e.
> simple-batch-store-lr / simple-batch-store-dma-fence test opening VMs in
> both modes doing a simple store (no preemption)?

Yes this is a good improvement and only requires a minor change.

> 
> We'd have to protect again infinite recursion though but adding flag to
> protect against that should be easy. e.g.
> SIMPLE_BATCH_STORE_NO_RECURSION.
>  
> > +
> > +	if (engine_execution_mode == EXEC_MODE_LR) {
> > +		if (job_type == SPINNER_INTERRUPTED)
> > +			xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync, USER_FENCE_VALUE, 0, ONE_SEC * 2);
> > +		else if (job_type == SIMPLE_BATCH_STORE)
> > +			xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync, USER_FENCE_VALUE, 0, ONE_SEC * 2);
> > +	} else if (engine_execution_mode == EXEC_MODE_DMA_FENCE) {
> > +		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> > +		syncobj_destroy(fd, sync[0].handle);
> > +	}
> > +
> > +	if (job_type == SIMPLE_BATCH_STORE)
> > +		igt_assert_eq(data->data, value);
> > +
> > +	munmap(data, bo_size);
> > +	gem_close(fd, bo);
> > +	xe_exec_queue_destroy(fd, exec_queue);
> > +	xe_vm_destroy(fd, vm);
> > +}
> > +
> > +/**
> > + * SUBTEST: exec-simple-batch-store-lr
> > + * Description: Execute a simple batch store job in long running mode
> > + *
> > + * SUBTEST: exec-simple-batch-store-dma-fence
> > + * Description: Execute a simple batch store job in dma fence mode
> > + *
> > + * SUBTEST: exec-spinner-interrupted-lr
> > + * Description: Spin in long running mode then get interrupted by a simple
> > + *              batch store job in dma fence mode
> > + *
> > + * SUBTEST: exec-spinner-interrupted-dma-fence
> > + * Description: Spin in dma fence mode then get interrupted by a simple
> > + *              batch store job in long running mode
> > + */
> > +static void
> > +test_exec(int fd, struct drm_xe_engine_class_instance *hwe,
> > +	  unsigned int flags)
> > +{
> > +	enum engine_execution_mode engine_execution_mode;
> > +	enum job_type job_type;
> > +
> > +	if (flags & FLAG_EXEC_MODE_LR)
> > +		engine_execution_mode = EXEC_MODE_LR;
> > +	else
> > +		engine_execution_mode = EXEC_MODE_DMA_FENCE;
> > +
> > +	if (flags & FLAG_JOB_TYPE_SIMPLE)
> > +		job_type = SIMPLE_BATCH_STORE;
> > +	else
> > +		job_type = SPINNER_INTERRUPTED;
> > +
> > +	run_job(fd, hwe, engine_execution_mode, job_type);
> > +}
> > +
> > +igt_main
> > +
> > +
> 
> Extra whitespace.

Will fix.

> 
> > +{
> > +	struct drm_xe_engine_class_instance *hwe;
> > +	const struct section {
> > +		const char *name;
> > +		unsigned int flags;
> > +	} sections[] = {
> > +		{ "simple-batch-store-lr", FLAG_JOB_TYPE_SIMPLE | FLAG_EXEC_MODE_LR },
> > +		{ "simple-batch-store-dma-fence", FLAG_JOB_TYPE_SIMPLE },
> > +		{ "spinner-interrupted-lr", FLAG_EXEC_MODE_LR },
> > +		{ "spinner-interrupted-dma-fence", 0 },
> > +		{ NULL },
> > +	};
> > +	int fd;
> > +
> > +	igt_fixture {
> > +		struct timespec tv = {};
> > +		bool supports_faults;
> > +		int ret = 0;
> > +		int timeout = igt_run_in_simulation() ? 20 : 2;
> > +
> > +		fd = drm_open_driver(DRIVER_XE);
> > +		do {
> > +			if (ret)
> > +				usleep(5000);
> > +			ret = xe_supports_faults(fd);
> > +		} while (ret == -EBUSY && igt_seconds_elapsed(&tv) < timeout);
> > +
> > +		supports_faults = !ret;
> > +		igt_require(supports_faults);
> 
> I was unsure why this code was added in xe_exec_fault_mode, so had to
> look:
> 
> git format-patch -1 8abb25ffe58
> 
> If you read the explaination for that it because we don't support mixing
> faulting and non-faulting VMs being open at the same time + races
> closing the VMs. With your KMD series we support having both a faulting
> VM and non-faulting VM open so this loop is not required.
> 
> e.g. I think you can just do this:
> 
> igt_fixture {
> 	fd = drm_open_driver(DRIVER_XE);;
> 	igt_require(xe_supports_faults(fd));
> }

Yes indeed, actually taking into account the logic for xe_supports_faults()
it should probably be along those lines:

	igt_fixture {
		ret = xe_supports_faults(fd);
		supports_faults = !ret;
		igt_require(supports_faults);
	}

> 
> Matt
> 
> > +	}
> > +
> > +	for (const struct section *s = sections; s->name; s++) {
> > +		igt_subtest_f("exec-%s", s->name)
> > +			xe_for_each_engine(fd, hwe)
> > +				if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
> > +					test_exec(fd, hwe, s->flags);
> > +	}
> > +
> > +	igt_fixture {
> > +		drm_close_driver(fd);
> > +	}
> > +}
> > diff --git a/tests/meson.build b/tests/meson.build
> > index 357db2723..e649466be 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -286,6 +286,7 @@ intel_xe_progs = [
> >  	'xe_exec_basic',
> >  	'xe_exec_compute_mode',
> >  	'xe_exec_fault_mode',
> > +	'xe_exec_mix_modes',
> >  	'xe_exec_queue_property',
> >  	'xe_exec_reset',
> >  	'xe_exec_sip',
> > -- 
> > 2.43.0
> > 
