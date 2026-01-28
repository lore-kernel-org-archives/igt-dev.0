Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBC2D35688
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 07:47:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCA310E268;
	Wed, 28 Jan 2026 07:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k/+WJUNI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65B010E24E
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 07:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769586445; x=1801122445;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VXcaGGbv1Em0wjOMinIb4z8sOxqDN5UJntYP8UhRd0c=;
 b=k/+WJUNIc8Un/WeSGb+hjOabrGgd7+dNGnpxVNoOjvt0l4bJ/6n+FFss
 axfxkC+dAkreu2kv8ClqIN3SwdweKZV8SjEeli8PnoXaxx3muhZEOfVcV
 Z+BzseAZd6RPxYDcNXSZkF5aFShk7CURHNPO1ibRF2TWAbtgLhWGiBqPI
 sBkY/MfWIMmnT954zrqWAi4mhSP6wqGFnRLlFDMAy9x6oGM61haL+Df9/
 Sm4x5Woq5P5v8yzq/ND9q7NvQlUi3djKXNO2OqScJqXkBZ+J/z0r0L/SO
 pYXwYjpoQgidHrcHxG+UyQCVya/Ic4wJZ55ONb9e6olRnd0oL3OjCsfYK g==;
X-CSE-ConnectionGUID: npbvRlTGSmmrc/cJfNLqjA==
X-CSE-MsgGUID: s6qx02jGQNyteTds3t/lxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70848720"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70848720"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 23:47:24 -0800
X-CSE-ConnectionGUID: NwxO8oaLQCSjGdNR9ujy6Q==
X-CSE-MsgGUID: vGl+1pQyTr+HMSBPTxMkqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="213169271"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 23:47:24 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 23:47:23 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 23:47:23 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 23:47:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j68oN9PP2cJyf7PRXGxWIR3yTWVXJqNuS7Nlr/3llgn3+vXDRKi8V4y8lToTso7cgumdXRifm9V/x7Ch3/60/+MQKZDpcZNn9JHONa3exKQqQ3N1Wbi0z6JhXuoApmRTZccsGLwCd/mMUwQ9H6pvxcrokeMKG+8rfl/03qsKfQyXctDtBqVEYXy2FZLvrRTakJ2Zzvo5JmBfbd4wJy8gEbjC8iepCwMti/03fto3QUk1hxXEJhBeeXOUtzbjC7oabCNdl9CC0z0dAAmw7vOfFmDq86kQ2PxNPrDs5Qy3a/4pEaNDLUuxtyW8rkgAVhu4WGcS33MMBRtf8UU5Yc0wrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crpLkL160THFukxY3tquHGFlIq61594JfODVr/4HCg8=;
 b=FkoUXHwYv9yxfiu2YGrBQrbifA1TyEHNO5qFFMMy2IdSxfEH59yJtUbtnyKvN5Jz7BpEwqMHe+6X2mhPT3hHfdhYuwWc1z0mkzh1y5Gd5Qyadn1HHUgQ3EatSubuVCZFHkLWfdAGa/siYcgFR9YWLwNrTCJq6tslZJQQRJYWYF6axRnDLuuje1Fp+aEE434m+UKHzB7veFRgyiKC6UozYt8nXinkw4VWWD76Pa7Qiksxvshsp/iI4CTkxo1iVXJ1tdVsMrAv52sA6UJJQIYJ5ELVRCsm+0cn27yGhI03Fy+R+PemzXfrK64TmDDZpiFRXg13OI/Le7G9UsmWkzIBRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by SJ2PR11MB7714.namprd11.prod.outlook.com (2603:10b6:a03:4fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Wed, 28 Jan
 2026 07:47:19 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 07:47:18 +0000
Message-ID: <fe0fb7cb-f03b-4320-971a-2422d0a3c49d@intel.com>
Date: Wed, 28 Jan 2026 08:47:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/4] tests/intel/xe_sriov_flr: Attach VFs to
 xe-vfio-pci before initiating FLR
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>,
 <michal.winiarski@intel.com>
References: <20260115131812.256678-1-marcin.bernatowicz@linux.intel.com>
 <20260115131812.256678-4-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260115131812.256678-4-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIYP296CA0002.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::7) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|SJ2PR11MB7714:EE_
X-MS-Office365-Filtering-Correlation-Id: 745b36c9-1bf9-4205-ae7c-08de5e41763e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0dZc3pSdGFTRElQWTBwdmx2Z0tJMUtqeXJlcUJKV0Z5KzQ3Nm40Zk9ZOTNQ?=
 =?utf-8?B?ZFN1SFcxZmNqT3JNQm5VRkIydlorZi9SdnV1OHE2M3JYWTNjeDVCZ0Nza2JN?=
 =?utf-8?B?S2ZSUzJIVHl6RFUvenBUWnRWTStVbGIrM3E1VDgrTXdTVXQ5R25YaTMzV010?=
 =?utf-8?B?RjllNm9yL2xQRXNrbkEvd25OM0lHRkRjblFlR08yenQrUllKWWtLL1RXbHNv?=
 =?utf-8?B?S3QySTZBcXNLejZTcURycFFibmFXcndsYURwOUdzaGVMREh4cDVHOXBDYTVo?=
 =?utf-8?B?eXNLeGpuOWZhRDJqbFV6OGJua2s2eTRWVjhXeFJDVFB4emdjUkxWUVBRbDFs?=
 =?utf-8?B?UjN0TDlFZk15K1UxektLM28xNUQ2TzZLWGh3dE5KUkJsa1h1WFhlbTZJSUJw?=
 =?utf-8?B?aENuaEt3TWhFVWpZdnVHemRQSHgxRUFkdmxrZEdjamVKcHNCbng2R1B2RGQv?=
 =?utf-8?B?YkZLRXgwM0Y4cjJxcnVGZk9DamJhQ0lJKzF6ZVoySjJSMkM4V0FPa3NOdzVR?=
 =?utf-8?B?QzNzQ0JDalBGNGlXWVFwNkNSN3B5ZkVlZUVYWlpITG1NMFluT2dUa2Y0ckxM?=
 =?utf-8?B?NUxhZXFORTJLcXFpNVFmQjYyUCtzcTJzSGpFZE1hNUt0MWpLTktHWXI0aFNZ?=
 =?utf-8?B?NmFodG1OZ0RvbmtWa2VxdlNuMlZCZXV0MnZNM2JJUXczWXRKUWRmbnBhMnhJ?=
 =?utf-8?B?MlQ0dkFtdjRXUHUzOUtUMlNVVkN2Unpsd2lVSUhUdjZvcnhiQk5MSk9UTHFQ?=
 =?utf-8?B?SkhrVVlOVFllNlVLaVFMcDZhbW51a3hrT2lYWGh4a25mUmJVcHR6QnJUZjdj?=
 =?utf-8?B?MHJJSWJxa1JmaHRFbENKbFE0Z1FiVE9Lcnlqd1lDdUlWWFN4dExsTTV6Rzl5?=
 =?utf-8?B?L2srN0FjMjhMSWVoZHBRQWxOakpqQUswQnZMWjZPVWFCejlSbnhLeXgrSlVp?=
 =?utf-8?B?bjNaMTV1Tlk4UElVaWNPejNJdGIwOXRXcCtZVWpLOU4zVTJoMDZHenV4Zncx?=
 =?utf-8?B?eHZBTkZZNjVPWUVRWWNjWkMrOG5HL2lJSjI4NzFxemdrYkhDUHZUNFZoRXRl?=
 =?utf-8?B?bUNMWjRWZmJHQ2owV1VjREk3YVcvdGhxQXpXNTAzZnFCdmdsUnVPcUM1VWhH?=
 =?utf-8?B?dC9YTWk4dWNvVFZMbXdiRlkvQVQrYTF5aU1IblZlQ1lDRXlBa09LRXNlbG44?=
 =?utf-8?B?bFRrT2YyYXFYa2RyNloxcHJyWW01Y3piaFV3MWFUQmU0VkZsajJNb1FlQ1hG?=
 =?utf-8?B?djBncVJMeXpDOHpvbXl4dTNYU3BGZ2EwZjF2aDFuV0h2OXcvTjc1Ulh4bmZm?=
 =?utf-8?B?dXJtdWl4N0tXZ0Q4ZzdUODVMVk9XS2kxSmhPb2lQeC8reUptaERiSzN3WjRE?=
 =?utf-8?B?bzl1OWF2TTNEaTdlNmhzaDR3aWFxbVZESHBOYzlHUjFkc2xIemlpL3FubU55?=
 =?utf-8?B?Wjd0cU1mdnNyRURmQkdRQkppV2xpSkpIazEzdnAyVnc3NXFTTGl5bU5RT2U0?=
 =?utf-8?B?L1hTVm5UR0VCUVgwVGllY2VwN3ZOVE50cHBoSUk5ZTdQN1dmeWRCUFg3NFFn?=
 =?utf-8?B?RXkzalZ2all6ZzJZRVMxak8xc2ltNEE3a1VxYnR1VXg5ZUlibmtST1dqdjkx?=
 =?utf-8?B?OTRmQ1lEanVjeURXWXk3RlhsRXJwUHZHQm52V3huMDRLSVpuTXJYVjNpeGNI?=
 =?utf-8?B?VFNUQW9zc29aeWRKYThFVkNMblBINGs3UGhtalh3ZGVwTjZLbkNjMTRQTEpD?=
 =?utf-8?B?V0ppbVlxd29rQ2tmTyt5RXJJN3FrclZRVVJMc3pGakJpWWg4eHMzRjRhcHZv?=
 =?utf-8?B?RmJQSHZ6YnpxcWFUT2JpMC8wSVNpRnZlUWc3UkFGekVyUnYzSTlOcSt2Smtu?=
 =?utf-8?B?QlY2UEI2SnZHZ09Lc3ZZSS8xNlVCMmJvcG5ZeWV1NGNVdHN0eHhXZTU1M2hJ?=
 =?utf-8?B?OXlNQ2c2a3ZKaEJGMml2M0dtR1dVRnFIeUovWEl6eDZUeDI1enE0TmxWTFRh?=
 =?utf-8?B?dW5jUXk5b2NrSWY5OUZkU1FFMlNJdnBrb3FWd3I5U21UUGdoUVE0V1NQWC9V?=
 =?utf-8?B?RnhrWEJ6QStybytCTUJyU3Y2T3BieHFsT3ZGTTNsUUVqVGl3OUhLcGVWOXZ5?=
 =?utf-8?Q?wMvY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YU9oS0Fjeno2Z3VhRmQ5cGxGUmYxMFhqaXlzQUI2ekFIRGVOT0pSNjk4MWNN?=
 =?utf-8?B?TTN5OUNEdjFlajFKTlRsd2lOeG5xMVdEZW1DRjhFMTFsNlFwMElFekxuNW1I?=
 =?utf-8?B?MmhLbUhOZVg0QTQ4UTZNNFZjbUtxV1NyRDMvSmtHZUIvOUVlaXVWSDZyL2dR?=
 =?utf-8?B?b2RkZndBc3JvanRVckZROEZ5R3N4NFl6MldyS3poL1FuMzJmeXNqR2RXNlhI?=
 =?utf-8?B?dzRNUFE5a1pvNlNnUVozSHdGOHpJVlI3OGJrZ3BiaU1mNUljZXBaTEhRSzZl?=
 =?utf-8?B?Tmg4NFk4bjgrRU5UNWZVNzhjSGt1YVlwbnU0VUFqWHh5N3dBZDQzN21tWXBj?=
 =?utf-8?B?YVdsNmRYWUZvbU50YlM0bzNPNmsyVDRYZHVacXpXejNuZk12QW1wSUNZNGh6?=
 =?utf-8?B?OEZTWkg4U09BeDBJaXJRdDlqbHBJMTZwQ3N1Vm05UnlubndXRFljbkxibW43?=
 =?utf-8?B?U3IwWDJOL2xpR1g1d3ZUVWJTSHBiOWt6c0RTcU5JOXhpcWNtNE9OVzNrcFV1?=
 =?utf-8?B?SExrb0JzRzlvMHdoYVNmc2tlUnhzakNyaUt5Z1JXSk9lMWpNblRnYzZWcHox?=
 =?utf-8?B?cWxCTGRWZmtCVm9DbE5CVms4RUNvV1V2dzdBWUZFam5xZktEN1JlVHpDR1NW?=
 =?utf-8?B?UlBJSlRuM2RMUDZEZVo3aVZuQlRqcEFEVmV4aWNUell5WTc5cVgrVjVQTnZn?=
 =?utf-8?B?VGdpb0ZRaDFwS212MWE4Qy83VE5UekVJU1czQWtwMnNiUUlNY0hOOW9yTm5n?=
 =?utf-8?B?dkpYcWVYS3BsV00vbjM3dDFMNVN0K0xWTDhjRUJVMlVtK3EwUHJIY1JvbUFo?=
 =?utf-8?B?SCt2RHdXSHRvUUo2eWFEYS9SbjFhcjNCZGI5TTJERXNUMVlLQlpOSHFleGl3?=
 =?utf-8?B?VVEyM2l5UExlT3BPM2Y5ZVAyRU00d21FVTdTMHUvcFdXUmdLV3FxMSsvNjYy?=
 =?utf-8?B?UUVtWmFLUDg5R1M2d2VveVhvS25GWmFuU3E5WUFJMUpyM29SK1dqUTY2R2hl?=
 =?utf-8?B?ZS93YXpFekFSZ25lTCt5cjc3T20wSmVrdzdRRWowckwzNFN0bURZbk44cjdz?=
 =?utf-8?B?SnFBV3h4VGZ1MmFUOEpCSWNtanpsbFhnM1I1M3NRMHpxMTNxaHhiRDNQZHMr?=
 =?utf-8?B?ZjFkWnM2NkxBb00rVitjSzFFWGsxR3RZTUxYK0NnSUwyVmdmQVY0QTVsNEdP?=
 =?utf-8?B?dEppRGZsOE1CaEwwZ0JmRk1GcU1ZVndaaXlpQUJLUTVxWEZVUUE4Y1NkeStm?=
 =?utf-8?B?M08rbE9SdUJiRGNRUGltSktQOExBNFpiQm5RN1l3T24yNzVKZnkvQzFOWXJH?=
 =?utf-8?B?TTRURlpla0xJeHYrZzM1cmhIQ2tjcGhGNTVBWFphUnRFRElUQmRFTnVJRDBV?=
 =?utf-8?B?THpQb0hwYVZGeGVOZTRhdklyTExsKzJLQ1ZmVXFnRVhtd1JrOFM0YkFXMUxs?=
 =?utf-8?B?ZkFWY2VzT0hlK01UbzB0THFTckUzRXBzd0tUMUhpRHgvSDg2SEN4Y2NSRnZo?=
 =?utf-8?B?VXNGR1pWRlJhMHZIWXBJNHJ4NSs3MlJMRkE2MjZaOEhFMms5WmVia1pvRDIr?=
 =?utf-8?B?ajlqUmlEOWRjWi8zR2Vwc0MzUkplMUJhUGhCdDFNVi9PSDAyU3lNMTQzZm13?=
 =?utf-8?B?U1NqSFpSNWJHSkdYUk93d1ptQ0VoTm5FbStDdW9ZaVVMNG1mTWlMUFNhT2Qr?=
 =?utf-8?B?KzVkWkc4UjVIVlFLMVRPM1p5RkkzOS8wZnZsY2tWblZnSVVYOGNSelhuR1Zy?=
 =?utf-8?B?MXJzWVdENE9IcjQxUm5IcHJaQ3Z3OHM3Z2NrMUh0MndKK0hMNkF5alg1NUJM?=
 =?utf-8?B?TUdENUVlL0FWYnlpYWt2UG1UMjJMeFRSeHRaNWlwZ0tNSnRUekQwTHhDVlVu?=
 =?utf-8?B?NDB6ZE82eVNyZkdqSVRtdG5WMkFYbzdpQ0NmRjI5bVplenVVb01nMEZ2TFRG?=
 =?utf-8?B?OTFFRE05Z0cxL1hHTmdCTzF0R2xOcjdLZ1Z3eVhRbTIya3FQY1liRHJsRERI?=
 =?utf-8?B?TGRLbVBWaVJZMFhPUWFSV05rREJ0NDFoNUVJa1dUV2NRMkdyb1dlQWRyVEVQ?=
 =?utf-8?B?NG1yTmI5ZjhvdFBFZVVGQVAxemJneStmRWEyVzNZVHZ1N2M0ZU9HZkZXcnJ1?=
 =?utf-8?B?eXQ2TG5qWFJoYXpQOGltY0wxcHIrd3JnWEF1QW12YVRETk9IRlNhMmphMHBp?=
 =?utf-8?B?WXErcTZGWHZNT0c4NFF5QVhoNjMySVBYZDdrZllQOHhuZWlITGs0N3FWZWtw?=
 =?utf-8?B?ajFaUVRkOGNoQkJrM3hqeHEvUFZ0QzBtY3JzTnhBLy9Vc3FQZDB1eXdOSWdj?=
 =?utf-8?B?OWJZWDBEeDEyYlZ6dDJGaGE0aWtOdC80WitPZU4yK1NZSGlsbnVUZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 745b36c9-1bf9-4205-ae7c-08de5e41763e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 07:47:18.5137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +TSLaZfpzRqkeNc/or4Vo0vJ4Yfj8xueO0GI6hVBYns1Xh7MaAgJtvLUH2qrrlmSLrxes8giGy7Uf9jQxi9h9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7714
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


On 1/15/2026 14:18, Marcin Bernatowicz wrote:
> Attach all VFs to the xe-vfio-pci driver before running the FLR scenario.
> This allows the test to rely on xe-vfio-pci’s FLR wait handling, which is
> triggered when writing to the VF reset sysfs attribute.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Suggested-by: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   tests/intel/xe_sriov_flr.c | 45 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 45 insertions(+)
>
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index 12989d0f5..5efe98a86 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -9,6 +9,8 @@
>   #include "drmtest.h"
>   #include "igt_core.h"
>   #include "igt_device.h"
> +#include "igt_kmod.h"
> +#include "igt_pci.h"
>   #include "igt_sriov_device.h"
>   #include "intel_chipset.h"
>   #include "intel_vram.h"
> @@ -276,6 +278,36 @@ static void subchecks_report_results(struct subcheck *checks, int num_checks)
>   	igt_skip_on(skips == num_checks);
>   }
>   
> +static void vf_bind_driver_override(int pf_fd, unsigned int vf_id,
> +				    const char *driver)
> +{
> +	char *slot = igt_sriov_get_vf_pci_slot_alloc(pf_fd, vf_id);
> +	int ret;
> +
> +	igt_assert(slot);
> +	igt_assert(driver);
> +
> +	ret = igt_pci_bind_driver_override(slot, driver);
> +	igt_warn_on_f(ret < 0, "bind %s (VF%u) to %s ret=%d\n",
> +		      slot, vf_id, driver, ret);
> +
> +	free(slot);
> +}
> +
> +static void vf_unbind_driver_override(int pf_fd, unsigned int vf_id)
> +{
> +	char *slot = igt_sriov_get_vf_pci_slot_alloc(pf_fd, vf_id);
> +	int ret;
> +
> +	igt_assert(slot);
> +
> +	ret = igt_pci_unbind_driver_override(slot);
> +	igt_warn_on_f(ret < 0, "unbind %s (VF%u) driver_override ret=%d\n",
> +		      slot, vf_id, ret);
> +
> +	free(slot);
> +}
> +
>   /**
>    * flr_exec_strategy - Function pointer for FLR execution strategy
>    * @pf_fd: File descriptor for the Physical Function (PF).
> @@ -325,6 +357,7 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
>   {
>   	const int wait_flr_ms = 200;
>   	int i, vf_id, flr_vf_id = -1;
> +	bool xe_vfio_loaded;
>   
>   	igt_sriov_disable_driver_autoprobe(pf_fd);
>   	igt_sriov_enable_vfs(pf_fd, num_vfs);
> @@ -335,6 +368,13 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
>   	if (igt_warn_on(igt_pci_system_reinit()))
>   		goto disable_vfs;
>   
> +	xe_vfio_loaded = igt_kmod_load("xe_vfio_pci", NULL) >= 0;
> +	if (xe_vfio_loaded) {
> +		igt_sriov_enable_driver_autoprobe(pf_fd);
> +		for (vf_id = 1; vf_id <= num_vfs; vf_id++)
> +			vf_bind_driver_override(pf_fd, vf_id, "xe-vfio-pci");
> +	}
> +
>   	init_mmio(pf_fd, num_vfs);
>   
>   	for (i = 0; i < num_checks; ++i)
> @@ -357,6 +397,11 @@ cleanup:
>   
>   	cleanup_mmio();
>   
> +	if (xe_vfio_loaded) {
> +		for (vf_id = 1; vf_id <= num_vfs; vf_id++)
> +			vf_unbind_driver_override(pf_fd, vf_id);
> +	}
> +
>   disable_vfs:
>   	igt_sriov_disable_vfs(pf_fd);
>   
