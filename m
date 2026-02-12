Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CB9EDF030
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 04:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E3F10E6D6;
	Thu, 12 Feb 2026 04:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aNVnXNRs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C1B10E6D6
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Feb 2026 04:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770871023; x=1802407023;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5L65JxUXIGv7jgHm0DcAyRDoFDWwWmHzZTxcLK2PIeQ=;
 b=aNVnXNRsu0YxoraiFdAhScfS0Py/2KcL6PO1fdcYkJMbXkosruEgXgaT
 DGn611PBjPoblm2kdmW/K1L5pWBvdpoqLUXmN8lqlgvYnt1KnnTcuhBZ6
 kqob3pBpbcJjJUl/ezIMgarOPMq5lwApa4VVfza/h2MOUgc10YssOvPxz
 N+H2BtT7nZuVxdJh6tOm58R/HGQiOhACM2gtP0iSVsKH6Yja6Wd64jO80
 FLFyp7wP4voD4ARERGG8c6McdhVXzZyiH+mJSQMucXmTWyrRNsQ/GJjka
 hJ4znUtT3HZMKNpWroy4li6xcS+Fozc1HX3G5l/7UsThGfUgsAuPyapby A==;
X-CSE-ConnectionGUID: mNekf1fHSIycZ7bhHELlxw==
X-CSE-MsgGUID: 7hzea0ygQ728plhv/Sj8Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="94678498"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="94678498"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 20:37:03 -0800
X-CSE-ConnectionGUID: 1ticl+N5RVeBVfxSm2BjxA==
X-CSE-MsgGUID: dygRtik+QNy0aeXlsQQTjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="242127160"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 20:37:02 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 20:37:01 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 11 Feb 2026 20:37:01 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.20) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 20:37:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QT04dq0eHphyY/FwPTtWkw5UAQ8AzJa3OZOCW0rbGiAUK6Nxhbl2aeU41Tuwwnp5idVrfJDoLrUEwAHWhhn48D9soL8f2HYfYhjon6vImWJBIs4luCZ68qzIm2FN4Y5K5zWSB7Nsdgu9pXmLdziu1jVyVhqhWgkwzXWyvxG43y8zw8x5Se10oC5T3dTUXlCT2SvT7zINoDqesuVPhU2e0SJPRABXexhhYbZQl+s7sfgOIoQZB6ClIE3CJarfaOpUYBcwiqEMXGCjY2/rRsxRhJGva+lFzTAsH0Awr8TpCsKtzA/YyjJfihBO4PT5ebpCCLJsbRA3BWnRB6F0nYpuVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hC03QLCi0p02PfnkjG3n3aygUIsR0e41Z6Ety+pArk=;
 b=Y7cwYyim6BbP0+TcZYFdRiFSvA2euRLZKbpXslqlKS7TpIKHifK+cOi5wubv0wXk92fkwwlVHKWVlxX+HXn72PJaBPnRIzuYqisAWwRjxCiS7zQy/U4OcW2ZW7MAtDqJ2ahUPA1Yjs4I+oge9AITfG+GkF5HyN9mXtVOShmJV6in+AQzM1SM3fN3bMeZ3nmR+zKYyw8vx9YV2lpdK4YxXXgaiJguvj9fQislqpD1uRU7k8R+vN7XR3KE2oU3ogzuaNXW7i8we3xGG/KyKnNhWFVwbKhni6/SXRHD0/KxXC5Zlg+Z4R2yuPONR3h4WmTg/AMeAokCVRul+OAM/4WS1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DS0PR11MB8231.namprd11.prod.outlook.com (2603:10b6:8:15c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 04:36:58 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%3]) with mapi id 15.20.9542.010; Thu, 12 Feb 2026
 04:36:58 +0000
Message-ID: <ebb64957-80b1-4c72-92e4-4e9b6d6475f0@intel.com>
Date: Thu, 12 Feb 2026 10:06:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tools/intel_vbt_decode: sync intel_vbt_defs.h
 with commit 835a0d544def
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260119111918.2686910-1-ankit.k.nautiyal@intel.com>
 <20260119111918.2686910-2-ankit.k.nautiyal@intel.com>
 <20260210182528.sokdzf7pbyvurp5k@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20260210182528.sokdzf7pbyvurp5k@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::17) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DS0PR11MB8231:EE_
X-MS-Office365-Filtering-Correlation-Id: bc125259-7705-4b2b-db2f-08de69f05bb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3prc1BsUUNaOExpM3BOZ1F1NWlza05UdGZMK2xRcVBGTzV0cldUNWp4ZllE?=
 =?utf-8?B?MFpxaWxDRVp3U3dhSnBmN3J4MktVRXBWZFNRclUxdVo2TDNMY0pFUUpCbDFR?=
 =?utf-8?B?eWNBZjU2TllORnVub3UzamRlVFpwYVlQTHR5MFBXL3lZai92OVV6SnFWeGJz?=
 =?utf-8?B?SVJQS1pxZXhYZSt1eVVSVmZ1SkNRSUZCUDMrUG9RS0gzcFlrNVY5QXhFQ0U2?=
 =?utf-8?B?ZStEM2hlOXdjVjF0czZ4QUxwdVBsVHlPVk9JVUVzYjVwY1NLM0xoekFybThY?=
 =?utf-8?B?MklIaERoQUEwZ0RoQ05zYTJXZFpQRzBOQ0xGSVRuaks3QUVUZWtVcjU1Vmp1?=
 =?utf-8?B?ZzJGY1prb1ZzMy9oYlJjVFh6dnZoSy9aUXF6M2pKMVd0R1c3TTRiYWFFTmJN?=
 =?utf-8?B?YlFBNm1XenFxaGJTWW5qaytQWVZzcWNXdnBhdGlMVTk4V2ExWGl5REluRDRj?=
 =?utf-8?B?ajd1dkQ5SWhKY2h1Si9BSXBhZEZIZUZwKzVxRUtGb1J2TVgwYk9GRHBOMFVw?=
 =?utf-8?B?L0dnVmQ0WXk1WHo1bGNkald5ZWdVOUZURzQzTkdOR1BGWlFRUHI5bzdVLzds?=
 =?utf-8?B?akc5Z0NqeUxua0VyaDhacU9pbFRQRmRQMDBFbUswNmhlc2IxT3hCOVdlVTdI?=
 =?utf-8?B?bHFPd0VZVW41YnI4am5Ea2JmeGlrM0FFVDREdURqWUJFMnZEZFpvM0l4dmRh?=
 =?utf-8?B?ZkFpZHBVcCtYUk1OZHA1SUlYeDRRbTVucTRxTkg0NXgxTDdBWDd3NWppRlpw?=
 =?utf-8?B?Nk43dkpkNkwzZWljZ0xkcnFsRHpGdVh4d25OclJSKzNkL0VQUENiYk9pMUt2?=
 =?utf-8?B?dERyVThDUlVwTldqKzVLM29XeGhUWWhsN1ZGK01wZE9CWHhQNWJIS2l6NTUz?=
 =?utf-8?B?TjNneXJaSng3a2xNdkVtbVBYNTBhVUFkVStqalkwUzN1ZHdJd3hTK0tZODgx?=
 =?utf-8?B?ZVB2YkhjRzdDUk52aHphSG4vZzdsMGNuT215WFRUV2tzTitXeWdXcVRONWYz?=
 =?utf-8?B?WEJXbnlibDdDNHczbFJoaEJnbExiLzU2V0wwNGEwNS90VmhpMDZSbnRCQ0wr?=
 =?utf-8?B?Qys0TmQwZVNOdkphc3U3dnVocTJyRWpqZGRQa0tMYy90c3MzVVlnYU5LaU5S?=
 =?utf-8?B?NHVub1ZNS3pURm40aFRSdUhSM21ORUFJK2NFV0hrcmZkVlhGdDZCei9YQnpW?=
 =?utf-8?B?SWgvMTBENkNnTUxxaUJGanVoQThlb2dVTjliSlFnSGxycjdMSnVrUUlCWnMr?=
 =?utf-8?B?WU1DbkVpeVZjOEQ1Smd2T0lGQmNQeVF5alJrV2hhVklxdDZhNnNtaUF5Uldl?=
 =?utf-8?B?OUx5TG1Td3dsZDUyRXk4Y2hmK1ZXSW1qdjMxV3pwTE5nbmp5QzROSCtQMDlu?=
 =?utf-8?B?QzdJdnZxd0Z2TjJKelRvbEttWFliSDM1Z2ZXSlVkbm9RbDEzZ3I2SDBnaGN6?=
 =?utf-8?B?REtqTXhZSWxiSjJUTjMrRCt6UER5azc5WXJwb1Q4Rm96MnFoWi9vUmhBNWVo?=
 =?utf-8?B?NUl6cWZQSWhsUFdmekliYkZrZDFENzBtVDhsMTZDMnpxWEgxOVM5a3RkRU9x?=
 =?utf-8?B?cHhRTDdnVjVSYVoreUtmMmo3QmlHK1NHSGYrUUdnRkJKRUFiRmVUUEZ4RFNa?=
 =?utf-8?B?SUpPNTg3SlVNM0F2V1NVVUp5cVFLTUlQd296bWZXMmo5RjcxdHA1dGZRbXJG?=
 =?utf-8?B?amtFZFdwcVROWFRvS2RWWlJJQWZrdGh4WG5JUUFFc1o0Q1R2Sk1iWlBmWlg1?=
 =?utf-8?B?MnZiWjJsK3RFck1FUXhqdmRHZVB1U1Q3UzB1ZzdCMy9oNVlFTEZJQmJqcXc1?=
 =?utf-8?B?S0JjL0NTaDUyMlZWZ1JQOXIwY09SV1FzRkk2TGVCSHIyQmxPVWxveGY4VUU2?=
 =?utf-8?B?RC96cVRtR0wxUEVvWFVTeUs2VnBjZi9TV1R4MWtMQmtOM2pOd3VlZGR0MDB2?=
 =?utf-8?B?WHFSSnV2YWNIY2J3WE1ETFZrdGlWZTVMNTdnQmZvR2p6cDhmdmJGazJzWDVk?=
 =?utf-8?B?bkdsZnpZV2xZWDNyeTFRQjZIZ2VVMTlnd1VrRWpGMkw2bjJXR0RqNTJtcHpZ?=
 =?utf-8?B?bkhtT3JiN3dGZnJzTTFtNlZHbXJWaXYxRW0zemFFdDc5SlBiRERmTXpuUXg2?=
 =?utf-8?Q?nEzk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnFkS1ZGdjBNU1dLWnBGOTVPUk9YU0ZzdXVpTjhONUFtaHRGUGFnMkEvWDNa?=
 =?utf-8?B?K0gveFJwSlljeWMwbTM1cG5FOUtiSjZldkozMG9HNlY1N2JGS2JHVHVpQ1lD?=
 =?utf-8?B?bzl3a1FIeEtSWnZIM1lTNkR1NUNaZTBFZEVLVlUyS29acElsTzRlWGp5RUlz?=
 =?utf-8?B?Zk5HZGRERzhNRUtORDZyV3hPTGZEeTZNWWs1MytJUTMrN1cxdHJjZm5HamVz?=
 =?utf-8?B?WnkrMllXVnkyVFdDOFNLcDhXNk80d0RGQWFBU1pXbXdNdHY5UWs1eEJGQUti?=
 =?utf-8?B?M09abTBjQi9VQzJZQTFpUHlNbkVrZ1JnN2paK3RON1QvU3FRMndQSGVPekpk?=
 =?utf-8?B?ek5vakhlTG0wRWxVTGhYaHlML1RWRUl0R2djeUwzQWpaNGJaS0xOekZ1QWFn?=
 =?utf-8?B?LzgyY203Wm5ZV1FpeW1EbE50aUoybENWT3I1NURjWDZMRDUweDlFUGZhKzB0?=
 =?utf-8?B?TnExUlBMYUZYTldoMC9IZTY2d1R5NklXeWtBL1VrOXFhYVMxdWIrcURRQWxH?=
 =?utf-8?B?bUNQMzlSejNDcGkzYkF3NXJXODUzTHZzT25ZUm5MVktaYUtvcXcwV21hQjdU?=
 =?utf-8?B?MklKU0s4UGhpbXJaMUJjR2tTQXNmdlRHTElhM0FYdTA4Q1dXUXNTdXN3MFJO?=
 =?utf-8?B?V3VWVFh2YmJZWi9rQVRTNW5uZjBnME5BcnlkUzZVYm9Qd1VNS2hPQ0E4MndL?=
 =?utf-8?B?OUJvanJTcWJzMjFPa3NZeEVxcTQ2RkNxTkZ5Q3JtZnVZTk1tQTNNd0lJdkRk?=
 =?utf-8?B?SGxVVWdkbVhpbk9HaUFYT2ZNVmhkR1hKa1JVRklKUElMMXcwQnFEVnVhYlJR?=
 =?utf-8?B?bFdENnhPYTB6eWx4QzkwYmdZTmhIR1pVbFVhclhwdDBwbS9Ta1g3aGQxWGh2?=
 =?utf-8?B?QklFQ2RZbVdaMjh2WkJBeEQ1T0hwc3hHWlVWUVl4RWVhTGVIanpYdVpNM04w?=
 =?utf-8?B?NllYamVndFRtL3RsV25wTEhHVUdTT3RkOTFzTURBZzlhRGt0NDdWVEk3TW9u?=
 =?utf-8?B?SHNocUN1Z0NsVGZERElqdUUwMHVFdHdpazFkMjJJcUhHUmpTaDM0cG4xcjFo?=
 =?utf-8?B?NkVqbStBMG5ySi81MFFsSG1ESFJJMzZvYUlqZ0dMM0lITjFodHpUc3lyUGl4?=
 =?utf-8?B?cC9uZmUvUlI0a0xpa2FHVitUNXJDMGFjNU03aEZxWEt3ZWhFU015WEwweUxa?=
 =?utf-8?B?VkFIbDZicHF0cWpnTENRTlZKazU5SGQwd2JlR3V0WlF5U3pDZ0FSYWRjM1VJ?=
 =?utf-8?B?S21PZjdNRzJqWEVQbE1ReGw1NU1NTEpQL1NVdXl0NTJRU1BENUVRYnFlTVFx?=
 =?utf-8?B?TWpuN1pXRCtWQVJlMFZhWS9yQkU4REoxVlJ0cE5NMEk0YzJ4YlNlc2l4bUhY?=
 =?utf-8?B?NitGS21kYnk1L1JzdXg0NWRHSWd3TWQ5YjJ0Yk9ZcW8zdnJPNTNVUW1DN0xu?=
 =?utf-8?B?YTFjbUR6QUV6cEJDN0FXendEUkhpM2JXNERZcmdqMUVnUmtyTzU5MjI5eW5E?=
 =?utf-8?B?SVZpSVVVVGR1VDNtckxkN21UN0diNXRadUJ5Y2VJL0RyK2NQblpzdnRvblpp?=
 =?utf-8?B?bzJULzJ4bGxFWDNWemErRTVONjQ0N255ZlJ5MXNiL3pWWndrU1hZWVBPcy9n?=
 =?utf-8?B?Mlg4bTVJeklobU0zdkYwWERrY242Qys0RUZDaFZGb1NaU1lKaHhjbTcyUXN2?=
 =?utf-8?B?SFVJQ0VmS1haeUxwS2Mvc0ZBaDh5SDliMnU3SUYzL0RkQjhTalUxRWh3OUZ6?=
 =?utf-8?B?MkhPbVhPeForU1lVME40aThuekV3dVJocGdWWXdhSEFHeG1OZjNxck50OTMv?=
 =?utf-8?B?RG1SV0dTM2g5YzY4WjYycDJhZ0lpb1NHa3JncGYvMEV6SUpQUy9tZVk4QWxo?=
 =?utf-8?B?NjRzODJ5MThvVWo3LzhScmNtMXErODZmZkIyRzduSkxiU00ramwvSzZ0cVRH?=
 =?utf-8?B?dGVwS29ERXduZ2J3VHJWTXFVazFzeTAreHlId2NUdSt1aWltbWhweDlXZmVN?=
 =?utf-8?B?U2tMVUZ2SWpvM2Z0NFBCTVRxaGZCWVNKbE5jc244YXJtN2ROM01Ic080SW93?=
 =?utf-8?B?Z1B0M0pMNm9TNG1KNUJWT1NtS1R6N1BNQmx2YmFtU2ZKSUVOeHVkbEROSDRL?=
 =?utf-8?B?dGpUOVNqdHVXUHJjWEx4dlB3NDZxRWRHWWZneUNJMnZXcUlGam5DMUlWb3VG?=
 =?utf-8?B?OUFPb3dHZWRnbGE1aEdpbmVTMlozSytJZE1TblJYY0xEZDVadk1nUGM3a2Fx?=
 =?utf-8?B?UTdmVktnZnBTT3JXNU1VVUwvUmdXczNPZ2VUM3BsNUE3NmlJNlQxSG8wazVa?=
 =?utf-8?B?Vmd3Wm92aTlsUTBPZmVEZFJNbmlNWFFLckg4U2l5eXlualVhc05VWkV1aFlS?=
 =?utf-8?Q?fBQ0UJuHbB0/CaNs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc125259-7705-4b2b-db2f-08de69f05bb6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 04:36:58.8046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AUMNjneHQWVDiU8hrD76jEJzIl37s4RbW/ZCUo+G0x9HvugLn3eAxqbDO+n3mE3v5HMyA2SL1rqKEHlDCg//VeC1XeA42l1lqVpX/0abj1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8231
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


On 2/10/2026 11:55 PM, Kamil Konieczny wrote:
> Hi Ankit,
> On 2026-01-19 at 16:49:17 +0530, Ankit Nautiyal wrote:
>> Synchronize intel_vbt_defs.h with kernel commit:
>> 835a0d544def ("drm/i915/bios: Add function to check if edp data override is needed")
>>
> This kernel commit do not touch intel_vbt_defs.h:
>
> git show 835a0d544def --stat
> commit 835a0d544defa05d2425496d16d006b147df5bde
> Author: Suraj Kandpal <suraj.kandpal@intel.com>
> Date:   Thu Aug 21 09:56:52 2025 +0530
>
> drm/i915/bios: Add function to check if edp data override is needed
> [cut]
>
> drivers/gpu/drm/i915/display/intel_bios.c | 32 ++++++++++++++++++++++++++++++++
> drivers/gpu/drm/i915/display/intel_bios.h |  2 ++
> 2 files changed, 34 insertions(+)
>
> Checking changes for that file:
> git log --oneline -5 drivers/gpu/drm/i915/display/intel_vbt_defs.h
> 1b85a9b04681 drm/i915/vbt: Add edp pipe joiner enable/disable bits
> 203c7904f2d8 drm/i915/vbt: Add fields dedicated_external and dyn_port_over_tc
> 4d33c77cf2c3 drm/i915/vbt: Add eDP Data rate overrride field in VBT
> f3c65a8e9b09 drm/i915/vbt: split up DSI VBT defs to a separate file
> 96b451d53ae9 drm/{i915,xe}: convert i915 and xe display members into pointers
>
> Last sync was with f3c65a8e9b09 so you need to bring new ones
> starting from 4d33...

You are right! I will correct the commit to : 4d33c77cf2c3.

The MIPI definitions are already there in the tools/intel_vbt_defs.h so 
we are covered for f3c65a8e9b09.

Regards,

Ankit

>
> Regards,
> Kamil
>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   tools/intel_vbt_decode.c | 36 ++++++++++++++++++++++++++++++++++++
>>   tools/intel_vbt_defs.h   | 18 ++++++++++++++++++
>>   2 files changed, 54 insertions(+)
>>
>> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
>> index d4aada743e42..6f6f70dcee63 100644
>> --- a/tools/intel_vbt_decode.c
>> +++ b/tools/intel_vbt_decode.c
>> @@ -1125,6 +1125,39 @@ static const char * const hdmi_frl_rate_str[] = {
>>   	[5] = "12 GT/s",
>>   };
>>   
>> +static void dump_edp_data_rate_override(uint32_t edp_data_rate_override)
>> +{
>> +	int i;
>> +	static const uint32_t link_rates[BDB_263_VBT_EDP_NUM_RATES][2] = {
>> +		{ BDB_263_VBT_EDP_LINK_RATE_1_62, 162000 },
>> +		{ BDB_263_VBT_EDP_LINK_RATE_2_16, 216000 },
>> +		{ BDB_263_VBT_EDP_LINK_RATE_2_43, 243000 },
>> +		{ BDB_263_VBT_EDP_LINK_RATE_2_7, 270000 },
>> +		{ BDB_263_VBT_EDP_LINK_RATE_3_24, 324000 },
>> +		{ BDB_263_VBT_EDP_LINK_RATE_4_32, 432000 },
>> +		{ BDB_263_VBT_EDP_LINK_RATE_5_4, 540000 },
>> +		{ BDB_263_VBT_EDP_LINK_RATE_6_75, 675000 },
>> +		{ BDB_263_VBT_EDP_LINK_RATE_8_1, 810000 },
>> +		{ BDB_263_VBT_EDP_LINK_RATE_10, 1000000 },
>> +		{ BDB_263_VBT_EDP_LINK_RATE_13_5, 1350000 },
>> +		{ BDB_263_VBT_EDP_LINK_RATE_20, 2000000},
>> +	};
>> +
>> +	edp_data_rate_override &= BDB_263_VBT_EDP_RATES_MASK;
>> +
>> +	printf("\t\teDP data rate override:");
>> +
>> +	if (!edp_data_rate_override) {
>> +		printf("(none)\n");
>> +		return;
>> +	}
>> +	printf("\n");
>> +
>> +	for (i = 0; i < BDB_263_VBT_EDP_NUM_RATES; i++)
>> +		if (link_rates[i][0] & edp_data_rate_override)
>> +			printf("\t\t\t%d kbps\n", link_rates[i][1]);
>> +}
>> +
>>   static void dump_child_device(struct context *context,
>>   			      const struct child_device_config *child)
>>   {
>> @@ -1285,6 +1318,9 @@ static void dump_child_device(struct context *context,
>>   
>>   	if (context->bdb->version >= 256)
>>   		printf("\t\tEFP panel index: %d\n", child->efp_index);
>> +
>> +	if (context->bdb->version >= 263)
>> +		dump_edp_data_rate_override(child->edp_data_rate_override);
>>   }
>>   
>>   static void dump_child_devices(struct context *context, const uint8_t *devices,
>> diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
>> index 6612d3a4ec49..932305df2320 100644
>> --- a/tools/intel_vbt_defs.h
>> +++ b/tools/intel_vbt_defs.h
>> @@ -437,6 +437,22 @@ enum vbt_gmbus_ddi {
>>   #define BDB_230_VBT_DP_MAX_LINK_RATE_UHBR13P5	6
>>   #define BDB_230_VBT_DP_MAX_LINK_RATE_UHBR20	7
>>   
>> +/* EDP link rate 263+ */
>> +#define BDB_263_VBT_EDP_LINK_RATE_1_62		(1 << 0)
>> +#define BDB_263_VBT_EDP_LINK_RATE_2_16		(1 << 1)
>> +#define BDB_263_VBT_EDP_LINK_RATE_2_43		(1 << 2)
>> +#define BDB_263_VBT_EDP_LINK_RATE_2_7		(1 << 3)
>> +#define BDB_263_VBT_EDP_LINK_RATE_3_24		(1 << 4)
>> +#define BDB_263_VBT_EDP_LINK_RATE_4_32		(1 << 5)
>> +#define BDB_263_VBT_EDP_LINK_RATE_5_4		(1 << 6)
>> +#define BDB_263_VBT_EDP_LINK_RATE_6_75		(1 << 7)
>> +#define BDB_263_VBT_EDP_LINK_RATE_8_1		(1 << 8)
>> +#define BDB_263_VBT_EDP_LINK_RATE_10		(1 << 9)
>> +#define BDB_263_VBT_EDP_LINK_RATE_13_5		(1 << 10)
>> +#define BDB_263_VBT_EDP_LINK_RATE_20		(1 << 11)
>> +#define BDB_263_VBT_EDP_NUM_RATES		12
>> +#define BDB_263_VBT_EDP_RATES_MASK		0xfff
>> +
>>   /*
>>    * The child device config, aka the display device data structure, provides a
>>    * description of a port and its configuration on the platform.
>> @@ -547,6 +563,8 @@ struct child_device_config {
>>   	u8 dp_max_link_rate:3;					/* 216+ */
>>   	u8 dp_max_link_rate_reserved:5;				/* 216+ */
>>   	u8 efp_index;						/* 256+ */
>> +	u32 edp_data_rate_override:12;                          /* 263+ */
>> +	u32 edp_data_rate_override_reserved:20;                 /* 263+ */
>>   } __packed;
>>   
>>   struct bdb_general_definitions {
>> -- 
>> 2.45.2
>>
