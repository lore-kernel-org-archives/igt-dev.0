Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5EAD4A612
	for <igt-dev@archiver.kernel.org>; Fri, 16 Jan 2026 08:38:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30F310E82C;
	Fri, 16 Jan 2026 08:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g3mmk1nw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA8C10E82E
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jan 2026 08:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768552705; x=1800088705;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YYvtk7jhRG5yiv0ZlinYPTcrTdxOlojS+7BXANyb20A=;
 b=g3mmk1nwkGzUXbHDbSWqAVO8idCn1if1jwLuaM1fLX+cnJSB55rxNb0X
 H1byGOreVC3s+6ITASfLdu8ku/2Hke6WOHUfsijvqs0l+ekIuhlTFHe32
 o2haO4Q9Ckn2Q6UHJOb5gT2rx8kurfECt1SdwjMFyBXpxlhWwgp6FDcPa
 S5VLnweXD75MUOb8QYzwUdZZm0HBotlgtDv9FWlasYfaBSt/fsK/CaFBY
 XUU5BphMQLBNOI13Fk4p9roXeZFLdbditIN0wMoFaY1ranu3I+pQSWWQE
 niYcE2nD+cJMpNzbqqMtzmOak0F8HtB6VCz9TLoryI2b/JOLXcFM4CSb+ Q==;
X-CSE-ConnectionGUID: ZyrqhBm3TIaBhr6d/FpMBw==
X-CSE-MsgGUID: wBo3wFy2TIWoHPTYIgVNIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="73719349"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="73719349"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 00:38:24 -0800
X-CSE-ConnectionGUID: 4KycYrOZQfeBTPhOKf08lw==
X-CSE-MsgGUID: /ofWgv2DQU+njG42kenvJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="205240165"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 00:38:24 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 00:38:23 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 00:38:23 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.46)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 00:38:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uL8AtIVvoaBpMyEYR1yMBVvRu9PdaZavgIhMfT0QA5r4+LK/w6H2x9iZKM8yb6jvqy5VSanOrCR0NcoUjwXfRKSWoQi+o2msoVaIb5v3dONKDzUVAccktshtAr2frow+bG8Co1e49w33h8Pld56aGksZfLQJ9ZetW1dalACTf6TKWyIygWYhBfkml0lNkOwr9mr+q1AbdY6QqGMS3W1pIN1Z0nFMJPfb1DsGlwHh/8YaxulUNsTePh2jWFSQicsJ8ghwA54ddMVfS3yxEmAJLcA7JfnOwoc/z6ZQAtKH2tG0Mrp5q2U7WWOZksKm5CXXaJCDsz1jaGWWZQjsC7hDpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKKczgAyXEbh3CsmsIgzqnuIe1GomzHph5YcLIKqnJ0=;
 b=r1963AKqhVJY7evACCwdQgbzJMsoiLSknF20Jao5A9vKgcJuKJ05CGOSXqhd+5CGFUb8N/FgZta0TXGnSf5l0MVqCKbKM/K6jbQIh7mqDywvlzjMIKX2JMKNW59ic3qt+7XyvqxYGVsqVfndeMD+OIbpHi5A+6puSUAZsZCyC4sGm6djCrv15JEDKaLtXAGjOhpiY6tExsOTcNY0OtD4OSRYxq7mUSLMmFrdHRMLhvjE9KB2YkKGAqjIUDsNJg+/2l4Y3z0WpiqscuKs/ejOpBh73riQyPZ/LXLzoepUr61iHM9YmRoAfghy9GnKj+pTsRNImCeDSJrXKxvRONjVrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ0PR11MB5200.namprd11.prod.outlook.com (2603:10b6:a03:2df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 08:38:21 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9520.006; Fri, 16 Jan 2026
 08:38:20 +0000
Date: Fri, 16 Jan 2026 09:37:54 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v3 1/5] lib/intel_compute: Add compute-square for
 xe3p
Message-ID: <aWn44qVXIJKRt6ps@fdugast-desk>
References: <20260114151930.211512-7-zbigniew.kempczynski@intel.com>
 <20260114151930.211512-8-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260114151930.211512-8-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DB7PR05CA0006.eurprd05.prod.outlook.com
 (2603:10a6:10:36::19) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ0PR11MB5200:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a88a7e-94e5-4762-1db6-08de54da9a5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1pySUtER25BQ0F0Z2llT3YxQzJucmFNdlg5dzJCSEZEdU5hSjV3emd4QlRN?=
 =?utf-8?B?ODNQRkJNRlcyZTVNbW5jZHY4ZDBZd2IvdTJPN3pucXRwY3p3aDVmWXZ4WFFX?=
 =?utf-8?B?MXQzd1JvYmpNaW4wbzJFckd6ekxudWJJcG0rVTZkT1oyS21wcjNtU0J4Yy92?=
 =?utf-8?B?Q2N1UjlsWjl5RTQ3SUJ0VEpEU25nOHpuYTZjbXlad1Zla1VSUmFiVWxSVVlV?=
 =?utf-8?B?Ti9URmJrS2VRQVpIUlBoMmxnZ2hmRkIyVFBHRk1FT3hRVDVTcCtHeUVoOVEx?=
 =?utf-8?B?ajcyU3QzWDQ4am9FdHk3dVR6RkZFWmpWZ2U2cmJSSndRMG1lWUhSeWNLREZR?=
 =?utf-8?B?MkVEL0hwTU1ZRm91dXlHeU5Pd2ZBUmpiOUhGVjNhdkF2VHQ4UnJCcTlrekJv?=
 =?utf-8?B?Qlp3U3JReWczOU01ekNJeldQY0YxbnQzTHg5N2VLMGdsMHpWR09HZjIvWUQ1?=
 =?utf-8?B?RVpSNEhmYVNMZndIQksza0FXbWN2TTR6YzRxSk93QVlQSERMSUxmVVhEQkpp?=
 =?utf-8?B?SjJMMHpVUXc0N1ZObnNxQzk4NGhoUG00QUFLRzNOeTRBS1pEV1ZDd0VlYTFk?=
 =?utf-8?B?T3FMd0RiS1Y2NWtRTGhuRXM4TS9TL2d0QmErS1hvcE1ZaGVuUTZQazJseDhx?=
 =?utf-8?B?SllHQXVoR3hueHg0T3RyYnphT3F4NE8rOXg0eGh2WWdlWWNNOFdLZ2ovb3NF?=
 =?utf-8?B?UzREVnZDK1l3U0ZraVZiZ3FaZm40Y0N3RVFrb1V5djRNRUwzaEJ4dTJFTFhi?=
 =?utf-8?B?Z3d4NE55NUFqR1kzWDE0YUpteVZKeEloeTAyWHBmQ09SdGpQelhLcDZVMGNZ?=
 =?utf-8?B?bXVHR0o4clJNMEk5ajBFd1VTSXlSMGZBZDB4RTM0aW9zRkJvWnFQNmFNbGpU?=
 =?utf-8?B?S28vblRialJMcDVrU3lCQi95ZkJJT3p3MFJpUkVmbzBBNTFnTWtUTlMxYzdU?=
 =?utf-8?B?d0V5cWhBUldQOFRxNmkwRTk2VkJVZ25LejlhNWZlS25DWXRPc1hyZVhXc24z?=
 =?utf-8?B?QmREN1Yzb3VnOUQrOGl0RVJEUmJhYytaSGZKL25XQmJBL1c4UHVsQ2dVUkwx?=
 =?utf-8?B?MkFGK0VLWGJMTWVjenFtRjk0NGFrdFRYUGhQZjBXZzhMeHM2Y0VyNEE5Yjdp?=
 =?utf-8?B?d1RzRFNxcHJtWFhXVEFOaHdBWmNHN1JNWEVHWG5UdU9wOTA1am9iTk9Va3RS?=
 =?utf-8?B?M2RRcEpUcDNYdmE3WFM4NVRxQVVPcUo4UXdUK0gzT3o1WFFkb0hpOEYzZ2du?=
 =?utf-8?B?WHFiSHluNWU2MEtIM1c2a1pTN0RvM01va3o1V0k3T2xVVGJIeUxlbkRPVkJv?=
 =?utf-8?B?b3FnQmVoQ1JSeWUrMlN5ZVZyczJEazI5NE9EUExVQVpuSVVKMmgvSThKZHhr?=
 =?utf-8?B?QlM3UlhiallEUjRyTjRRSFRscGIwZ3F1MXh6QmhDRVlLMDg0TWwyQnpPeXV3?=
 =?utf-8?B?eHlvcG9MS2ptS2ttYXhwMU4xenQ3VUZ1S01XR1M3OFdkTTd5WVFqazNZdlFF?=
 =?utf-8?B?QlhNcEFEWHRsZzBjdVZNN0h3TnRiMVVTSEVuYXFhejRqakFZdytoUWZ4dTBk?=
 =?utf-8?B?QXBYc2FqM0NXOVZKYUtvdndOcDVYNXMrTDVZbFRkUml2K0JMMDZ2QXQxQ3NK?=
 =?utf-8?B?dzR1ZnN2WWN3NVgyM214RU9HNjFZQUVTcGVBekFFL3BNdmwwS2FycGZrenlE?=
 =?utf-8?B?V0ZvNHJvU3VMMWdCUnZlSE5WUlprUjV3YXo3TGdqQzZZdWF4TzdKTHZJcXFW?=
 =?utf-8?B?ZWl4YnIrRytBZjNCMDBoVVBGZHdnR2xINmVPdkk1WHpSVnVCdzRUTWEyVDVs?=
 =?utf-8?B?NkNDOTh2dDdDWjFmNU0ySWZWQ0pRSWhPbFBPRHE2dDdFKzU0dEtUMXl5KzJO?=
 =?utf-8?B?ZmNDdTUxRHBJRW5RWS9SODIrN1ZmbVdmb2JMMVBxT3RzaWhISmdlRndLMUtB?=
 =?utf-8?B?TGxLaUVyMUhqcHRlT094cmNjNk1WUWxWMUhUNjVkRjdyazEyUWtUMGdnVTNL?=
 =?utf-8?B?VFZDYjU3d3lSUTl1ZkdKRzlYdk41cFNhMURzL3dYMERrYzBpNnI0VDFhSXQ0?=
 =?utf-8?B?bTdCazhoS2krcnZkdjhqNERsV1hjT1lRWkNGVTRBbXU5aU8yajBRVTQvTHRM?=
 =?utf-8?Q?nEwo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SndsSEp4RjZwSG9NS3R5WjkzcDVncEt5eXJ0UFpGTjJpckRuZm5sNXk4WXp0?=
 =?utf-8?B?cnZEakdDWkJrV0wyOFFYUUpiMnU4ZFlKdWpZK3ZVZzdRa3gxL0JNZUZGSVpO?=
 =?utf-8?B?R1ErVDJwT3dvQlc0L3oweDJONnNPQjJTVWxQRjRpWmpYYmlKemRGa1MxSU5R?=
 =?utf-8?B?THA4aUptdWQ3U0dSNi85dmMyQmdWM2U5Q1h2S2JMK3R5NFZNRnB5RmFBcjVp?=
 =?utf-8?B?WXkzZktCTXhGZDlrZG1pR056VUtyb3gvdFMydG1YK0NwNzBma05iMVFERHRE?=
 =?utf-8?B?VDlWWmR1L3BxbDJpMDQ3VTZpQmtKeGk2aVF6bGU5TkdwVWpqZ3lLbFBBN3lt?=
 =?utf-8?B?OGJwbGxtYVdzZlZaMkFWN1daaWYxTlVEUUVLdFpzQVZlMlZhSzk5VG95OFY2?=
 =?utf-8?B?MkJaeWoza2JRZldMYTEvRzBWR2xtMjlEYTNkaWthL1F5SVFxZ0hRSk9zTGJw?=
 =?utf-8?B?Y3FYOXVmVzJlOHEvSXh6UUwwcXRubDBWUVIzemlrUm9YakhlTW5UcGt2S1Vt?=
 =?utf-8?B?MFNPa2xxRXJ5MkJnd2s3blhwQ2drT0wwemM5SSt6emM4aFVjLzVDQmh1S1I1?=
 =?utf-8?B?QzZyVFk2MEdNLzRIUWlvNXRVaURZaWZOLzVTZ2o2bmRVaWVXMHBNV2paaFBt?=
 =?utf-8?B?bWpQQVF2N1ZSM21QejVlYzZ3ajNyQk81VjU1WEsvT01MT05uRVcrZFNvMjhH?=
 =?utf-8?B?cElZTnVaK2hTQ2tFVXR1NHZPRG1hZVNWWndKWmd6RVJMSzVSL3VtSTVEeTRC?=
 =?utf-8?B?QzJsTlNETTU4OGdManIyWkhRQzFYNFo0WG9rY1pleCtMejRyZlhHT2daZTRj?=
 =?utf-8?B?WHQxQmNlRklQVmhWcXNNVllyeDRhYkYwQ1lCSlc4R2xSZWViMnpFa2ZTU1h5?=
 =?utf-8?B?NCt5azUrRjhEY0NlMllzRlFvQzBDaTAyd0s0NGM4bnd0ZlZ4aXc2aDNZdjhS?=
 =?utf-8?B?K2xGUEwrTW91MS8wU05zNGhNN1BFaGFzaHMxdThjRXpydmN1cHZoMWxRZDlY?=
 =?utf-8?B?Y2dxK0pseE8zc1JQUXVhdTF2ZE1XU3RzZHcyTlBjcTJ3RUo1ZmNsWHFEQWp4?=
 =?utf-8?B?NDFqSHRNcS8vMkQ1Q3gzdXZYZWk2TGk2dFNiM2xreFZySHdDRlhjN3BiWDZt?=
 =?utf-8?B?SXRlNEtZUEw2SmNqMldjWjRvUGRUSlpvQzlVWDJCdFgyWkJVN01IbDdab08r?=
 =?utf-8?B?VlVJancxOVVIQWdyNW5KTHVETUREcjNGZjJKcDcycjlIdzlyeUFyZ3JCbkhp?=
 =?utf-8?B?cVA0TGxGMzliWllRUWJkNnV4enZUT1g1Qzlvc0xYOHR1RW5uQ2gwYjIrK1lq?=
 =?utf-8?B?VGFWZUZhQklNaVI3Q1pzNmJZeFhCTzc1Qmtsem1ldFBrQzVBQiszZHVCMVNi?=
 =?utf-8?B?RGg4dXlmM1RGNnJQYnRVa3pBRm9RaXFMZjVhMEIvZGRnZGRqUUZYN0szd0py?=
 =?utf-8?B?YkFSb0lRanlHOTJwVzYvR2hrVUp0dVdPNkNJbTlISm9VR21rb0t3d2M4UXVy?=
 =?utf-8?B?VWQrejFDMXZWUTV2MmV2MUFaSXkxWjI1eTZtVnN0TklISERKbjkzMXg5ZmJ1?=
 =?utf-8?B?dllkWkk4MnQ0VkRKZVR2aTFnRUowdUVqUXIvUEFKS2I1bmNjNWl0V1QzRjl2?=
 =?utf-8?B?b2R6VlJ0a2NjWXBrY2lRVk1PanFZLzJTRjVKUTJuKzRqZ21rRzRWNXoxWUlZ?=
 =?utf-8?B?L2Y0M0IxdGNZSmtyc1pNUEZLQkNJaWt1Vmc4eWZ5YnBETU5RMjhQb1JLZEpB?=
 =?utf-8?B?b0dHK3FVY05TU3JTc2RVcGN3ZEJzU3U0SytHMHFCSG1yRVBidGM4d0pSU2xt?=
 =?utf-8?B?cG5LclNVZW52bHhhbmpDZm91T0FtWHF0bUxLeTBDMlYxNmJjYjZnVW5oREIr?=
 =?utf-8?B?MTZXQ2M2Ny8rM2xDZEpnRDRlNW83SnhzRExVZXpVMG82OXlFSk5GVm1KSXBJ?=
 =?utf-8?B?WWZXdlJBckoxUU9CY2wvWjVFa0xyanJHSUdpOHJVTmlRY2FzaUdZOWU5RzNX?=
 =?utf-8?B?VTNNMG5zcjNvcUhIS0JJT3lTQWZUUkRzMDZBektTak5mcjBVZ3FheEwrTGhS?=
 =?utf-8?B?RytDWXp3RFhEQTVvRTRScHc5NFFldUFKREUyYVlCOUh2eHd5UzlJeFdObGVU?=
 =?utf-8?B?TmpVbDBiaDUxcHVsZkY2MXV5elFaVkwvQWhGSkJCL2N0U0NnbXowY3Nyd3lO?=
 =?utf-8?B?ajNrOUpIazVwRStCN0g4RjZsbmhoUlRWNUFNNEc4STZSVXhOSGVsUlR3ZGhQ?=
 =?utf-8?B?b1RjWDFEWEh6cmlRZ3JTeS9jYUVvb08rQW1Qa1k1aXUrRU12ZXZYSnlnTWJP?=
 =?utf-8?B?RUgxb0w0alJCNnhnK0ExQVQvdE1sTStXeUU0QUFTemZZOWZuMElBNm5HZlQ1?=
 =?utf-8?Q?rYkWAt8dDfMOawRg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a88a7e-94e5-4762-1db6-08de54da9a5b
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 08:38:20.5298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n18NangU0AyUPdmErgv5AwfmddYMPnDruGrX9e4AU9OWCLTgqbTRLOS+cAdn7pfzhXMIuBsbocN591xff9CePXEpcWUCsKoMd1nZFMAh/3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5200
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

On Wed, Jan 14, 2026 at 04:19:32PM +0100, Zbigniew Kempczyński wrote:
> Extend support of compute-square calculation in IGT to xe3p platforms
> like CrescentIsland.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
> v2 - remove unnecessary kernel_addr variable and reuse
>      XE2_ADDR_STATE_CONTEXT_DATA_BASE definition (Francois)
> ---
>  lib/intel_compute.c                | 231 ++++++++++++++++++++++++++++-
>  lib/intel_compute_krn_square.h     |  41 +++++
>  lib/intel_compute_square_kernels.c |   5 +
>  lib/xehp_media.h                   |   1 +
>  4 files changed, 277 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index a555f908b1..397cef0ae9 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -50,6 +50,8 @@
>  #define OFFSET_BINDING_TABLE		0x10000
>  
>  #define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x9000000ULL
> +#define XE2_STATE_CONTEXT_DATA_BASE_ADDRESS ((3 << 29) | (0 << 27) | (1 << 24) | (11 << 16) | (1 << 0))
> +
>  #define OFFSET_STATE_SIP			0xFFFF0000
>  
>  #define USER_FENCE_VALUE			0xdeadbeefdeadbeefull
> @@ -66,6 +68,7 @@
>  #define DP_PIPELINE_FLUSH		(1 << 2)
>  #define WRITE_IMM_DATA			(1 << 0)
>  #define WRITE_TIMESTAMP		(3 << 0)
> +#define XE3P_WRITE_IMM_DATA		(1 << 16)
>  
>  /*
>   * TGP  - ThreadGroup Preemption
> @@ -109,6 +112,17 @@ struct bo_execenv {
>  	struct user_execenv *user;
>  };
>  
> +struct inline_data {
> +	union {
> +		uint32_t dw[16];
> +
> +		struct {
> +			uint32_t indirect_addr_lo;
> +			uint32_t indirect_addr_hi;
> +		} xe3p;
> +	};
> +};
> +
>  static void bo_randomize(float *ptr, int size)
>  {
>  	srand(time(NULL));
> @@ -1578,7 +1592,6 @@ static void xe2lpg_compute_exec_compute(int fd,
>  	addr_bo_buffer_batch[b++] = 0xE0004000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  
> -#define XE2_STATE_CONTEXT_DATA_BASE_ADDRESS ((3 << 29) | (0 << 27) | (1 << 24) | (11 << 16) | (1 << 0))
>  	addr_bo_buffer_batch[b++] = XE2_STATE_CONTEXT_DATA_BASE_ADDRESS;
>  	// Split into low and high 32 bits
>  	addr_bo_buffer_batch[b++] = addr_state_contect_data_base & 0xFFFFFFFF; // Mask the low 32 bits ;
> @@ -1902,6 +1915,217 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  	bo_execenv_destroy(&execenv);
>  }
>  
> +static void xe3p_compute_exec_compute(int fd,
> +				      const struct inline_data *idata,
> +				      uint32_t *addr_bo_buffer_batch,
> +				      uint64_t kernel_start_pointer,
> +				      uint64_t context_data_base_addr,
> +				      bool threadgroup_preemption)
> +
> +{
> +	int b = 0;
> +	uint8_t uc_mocs = intel_get_uc_mocs_index(fd);
> +
> +	igt_assert(idata);
> +	igt_debug("kernel addr         : %"PRIx64"\n", kernel_start_pointer);
> +
> +	addr_bo_buffer_batch[b++] = STATE_BASE_ADDRESS  | 0x14; /* dw0 */
> +	addr_bo_buffer_batch[b++] = 0x00000040; /* dw1 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw2 */
> +	addr_bo_buffer_batch[b++] = 0x40048000; /* dw3 */
> +	addr_bo_buffer_batch[b++] = 0x00000040; /* dw4 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw5 */
> +	addr_bo_buffer_batch[b++] = 0x00000040; /* dw6 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw7 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw8 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw9 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw10 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw11 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw12 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw13 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw14 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw15 */
> +	addr_bo_buffer_batch[b++] = 0x00000040; /* dw16 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw17 */
> +	addr_bo_buffer_batch[b++] = 0xFFFFFFFE; /* dw18 */
> +	addr_bo_buffer_batch[b++] = 0x00000040; /* dw19 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw20 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw21 */
> +
> +	addr_bo_buffer_batch[b++] = XEHP_STATE_COMPUTE_MODE | 1;
> +	addr_bo_buffer_batch[b++] = 0x14001400;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +
> +	addr_bo_buffer_batch[b++] = XE2_STATE_CONTEXT_DATA_BASE_ADDRESS;
> +	addr_bo_buffer_batch[b++] = context_data_base_addr;
> +	addr_bo_buffer_batch[b++] = context_data_base_addr >> 32;
> +
> +	addr_bo_buffer_batch[b++] = XE3P_COMPUTE_WALKER2 | 0x3e; /* dw0 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw1 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw2 */
> +	addr_bo_buffer_batch[b++] = 0x008004A0; /* dw3 */
> +	addr_bo_buffer_batch[b++] = 0xBE040000; /* dw4 */
> +	addr_bo_buffer_batch[b++] = 0xFFFFFFFF; /* dw5 */
> +	addr_bo_buffer_batch[b++] = 0x000001FF; /* dw6 */
> +
> +	if (threadgroup_preemption)
> +		addr_bo_buffer_batch[b++] = XE2_THREADGROUP_PREEMPT_XDIM; // Thread Group ID X Dimension
> +	else
> +		addr_bo_buffer_batch[b++] = 0x00000004;
> +
> +	addr_bo_buffer_batch[b++] = 0x00000001; /* dw8 */
> +	addr_bo_buffer_batch[b++] = 0x00000001; /* dw9 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw10 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw11 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw12 */
> +	addr_bo_buffer_batch[b++] = 0x00010000; /* dw13 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw14 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw15 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw16 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw17 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw18 */
> +	addr_bo_buffer_batch[b++] = kernel_start_pointer; /* dw19 */
> +	addr_bo_buffer_batch[b++] = kernel_start_pointer >> 32; /* dw20 */
> +	if (threadgroup_preemption)
> +		addr_bo_buffer_batch[b++] = 0x00000002;
> +	else
> +		addr_bo_buffer_batch[b++] = 0x00100002; // Enable Mid Thread Preemption BitField:20
> +
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw22 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw23 */
> +	addr_bo_buffer_batch[b++] = 0x0C000010; /* dw24 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw25 */
> +	addr_bo_buffer_batch[b++] = 0x00000400; /* dw26 */
> +
> +	addr_bo_buffer_batch[b++] = DP_SS_CACHE_FLUSH | uc_mocs << 4 |
> +				    DP_PIPELINE_FLUSH | XE3P_WRITE_IMM_DATA; /* dw27 */
> +	addr_bo_buffer_batch[b++] = ADDR_BATCH;		/* dw28 (postsync addr) */
> +	addr_bo_buffer_batch[b++] = ADDR_BATCH >> 32;	/* dw29 */
> +	addr_bo_buffer_batch[b++] = (uint32_t) POST_SYNC_VALUE;		/* dw30 */
> +	addr_bo_buffer_batch[b++] = (uint32_t) (POST_SYNC_VALUE >> 32);	/* dw31 */
> +
> +	/* inline data 32 - 47 */
> +	memcpy(&addr_bo_buffer_batch[b], idata, sizeof(*idata));
> +	b += 16;
> +
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw48 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw49 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw50 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw51 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw52 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw53 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw54 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw55 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw56 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw57 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw58 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw59 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw60 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw61 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw62 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw63 */
> +
> +	addr_bo_buffer_batch[b++] = MI_BATCH_BUFFER_END;
> +}
> +
> +static void xe3p_create_indirect_data(uint32_t *addr_bo_buffer_batch,
> +				      uint64_t addr_input,
> +				      uint64_t addr_output,
> +				      uint32_t loop_count)
> +{
> +	int b = 0;
> +
> +	addr_bo_buffer_batch[b++] = addr_input & 0xffffffff;
> +	addr_bo_buffer_batch[b++] = addr_input >> 32;
> +	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
> +	addr_bo_buffer_batch[b++] = addr_output >> 32;
> +	addr_bo_buffer_batch[b++] = loop_count;
> +	addr_bo_buffer_batch[b++] = 0x00000200;
> +	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +}
> +
> +/**
> + * xe3p_compute_exec - run a pipeline compatible with XE3P
> + *
> + * @fd: file descriptor of the opened DRM device
> + * @kernel: GPU Kernel binary to be executed
> + * @size: size of @kernel
> + * @eci: engine instance class
> + * @user: user defined exec environment
> + * @alloc_prefs: memory allocation preference
> + */
> +static void xe3p_compute_exec(int fd, const unsigned char *kernel,
> +			      unsigned int size,
> +			      struct drm_xe_engine_class_instance *eci,
> +			      struct user_execenv *user,
> +			      enum execenv_alloc_prefs alloc_prefs)
> +{
> +	struct bo_dict_entry bo_dict[] = {
> +		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
> +		  .name = "instr state base"},
> +		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
> +		  .size =  0x1000,
> +		  .name = "indirect object base"},
> +		{ .addr = ADDR_INPUT,
> +		  .name = "addr input"},
> +		{ .addr = ADDR_OUTPUT,
> +		  .name = "addr output" },
> +		{ .addr = ADDR_BATCH,
> +		  .size = SIZE_BATCH,
> +		  .name = "batch" },
> +		{ .addr = XE2_ADDR_STATE_CONTEXT_DATA_BASE,
> +		  .size = 0x10000,
> +		  .name = "state context data base"},
> +	};
> +	struct inline_data idata = {};
> +	struct bo_execenv execenv;
> +	float *input_data, *output_data;
> +	uint64_t indirect_addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START;
> +	int entries = ARRAY_SIZE(bo_dict);
> +
> +	bo_execenv_create(fd, &execenv, eci, user);
> +
> +	/* Sets Kernel size */
> +	bo_dict[0].size = ALIGN(size, 0x1000);
> +	bo_dict[2].size = size_input(execenv.array_size);
> +	bo_dict[3].size = size_output(execenv.array_size);
> +
> +	bo_execenv_bind(&execenv, alloc_prefs, bo_dict, entries);
> +
> +	memcpy(bo_dict[0].data, kernel, size);
> +	memset(bo_dict[1].data, 0, 4096);
> +
> +	xe3p_create_indirect_data(bo_dict[1].data, ADDR_INPUT, ADDR_OUTPUT,
> +				  0x400);
> +	idata.xe3p.indirect_addr_lo = indirect_addr;
> +	idata.xe3p.indirect_addr_hi = indirect_addr >> 32;
> +
> +	input_data = get_input_data(&execenv, user, bo_dict[2].data);
> +	output_data = get_output_data(&execenv, user, bo_dict[3].data);
> +
> +	xe3p_compute_exec_compute(fd, &idata,
> +				  bo_dict[4].data,
> +				  ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
> +				  XE2_ADDR_STATE_CONTEXT_DATA_BASE, false);
> +
> +	bo_execenv_exec(&execenv, ADDR_BATCH);
> +
> +	if (!user || (user && !user->skip_results_check))
> +		bo_check_square(input_data, output_data, execenv.array_size);
> +
> +	bo_execenv_unbind(&execenv, bo_dict, entries);
> +	bo_execenv_destroy(&execenv);
> +}
> +
>  /*
>   * Compatibility flags.
>   *
> @@ -1968,6 +2192,11 @@ static const struct {
>  		.compute_exec = xe2lpg_compute_exec,
>  		.compat = COMPAT_DRIVER_XE,
>  	},
> +	{
> +		.ip_ver = IP_VER(35, 11),
> +		.compute_exec = xe3p_compute_exec,
> +		.compat = COMPAT_DRIVER_XE,
> +	},
>  };
>  
>  static const struct intel_compute_kernels
> diff --git a/lib/intel_compute_krn_square.h b/lib/intel_compute_krn_square.h
> index 2b616f136b..0490a692ef 100644
> --- a/lib/intel_compute_krn_square.h
> +++ b/lib/intel_compute_krn_square.h
> @@ -288,4 +288,45 @@ static const unsigned char xe3lpg_kernel_square_bin[] = {
>  	0x04, 0x00, 0x00, 0x00, 0x0c, 0x14, 0x20, 0x30, 0x00, 0x00, 0x00, 0x00
>  };
>  
> +static const unsigned char xe3p_kernel_square_bin[] = {
> +	0x61, 0x00, 0x00, 0x80, 0x30, 0x43, 0x61, 0x60, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x33, 0x22, 0x01, 0x80, 0x06, 0x18, 0x00, 0x05,
> +	0x0c, 0x04, 0x28, 0xf0, 0x00, 0x00, 0x00, 0x96, 0x61, 0x80, 0x10, 0x80,
> +	0x20, 0x02, 0x05, 0x02, 0x04, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x66, 0x09, 0x00, 0x80, 0x20, 0x82, 0x01, 0x80, 0x00, 0x80, 0x00, 0x02,
> +	0xc0, 0x04, 0x00, 0x40, 0x01, 0x09, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x82, 0x00, 0x00,
> +	0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x41, 0x21, 0x03, 0x80, 0x60, 0x06, 0x05, 0x03, 0x54, 0x05, 0x00, 0x06,
> +	0x14, 0x02, 0x10, 0x00, 0x61, 0x00, 0x14, 0x00, 0x10, 0x01, 0x06, 0x0d,
> +	0x04, 0x01, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x52, 0x19, 0x14, 0x00,
> +	0x60, 0x06, 0x04, 0x06, 0x04, 0x03, 0x06, 0x01, 0x04, 0x0d, 0x84, 0x04,
> +	0x70, 0x19, 0x14, 0x00, 0x20, 0x02, 0x01, 0x00, 0x04, 0x06, 0x10, 0x52,
> +	0x44, 0x05, 0x10, 0x00, 0x2e, 0x00, 0x14, 0x14, 0x00, 0xc0, 0x00, 0x00,
> +	0x60, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x61, 0x00, 0x00, 0x80,
> +	0x70, 0x07, 0x41, 0x60, 0x04, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x61, 0x00, 0x00, 0x80, 0x70, 0x07, 0x61, 0x60, 0x24, 0x05, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x33, 0x43, 0x17, 0x00, 0x06, 0x11, 0x00, 0x08,
> +	0x14, 0x06, 0x00, 0xf0, 0x00, 0x00, 0x00, 0x50, 0x41, 0x83, 0x14, 0x00,
> +	0xa0, 0x02, 0x05, 0x0a, 0x04, 0x08, 0x10, 0x0a, 0x04, 0x08, 0x00, 0x00,
> +	0x33, 0x24, 0x15, 0x00, 0x04, 0x19, 0x00, 0x00, 0x14, 0x06, 0x00, 0xf0,
> +	0x14, 0x0a, 0x04, 0x50, 0x2f, 0x00, 0x14, 0x00, 0x00, 0x40, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x80,
> +	0x01, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00
> +};
> +
>  #endif /* __INTEL_COMPUTE_KRN_SQUARE_H__ */
> diff --git a/lib/intel_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
> index 3c888ebd85..4d69f270e9 100644
> --- a/lib/intel_compute_square_kernels.c
> +++ b/lib/intel_compute_square_kernels.c
> @@ -86,5 +86,10 @@ const struct intel_compute_kernels intel_compute_square_kernels[] = {
>  		.loop_kernel = xe3lpg_kernel_loop_bin,
>  		.loop_kernel_size = sizeof(xe3lpg_kernel_loop_bin),
>  	},
> +	{
> +		.ip_ver = IP_VER(35, 11),
> +		.size = sizeof(xe3p_kernel_square_bin),
> +		.kernel = xe3p_kernel_square_bin,
> +	},
>  	{}
>  };
> diff --git a/lib/xehp_media.h b/lib/xehp_media.h
> index fb65b8f207..20227bd3a6 100644
> --- a/lib/xehp_media.h
> +++ b/lib/xehp_media.h
> @@ -18,6 +18,7 @@
>  #define XEHP_STATE_COMPUTE_MODE		GFXPIPE(0, 1, 5)
>  #define XEHP_CFE_STATE			GFXPIPE_XEHP(2, 2, 0)
>  #define XEHP_COMPUTE_WALKER		GFXPIPE_XEHP(2, 2, 2)
> +#define XE3P_COMPUTE_WALKER2		GFXPIPE_XEHP(2, 2, 8)
>  
>  #define BITRANGE(start, end) (end - start + 1)
>  
> -- 
> 2.43.0
> 
