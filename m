Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB695C2BBCA
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 23:18:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F7710E2FE;
	Thu, 20 Jun 2024 23:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W/5hn+IZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C8D10E2FE
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 23:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718925520; x=1750461520;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nwZxIJAKckNukTa0u+PW7/4gvMVOZuyNruHqj5GoD04=;
 b=W/5hn+IZpDF0VTCWhcSIT74M4lFYUc3Tk6Ltou2oKeg6pInIzFY6vm8U
 oONJNXX73RvqTVSTYID00rWQR1FonU9y0pBu+yvRNwwhQSsNLqUIuEEbb
 H6crYID262jb2z3irCy1ZE6Xu6eU3cAPUR6ngc2Y3z85wzQKOq4UwzQMs
 x1tF49iApBPVIV16dCafqxaNDh+4rRozFbwPHRcxbUzz2TrRwoaYx6hUI
 w48yEfURbrhDwZ8cgeJcJtbvi9PZnWT9J1oGb7NEUAze5FRz7fpPREAcR
 A9q3Y99qEwsgIU7U2CZtoW1IVVIfJmW3PAQZNrggJ+226lGCGJXo6faCw w==;
X-CSE-ConnectionGUID: 2eMapMiKQpeN1RcMRxy2CA==
X-CSE-MsgGUID: AHVFqiP0SjCGahdwpYGbxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="19754491"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="19754491"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 16:18:36 -0700
X-CSE-ConnectionGUID: oPr/sbVgQyeTyqav+YZaxA==
X-CSE-MsgGUID: KQX8MnSnSYC2LFqn2PbWbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="42509654"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 16:18:37 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 16:18:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 16:18:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 16:18:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcoHMoyvWvhR5P1CSw2b+4tteEBqWM+MmvIGGXhRzXngi0SfvBQtwf3clNPQoU07y3EgcjZB12qFNZMkXNqhXaURhYnrz1KS8DUnvD4npZHkPrU9DmEfbL6O9QGZ9Wtr5CVtYzlweXxi6c7jVSXg5iSbCUVET7GLAL5T7NVE5NwouipkxYrsj/Isf5Rrc0iP8WduEexqi+0HBAfOBx4AYmrja2fHHmbl0EcqGp8kjNOWQJGI91myLg7b7ggTuDayiBf3Ti/FinnMSIvKXfhfqmilXV9LOb4eDFT0P02ZhvVxYDuQmnjyONF+ZOQ3Ug/qqU06RPNDibMxxFBcfy1oHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/xUKTNnei5VOWtCck3xKXNHUgRTNLicGpDQ4useHPs=;
 b=UOhfuLlPeHW/l0aTi4bC+TYaGvbPlAg0nCmYtSGaUn4GjejTVTiaZAWlJnLdp440OlgojQ6JgWxOqdniJmEnrsNlinOuDm81W0aJyWM39E4HXzkkah5ZvjSm9HN0Xz4QeElQ+LRLNRwPoKHUqf0J0rEpCTXYH9JWgrytirtmzZMnAqlZzPASJp8w3L0LeGDgZbjssqcjxISBr713exFaX/5Be6JARm48yvW4nqIwbOJoVir76CxOvJkxf2OfgK9BbDcKiQEKyCLdtwBxxF78eXdPbuw+gyO2PdQyoq36NrevOtPU7Hc/PKk089tqSS9oaBzwyJwcQOXptURyatCu3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW5PR11MB5858.namprd11.prod.outlook.com (2603:10b6:303:193::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 23:18:32 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 23:18:32 +0000
Date: Thu, 20 Jun 2024 16:18:30 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 13/28] tests/intel/xe_oa: Add oa exponent tests
Message-ID: <ZnS4xqr0ylt3mTh5@orsosgc001>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
 <20240620200054.3550653-14-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240620200054.3550653-14-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::12) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW5PR11MB5858:EE_
X-MS-Office365-Filtering-Correlation-Id: acfd7ab6-75eb-4a87-1720-08dc917f4d77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekdtQnBSeFYzKzJRRzJDcngydFAvaXpIQlN0NTlkTlNsdVJMZ2s1U2FqaXpr?=
 =?utf-8?B?bzJtV2xnVDBaMFJHdVlMMnpWdjFVdy9LNy9YdW16akU0aERrWllYS0hBUTF0?=
 =?utf-8?B?bHhPZ3lPc20zQTRsdHBQNFp2WXRmR0JDanBncVcyd2RuS3pqUTFFdjBKazhY?=
 =?utf-8?B?NE0xVG1hZkFpTlZ1ckNyRGRxWmNjQjY2bDZxRW9qTXFiVjlqWEowMmZQaFBW?=
 =?utf-8?B?NmpSZSsvNmpEQUhzc0x1YTBkNVZRYU13aWpCU0Iydlp5R0JSdGp6SVZKbjgw?=
 =?utf-8?B?bWxtR1U0VmZaaVFyeC9wWGJjMGE0SnJWdm9BT0FwWGN2Q21zYXlwYm9YeVRL?=
 =?utf-8?B?bW1iWWIwWTcweExGSkNJNXM5NExWWU1xY1lxSjlwNzZVeWRRQUtXM3VVQU13?=
 =?utf-8?B?ZkNIcUo1Zmt3VmM1SUpITjJmK3JvMis4TE4wa1BOVzU2MCtEaWxTTXhrOVJn?=
 =?utf-8?B?TkdXYnloazh5cWlKMUJEQmV0WW1sWDhKd0FNb280cyt1M2JXWjRXNkRVYmNj?=
 =?utf-8?B?VHpySkdzL3lyZXByUnI3aDJIZnBxM3paTm1BN0FSaElvM3c5QlBVVDJZd2V2?=
 =?utf-8?B?Q1BxQVN1dXdJcU9JcHUwVk8wdTIzTVc2djRuVUFTclJJT01SN21wS3JUcnFu?=
 =?utf-8?B?V214Njk5SDErME92VURCOXA2U0orSXAxVU5GcGxaMU5GVGowOFlaMThFZ3FM?=
 =?utf-8?B?Sk02alI4dloyTXlCWmZwRUhST1FQU0NsZVQySW1FTFFJOFFTeldEN2t6cWNP?=
 =?utf-8?B?MHUwQjd4cklINEIwQ2NoRVFQYjd1bExaelBpbVdja3YweU85cmsrQ1FUcXJN?=
 =?utf-8?B?RSsrSVJnemZaZlFTMkxuK0pIbjA3cWgydHZ3R0tVNXh4RkFOV0xzTEpZUThN?=
 =?utf-8?B?MFVzaTBzRUN3enk5eGd4Y25LQWZXRlBheTJLTnlGd09lRXR2b2JiVUFCYms0?=
 =?utf-8?B?M3pIR2dHdkhGNDVjOEVuMXBiUi84TE5EU0ttT1NVQkpEbFZtY3E5SXMwYjZo?=
 =?utf-8?B?NXhBeFhZOVV6M05MdE9meFRwbFd3TTJDM25uNEt4dCtaS3QvMk5qWTdEU2Ur?=
 =?utf-8?B?Qkx5azlLK2p2RWNuVWcvekgxOVhSM1FQd1MyUUZ1RFM5aXh3cktkUFJrc2Zt?=
 =?utf-8?B?SGcyY0lkVjlRWU1maVlGWVkvdEJRTkUwb2VWVXV6MDZoSWRUeHYzOHNXdnlv?=
 =?utf-8?B?TzBjVG9BZHlzckdjRlV3L0paYU5BaU14NFowUlRrb1lMWjRrbXlvdUIwODZN?=
 =?utf-8?B?THkvdzBCLzZmUkRTdi9kMEJ2SHZBOUp4M0pyQTd0R0I2NFk4dURZNWxRZDBz?=
 =?utf-8?B?K2VuTnZKcFVqcGFhU3F5VmJiRGp2eVovMTIyOUY2NmMwczl6SHlaQTBpZ1FK?=
 =?utf-8?B?L0szRkQ3RHFXUzRzNVdEdnJIemRJaEp3elFsaHRlQjkvRzk1SDlFaWd1QUJN?=
 =?utf-8?B?MDQ3Sk4wYXB4K05RTC9mMm9rSk5WNWhESDUwazRnUUYyMGxSMVpYNnVoVHlp?=
 =?utf-8?B?ZzdUTE9kVXhMd29mZzh4VERobERSVzYrK25ycnhPeHgza2IxMmcrTFRJVWln?=
 =?utf-8?B?aENzZHE2bXFVZGVEMWxYZnNEeGo5ejVhcWxlYWQzL0RxeWk4cDgrKytDT2lt?=
 =?utf-8?B?b0JMOUpRMFdidXcvc0E4eU5WeSsvTmFaaFJpM2o0UzhjN1JxbmVuOHRxSU0x?=
 =?utf-8?B?Y3Z4dUJsSmJvM3p2bVRHayt6VEhQNkxLOFVLVm9EaUJQdWhnaktuNThDMFpT?=
 =?utf-8?Q?ZWXVxAps+t3npiARpI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(376011)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDE3NEZEd2Z4K2dxcjBOczdIR1BFblNrTlBwaE5ZaW1ScUU5SmxVbEl3ZXo2?=
 =?utf-8?B?R0xMemRULzFGSkhaNUV5cTVNRVNGSXBiV1o4MkxvcTd0aHIrZFI2UVBqUFlV?=
 =?utf-8?B?czlNYSt0YlNKZzBIZ0RScHlJSDNudDhVZFdydHlqY1ppM0RNU0h3MFNZei9C?=
 =?utf-8?B?cVBNMjlWVmJPWk1zUzI5K3dXc2dEZFRMdVM0RE45VDlIWlBOMGppaHMrSEpr?=
 =?utf-8?B?QmZ0cnpxOFpkaG9WUm5rRjBpWi9TclF4b1d6NXRXVzRSN1VjRUw4TjR1M2Yz?=
 =?utf-8?B?QUdQL0tLazdVT1NxVkh5bVpSR1puN0lWdktDMjdRd213REh6N2IxdS9yb1Jn?=
 =?utf-8?B?Wk5rTXJyeUw5b3JDTEFiemNUcytpVkErTytEM0VQZEwwQy9JaE1Cblg2aGZZ?=
 =?utf-8?B?TUh4YTEzYTV0c2svN2pRekt4NHpQNkdmTGJBV3JDdzVrRU9ubzBzTUw0L0FS?=
 =?utf-8?B?U044T1FlRXlUemFJbEJlVXlKUWpxd2RWT05zMENVUWZ1cWRxN2c5bVowekhX?=
 =?utf-8?B?UlpjaC9aTXN6bFNSOWE3aEtvbGNvSTgxcGRPWjdORHljRXlZMk13SEs1Nlgz?=
 =?utf-8?B?cU9rdnZoYmlJTGJKcGc3bTNJMlJxM245UEozTUZmTWdZSG9XbGlVUlZ5ZUVC?=
 =?utf-8?B?ZHZCVUdxd2hUZjJmeDdJYllpNndPdHpvQUV0Vk5rY3l6M244Qm1CRHVGR3hi?=
 =?utf-8?B?VERRL2JjTmJuOVdCd0RVRXNRZ3h3OXN2Z0FMTkhvdmxYZyt6ZGR4TENXMXBL?=
 =?utf-8?B?UjUrVkxHVnkwaEFMRERPQkhULzZVTmhKOGFBb2QzUFd2UE5zb3JvbnFrdllL?=
 =?utf-8?B?eEFjMWdjeis1RzJVL2phZXBobnJJV2RaOGJYWTdsUW9vQjc4bHpsdkI1YUlQ?=
 =?utf-8?B?Z3V0SGJQbWhDOUJkblQwZTYvaVRvM2lLcERlWDIrcnJYUHFQNXZMUlNmUW14?=
 =?utf-8?B?c0NhUmkrR3UrNEh1Tk5yUWp6QnRSVWtOQ0d4WUw5azV4cTFpUGZ6cXZBOGZP?=
 =?utf-8?B?ckR4dWdxbmNQZDZCT3Fpb1FMUG9JNHh6VE9iajhjWGt5WmpidTE3b3lOb2l3?=
 =?utf-8?B?VFFMVUt4Unl2MDlHdE9BTmx2NTM3RFhYcUNIMFIwTXZ5S0hUNlFhVUJyajBp?=
 =?utf-8?B?b0hCeVJaUExudnVQRXF3VlJZSS9hR3oyM1BTZEtaUEJPcE1OQ0YzamdVOWUr?=
 =?utf-8?B?SndRNmVUQ3E3RXNPSzhYZ1VwV0F6c1I2N29DRXB1MmxVK2RTYzdXc0trdk12?=
 =?utf-8?B?dDlnU2hoUnZBdDZBWFEyRGNOd2xvLzR2Zll2TlRLWVFRVzJ2K21oZHByd2Rt?=
 =?utf-8?B?SUtsL0FGVSt6QjlReFk2QWF1dDRsUWNXREV3TlpZWmluTWNVdG9lNGxhVlhT?=
 =?utf-8?B?UTY4dUkwSjhXekRUcmhPT0pQS0JUcEVzaGFyZlN5Uy9yVDV3bDVoQjJVWTBO?=
 =?utf-8?B?U3J2L0Jtd3RuT2NVZlRsUnZoVmtPbHorMVhNeUYxUkpsWWdUeDVBYk4yMzY3?=
 =?utf-8?B?cTRCbC9iazg4Y0l3Vm5tTDZDVmlrYyt6QlRBWmViQnZuTGJVOTBoVStHS3ZU?=
 =?utf-8?B?TGFUaVVEaUFQK1BDUU9admdwWTEydW5PWXY4anJJa0FxMHBUb0tjdllIY3o4?=
 =?utf-8?B?c3RYRHpXZm9Vb3haUThQZ01ydGJJcjB0c0k2QktGRGkzYzlQQlIza0RqR0h2?=
 =?utf-8?B?Y01BSk5HelF5Z1laZDRSdWJjN2Z6R1FpcGFXMGlHMVZoZEtRaUdhMFpFQkJl?=
 =?utf-8?B?WE5ld0NZbm44N1JRWVRLQnBiMWVJM3RNZjB1a1ppaHJ2MGxqanZldmRnTHpZ?=
 =?utf-8?B?aVk3ZGd5Wmw1ei9DMmQ3dDNiK21aR0JVWlBHcTBhWDFsbjZjWHhJcjVON09w?=
 =?utf-8?B?UXZUNmJTYm1odXp5cThvM2Q0c3hwUUVDOGJMTXJaYmtKaXN2ZFF4alVrUUcz?=
 =?utf-8?B?ZlJBWXQzd3c4bWx6OFNWd1FzSFQ5ckg4WmxEVTd3R0lLWUdDL2tqeFRhbnZk?=
 =?utf-8?B?MWtKZ1BYaENwZHY4azJyR0x3K0cvaVRadHNLUW9QdUFlMFNwYUo1akpiQS9U?=
 =?utf-8?B?Z2xOL3d1NGhYL3RRUjdndkVTbkdEVzMzZjVYcll0YW5wWjM2ZTF2eTV3T0I3?=
 =?utf-8?B?MjlDVVlnM0tSaG41eS92aW9kaHdsenhKL2Vkb0hTVE5jaVJJcFo0eFhHL3Bh?=
 =?utf-8?Q?S20PpMomjCsk4LKRpk7EIzo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: acfd7ab6-75eb-4a87-1720-08dc917f4d77
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 23:18:32.7314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v22/Sb18i/YNvlytIQKMopYpQMRBCI3EqJsil1qfdOGLvLHti304/YMRpCEiiE88J0SlFk7gm0FnNOKDGw11T43P4cZYY7dubZmv3gKOj0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5858
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

On Thu, Jun 20, 2024 at 01:00:38PM -0700, Ashutosh Dixit wrote:
>Add "invalid-oa-exponent" and "oa-exponents".
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

one nit. with or without

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_oa.c | 415 ++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 415 insertions(+)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index b7de6f7bd2..46bfd1d16e 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -410,6 +410,27 @@ static u64 oa_format_fields(u64 name)
> }
> #define __ff oa_format_fields
>
>+static struct drm_xe_engine_class_instance *oa_unit_engine(int fd, int n)
>+{
>+	struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
>+	struct drm_xe_engine_class_instance *hwe = NULL;
>+	struct drm_xe_oa_unit *oau;
>+	u8 *poau;
>+
>+	poau = (u8 *)&qoa->oa_units[0];
>+	for (int i = 0; i < qoa->num_oa_units; i++) {
>+		oau = (struct drm_xe_oa_unit *)poau;
>+
>+		if (i == n) {
>+			hwe = &oau->eci[random() % oau->num_engines];
>+			break;
>+		}
>+		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
>+	}
>+
>+	return hwe;
>+}
>+
> static void
> __perf_close(int fd)
> {
>@@ -604,6 +625,64 @@ max_oa_exponent_for_period_lte(uint64_t period)
> 	return -1;
> }
>
>+static uint64_t
>+oa_exponent_to_ns(int exponent)
>+{
>+       return 1000000000ULL * (2ULL << exponent) / intel_xe_perf->devinfo.timestamp_frequency;
>+}
>+
>+static bool
>+oa_report_ctx_is_valid(uint32_t *report)
>+{
>+	return report[0] & (1ul << 16);
>+}
>+
>+static uint32_t
>+oa_report_get_ctx_id(uint32_t *report)
>+{
>+	if (!oa_report_ctx_is_valid(report))
>+		return 0xffffffff;
>+	return report[2];
>+}
>+
>+static void *buf_map(int fd, struct intel_buf *buf, bool write)
>+{
>+	void *p;
>+
>+	if (is_xe_device(fd)) {
>+		buf->ptr = xe_bo_map(fd, buf->handle, buf->surface[0].size);
>+		p = buf->ptr;
>+	} else {
>+		if (gem_has_llc(fd))
>+			p = intel_buf_cpu_map(buf, write);
>+		else
>+			p = intel_buf_device_map(buf, write);
>+	}
>+	return p;
>+}
>+
>+static void
>+scratch_buf_memset(struct intel_buf *buf, int width, int height, uint32_t color)
>+{
>+	buf_map(buf_ops_get_fd(buf->bops), buf, true);
>+
>+	for (int i = 0; i < width * height; i++)
>+		buf->ptr[i] = color;
>+
>+	intel_buf_unmap(buf);
>+}
>+
>+static void
>+scratch_buf_init(struct buf_ops *bops,
>+		 struct intel_buf *buf,
>+		 int width, int height,
>+		 uint32_t color)
>+{
>+	intel_buf_init(bops, buf, width, height, 32, 0,
>+		       I915_TILING_NONE, I915_COMPRESSION_NONE);
>+	scratch_buf_memset(buf, width, height, color);
>+}
>+
> static bool
> oa_report_is_periodic(uint32_t oa_exponent, const uint32_t *report)
> {
>@@ -1344,6 +1423,304 @@ static void test_oa_formats(const struct drm_xe_engine_class_instance *hwe)
> }
>
>
>+enum load {
>+	LOW,
>+	HIGH
>+};
>+
>+#define LOAD_HELPER_PAUSE_USEC 500
>+
>+static struct load_helper {
>+	int devid;
>+	struct buf_ops *bops;
>+	uint32_t context_id;
>+	uint32_t vm;
>+	struct intel_bb *ibb;
>+	enum load load;
>+	bool exit;
>+	struct igt_helper_process igt_proc;
>+	struct intel_buf src, dst;
>+} lh = { 0, };
>+
>+static void load_helper_signal_handler(int sig)
>+{
>+	if (sig == SIGUSR2)
>+		lh.load = lh.load == LOW ? HIGH : LOW;
>+	else
>+		lh.exit = true;
>+}
>+
>+static void load_helper_set_load(enum load load)
>+{
>+	igt_assert(lh.igt_proc.running);
>+
>+	if (lh.load == load)
>+		return;
>+
>+	lh.load = load;
>+	kill(lh.igt_proc.pid, SIGUSR2);
>+}
>+
>+static void load_helper_run(enum load load)
>+{
>+	if (!render_copy)
>+		return;
>+
>+	/*
>+	 * FIXME fork helpers won't get cleaned up when started from within a
>+	 * subtest, so handle the case where it sticks around a bit too long.
>+	 */
>+	if (lh.igt_proc.running) {
>+		load_helper_set_load(load);
>+		return;
>+	}
>+
>+	lh.load = load;
>+
>+	igt_fork_helper(&lh.igt_proc) {
>+		signal(SIGUSR1, load_helper_signal_handler);
>+		signal(SIGUSR2, load_helper_signal_handler);
>+
>+		while (!lh.exit) {
>+			render_copy(lh.ibb,
>+				    &lh.src, 0, 0, 1920, 1080,
>+				    &lh.dst, 0, 0);
>+
>+			intel_bb_sync(lh.ibb);
>+
>+			/* Lower the load by pausing after every submitted
>+			 * write. */
>+			if (lh.load == LOW)
>+				usleep(LOAD_HELPER_PAUSE_USEC);
>+		}
>+	}
>+}
>+
>+static void load_helper_stop(void)
>+{
>+	if (!render_copy)
>+		return;
>+
>+	kill(lh.igt_proc.pid, SIGUSR1);
>+	igt_assert(igt_wait_helper(&lh.igt_proc) == 0);
>+}
>+
>+static void load_helper_init(void)
>+{
>+	if (!render_copy) {
>+		igt_info("Running test without render_copy\n");
>+		return;
>+	}
>+
>+	lh.devid = intel_get_drm_devid(drm_fd);
>+	lh.bops = buf_ops_create(drm_fd);
>+	lh.vm = xe_vm_create(drm_fd, 0, 0);
>+	lh.context_id = xe_exec_queue_create(drm_fd, lh.vm, &xe_engine(drm_fd, 0)->instance, 0);
>+	igt_assert_neq(lh.context_id, 0xffffffff);
>+
>+	lh.ibb = intel_bb_create_with_context(drm_fd, lh.context_id, lh.vm, NULL, BATCH_SZ);
>+
>+	scratch_buf_init(lh.bops, &lh.dst, 1920, 1080, 0);
>+	scratch_buf_init(lh.bops, &lh.src, 1920, 1080, 0);
>+}
>+
>+static void load_helper_fini(void)
>+{
>+	if (!render_copy)
>+		return;
>+
>+	if (lh.igt_proc.running)
>+		load_helper_stop();
>+
>+	intel_buf_close(lh.bops, &lh.src);
>+	intel_buf_close(lh.bops, &lh.dst);
>+	intel_bb_destroy(lh.ibb);
>+	xe_exec_queue_destroy(drm_fd, lh.context_id);
>+	xe_vm_destroy(drm_fd, lh.vm);
>+	buf_ops_destroy(lh.bops);
>+}
>+
>+static bool expected_report_timing_delta(uint32_t delta, uint32_t expected_delta)
>+{
>+	/*
>+	 * On ICL, the OA unit appears to be a bit more relaxed about
>+	 * its timing for emitting OA reports (often missing the
>+	 * deadline by 1 timestamp).
>+	 */
>+	if (IS_ICELAKE(devid))
>+		return delta <= (expected_delta + 3);
>+	else

can drop ICL stuff

>+		return delta <= expected_delta;
>+}
>+
>+/**
>+ * SUBTEST: oa-exponents
>+ * Description: Test that oa exponent values behave as expected
>+ */
>+static void test_oa_exponents(const struct drm_xe_engine_class_instance *hwe)
>+{
>+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+	uint64_t fmt = test_set->perf_oa_format;
>+
>+	load_helper_init();
>+	load_helper_run(HIGH);
>+
>+	/* It's asking a lot to sample with a 160 nanosecond period and the
>+	 * test can fail due to buffer overflows if it wasn't possible to
>+	 * keep up, so we don't start from an exponent of zero...
>+	 */
>+	for (int exponent = 5; exponent < 20; exponent++) {
>+		uint64_t properties[] = {
>+			DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+
>+			/* Include OA reports in samples */
>+			DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>+
>+			/* OA unit configuration */
>+			DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
>+			DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
>+			DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, exponent,
>+			DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
>+		};
>+		struct intel_xe_oa_open_prop param = {
>+			.num_properties = ARRAY_SIZE(properties) / 2,
>+			.properties_ptr = to_user_pointer(properties),
>+		};
>+		uint64_t expected_timestamp_delta = 2ULL << exponent;
>+		size_t format_size = get_oa_format(fmt).size;
>+		int max_reports = MAX_OA_BUF_SIZE / format_size;
>+		int buf_size = format_size * max_reports * 1.5;
>+		uint8_t *buf = calloc(1, buf_size);
>+		int ret, n_timer_reports = 0;
>+		uint32_t matches = 0;
>+#define NUM_TIMER_REPORTS 30
>+		uint32_t *reports = malloc(NUM_TIMER_REPORTS * format_size);
>+		uint32_t *timer_reports = reports;
>+
>+		igt_debug("testing OA exponent %d,"
>+			  " expected ts delta = %"PRIu64" (%"PRIu64"ns/%.2fus/%.2fms)\n",
>+			  exponent, expected_timestamp_delta,
>+			  oa_exponent_to_ns(exponent),
>+			  oa_exponent_to_ns(exponent) / 1000.0,
>+			  oa_exponent_to_ns(exponent) / (1000.0 * 1000.0));
>+
>+		stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
>+
>+		while (n_timer_reports < NUM_TIMER_REPORTS) {
>+			u32 oa_status = 0;
>+
>+			while ((ret = read(stream_fd, buf, buf_size)) < 0 && errno == EINTR)
>+				;
>+			if (errno == EIO) {
>+				oa_status = get_stream_status(stream_fd);
>+				igt_debug("oa_status %#x\n", oa_status);
>+				continue;
>+			}
>+
>+			/* igt_debug(" > read %i bytes\n", ret); */
>+			/* We should never have no data. */
>+			igt_assert(ret > 0);
>+
>+			for (int offset = 0;
>+			     offset < ret && n_timer_reports < NUM_TIMER_REPORTS;
>+			     offset += format_size) {
>+				uint32_t *report = (void *)(buf + offset);
>+
>+				if (oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW) {
>+					igt_assert(!"reached");
>+					break;
>+				}
>+
>+				if (oa_status & DRM_XE_OASTATUS_REPORT_LOST)
>+					igt_debug("report loss\n");
>+
>+				if (!oa_report_is_periodic(exponent, report))
>+					continue;
>+
>+				memcpy(timer_reports, report, format_size);
>+				n_timer_reports++;
>+				timer_reports += (format_size / 4);
>+			}
>+		}
>+
>+		__perf_close(stream_fd);
>+
>+		igt_debug("report%04i ts=%"PRIx64" hw_id=0x%08x\n", 0,
>+			  oa_timestamp(&reports[0], fmt),
>+			  oa_report_get_ctx_id(&reports[0]));
>+		for (int i = 1; i < n_timer_reports; i++) {
>+			uint64_t delta = oa_timestamp_delta(&reports[i],
>+							    &reports[i - 1],
>+							    fmt);
>+
>+			igt_debug("report%04i ts=%"PRIx64" hw_id=0x%08x delta=%"PRIu64" %s\n", i,
>+				  oa_timestamp(&reports[i], fmt),
>+				  oa_report_get_ctx_id(&reports[i]),
>+				  delta, expected_report_timing_delta(delta,
>+								      expected_timestamp_delta) ? "" : "******");
>+
>+			matches += expected_report_timing_delta(delta,expected_timestamp_delta);
>+		}
>+
>+		igt_debug("matches=%u/%u\n", matches, n_timer_reports - 1);
>+
>+		/*
>+		 * Expect half the reports to match the timing
>+		 * expectation. The results are quite erratic because
>+		 * the condition under which the HW reaches
>+		 * expectations depends on memory controller pressure
>+		 * etc...
>+		 */
>+		igt_assert_lte(n_timer_reports / 2, matches);
>+
>+		free(reports);
>+	}
>+
>+	load_helper_stop();
>+	load_helper_fini();
>+}
>+
>+/**
>+ * SUBTEST: invalid-oa-exponent
>+ * Description: Test that invalid exponent values are rejected
>+ */
>+/* The OA exponent selects a timestamp counter bit to trigger reports on.
>+ *
>+ * With a 64bit timestamp and least significant bit approx == 80ns then the MSB
>+ * equates to > 40 thousand years and isn't exposed via the xe oa interface.
>+ *
>+ * The max exponent exposed is expected to be 31, which is still a fairly
>+ * ridiculous period (>5min) but is the maximum exponent where it's still
>+ * possible to use periodic sampling as a means for tracking the overflow of
>+ * 32bit OA report timestamps.
>+ */
>+static void test_invalid_oa_exponent(void)
>+{
>+	uint64_t properties[] = {
>+		/* Include OA reports in samples */
>+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>+
>+		/* OA unit configuration */
>+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
>+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
>+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, 31, /* maximum exponent expected
>+						       to be accepted */
>+	};
>+	struct intel_xe_oa_open_prop param = {
>+		.num_properties = ARRAY_SIZE(properties) / 2,
>+		.properties_ptr = to_user_pointer(properties),
>+	};
>+
>+	stream_fd = __perf_open(drm_fd, &param, false);
>+
>+	__perf_close(stream_fd);
>+
>+	for (int i = 32; i < 65; i++) {
>+		properties[7] = i;
>+		intel_xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param, EINVAL);
>+	}
>+}
>+
> static unsigned read_xe_module_ref(void)
> {
> 	FILE *fp = fopen("/proc/modules", "r");
>@@ -1460,6 +1837,37 @@ test_sysctl_defaults(void)
> 	igt_assert_eq(paranoid, 1);
> }
>
>+static const char *xe_engine_class_name(uint32_t engine_class)
>+{
>+	switch (engine_class) {
>+		case DRM_XE_ENGINE_CLASS_RENDER:
>+			return "rcs";
>+		case DRM_XE_ENGINE_CLASS_COPY:
>+			return "bcs";
>+		case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
>+			return "vcs";
>+		case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
>+			return "vecs";
>+		case DRM_XE_ENGINE_CLASS_COMPUTE:
>+			return "ccs";
>+		default:
>+			igt_warn("Engine class 0x%x unknown\n", engine_class);
>+			return "unknown";
>+	}
>+}
>+
>+#define __for_one_hwe_in_each_oa_unit(hwe) \
>+	for (int m = 0; !m || hwe; m++) \
>+		for_each_if(hwe = oa_unit_engine(drm_fd, m)) \
>+			igt_dynamic_f("%s-%d", xe_engine_class_name(hwe->engine_class), \
>+				      hwe->engine_instance)
>+
>+/* Only OAG (not OAM) is currently supported */
>+#define __for_one_hwe_in_oag(hwe) \
>+	if ((hwe = oa_unit_engine(drm_fd, 0))) \
>+		igt_dynamic_f("%s-%d", xe_engine_class_name(hwe->engine_class), \
>+			      hwe->engine_instance)
>+
> #define __for_one_render_engine_0(hwe) \
> 	xe_for_each_engine(drm_fd, hwe) \
> 		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER) \
>@@ -1533,6 +1941,13 @@ igt_main
> 		__for_one_render_engine(hwe)
> 			test_oa_formats(hwe);
>
>+	igt_subtest("invalid-oa-exponent")
>+		test_invalid_oa_exponent();
>+
>+	igt_subtest_with_dynamic("oa-exponents")
>+		__for_one_hwe_in_oag(hwe)
>+			test_oa_exponents(hwe);
>+
> 	igt_fixture {
> 		/* leave sysctl options in their default state... */
> 		write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 1);
>-- 
>2.41.0
>
