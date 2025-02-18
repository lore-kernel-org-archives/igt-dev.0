Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480BBC021AA
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 16:40:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB77910E3F4;
	Tue, 18 Feb 2025 16:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WJw57rx1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F07E10E3D4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739896833; x=1771432833;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Xs+heuBi9pp1EOBfDMEMeF/PytJJwHEZcSRPnngIHnk=;
 b=WJw57rx14oDhhOPwKWwPJ6K7yJ0JiooZrkiCW6C1hUqUAUStTVsoh/Or
 gDO9PjLosS8FQRADudn2RZf2M8y7e5RQBMUaG3lXOV4Fbhlv/jZ6nbHzr
 L0VKXQLjNtWQwP/4BycRQSor6j5R6F8QXY3ZIn0O17c9RrQ7D964s+2OB
 D/rMs8ETAdAyZ3yB3pvfSdUQqfy+C3yW6hOE+iv5TdXWSdOLXSKgKvWqz
 PPiV/xE/ogYsdCBw+8t/iH5y0xfO/ZvriXMyRL0DdKWuNEtTHqZKaUqQq
 wLPklszrTI+UYYGskcn0KH+as2JeEXU8DDK+D0v+1vHun/3jDPLC5IU0M w==;
X-CSE-ConnectionGUID: FkVk6T5RS0yKDAizQ26i/g==
X-CSE-MsgGUID: tycdF2NLSzusIlM2lwArDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="51243988"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="51243988"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 08:40:33 -0800
X-CSE-ConnectionGUID: ldjs8PwgT6+AHmiUBh5EiQ==
X-CSE-MsgGUID: YHY81BbHQWCa+cHaV61rVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119088927"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 08:40:32 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Feb 2025 08:40:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 08:40:32 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 08:40:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewTbYsjE2dxwqf1rlQF6bTxNj3D0hekE+YiXusKHdwqHEPBcrUFptwDLfMfI3U1bO/mMQOUHInAwcTBsZpodwvXYlhFcQ97h8UztA65UL3ViL97nCQirhaib3YaOXqSz01sW7Al+f+xBM984m3AUcjcp1BlQ/nsqLXbag1KEOU0IvLg/x+mIHOqT60X/J3ZeqG03onC36i1RDvo6VhMqFGpTxJJSoEAHbiX02e80AlyIb5OQb3Nr6DLrKEW3oAWS/1zsR6hlaK4yHm/GLodRhu0IAUptBWAPVDVlELjXp+4GbSxbXDjere0JqvCaHXPZI61BMKwmJl7SjwocNT6sag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vOSRx093UfGj7/67cpVGWQsOgT1/3AMji+THGZim6w=;
 b=SwfcV0p5/ZPmv9Vbv1fGJMKvHs11Hf44VQsKVtT/R2lvhRIRPt0T3ORLQWIZvmymJ6fOTUd8N8kM2n2PKVTu+hJ88puq2pLcqTHGQO6wRovJ8XkLsc1M/m5cO8+e+3bERk7/J562Osqlmb2bwDZ3c6ZMcm8W/C3mo7fYR6F6ZG18ea11rWvvoQ0gEVuMGEFmETqUp8sbWyFImvIrl3c1VEpcQ7XSwMk5ukcgIl1GcPxA760X5W3D2JnvNa1BKEymcSM3G7do4X0Pgf1yMF+lVggTNJlZ1cO6mZT/FPXzQSSrbafMLivx+WlGes3vSvIab6wXWuezVxUcr+BpPAeaUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DM6PR11MB4530.namprd11.prod.outlook.com (2603:10b6:5:2a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 16:40:12 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 16:40:12 +0000
Date: Tue, 18 Feb 2025 17:40:03 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 4/4] tests/intel/xe_fault_injection: Inject errors
 during xe_guc_ct_send_recv & xe_guc_mmio_send_recv.
Message-ID: <Z7S346fd46gL9uIA@fdugast-desk>
References: <20250207072902.12582-1-satyanarayana.k.v.p@intel.com>
 <20250207072902.12582-5-satyanarayana.k.v.p@intel.com>
 <Z7SPn9Kstq7TKErm@fdugast-desk>
 <d1ee88cd-bcbe-4840-9e0a-4d9c71b8fe1e@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d1ee88cd-bcbe-4840-9e0a-4d9c71b8fe1e@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: ZR2P278CA0002.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:50::7) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DM6PR11MB4530:EE_
X-MS-Office365-Filtering-Correlation-Id: bcd68d81-0bb7-400f-e877-08dd503ae9de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q+dr4G1t6gO1pF1zTwPOU8AKKFae8FPnws+GSQzrPRxFo/nyLiVpUk1VsH9j?=
 =?us-ascii?Q?B5kKO61qIuNLrmQbKrSYSNwLptGMHlm5JCXFlLTeULDhewzqwMLqWko2Uxgw?=
 =?us-ascii?Q?EwvoClH/bkb3NY1S3X2etuE97yCjOCunaeJPsUDsGhA7hYXdYdGq8iVniSn4?=
 =?us-ascii?Q?P7/5+xXhtOA/Enu9u1RlsUDWbXrH6chmhPIsMEKjKYLJLhsL4PDj1Q771Bcr?=
 =?us-ascii?Q?WgwIJ3M+1rZjpTXr/eq6lH+d4AeqWk66gyBKR3alMQFBdtFo1khMzp/UOgpo?=
 =?us-ascii?Q?MGWJa5/n20qgaPt6I5p7wvqo2moH45mP/DVfobDqe3lkJN8U/3eIzoq2KztE?=
 =?us-ascii?Q?YFpoRz5AqtJv2ObgvK7DXWR1aHDTqUo+QQhQCoUOyZwdy0sBrWYMcrxcbB/h?=
 =?us-ascii?Q?EEsFqGfX7aFV8YCEbm+MtSrXLkHAw16l4bFi4L0JgwJRr0DnyXUjhVitCl2c?=
 =?us-ascii?Q?5JjQkCtnEi9n7QVd2UWThPcjSrhQoi70Amj/AWdpLEMednLSny2B7l5F0SjS?=
 =?us-ascii?Q?w2fbJc21xI69VIFKPiatkQ//gBQ1Pzvt5OwHA7rv8k9eSZMQZsiQHZY6naGH?=
 =?us-ascii?Q?foSdw1d6kHme94z24XgNxQxMRwVTkCJ7Rnko9Lvb0LCyIqcmyLA2b0CSE2Kw?=
 =?us-ascii?Q?BUmH1ICnf6bNOv864/jrt1x9Lh08zHvB44IfppZBziq4UA/YMTIS1nxxV1AV?=
 =?us-ascii?Q?jDoc/n4tJmuB+J62/lrWJcay+lPph9j92QYHViwvEYfN+qbBHBBb+b7TKjkM?=
 =?us-ascii?Q?xJIyU5unZvYsB12NaOTAKzKeiFCp8PKbY9kRTiYVLSGsPtib4Qtvv6vivc+N?=
 =?us-ascii?Q?o1JzQQlCDh16kDrwfEETLH6ffcL2XLgKLFb3ydw4pGj9qZsdTwt1mhQkzAjG?=
 =?us-ascii?Q?zA5FjpsHuziUn3rX561QxHpDJHW8dxthjkTJGKfmVPEitiY+YOx6KRJo+dQD?=
 =?us-ascii?Q?ulivnNIHoiPkxrrIfpeE6XhSAni94kPbj8ABjt5jcfXtBkLS81oaPun6DuXq?=
 =?us-ascii?Q?uuNO8ZrqdpgDK6xNLjDiJLdDg7z9gfesx1NWYDToN0Ctp1DyeZ06uUeHJJwU?=
 =?us-ascii?Q?AqPuCMeHexIFD658Y+jyQpcMVMeRl6ZoFVRk0f1ra+0G2jt/FLeOGlg1I7w+?=
 =?us-ascii?Q?NParnXsB3Bghr/mHwqUBJipVzo23XB/fFxzbK1yxxjATcpFgSur5qv6hYW4f?=
 =?us-ascii?Q?QCsF0UsweM3CDwKXT35h8RksOxzxbeH5aqU2S0fuVUGmposEOz5utkpZDvhk?=
 =?us-ascii?Q?mhylex9/3X/w3mjhUNU56kfguSMNDu0j0Z/GFB/Z1lhuUAEQE6xlULjERAig?=
 =?us-ascii?Q?M8vpiOzWYB5q3f/aRhUNWo/xpv4MQ8dsgRDoY/pCfDgAm9OMeaa3MYVM4ltf?=
 =?us-ascii?Q?1V9LKgVI73LJcVSWnPZWic0FcaIV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6jdgU8ogpgVXk3XRTmWp8on9cb2J3/xk2EKWmxDHthZpyil9eMA/ZaOyPw+r?=
 =?us-ascii?Q?/eY072ZoLqwjYOU/hsdrxgQCeoVPBp26PFwnOdLd80sUZ4xpHs9mTx5yRKE4?=
 =?us-ascii?Q?1Bd27fdmzKfmSexofhP2yI6ptTxj+lRVzRQOTkVPC1JxZ6Ghi60gFJzMNLAT?=
 =?us-ascii?Q?yy/TiDdTLf4rBeExuyMwuIb++b1MHJQTkQfZhUJjP89z1byVvjIWavu90ZwM?=
 =?us-ascii?Q?eLf0AjBP2ep9fuOtUnkGaFLGCunOs3pkIx9/ZbUaAE6GjPeOwekAx8Nd7tN8?=
 =?us-ascii?Q?uqcZGV2gyrbW805aoeyk3m46MAUSF2jSwOL2Xjv6Phdmh/zTkOt37EFtltXa?=
 =?us-ascii?Q?hsTqNAD+h53CDvvYD8WDUvexzRxvXb9FPut2Ogkx+I0BGQcCsxjyGQbB6svr?=
 =?us-ascii?Q?XJctOdCsc5TO9CqXqp0wuK2Gkw9to0qh38oNhhlk/2BeDkGhUrgJWIKEW/rm?=
 =?us-ascii?Q?Ec9gfUPpqAT3wyjF2raPbOpYXukzsZi5LreGkNxMVlAW+fdqhm+098nDqFx1?=
 =?us-ascii?Q?l4TGlt4/vLsZhnnqtmgodC+StWeTrLDZR+iRbSD2mqOlR05tpLj4NkpGM/xX?=
 =?us-ascii?Q?Z77U99XI61oyHvnTy1lI4OB+3FwHPYxtKqPVKyLZJELtU3FWJZwld0GtR3m/?=
 =?us-ascii?Q?+ecY2irQfPsv6RzYu9aAhkNw5Xv2nvKeyGc7qfKFQf51cLpyJMcS6AnHV5Xa?=
 =?us-ascii?Q?B35feM8I+b5+qRJHzX0eXkveURKVUc09omub2o+A305X/zto8SKuJsY3e2OU?=
 =?us-ascii?Q?yjCAY41W40HoS+fcVdiU2nPG7sMbAE3gy8Un2Yc5xzSg4wKxecVFJIcSXrOi?=
 =?us-ascii?Q?h3hiPr9Kecl0VMp0YW1gbyKOvwnpMXixs7cCSn40ToPI0AdAHwrvafnHy/Ip?=
 =?us-ascii?Q?hGvnV8jCFeRgFmrQE6BbWGosi5DWTtUJR9aK+F4k/LqNPkrO8ZoPb+taH7SN?=
 =?us-ascii?Q?SLKic8PD8qdbS8c5HdPPOQ+9k+XgaHpxJfizvUgmHr/datiCBEZO7I4vJXZ8?=
 =?us-ascii?Q?m50q+/64WLGhsGjjLpWegNxyfTgkPT4HrWqC7k2KZaLNuKb1Yd5VgB5vqSW4?=
 =?us-ascii?Q?GcuXZSIlinkYysr7HWmMLauvxICVICnmsTyD2qHm6hDGJ9zrcYY1zwA9jE50?=
 =?us-ascii?Q?4Ukd6UA7G15IJcw3vk3uMEVNz8XSoK11MSh1I3LyeXFQ4MOEZFKnDyVDJGWa?=
 =?us-ascii?Q?CFhsOLoQCbIz1dat3ijWLKk0kQr1Jt0Pin9f1kkUTIFsw5bv2gNkKvziQk/K?=
 =?us-ascii?Q?9mi8LnECVeC50LqEoltUED/cg7ChIgTH7Thz3Df7E8pIUe3EC33adjTkefEg?=
 =?us-ascii?Q?q6/TuOEXmSCHP7tGIXjPxXlEoHffyGun9kJ8jQYD0EmqjEXUhSB6kI7YYyFl?=
 =?us-ascii?Q?E/fzIpj2ANhLTeHcj74GWVE+cA/o8t/XeklcnUoD/3asPwKd2+ZEoumemmFG?=
 =?us-ascii?Q?HgBvkB6Enkb/tiR1iByMU3cKCL3mnLGyHiFPPG5sbKbGaRAuSZEUMpbENtUk?=
 =?us-ascii?Q?yk6MuLU3rg1XVl9PUItHHlHRUcrEC9o7V8JDYyiC+eJ1BLOJbf2AEAP+uclU?=
 =?us-ascii?Q?4TIzZx9FsXoBYFsQYhxyFHNU85BhYq5/IRciYPFTChYM5xwlW4RRlZ7mKikn?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd68d81-0bb7-400f-e877-08dd503ae9de
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 16:40:12.0226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3RtRapaLNsRV9hc3rWa0C2zOuedg4QqSVUkAD/wIM34NMfjX9ALyiP2kGByESSjx8M7rer3p6rHZZYws/shPpI5uqg3FMYbiY1Zw3FvqQbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4530
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

On Tue, Feb 18, 2025 at 03:06:27PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 18.02.2025 14:48, Francois Dugast wrote:
> > On Fri, Feb 07, 2025 at 12:59:02PM +0530, Satyanarayana K V P wrote:
> 
> >> +
> >> +	/* Get the iteration count from environment */
> >> +	iter = get_fault_inject_iter();
> >> +	iter_start = iter ? : 0;
> >> +	iter_end = iter ? iter + 1 : INJECT_ITERATIONS;
> >> +	for (int i = iter_start; i < iter_end; i++) {
> >> +		fault_params->space = i;
> >> +		setup_injection_fault(fault_params);
> >> +		inject_fault_probe(fd, pci_slot, function_name);
> >> +	}
> > 
> > This loop is specific to the guc test, it is not present for other tests.
> > What is different about this test, why do we need to inject a fault at a
> > given iteration?
> > 
> > In case IGT_FAULT_INJECT_ITERATION is not set, why running
> > inject_fault_probe() 100 times instead of just once like with existing
> > tests during probe?
> > 
> 
> Because all xe_init() kind of functions are called just once during
> driver probe, so it is sufficient to fail first/all calls to them.
> 
> OTOH driver communicates with the GuC multiple times, and the real
> failure can happen at different call, hence the need to inject failure
> in GuC communication functions, like guc_mmio_send() or guc_ct_send(),
> but it can't be just first call or all calls, but we need to be able to
> select specific iteration to fail.
> 
> Only with that approach we can provide sufficient coverage of the driver
> probe related to GuC.
> 
> Michal

Makes sense, thanks for clarifying.

Francois
