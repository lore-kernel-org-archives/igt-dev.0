Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346A9C36014
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 15:17:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD72E10EBEB;
	Fri,  4 Apr 2025 15:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="naLWr0Uj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D16810EBEB
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 15:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743779845; x=1775315845;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TdB26Na5NS6WPdV3an9qcIoCJzzYqRNNWNFJtqcTQ8A=;
 b=naLWr0UjsMkP/tK9LiFvnRrSzeCyMzcvn3ZR0S/l4MuOeHQ8xRV8MEKU
 yOb/G207I9/LgY6nlSfTXuHfIJ2pY793RGKwHt0udxP5p8qVHC4oAup0B
 BoNSKd89jaIBSywKZVbk1C5H8/ys1LCbcCPuBMtxIMedOeHzXrfWy9UPy
 wpgitAztoJHmT+A6xjuew37Lsaz5YRsJYQjKytmImJXD8CAYANqjm6tkK
 FuApE5hNTGr8DQWAvV89Ie+zKKa5FTIqgpjaAfs/ws1mI55g+n1T5jOYk
 jkPZx2g8ExM1XOQ3v2dM7SJ/312P1J1YTTwYRN5BxTkCl3htSySb68PB9 A==;
X-CSE-ConnectionGUID: AJW8jjJEQ3mo5RBUIw3O0Q==
X-CSE-MsgGUID: GHOHwbNgQ9CObDrsnf+arg==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="44375202"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="44375202"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 08:17:24 -0700
X-CSE-ConnectionGUID: q63C3fhDTDy3HA1OFdBDPQ==
X-CSE-MsgGUID: jpVyStRgR6OG9+A3jMvQdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="132196339"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 08:17:24 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 4 Apr 2025 08:17:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 4 Apr 2025 08:17:23 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 4 Apr 2025 08:17:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cLiiWrbbF52BBWF/jLqBmbf1GvGh63SQPub3HTJKILzuqQdP84Hjd/E7lqM3Kt4PTWZkc+dUJqi7dmVALxA8i2LOSc/Cv7od6CdS5YUTGX5aoOpJCAwgLKcnEcqcQ3wL837M8aSDeYMNroyBMbGofpvpHNN3g20egiYcwblg8FsFzDWNRL3/1FKTP3zKYkzg47mVpb1vR86oDzoaYqXlBvwvA2fD1qOj4nRFj/Mnx9FTqU4SDdLdBW9LO4p0F2swTnmrhXO6znChzPUW4OsY2j03zwe7hT5w22oxIxBKCErim9x3Rdsz/aDWndkq9Nr4zkSydvUFr3hsGwIIJMvgWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLndpoiLxHUr0HshmAYyzkq8HzocJ8ieD4B9buTQnAU=;
 b=cYd6Gls7DVK1MLfbXooLMI0ax5WUJHDMKROB2XzICxOAJwub60Be+4QUE1ew4xlUQWdQxAD1vOZ/coWrSFq6QrSXiEtpT2/A+5fCCfEq+KsPCmEIdNDVVPyBlMJ/bQpTW29l/HwAbe06rlxKTzUbW34xSGAihRUD6k5NKfZxvb9AsqPkozUjtNERLWfWlnFDSb8rZX9WQ8b//G1UJ3xy2Hyref6UJe9GGS/iHESThNoYe9skI24Yhm7ibI5gVL86cNrpLw/wKfwwnV8t5iHLlbs8blfiSOBJe94ATCkHjTGbv2m0U7Kh043QLQQMA7UCqVsK5AJhrj1orU5xSGch5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6516.namprd11.prod.outlook.com (2603:10b6:208:3a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Fri, 4 Apr
 2025 15:17:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8583.043; Fri, 4 Apr 2025
 15:17:18 +0000
Date: Fri, 4 Apr 2025 10:17:14 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>
CC: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Wajdeczko,
 Michal" <Michal.Wajdeczko@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [i-g-t,v4,2/3] tests/intel/xe_fault_injection: Inject errors
 during xe_guc_ct_send_recv & xe_guc_mmio_send_recv.
Message-ID: <ww3fwsqvekzqjynaqxiivaszyhmhklxkuolmwa4oahlhvhrpdb@5qzomldrb55x>
References: <20250328111532.16620-3-satyanarayana.k.v.p@intel.com>
 <1b95cae9-33c2-47b5-b4e5-d9000543cd8c@intel.com>
 <LV3PR11MB86951576818F866D55D961D7F9A92@LV3PR11MB8695.namprd11.prod.outlook.com>
 <100211b9-9600-4a35-b1c4-3198cdc5e72e@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <100211b9-9600-4a35-b1c4-3198cdc5e72e@intel.com>
X-ClientProxiedBy: MW2PR2101CA0017.namprd21.prod.outlook.com
 (2603:10b6:302:1::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: 3abc6329-89fb-4bc2-61cc-08dd738bca34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vcDXMppe7KC3FdKTtbThbz3D+cPLX57vAcFxGzr4GrD2MfatYVOYc0Fwn0ta?=
 =?us-ascii?Q?nQk0IDQuUZmwMcY4H6akh80C+0klT1QOlcpNAfMfZOJCLSoN0Ziw5k47LRAX?=
 =?us-ascii?Q?sYa63DOWK4Us35ofGq2btY6r4CL2Pm59OtNVmqsm1Cqq4JELN4kqyqpixjFX?=
 =?us-ascii?Q?+MCLaTWBsxMZyegVTPRS6z+NGf4RbrEtWKwS1bGjhF62eXjZwt71my7hQO2p?=
 =?us-ascii?Q?M1RcwEaCRTK9Nms3iCiOz0XPG44xUvWp21ybQfqdhgJ92yDHcbKWl2vaJp1K?=
 =?us-ascii?Q?gfdwL+TUe+wYYiBM0mLsF/jOIKa9Ftis7VkiGh1rDX3TvO1aUTVCxzKqlg8r?=
 =?us-ascii?Q?G8g36pVQkoPdds/kFpWJslFmgC+tq1UFjv3euVr54J2nhGCZ00rbkyjCuQy/?=
 =?us-ascii?Q?AcOKvnWrQUBkRx0FwiYYg3Mk/+3otBTytw2nAduaQRNYL/bw2/i7BRwAqKef?=
 =?us-ascii?Q?9XZSJ8DvMbUXQBuzQ4ExHoganMmD3Fl4zSngOvd0859dAw1f72oMFm3n9Epg?=
 =?us-ascii?Q?tOy1KFQ1Wu3tA+rjh9H5vw6/BQIZeOI6cx8w6O9BKl6IfT0ocubXmMCx8qC4?=
 =?us-ascii?Q?iqt23MwukSUSArgcSWtqFs/4M1HlOIw2m9RgKoS0EJOY6rlAP9YwIJ0SaulX?=
 =?us-ascii?Q?BfdTyLYd9qFEVpXxwO5GHndr+JO6ssYjrA2wCpnSxHqOWwLMFbvH470e4R2P?=
 =?us-ascii?Q?TV7sWebhnIlU9TeHjwepOBox4MIXTDjApS8XxFFKuurYbmMMI1dj3OJroDRb?=
 =?us-ascii?Q?UPP41++DuTjDtdhL7WeIeDxjOfRikrB5O+gW0djNpi7+B9oPmtgTQR2iUfpR?=
 =?us-ascii?Q?FeLRJX0dKMJymTW8gP8hBWKy1ZnvAPDB2G0zw4ZOraBxPRby03B0r80XSFTH?=
 =?us-ascii?Q?zl9xH4dBe7lT+kNQ95K8VyfQ4RgstvqvZ5pctQDefIHi+dHIfrTsXg6HHGPH?=
 =?us-ascii?Q?5u5nhjm8H58yMVanszYy0cdZu/Gkc2KYXXz4+zJt8i3zYU2rBKVxPqh8nC04?=
 =?us-ascii?Q?aj8Hmg4wZcEL+qT64q79VhmCIsP19QifUGlKKVAhOuAVtoFZ/AhVpujnHoxe?=
 =?us-ascii?Q?gbgiA7vMyPEbQPavDazdZvrWBlu2UPKViVZQ/o31sfPn+6iNpbRGIrjA/imc?=
 =?us-ascii?Q?15dXej7O1QpD7Q06SJnVEbeKFEi2Yr2JjBbMbmFlzU+8L2fAxD7OfqV1isz7?=
 =?us-ascii?Q?GBcAs0Xl9WLc7EzSaq+vYRFFTQNJhgE0AOJgIH8aYiyFF5Vq+bLTWABquxB9?=
 =?us-ascii?Q?LYwcmzJsFdsRu0b9pd8L/9kJCdiOK1gpJjilycOagn++9grmDOb+cY6e7n/a?=
 =?us-ascii?Q?FmxZXb8GEGf4qgGPA3qoyglKD6Dj1n5nJQ9Z0kyxifqHMYHQv+xcs39fpwC3?=
 =?us-ascii?Q?L0GQzr6NInaDTgSVNh9NG0WKjsAXa7iZbZ4UPfXfGDgHDzkjf8D7hRGau/lT?=
 =?us-ascii?Q?Z6aZD+Z0WSA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JAlT8FV92eL/L0aNiHZNzZPBtqJNr3XA6O/Dmz1uWrQ1WoW6VVqfnSh044zv?=
 =?us-ascii?Q?mW6W+kBwnb6UhL9NvceEX+ayr+SRfuM1xgwVrPcW0NfZ/WvHRstHbQk7PIxn?=
 =?us-ascii?Q?IMvwi/QBbwUdc5OuGwXjpbsCoM1ZQY1Xjqgdzg7E6gPRfCBnEE0L8ZOteACN?=
 =?us-ascii?Q?L7ihY7EFvnuHqWY0NcWb0GL0HL7yOA7FUh9CPFynH3+EQ3x1xwYssbnxeJup?=
 =?us-ascii?Q?aHq649YWc2RnQiBIYEX/fMqCxH7zWVXvpk8rv8VFtSgXDtkU5pPJIJPxOhuT?=
 =?us-ascii?Q?eIsrDLU/Uox+xe2hV05uJcJ9zFoyekY9r1ALjq9FdigXXJA7K0hqA1zpOrzB?=
 =?us-ascii?Q?+S6n2V855xjSDzfGFnIsO/BShVczVYFi39m6/tTvMerBMk1oEHeWb6fW8+Su?=
 =?us-ascii?Q?9QqW95/1BbNC5nbA04ptqOlPJ4/n42nsKkn2mDnOJHVx8vO793kzhf8UcM8O?=
 =?us-ascii?Q?4CDL23/X/Xk2Hr5n80lSAesJEbpFZhVLEwxZrNnaxzXGoPPII2GumndEV6t+?=
 =?us-ascii?Q?6lUpYLSBoHLzGeQA575xzL7kOnAqIsxqLFjSVeNvscq33xoDStmW3S2biFd4?=
 =?us-ascii?Q?oLPqQOgQeG6Fftb5ZCGLcNqDmupJACWrG3ObGTCvufXYvH6p7XlVokYAbnTD?=
 =?us-ascii?Q?Qf8M77Ncy3+tlBfAuh7406521MaLhFhxWmhFwUs5H46+FGNb/7ju+ISd8c5g?=
 =?us-ascii?Q?vS00o5ioCFKZfQU+dPkGk5hzEIkhkXEd4LNC6u+S9abUHj4YsJDO1LYMID4R?=
 =?us-ascii?Q?UUe9rdEvPs+jtz6YdxdMFluMVT5ik5NdncVaQtMRXxsszWtkEA1FBOXIHOQJ?=
 =?us-ascii?Q?BVCrtuBaPWZwpgth7T3pmqIBF2lGKzgxU8GRuHUVNLcJD1770I0dAbXG//PB?=
 =?us-ascii?Q?dF7AOZmvfmiskYQDb747/isHftkw31ErWxduGQf2s14VK7YoLjtPcSwOcPIt?=
 =?us-ascii?Q?UF6SrowEqUhC7ljJdsolhIC0ojVhWkARKIyhaModcOg5UV3zJQMV7oP8y7U5?=
 =?us-ascii?Q?W+KJ0WXhzobpcc3LakGPYdcRNDS4GBrTXErijk4XUlg7xvydNyl6fGMWmNOq?=
 =?us-ascii?Q?Ld2cepM92dcVFjsw1Gd+QXGlAn2v+0aa1y7VqvYvT/UePx7aZlDs78IwDlR3?=
 =?us-ascii?Q?hTYXczDMJC/TD7PzOMVN1l3MNsEJSztyPfU4mr7HUC3L2r4ocHYGiQWDl+X7?=
 =?us-ascii?Q?zW/IU+SrTkLl04s4gQdvONjkWAwF4EhMR8B/L1jQ63Ft+0YNEtTpsTuKN8Wo?=
 =?us-ascii?Q?8Ogfo95shufK0+CD8TTCN4t91nk0BIk35xm9Erqq8kxX/m2/fiViGksuqjMd?=
 =?us-ascii?Q?zmLoYk/K600PgwSYFWascJCh14IHgeVXFdJ9peZx/1fYj1Ss2LTmtWNDZTer?=
 =?us-ascii?Q?tRuSOUg4Oy/v/yPhTZZYXXIUBVev2zE8N/KLca9Y+ky2AyuGZdipb5HZmrpo?=
 =?us-ascii?Q?SIqN9Dm96pPvV7WW82UtMfTHgofj68bJ8rOVUO8Sahxn7FxYVMxwDK+Txah9?=
 =?us-ascii?Q?gK9/fs1TR/ULQKDA7l8sknOQlXXNO/znYpSD8I3vOprV8SuxTwqKyIkrRJAr?=
 =?us-ascii?Q?lx1nGm2fhVNbtCfthzcjS23Kmvi4UZvp0FzpJZvaHKJApOGmc+mgWFqn+0Ru?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3abc6329-89fb-4bc2-61cc-08dd738bca34
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 15:17:18.8530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZRI+9IuDNcDIsQ0OsgDkGo/j3FffMN7h+lv+CgMm8/hdZ7fhojfWZ5/AWI1hFHewh2dIU/6h2M9j/RXw6F2s3Vwh/VbzIWAKd7cH2gyeEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6516
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

On Fri, Apr 04, 2025 at 08:25:12AM +0200, Laguna, Lukasz wrote:
>>>>To address this problem, the environmental variable
>>>IGT_FAULT_INJECT_ITERATION
>>>
>>>I think it'd be better to use test parameter instead of environment
>>>variable. Please check igt_main_args() and consider using it.
>>>
>>Hi Lukasz,
>>  The intention of test is to inject error 0-100 iterations for guc_ct and guc_mmio functions.
>>The environment variable is used to inject error at specific iteration in case we want to debug
>>Issue in case of any failure. So, not used test parameter.
>
>I got it, but still don't see why to use environment variable instead 
>of test param.

Satya, let me help clarifying the ask from Lukasz: the intention is to
have an option to the test instead of env variable, so it's visible in
./xe_fault_injection --help. Example:

	tests/intel/xe_create.c:igt_main_args("Q:p:", NULL, help_str, opt_handler, NULL)

In the help message you can detail what it is about and that it's only
applicable on subtest XYZ, which gives more visibility than a random env
var.

thanks
Lucas De Marchi
