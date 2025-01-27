Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE92C02188
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 15:13:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1AF10E563;
	Mon, 27 Jan 2025 15:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FtKX0Vl6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDED10E563
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 15:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737990783; x=1769526783;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mtO3A9fCqOatJXCuq52K20CqpG3dv0cw8VNPZLE0z58=;
 b=FtKX0Vl6uWzV8z1BPWD90T5BwpEM+wS+CwzFUdu8BEG06xDCMr3qEryQ
 QsuhZCx9T1F/NHv++i8hNT6hlSqqmAIc3O96snafAylvVdjYZZmDlDLV9
 Po+0E5zaAEQ9AZVL/ILirJCHk3GTExh5a9gc+aYhTeendA34SORDmiRVJ
 rw2QxPxcXit/y46WBVaaxTfFcsGGFHhUT+S4gmbnSvpov6zemBNoY37Lq
 EI4sZuNoceZU8W+PpabR9eqqYUUzCtFhCLyKq3L/EUQynjZrftEPFJMru
 Otsdkhv1EJeofhjoyig0X+rvu8XIwF7iTqcGK8R7qhJRDKJB91Qb0V1Ud A==;
X-CSE-ConnectionGUID: 9zdashTtRoChj1Qe5Tcj+Q==
X-CSE-MsgGUID: DKBzTqw6SY6CXSRbFELfaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38485810"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="38485810"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 07:13:01 -0800
X-CSE-ConnectionGUID: FgvcCRRjRLGXlV299/JKjA==
X-CSE-MsgGUID: 9h8cCilnQ/eyyRSIuWqjPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113602540"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 07:13:02 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 07:13:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 07:13:00 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 07:13:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LU3jYnqIRJCCUa8xXyWMB8esUXC42ODGZQzIDHCxTe7fIyVZlP/EYHlsDg/0D2sVUd0A4sND/+CI/rGCFFbcy8G9A4woMgRWJru8zlVPWnP6GhlkfwovdfnKd6ipnCn+YJL2lcE9d2MR3BVOxW+gta8bnkoopw8UojqLDwn4ov446LzXpysHdT2Mw+q71lPteTCWjL1/3bUVPZqz/RyVd/1YYqlTlu3ddUw99WsEv1HrfEcz6BjbVW1MJNbixhGqRZ82hzsRo49j00gD9fVWfVIukf5Jeyygm4h5WngAd5UeGY1tNJCB4y85j45+ir+fK6BYoU6M2b5hRwVMqwoFSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0KrLyehVrmyLO/IHN13EpjeGNmNvwbE0kg7sACjiWc=;
 b=gyC7JHuV0d+qIaxG1tBwx5EI1Sk5pyvoYrKufZQ9hNdRPtmaof2ReayJ2P1ZNjpLaRzglwvAg4koXAK8RBWFgz4X6nwX0vEF/jv316ArR160ohUUfccb0MNJQhY+V4urY80cNGrNq9hX3OshWqWFrlGmHguJeoRGSscO0Qv6PQyKsHszjuaWTuy3f/SnH68rXAFdfQ4nbexYgqtgqL8MFExRfTxVuSzSH2f99Y09s+QaPccx0Yaqt1shqxVo5okzPyvo1XaAN7HWqzZ8310JlEUiVKNwFaVPRcAEgCxsludgjOTU25bRFQ/KpMpG2Wc8BbogUJKEgrhki7nCJyriTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4614.namprd11.prod.outlook.com (2603:10b6:208:268::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Mon, 27 Jan
 2025 15:12:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 15:12:44 +0000
Date: Mon, 27 Jan 2025 09:12:42 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/perf_pmu: Drop cpu-hotplug subtest
Message-ID: <4qaxodfbnqpswx5lkvwoxtcuxcxa5rynvk6vbuzwathdonare3@fo5mo2xjoifn>
References: <20250123053039.1948302-1-lucas.demarchi@intel.com>
 <386b2877-2768-4880-94d9-765216a5fd20@ursulin.net>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <386b2877-2768-4880-94d9-765216a5fd20@ursulin.net>
X-ClientProxiedBy: MW4PR03CA0086.namprd03.prod.outlook.com
 (2603:10b6:303:b6::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4614:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e799ce2-a337-4f3b-7967-08dd3ee50ced
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v9HIMf0voVn2SWdePt/gq++hwkkfRwlh6M49diuGJFOeTJE9GAj1A2BwvywN?=
 =?us-ascii?Q?tqsa1wR8nUPGiE0azTC4LMu6MYSYaBs1MByZMk92nmdp/ALAzwTyjtLWSGyM?=
 =?us-ascii?Q?o7W8lHvB8vhyfxzJ5nhSnbApa8wOdJeo1/toAxLXWxs74TXat7mc874toPjL?=
 =?us-ascii?Q?iWEAf/MOVvHSGDNDx/ZtMJlm1sIKAhQL6aomdVU6ni9BQTsc1oU0Q0Q64Q6J?=
 =?us-ascii?Q?WiAd0zrGRcSnbgonQ8vU44EyywVTBnbdXvWYdUW6+wHNyobP+shIRZB+sFbz?=
 =?us-ascii?Q?Tz6SxP3ZCOsxeZPvMy1O1uzvx6keHfssPbDlmfCxOp8u4ALVb/5HURWo3sEl?=
 =?us-ascii?Q?hDn9mcmXqJxLiy9wHyAUlJ03h5UBCYp3/HZnrsUX187jiBgp5w6xkwfXonOg?=
 =?us-ascii?Q?H1sfRFM5c/uFZF8LBdBa5l1PL3BcwjexjrWW53L669KaHBRoIMBLmwSLgj+N?=
 =?us-ascii?Q?b9EYZOZC5QWXNp4ZwtptzHz61YuphngyPkWWb/BE/JM9hXYt20DR0F16COzn?=
 =?us-ascii?Q?LjBIWhPRzcxx098xqQgU3BRTWsMVgV80Xf9rcn7M3yhxtLJT3NP5CBLgPyWF?=
 =?us-ascii?Q?drtEu51BrcL5cBXnPfkuxCMISl64x0ed4LUW9N8tvNE+EgnQSYW8/T8xo+z0?=
 =?us-ascii?Q?J5Jh+MNLklPmZJxGHgQOGdOG3ZOhgJzxNgm1UceE6EK18+6yu3xFXzhvBfCi?=
 =?us-ascii?Q?nbjqFBurux8lVJVNIh7nbBBHkjbnBA1pgyHo4v4i/xf8xkFhI3dauMVdTlaV?=
 =?us-ascii?Q?pLcR9lp+gRato2K35+nR/z9E4qnbfPFxp3iFVzu8x1dGb/FpepT1zvLGgVcc?=
 =?us-ascii?Q?/joJ0A9JurTCg+w+ZsxOZrU5l1yWj8PBKZHQkixlp4trwdxNGPNJ8ZgEcn5e?=
 =?us-ascii?Q?BYXFTrVbAYP6IizNEdHMMzlPHQtu6qvi+TcpSYC9PeAw/2Dz3001Y51I6Q3i?=
 =?us-ascii?Q?KERyXKtviWYEQpgAI/Zi0Z6PnFk1590exFP+Ne3cnw9hL/rDSYp9rJ8mvb5j?=
 =?us-ascii?Q?v2b744sGFjQSbScwT4iVCzYZ747RrCXZZTbMyGsh7fsxR9Vr4H0jIzmYBlml?=
 =?us-ascii?Q?1h20QPHEtosyExQibBN8jqwoEOdOnCubpS5lQ6ANvaw1b+HdZvLk+yJTHerp?=
 =?us-ascii?Q?OXH/WsIK9lWDdtMmrQ+TNiqBSXFs7qIvGn3BYCGMeuBsC8GluROPA2s9yevH?=
 =?us-ascii?Q?a1lNjEJcd+WZmzKlHuRZpgk+KHcWDETixon4ogW2n3Uq4CKYRsN4sgoapG8v?=
 =?us-ascii?Q?8vlRoZztVy5TW6GsYmFNaOZqba+SlzZnEodzj7KWUKWWGUWqxLqj50WMYGUx?=
 =?us-ascii?Q?ofA+0G0i3DeiwOXsPp3U6MBGLwBNSsCsy0kTr1T4XHBLcw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y7Z+C50VKG2ZqBVgYnT9JkFnCivGhAHMz96sM5u7s5I5bHRITWelwv1sAoer?=
 =?us-ascii?Q?lRxgizmc0i553aewVSqu0DJCP2B4Ikl4sHSXT96NaYBImAsO/j7AmV0icWMW?=
 =?us-ascii?Q?Zmpsxi6D1TxscPLM1QkxUTmVBI1TUo5c/EVMPv/cJv71Xra/MYND3DcVHs2C?=
 =?us-ascii?Q?R+QHlQLaO5LxRFxUKFORJlh+SwC/zCt5k3qJP/bPViFtj1zoNifE7lrVZ5SU?=
 =?us-ascii?Q?oqQcQZRniuD3TfLHdGqoMc5sleGms9/UlN2aR9Nqr7zNbwgBZ55VEnIW3DRz?=
 =?us-ascii?Q?P15UFVfn9eHJsjuaYMjdj1cLlLp/25RKHYjelY1llt+HZWHQKfHAUnSBseI9?=
 =?us-ascii?Q?LkQg7exXBlzuLHf3Yo73WMtRri8VmqEtUG4rlehXK6l1t5CYltq7eLRYaDF0?=
 =?us-ascii?Q?GtdCaCjuKfh4vPHLGq+WnqKNR9+anxzNk19VBQ/5Jo9Gn3M2l4XVJHzR7vdA?=
 =?us-ascii?Q?ZTAYOOSO5/CgEijzOpCHCLG7+44fnImWJRarIfcve4j3rEPnSvMy89m7YLib?=
 =?us-ascii?Q?6uUWVjbYY3tTH+vbeOFJU0MCxqMqOIyS6olXN9hdL2lBqQnVUwz814pBOks2?=
 =?us-ascii?Q?6HC3jUD9hfkw1bgfZtGyZPHBPBVZ0aKml8A4+KD5+3mvq7i0eusAMsoyzCzI?=
 =?us-ascii?Q?+2FnNt/JKErwZ6S+734a7mj2VbCZcbOczLGDMzt5UhO+UV8I+BJIildBv+Hi?=
 =?us-ascii?Q?OsRLReXT/NSjhFuUUkRXvrNXmTc5sPAAGMyjccTu3zLS0IzWOnMPTV6ZRaz7?=
 =?us-ascii?Q?+fnNKalIhGPsPMTs+Yp6RfRA3QoTL8KvxVNv38ZkmrLjmHw1x8kcYWaWM1hl?=
 =?us-ascii?Q?0AMqmgouwD6lgpy1C7jPvjQxezp3pPdREfPgolkqjxPpuPmAWkA3BO+87iR8?=
 =?us-ascii?Q?K0XTk1bG/wKAFYQCotkg+paTwZm/mOChrf8TqO7eA/sr2EMvAQJPLdMY/m6G?=
 =?us-ascii?Q?rn5s27Achu9VHxz63BPyoHQs3YXbw5qARuKrggjHiF1sLPcFuHlDSyHhzMdp?=
 =?us-ascii?Q?F8Slj1rQwp3hh2j2Uy2dB/udaclf/BVpN1VjQuKEWt75+a01UKx0VBJNQJhd?=
 =?us-ascii?Q?zJjCsDl7TADHYLMEKgCkZlkaGkMVuCmd62AYg3tMXOPPOhqrdw6JX0KgfrCY?=
 =?us-ascii?Q?oQhGdQb29s1fVbdofGoskDRPY/CatGhly7CEE99mejzqAqc7O42o7WINjiJJ?=
 =?us-ascii?Q?jIAhwn7hRdeAskmGM7ErXDViO/kVgOQ+UULxo/LtETA4CcgLqFOsnnNiuDCr?=
 =?us-ascii?Q?8yi6Sie84ChSGdcsNkHgmUcc9abzhaqdneRFWcchDJTl/fkYMvybgEDVil4Y?=
 =?us-ascii?Q?2apTzRuVj5DOzWU3uRruuqy87dZAQYsY713ms5X0I41fEVNb/HE8gi1+erM0?=
 =?us-ascii?Q?FxFhzgTx9OEDwawTDOreG54OKESYW1EmdeXGYOYjcrMdUGXSDDbHIDCuw3qR?=
 =?us-ascii?Q?NJpeKW6xitiYSnPATJ09lCn58A+Pi1mG70l7wnSxbsE8fEAQjbmKpP1Oxuqy?=
 =?us-ascii?Q?HOc+9NpbygUtKWvcFLdymaYUodH/vnqJVSbu1pRUioiYW6hk1R6WfrnJ+S2l?=
 =?us-ascii?Q?H9uKmW0U7riSqpZ4j+IbbyXJR8nKPDSHWHlGfFZxh/QlDtw7TWigdvonqTub?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e799ce2-a337-4f3b-7967-08dd3ee50ced
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 15:12:44.3986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A23J0nYG4SNTFAvmQL3C4MLuxi3og3KBxU1a0QoeyDoca/7zCiJRo/R7ibdWS2EPg4Lh7L3N6Ta47wqMH1xEJDFPGGyOSFPqCJ7ZzV05yow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4614
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

On Mon, Jan 27, 2025 at 08:53:02AM +0000, Tvrtko Ursulin wrote:
>
>On 23/01/2025 05:30, Lucas De Marchi wrote:
>>This test has been skipping since a long time (forever?) in CI. The
>>reason is that cpu0 is not really hot pluggable. There was an initial
>>attempt that got removed with kernel commits 5475abbde77f ("x86/smpboot:
>>Remove the CPU0 hotplug kludge") and e59e74dc48a3 ("x86/topology: Remove
>>CPU0 hotplug option").
>>
>>With those commits there are no more cpu0_hotplug kernel parameter and
>>no more BOOTPARAM_HOTPLUG_CPU0 build config.
>>
>>The current i915 pmu integration always returns the first cpu in the
>>system, which means that it's always cpu0.  The cpu migration is also
>>currently wrong and was never detected by this test: it tries to find a
>>sibling cpu rather than allowing to migrate to any cpu in the system.
>>In order to clean up the i915 side, the hotplug code is being removed in
>>favor of the generic one, provided by perf infra. That too has the same
>>"issue" that there's no easy way to test, but hopefully receives more
>>visibility since it's shared by several drivers.
>>
>>If we ever find a way to instrument the kernel to test the hotplug, this
>>code can be partially restored.
>
>After your i915 PMU patches to use the common hotplug infrastructure 
>the test still cannot work? Still strictly requires cpu0 to be 
>hotpluggable? Or could the test be changed so it skips cpu0 if not 
>hotpluggable?

It still can't be tested. We'd need a hack to make the sys-wide cpumask
to drop cpu0 (or "non-hotplugable" cpus) so it returns something else
for target cpu.

I think this is only relevant for test purposes because for a
system-wide events it's actually good that we never have to migrate the
counter: it's not really related to the CPU and having to handle the
hotplug is only done for compat with other perf event scopes that need
to handle hotplug.

As example, see drivers/iommu/intel/dmar.c that calls
iommu_device_register() and registers the pmu as sys-wide.

LNL:~$ sudo cat  /sys/bus/event_source/devices/dmar*/cpumask 
0
0
0

Lucas De Marchi

>
>Regards,
>
>Tvrtklo
>
>>
>>References: https://lore.kernel.org/all/20250116222426.77757-1-lucas.demarchi@intel.com/
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  tests/intel/perf_pmu.c | 142 -----------------------------------------
>>  1 file changed, 142 deletions(-)
>>
>>diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
>>index 5d0467c02..084ef9631 100644
>>--- a/tests/intel/perf_pmu.c
>>+++ b/tests/intel/perf_pmu.c
>>@@ -101,9 +101,6 @@
>>   * SUBTEST: busy-start
>>   * Description: Test to verify gpu busyness through engine business pmu counters
>>   *
>>- * SUBTEST: cpu-hotplug
>>- * Description: Test the i915 pmu perf interface
>>- *
>>   * SUBTEST: enable-race
>>   * Description: Test the i915 pmu perf interface
>>   *
>>@@ -1362,139 +1359,6 @@ static void open_invalid(int i915)
>>  	igt_assert_lt(fd, 0);
>>  }
>>-static bool cpu0_hotplug_support(void)
>>-{
>>-	return access("/sys/devices/system/cpu/cpu0/online", W_OK) == 0;
>>-}
>>-
>>-static void cpu_hotplug(int gem_fd)
>>-{
>>-	igt_spin_t *spin[2];
>>-	uint64_t ts[2];
>>-	uint64_t val;
>>-	int link[2];
>>-	int fd, ret;
>>-	int cur = 0;
>>-	char buf;
>>-	uint64_t ahnd = get_reloc_ahnd(gem_fd, 0);
>>-
>>-	igt_require(cpu0_hotplug_support());
>>-
>>-	fd = open_pmu(gem_fd,
>>-		      I915_PMU_ENGINE_BUSY(I915_ENGINE_CLASS_RENDER, 0));
>>-
>>-	/*
>>-	 * Create two spinners so test can ensure shorter gaps in engine
>>-	 * busyness as it is terminating one and re-starting the other.
>>-	 */
>>-	spin[0] = igt_spin_new(gem_fd, .ahnd = ahnd,
>>-			       .engine = I915_EXEC_DEFAULT);
>>-	spin[1] = __igt_spin_new(gem_fd, .ahnd = ahnd,
>>-				 .engine = I915_EXEC_DEFAULT);
>>-
>>-	val = __pmu_read_single(fd, &ts[0]);
>>-
>>-	ret = pipe2(link, O_NONBLOCK);
>>-	igt_assert_eq(ret, 0);
>>-
>>-	/*
>>-	 * Toggle online status of all the CPUs in a child process and ensure
>>-	 * this has not affected busyness stats in the parent.
>>-	 */
>>-	igt_fork(child, 1) {
>>-		int cpu = 0;
>>-
>>-		close(link[0]);
>>-
>>-		for (;;) {
>>-			char name[128];
>>-			int cpufd;
>>-
>>-			igt_assert_lt(snprintf(name, sizeof(name),
>>-					       "/sys/devices/system/cpu/cpu%d/online",
>>-					       cpu), sizeof(name));
>>-			cpufd = open(name, O_WRONLY);
>>-			if (cpufd == -1) {
>>-				igt_assert_lt(0, cpu);
>>-				/*
>>-				 * Signal parent that we cycled through all
>>-				 * CPUs and we are done.
>>-				 */
>>-				igt_assert_eq(write(link[1], "*", 1), 1);
>>-				break;
>>-			}
>>-
>>-			/* Offline followed by online a CPU. */
>>-
>>-			ret = write(cpufd, "0", 2);
>>-			if (ret < 0) {
>>-				/*
>>-				 * If we failed to offline a CPU we don't want
>>-				 * to proceed.
>>-				 */
>>-				igt_warn("Failed to offline cpu%u! (%d)\n",
>>-					 cpu, errno);
>>-				igt_assert_eq(write(link[1], "s", 1), 1);
>>-				break;
>>-			}
>>-
>>-			usleep(1e6);
>>-
>>-			ret = write(cpufd, "1", 2);
>>-			if (ret < 0) {
>>-				/*
>>-				 * Failed to bring a CPU back online is fatal
>>-				 * for the sanity of a test run so stop further
>>-				 * testing.
>>-				 */
>>-				igt_warn("Failed to online cpu%u! (%d)\n",
>>-					 cpu, errno);
>>-				igt_fatal_error();
>>-			}
>>-
>>-			close(cpufd);
>>-			cpu++;
>>-		}
>>-	}
>>-
>>-	close(link[1]);
>>-
>>-	/*
>>-	 * Very long batches can be declared as GPU hangs so emit shorter ones
>>-	 * until the CPU core shuffler finishes one loop.
>>-	 */
>>-	for (;;) {
>>-		usleep(500e3);
>>-		end_spin(gem_fd, spin[cur], 0);
>>-
>>-		/* Check if the child is signaling completion. */
>>-		ret = read(link[0], &buf, 1);
>>-		if ( ret == 1 || (ret < 0 && errno != EAGAIN))
>>-			break;
>>-
>>-		igt_spin_free(gem_fd, spin[cur]);
>>-		spin[cur] = __igt_spin_new(gem_fd, .ahnd = ahnd,
>>-					   .engine = I915_EXEC_DEFAULT);
>>-		cur ^= 1;
>>-	}
>>-
>>-	val = __pmu_read_single(fd, &ts[1]) - val;
>>-
>>-	end_spin(gem_fd, spin[0], FLAG_SYNC);
>>-	end_spin(gem_fd, spin[1], FLAG_SYNC);
>>-	igt_spin_free(gem_fd, spin[0]);
>>-	igt_spin_free(gem_fd, spin[1]);
>>-	igt_waitchildren();
>>-	close(fd);
>>-	close(link[0]);
>>-	put_ahnd(ahnd);
>>-
>>-	/* Skip if child signals a problem with offlining a CPU. */
>>-	igt_skip_on(buf == 's');
>>-
>>-	assert_within_epsilon(val, ts[1] - ts[0], tolerance);
>>-}
>>-
>>  static int target_num_interrupts(int i915)
>>  {
>>  	const intel_ctx_cfg_t cfg = intel_ctx_cfg_all_physical(i915);
>>@@ -2650,12 +2514,6 @@ igt_main
>>  		all_busy_check_all(fd, ctx, num_engines,
>>  				   TEST_BUSY | TEST_TRAILING_IDLE);
>>-	/**
>>-	 * Test counters are not affected by CPU offline/online events.
>>-	 */
>>-	igt_subtest("cpu-hotplug")
>>-		cpu_hotplug(fd);
>>-
>>  	/**
>>  	 * Test GPU frequency.
>>  	 */
