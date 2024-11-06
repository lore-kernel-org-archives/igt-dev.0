Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6F3D44D77
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 14:14:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2178110E2E0;
	Wed,  6 Nov 2024 14:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k5tcNVA1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D93E110E2DF
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 14:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730902446; x=1762438446;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=aULEu6O4/ywKza6Y18CLsablQF2NCMF6PtxDSPV/hxQ=;
 b=k5tcNVA10/zZiThJpDfJWQLOgj2QM3JjZ3bfYX7arRx0E/flNPaNI0DD
 acXafnRb8lKR0u1HzQ6kdQmi8h8CzyY/PT55/FXZXWXOzYF3sVrtvFYMC
 iDspUEo/J0XTYadkiZj8aZc2piPi1ZFR7lC81bWUw9754LyQFOEMoPj44
 AKSd4FDM4HI3e/uQuK8KgQ3AOynYhRrsJo0J5ECLCpxVlNyObaUcymZ/J
 E/jm3UxT/fJPjC+q1KyHyy85xH8cYHLHLqFJv9Uo6++XmiRV/eRE/LQKC
 C1WiHxkayhtauOfRCSQJ2rN5zGdQSDWPYx2Dm0RphcMOG1ovpUUv0o7cG w==;
X-CSE-ConnectionGUID: mWPw0QKSSJ6XeJcAgXElXA==
X-CSE-MsgGUID: G767VL5kSV2PYtV83gr77g==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="33545813"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="33545813"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 06:14:06 -0800
X-CSE-ConnectionGUID: cFgyFE50TY+7bQOsfvbLgQ==
X-CSE-MsgGUID: SZH7W+XhTiGlXYhz87BOSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="88532123"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2024 06:14:06 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 06:14:06 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 06:14:06 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 06:14:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=daMJq4Vqo7BAs8a9BSEF8F3QqCCpW3R+rr0ZVULZH0kiOdE9GM0cdvPHVJErB4Mtyjdj/8KuqZa7R2B/gE4+cxH7Fn7Kjedml74hojgh5Vp+RZxd9kFGcaudQ/5n4BMNEYLcXc6eRTj+wkRk/P9zJjgIuveEh/RqnwrD/JWawSUe85f30BIKK2mq91BsMGFkl9OGihSSopkOeYIVYDEosvuCzb3wNwvAspW8PpYN7H10VqNxrmv5XYtMRevtaUCAkkUgN6N5Ik1TdWgBsshhAp41c5VN2nhWha0/I90K2/tlkPWyRU2lbnNV1x0Rkafs+aj1OcRYBAMkB3hOMOc9UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9tr3iIQzcJDFn17B3GNSxC38p2acf5rk2NzUpZqnc4=;
 b=Uj8fTIw+1QVGBbFGxdTC95PD9B4rZqAbERgWXARDqDSkivEo6pJy7aJqfaYWMgB/ku4L+GsN7bahadRfvvEogZ8otwNvg/sFu8G0xJMiveZm7lNqn7Z0xdXBFzRusrLmhivVs2/xAobODhcRM2V74xNesJdM3uqWYXatsQWdSZ4kFEwyA2+/K1A0l8KYSVj0Er+8WUhzo6hC1UZSFM9yY8yMr4ikkn7sLsrDwMc0GN/eczdnMn8vJ++RgmTC3UvYrxqq2OwHofyHcq+Fq5jhF4+0vD1eGg4Dk+OB2hV22EQ2xCNVrjNIk1babljxnBmBxuG7N7QOnibDbXZIx4bBEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5213.namprd11.prod.outlook.com (2603:10b6:a03:2da::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Wed, 6 Nov
 2024 14:14:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 14:14:02 +0000
Date: Wed, 6 Nov 2024 08:13:59 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gustavo
 Sousa" <gustavo.sousa@intel.com>
Subject: Re: [PATCH i-g-t] igt-runner fact checking
Message-ID: <tmbhd2nam5xibqejlcpqo53zeiv543jkfokfh4yly63yjhpqf7@ruf6limclqyh>
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
X-ClientProxiedBy: MW2PR16CA0059.namprd16.prod.outlook.com
 (2603:10b6:907:1::36) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5213:EE_
X-MS-Office365-Filtering-Correlation-Id: 33dda162-eb21-4349-bfb5-08dcfe6d43d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?QS64YAzIAQLi5iz60AwFznv5BhjVh5aj0B1vacZVkiPSHs7eWwfe2f/+dZ?=
 =?iso-8859-1?Q?tfXbFxZAlcc0guZCvSAhYHdFcFYFAfn438dHi6mrkWzpbM81isAVGRz+CS?=
 =?iso-8859-1?Q?CeKQbxHNYYkYBSp70o49eWSZzy72eIY6jBIn9T0ZQbrqaZqs9Or265t4gE?=
 =?iso-8859-1?Q?O4yc3+yQjDpniVr1yzGKFseDhVZ+++hLGn0vBuQHYP9e6M02AHGFfyvhJP?=
 =?iso-8859-1?Q?Llps3IEqdd41GihQ3/evNB3WDTp7etc5Xnm1N8NSUgnNJZv/EJ8vGycaZb?=
 =?iso-8859-1?Q?SitqYcrAqC4Fz6FLvmwXl51TOOBwq/LN4uzUYfy6FoxRyesJ6Qo8zIrUFO?=
 =?iso-8859-1?Q?w6cPSRvTspUKpdQgcYdXdhQ+PvzoCSBLAbmarr5ygC31h16pbcR5uzNzTi?=
 =?iso-8859-1?Q?DocFBuYafJcDAYs9IHUJolQ0aFMVUHPVWwrsXOIDk1qUrwaeP8KKQiAfys?=
 =?iso-8859-1?Q?iyNqfxB/9V4F7Yg+P8mTxfOkvU7ylHUXhJjlnxrT8TbmzhYGDynuWQh+DK?=
 =?iso-8859-1?Q?t1V22v/WJZW8qx1RSAHaKqIFnsWwbSpaZysgXowh315CC+lKc+wHUbpSAH?=
 =?iso-8859-1?Q?erRKexkXLfQYhv5PyfV3YVC+FrdKZ4m68wXWHLUke5EtB80AP7Sts7+uJX?=
 =?iso-8859-1?Q?AITfBP2tH188QS5IzNRwsM2xpmyW3sRsfgztZcK8pSF3l9+in5pAVcOKNb?=
 =?iso-8859-1?Q?XoY5UEjebromTQSaE+7Ockq7fSO2yVyrOqlRHkbelYRloE+Rbc8gSPSnsA?=
 =?iso-8859-1?Q?7tpb6c9CzSWh59uw3djVhERn1vzUpJXdi5DRRIiJzIKQSWqeUIggRt/Hy7?=
 =?iso-8859-1?Q?GtW8zf1JuPShv0XZWNNG8fAmib1/b9J/EcJjKY2Y3wI3qRm5sYcBo+WcDw?=
 =?iso-8859-1?Q?DdKVQ+Y6lWsQ5UBQbhJKrpt5FYDL7irGj23S3OXofSnb09odgXE3r7pFET?=
 =?iso-8859-1?Q?3QD9FlltV+q98n5Ol5zbPGu0jQyi2mTMifdlccfCPXGUu3SSN3lVYnMnWw?=
 =?iso-8859-1?Q?0atrB0/F4ntgmgP5ZPl2F9HfXtkJ4A2NvYNRIs4eHTX5AMRO0ICuPGq3rp?=
 =?iso-8859-1?Q?7BUy/LPQxrBuYk9d0RzeU0VgHeF0z5vylC4Csvt6sOUzbd4Hwxi3Tx+0Q/?=
 =?iso-8859-1?Q?T/JGG2zLEonXk5k9RP1G0HUyOkFbEGmnjPdGjyMf+M8Dqs4wyhPuglPR53?=
 =?iso-8859-1?Q?AHE9gz6X0kwjnK+dpVQ041weLHOdYN4bZU3AeB+W21LuThbpWtk16iS+Qq?=
 =?iso-8859-1?Q?CwrgL7j4B9EdaMymi3324vL6BmLbQMjMVQ6NTUbJKK4TTOw6fLjqsaWwaE?=
 =?iso-8859-1?Q?4eyOftqrVMFHlHldir5f4nxZ5Db8tgt1lpaB2S3R0Rb5i4zmdpHKAK6AVR?=
 =?iso-8859-1?Q?+hr1/2jq0t?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CDggXaA6ZqfPAMpeAkmCFLPNI7FvJJ0C/x9l9TiEQIF3SNu8OgPUsIwv2p?=
 =?iso-8859-1?Q?ayAA0tmLcEIUCPYPI3jHkuqenAVYBVwlQtcim7pjPiyJkZNQdex+VOmN/u?=
 =?iso-8859-1?Q?/vPIxSkaMoIlJDzCqRKLUUsbK9zBrrp1cqvKn7pEx5tDLbeL9tY+Kgs3La?=
 =?iso-8859-1?Q?6ujlNqSvYWNfqvu6FHOHFn4HkHHBoNnIElb7GG79Em1i1rkx35TJkEqfP+?=
 =?iso-8859-1?Q?6e9SYWvcrpwm6oSRrYUfOiFmlODiQgqD/Cbp2NZzoLjEI7mUMQigqw4I5c?=
 =?iso-8859-1?Q?5byGbMXba0kQSGHe0UxWbGq2ABzkWRjIt2Xis9Zgh5JwBk6NIGCoY6fhYG?=
 =?iso-8859-1?Q?2/LEmZ7XEIOdR8XrsjTrW1H1F0E2lUI1WOxX3dyzFpO+Lhi/kP9ELP5fdX?=
 =?iso-8859-1?Q?EuT+iwh0/npqFw2Ltmn9cFTglX0tr0KTFs0PsujucqX+CYGt+Nhdhh5Oc+?=
 =?iso-8859-1?Q?T+GNLU4uPKndkmsfMpHE83pUrLL6M65mU7vUvtkDj4JBxoYZGngdW2HanV?=
 =?iso-8859-1?Q?3gKw9JK06rhtrdpZ3pwNDe/tGUd+q0IvDRq7V8HZqWtv01D+Eah564p0fT?=
 =?iso-8859-1?Q?9mUxy+IcX1UbEibU0WZaHlfpTG7HD3/0g6OwQSkIawyH20aSGDJG1VeAK8?=
 =?iso-8859-1?Q?3DqqLLNx4rSUWS8sOQEm4mVifeaaN3pNQhIT7fFU0I8WOcaoFHJZF3EiJk?=
 =?iso-8859-1?Q?UQ7hXfGfgrgYXFO5cQdcgNOiMeHxpNaWCDVwuX2w5Kwp17qvIueMTOuxBm?=
 =?iso-8859-1?Q?DpIBwE5W6Lo4LGKq3W3ZXdeFxIDUxqLCDrhr17qZHUh6rtE8tF9wlKD8z9?=
 =?iso-8859-1?Q?ry/pIZlr0uEzA0NaBxXLElLx/WBL6Ej7+8XFAOlZveWHe9ckdwW2WLo44n?=
 =?iso-8859-1?Q?o6XhAe5GRV0FE1oer2k+MESEq9OkxWg3TXoMw8A+Zft5hvIzj8ooshBvPW?=
 =?iso-8859-1?Q?X46fuJpIluS6Wz7FG+GWv6XUXGbxHljrcXiugMHiL/1Kn63i0tm2UcFiuA?=
 =?iso-8859-1?Q?g6pJvImzsyu1FYz9RtokUNLPVCzDDDyOGG8BDgwppbXUVCbrXHAYK5Vpa6?=
 =?iso-8859-1?Q?YsoNeojN+TubGXqSOCD713dcsUhMD5CWUB3TclSDnUWJGDiOLWmbdKWm2V?=
 =?iso-8859-1?Q?WngrBXq+sbtYZ+wMCK246EwbvLSmSLP5SEOAWWw4nLwZrEmxRBdTm4jX2k?=
 =?iso-8859-1?Q?FDc4PjT51qyOcv3+rVbznqqE6U16j6QWBW1eF2ND8wUrHus9y8WgPHpcDV?=
 =?iso-8859-1?Q?/PgFPl7CYWCPaQ0MzT1n7E+V32fyLBXXbeHYuhASQCPjam6rpep/bX0lUs?=
 =?iso-8859-1?Q?Ut8OrWw7nB9NOZO6ZNgU9ec5BT+cuwlHDCmEVMXxCzwJERKbMU5vGx0zuL?=
 =?iso-8859-1?Q?kE7YuSY1kT3509PCtdso27IfJC1sLn35fJXilYl7Mzpjc7JcJwI+RiEMNE?=
 =?iso-8859-1?Q?JLxSindtMFsS2vwekZV/w07WzTyBSHWS9dU0oxz6V03jVHZMXR/dUT/lKA?=
 =?iso-8859-1?Q?2vrzXgXuq+bqDKn4m1tfbsHDpBWsVr3jOU2d1WDEx5fyaAuH/Js7N7KIwT?=
 =?iso-8859-1?Q?ufaYPIwOTKHzcvIoGWz6b+TmhLJBGKCUqIcQ1iXeTrblBKUD9/oYmqA0qc?=
 =?iso-8859-1?Q?NUH4emyPubwip0XfeLPyXzlZ+Cm4wtGcDrD/gh2+Bq1uxAigHzlWaGLQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33dda162-eb21-4349-bfb5-08dcfe6d43d5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 14:14:02.6611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NhTwvqyqAUTbzI19DNzgmxTOjdQcyHdCjqh1J0bYOL9S+MXcSsQM+Dz5fZdKoMuJV7t6QUlz2v3o/4bNYd8uSQK7Utlq3qpKixURtG4rq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5213
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

On Sat, Nov 02, 2024 at 12:37:59PM +0100, Peter Senna Tschudin wrote:
>On igt-runner, before each test, and after the last test collect and report
>facts, such as:
> - hardware.pci.gpu_at_addr.0000:03:00.0 = 8086:e20b Intel Battlemage (Gen20)
> - hardware.pci.drm_card_at_addr.0000:03:00.0 = card1
> - kernel.kmod_is_loaded.i915 = true
>
>Reports new, deleted and changed facts. Here is an example:
> $ cat test-list
> igt@core_hotunplug@hotrebind
> igt@xe_module_load@reload-no-display
>
> $ ... ./build/runner/igt_runner ...
> [51.225490] [FACT before any test] new hardware.pci.gpu_at_addr.0000:03:00.0 = 8086:e20b Intel Battlemage (Gen20)
> [51.225700] [FACT before any test] new hardware.pci.gpu_at_addr.0000:00:02.0 = 8086:a782 Intel Raptorlake_s (Gen12)
> [51.227334] [1/2] core_hotunplug (hotrebind)
> [59.429470] [FACT core_hotunplug (hotrebind)] new hardware.pci.drm_card_at_addr.0000:03:00.0 = card1
> [59.429486] [FACT core_hotunplug (hotrebind)] new hardware.pci.drm_card_at_addr.0000:00:02.0 = card2
> [59.430002] [FACT core_hotunplug (hotrebind)] new kernel.kmod_is_loaded.amdgpu = true
> [59.430011] [FACT core_hotunplug (hotrebind)] new kernel.kmod_is_loaded.i915 = true
> [59.430014] [FACT core_hotunplug (hotrebind)] new kernel.kmod_is_loaded.xe = true
> [59.430456] [2/2] xe_module_load (reload-no-display)
> [61.521348] [FACT xe_module_load (reload-no-display)] deleted hardware.pci.drm_card_at_addr.0000:03:00.0 = card1
> [61.521834] [FACT xe_module_load (reload-no-display)] deleted kernel.kmod_is_loaded.xe = true
> Done.
>
>As igt@core_hotunplug@hotrebind makes changes to the system, running the same
>test-list again produces different results:
>
> $ ... ./build/runner/igt_runner ...
> [141.870776] [FACT before any test] new hardware.pci.gpu_at_addr.0000:03:00.0 = 8086:e20b Intel Battlemage (Gen20)
> [141.870820] [FACT before any test] new hardware.pci.gpu_at_addr.0000:00:02.0 = 8086:a782 Intel Raptorlake_s (Gen12)
> [141.872987] [FACT before any test] new hardware.pci.drm_card_at_addr.0000:00:02.0 = card2
> [141.874137] [FACT before any test] new kernel.kmod_is_loaded.amdgpu = true
> [141.874144] [FACT before any test] new kernel.kmod_is_loaded.i915 = true
> [141.874596] [1/2] core_hotunplug (hotrebind)
> [146.662913] [FACT core_hotunplug (hotrebind)] changed hardware.pci.drm_card_at_addr.0000:00:02.0: card2 -> card0
> [146.663850] [2/2] xe_module_load (reload-no-display)
> Done.
>
>TODO
> - Save logs to disk.
>
>Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>---
> lib/igt_facts.c   | 443 ++++++++++++++++++++++++++++++++++++++++++++++
> lib/igt_facts.h   |  51 ++++++
> lib/meson.build   |   1 +
> runner/executor.c |   9 +
> 4 files changed, 504 insertions(+)
> create mode 100644 lib/igt_facts.c
> create mode 100644 lib/igt_facts.h
>
>diff --git a/lib/igt_facts.c b/lib/igt_facts.c
>new file mode 100644
>index 000000000..90b362c5e
>--- /dev/null
>+++ b/lib/igt_facts.c
>@@ -0,0 +1,443 @@
>+// SPDX-License-Identifier: MIT
>+
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ *
>+ * Permission is hereby granted, free of charge, to any person obtaining a
>+ * copy of this software and associated documentation files (the "Software"),
>+ * to deal in the Software without restriction, including without limitation
>+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>+ * and/or sell copies of the Software, and to permit persons to whom the
>+ * Software is furnished to do so, subject to the following conditions:
>+ *
>+ * The above copyright notice and this permission notice (including the next
>+ * paragraph) shall be included in all copies or substantial portions of the
>+ * Software.
>+ *
>+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
>+ * IN THE SOFTWARE.

we shouldn't be copying this in new files. Just SPDX + Copyright is
sufficient.

>+ *
>+ */
>+
>+#include <stdio.h>
>+#include <glib.h>
>+#include <libudev.h>
>+#include "igt_core.h"
>+#include "igt_kmod.h"
>+#include "igt_facts.h"
>+#include "igt_device_scan.h"
>+
>+
>+/* Report new facts and fact changes
>+ * - new: new_value is NULL
>+ * - change: new_value is not NULL
>+ * - delete: delete is true
>+ */
>+static void report_fact_change(igt_fact *fact, const char *new_value,
>+							   const char *last_test, bool delete)
>+{
>+	struct timespec uptime_ts;
>+	char *uptime = NULL;
>+
>+	if (last_test == NULL)
>+		last_test = g_strdup("before any test");

why are we using glib? I only see functions that could be replaced by
libc like strdup() and asprintf()

>+
>+	if (clock_gettime(CLOCK_BOOTTIME, &uptime_ts) != 0)
>+		return;
>+
>+	uptime = g_strdup_printf("%ld.%06ld",
>+							 uptime_ts.tv_sec,
>+							 uptime_ts.tv_nsec / 1000);
>+
>+	/* If delete is true, the fact was deleted */
>+	if (delete) {
>+		igt_info("[%s] [FACT %s] deleted %s = %s\n",
>+			 uptime, last_test, fact->name, fact->value);
>+		return;
>+	}
>+
>+	/* If new_value is NULL, it is a new fact */
>+	if (new_value == NULL) {
>+		igt_info("[%s] [FACT %s] new %s = %s\n",
>+			 uptime, last_test, fact->name, fact->value);
>+		return;
>+	}
>+
>+	/* Check if the value changed */
>+	if (strcmp(fact->value, new_value) != 0) {
>+		igt_info("[%s] [FACT %s] changed %s: %s -> %s\n",
>+		       uptime, last_test, fact->name, fact->value, new_value);
>+	}
>+	g_free(uptime);
>+}
>+
>+/* Get a fact by name. Return NULL if fact is not found. */
>+static igt_fact *get_fact(igt_fact_list *list, const char *name)
>+{
>+	if (!list || list->facts == NULL || list->num_facts == 0)
>+		return NULL;
>+
>+	for (int i = 0; i < list->num_facts; i++) {
>+		if (list->facts[i].name == NULL)
>+			continue;
>+
>+		if (strcmp(list->facts[i].name, name) == 0)
>+			return &list->facts[i];
>+	}
>+	return NULL;
>+}
>+
>+static bool delete_fact(igt_fact_list *list, const char *name, const char *last_test)
>+{
>+	igt_fact *fact = NULL;
>+	int i;
>+
>+	fact = get_fact(list, name);
>+	if (fact == NULL)
>+		return false;
>+
>+	/* Report the deletion */
>+	report_fact_change(fact, NULL, last_test, true);
>+
>+	/* Move all facts after the one to be deleted one step back */
>+	for (i = 0; i < list->num_facts; i++) {
>+		if (strcmp(list->facts[i].name, name) == 0) {
>+			g_free(list->facts[i].name);
>+			g_free(list->facts[i].value);
>+
>+			for (int j = i; j < list->num_facts - 1; j++)
>+				list->facts[j] = list->facts[j + 1];
>+			break;
>+		}
>+	}
>+	list->num_facts--;
>+	list->facts = realloc(list->facts, list->num_facts * sizeof(igt_fact));
>+
>+	return true;
>+}
>+
>+/* Only used while creating the new_list. Not intended to add facts to the
>+ * global fact list.
>+ */
>+static bool set_fact(igt_fact_list *list, const char *name,
>+						 const char *value, const char *last_test)
>+{
>+	igt_fact *fact = NULL;
>+
>+	/* Check that name and value are not null */
>+	if (name == NULL || value == NULL)
>+		return false;
>+
>+	fact = get_fact(list, name);
>+	if (fact != NULL)
>+		return false; /* Should not happen */
>+
>+	/* Add a new fact */
>+	list->num_facts++;
>+	list->facts = realloc(list->facts, list->num_facts * sizeof(igt_fact));
>+	list->facts[list->num_facts - 1].name = g_strdup(name);
>+	list->facts[list->num_facts - 1].value = g_strdup(value);
>+
>+	if (last_test)
>+		list->facts[list->num_facts - 1].last_test = g_strdup(last_test);
>+	else
>+		list->facts[list->num_facts - 1].last_test = NULL;
>+
>+	return true;
>+}
>+
>+/* Add a new fact or update the value of an existing fact. Return false if
>+ * the value is the same as the existing one.
>+ */
>+static bool update_list(igt_fact_list *list, const char *name,
>+						const char *value, const char *last_test)
>+{
>+	igt_fact *fact = NULL;
>+
>+	/* Check that name and value are not null */
>+	if (name == NULL || value == NULL)
>+		return false;
>+
>+	fact = get_fact(list, name);
>+	if (fact != NULL) {
>+		/* Return false if fact->value equals value */
>+		if (strcmp(fact->value, value) == 0)
>+			return false; /* Not changed */
>+
>+		report_fact_change(fact, value, last_test, false);
>+
>+		/* Update the value */
>+		fact->value = g_strdup(value);
>+		return true;
>+	}
>+
>+	/* Add a new fact */
>+	list->num_facts++;
>+	list->facts = realloc(list->facts, list->num_facts * sizeof(igt_fact));
>+	list->facts[list->num_facts - 1].name = g_strdup(name);
>+	list->facts[list->num_facts - 1].value = g_strdup(value);
>+
>+	/* Report new fact */
>+	report_fact_change(&list->facts[list->num_facts - 1], NULL,
>+					   last_test, false);
>+
>+	return true;
>+}
>+
>+/* Merge list and new_list. fact_group is used to filer entries on list
>+ * that should be deleted. For example, if fact_group is "pci_gpu", we
>+ * can delete the fact hardware.pci.gpu_at.0000:00:02.0 if it doesn't
>+ * exist in new_list.
>+ */
>+static void merge_facts(igt_fact_list *list, igt_fact_list *new_list,
>+						const char *fact_group, const char *last_test)
>+{
>+	/* Filter by fact_group and delete facts that exist on list
>+	 * but not on new_list
>+	 */
>+	for (int i = 0; i < list->num_facts; i++) {
>+		if (strstr(list->facts[i].name, fact_group) == NULL)
>+			continue;
>+		if (get_fact(new_list, list->facts[i].name) == NULL)
>+			delete_fact(list, list->facts[i].name, last_test);
>+	}
>+
>+	/* Add and update facts from new_list to list */
>+	for (int i = 0; i < new_list->num_facts; i++) {
>+		if (strstr(new_list->facts[i].name, fact_group) == NULL)
>+			continue; /* Should never happen */
>+		update_list(list, new_list->facts[i].name, new_list->facts[i].value,
>+				 new_list->facts[i].last_test);
>+	}
>+}
>+
>+static void scan_pci_for_gpus(igt_fact_list *list, const char *last_test)
>+{
>+	struct udev *udev = NULL;
>+	struct udev_enumerate *enumerate = NULL;
>+	struct udev_list_entry *devices, *dev_list_entry;
>+	struct igt_device_card card;
>+	char pcistr[10];
>+	int ret;
>+	char *factname = NULL;
>+	char *factvalue = NULL;
>+	igt_fact_list new_list = {0};
>+
>+	udev = udev_new();
>+	if (!udev) {
>+		igt_warn("Failed to create udev context\n");
>+		return;
>+	}
>+
>+	enumerate = udev_enumerate_new(udev);
>+	if (!enumerate) {
>+		igt_warn("Failed to create udev enumerate\n");
>+		udev_unref(udev);
>+		return;
>+	}
>+
>+	ret = udev_enumerate_add_match_subsystem(enumerate, "pci");
>+	if (ret < 0)
>+		goto out;
>+
>+	ret = udev_enumerate_add_match_property(enumerate, "PCI_CLASS", "30000");
>+	if (ret < 0)
>+		goto out;
>+
>+	ret = udev_enumerate_add_match_property(enumerate, "PCI_CLASS", "38000");
>+	if (ret < 0)
>+		goto out;
>+
>+	ret = udev_enumerate_scan_devices(enumerate);
>+	if (ret < 0)
>+		goto out;
>+
>+	devices = udev_enumerate_get_list_entry(enumerate);
>+	if (!devices)
>+		goto out;
>+
>+	udev_list_entry_foreach(dev_list_entry, devices) {
>+		const char *path;
>+		struct udev_device *udev_dev;
>+		struct udev_list_entry *entry;
>+		char *model = NULL;
>+		char *codename = NULL;
>+
>+		path = udev_list_entry_get_name(dev_list_entry);
>+		udev_dev = udev_device_new_from_syspath(udev, path);
>+		if (!udev_dev)
>+			continue;
>+
>+		/* Strip path to only the content after the last / */
>+		path = strrchr(path, '/');
>+		if (path)
>+			path++;
>+		else
>+			path = "unknown";
>+
>+		strcpy(card.pci_slot_name, "-");
>+
>+		entry = udev_device_get_properties_list_entry(udev_dev);
>+		while (entry) {
>+			const char *name = udev_list_entry_get_name(entry);
>+			const char *value = udev_list_entry_get_value(entry);
>+
>+			entry = udev_list_entry_get_next(entry);
>+			if (!strcmp(name, "ID_MODEL_FROM_DATABASE"))
>+				model = g_strdup(value);
>+			else if (!strcmp(name, "PCI_ID"))
>+				igt_assert_eq(sscanf(value, "%hx:%hx",
>+						     &card.pci_vendor, &card.pci_device), 2);
>+		}
>+		snprintf(pcistr, sizeof(pcistr), "%04x:%04x",
>+				 card.pci_vendor, card.pci_device);
>+		codename = igt_device_get_pretty_name(&card, false);
>+
>+		factname = g_strdup_printf("%s.%s", pci_gpu_fact, path);
>+		factvalue = g_strdup_printf("%s %s %s",
>+				 pcistr,
>+				 codename ? codename : "",
>+				 model ? model : "");
>+
>+		set_fact(&new_list, factname, factvalue, last_test);
>+
>+		free(codename);
>+		free(model);
>+		udev_device_unref(udev_dev);
>+	}
>+	merge_facts(list, &new_list, pci_gpu_fact, last_test);
>+
>+out:
>+	udev_enumerate_unref(enumerate);
>+	udev_unref(udev);
>+}
>+
>+static void scan_pci_drm_cards(igt_fact_list *list, const char *last_test)
>+{
>+	struct udev *udev = NULL;
>+	struct udev_enumerate *enumerate = NULL;
>+	struct udev_list_entry *devices, *dev_list_entry;
>+	int ret;
>+	char *factname = NULL;
>+	char *factvalue = NULL;
>+	igt_fact_list new_list = {0};
>+
>+	udev = udev_new();
>+	if (!udev)
>+		return;
>+
>+	enumerate = udev_enumerate_new(udev);
>+	if (!enumerate) {
>+		udev_unref(udev);
>+		return;
>+	}
>+
>+	ret = udev_enumerate_add_match_subsystem(enumerate, "drm");
>+	if (ret < 0)
>+		goto out;
>+
>+	ret = udev_enumerate_scan_devices(enumerate);
>+	if (ret < 0)
>+		goto out;
>+
>+	devices = udev_enumerate_get_list_entry(enumerate);
>+	if (!devices)
>+		goto out;
>+
>+	ret = udev_enumerate_add_match_subsystem(enumerate, "drm");
>+	if (ret < 0)
>+		goto out;
>+
>+	ret = udev_enumerate_scan_devices(enumerate);
>+	if (ret < 0)
>+		goto out;
>+
>+	devices = udev_enumerate_get_list_entry(enumerate);
>+	if (!devices)
>+		goto out;
>+
>+	udev_list_entry_foreach(dev_list_entry, devices) {
>+		const char *path;
>+		struct udev_device *drm_dev, *pci_dev;
>+		const char *drm_name, *pci_addr;
>+
>+		path = udev_list_entry_get_name(dev_list_entry);
>+		drm_dev = udev_device_new_from_syspath(udev, path);
>+		if (!drm_dev)
>+			continue;
>+
>+		drm_name = udev_device_get_sysname(drm_dev);
>+		/* Filter the device by name. Want devices such as card0 and card1.
>+		 * If the device has '-' in the name, contine
>+		 */
>+		if (strncmp(drm_name, "card", 4) != 0 || strchr(drm_name, '-') != NULL) {
>+			udev_device_unref(drm_dev);
>+			continue;
>+		}
>+
>+		/* Get the pci address of the gpu associated with the drm_dev*/
>+		pci_dev = udev_device_get_parent_with_subsystem_devtype(drm_dev, "pci", NULL);
>+		if (pci_dev) {
>+			pci_addr = udev_device_get_sysattr_value(pci_dev, "address");
>+			if (!pci_addr)
>+				pci_addr = udev_device_get_sysname(pci_dev);
>+		} else {
>+			/* Some GPUs are platform devices. Ignore them. */
>+			pci_addr = NULL;
>+			udev_device_unref(drm_dev);
>+			continue;
>+		}
>+
>+		factname = g_strdup_printf("%s.%s", drm_card_fact, pci_addr);
>+		factvalue = g_strdup_printf("%s", drm_name);
>+		set_fact(&new_list, factname, factvalue, last_test);
>+
>+		udev_device_unref(drm_dev);
>+	}
>+	if (new_list.num_facts > 0)
>+		merge_facts(list, &new_list, drm_card_fact, last_test);
>+
>+out:
>+	udev_enumerate_unref(enumerate);
>+	udev_unref(udev);
>+}
>+
>+static void scan_kernel_loaded_kmods(igt_fact_list *list, const char *last_test)
>+{
>+	char *name = NULL;
>+	igt_fact_list new_list = {0};
>+
>+	/* Iterate over igt_fact_kmod_list[] until the element contains "\0" */
>+	for (int i = 0; strcmp(igt_fact_kmod_list[i], "\0") != 0; i++) {
>+		name = g_strdup_printf("%s.%s", kmod_fact, igt_fact_kmod_list[i]);
>+		if (igt_kmod_is_loaded(igt_fact_kmod_list[i]))
>+			set_fact(&new_list, name, "true", last_test);
>+
>+		g_free(name);
>+	}
>+	merge_facts(list, &new_list, kmod_fact, last_test);
>+}
>+
>+void igt_facts(igt_fact_list *list, const char *last_test)
>+{
>+	scan_pci_for_gpus(list, last_test);

ok, this uses udev to scan for vga/display

>+	scan_pci_drm_cards(list, last_test);

this seems rather to be scan_drm_cards, i.e. any device that has a
loaded driver registered with drm subsystem. This would also show
vgem, usb, etc

>+	scan_kernel_loaded_kmods(list, last_test);


So... igt_facts() hardcodes what is the info collected. Maybe we
should rather plug this into the hooks framework as part of
"built-in hooks".

This way it's easier to control what and when info is collected,
allowing developers (and CI) to pick and choose what gets executed.

+Gustavo

Lucas De Marchi
