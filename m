Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF55C54F5B
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 06:07:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FFE10E789;
	Fri, 20 Feb 2026 06:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VdYBugsG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8111810E789
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 06:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771567632; x=1803103632;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UNxQFVdqAj5PzaySdf1pkUj6WDdssP8vLv91Y9ioe1I=;
 b=VdYBugsGoWRhoOLVItiuz7dADSZCLcM4/OZ4KxzqlWaEEIJVK1RgXIfj
 VQh8cB+RSMbYC7GkgOfpGHCO6ueOTHFmwBKx7nvs6zDAeRlPAc907jW4X
 V+19X6fyLL3ht8VrNLO+z6f8px2c4goka37YHphlpMnb7NFj8qONUPrrE
 xYmsLRd21IVUkU8Vs4HSZ9EJb41+Q3fKZglblqsApeW0rSwefWRclhiRz
 3X/WcCerEW78SNl2PLLWyE5YsA0CyfWBKADoTwNC7EW91ZWN0IJ89L4sf
 xJ+ivAl2gF+Z76sFNCAUTf/fYc2qHWzExfqTfL0AK5R7OXErP3kpIJwn0 w==;
X-CSE-ConnectionGUID: 5Ny+boh4RLuBrpGvttECCg==
X-CSE-MsgGUID: D4gtPTlpSmS/TbbeVT95+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72561886"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="72561886"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 22:07:11 -0800
X-CSE-ConnectionGUID: 600UBw8UTdGh2B5dSkIKVQ==
X-CSE-MsgGUID: xmYw2cbgSLmUoJN95KBkYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="213830599"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 22:07:10 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 22:07:10 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 22:07:10 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 22:07:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BpIj7b+D8npo5oVS+Fpxz4+Z5CANRaihEvQELtQv3OjxA1U/vnvLld7q8zLjV66l6yhaI4t0/b98HcmQ0qw4MhIxZR1oGm5m8xr/H9DLkWeZyfNcN7D4V8Otu/bhSTnli0m7AOLaYEuP+G/3ZaPt+/M7pQQVeN3cFdTPLID5rSUbTNcVDCbQfA0lNiTUJ4vOic9MH2Rt6E4zOhwNDZJtQP7izPb2pD8Ym6jYZj2vdqcf1MipO5nhjzFePWvzhbKq42BN9ZalZ+OCug44+J9PGNdK0OBjnK7eLmsnwgRgit/b+RLsaCJvvNoYP1rnGU6IN7FrN4t7q3NO6nsOHHxw3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmtbEhdhFcjU3xd+K3fQEyCcK9yyGC82UKWnCVYXjX8=;
 b=cBsVnIjorhQT16R/ilW4z2kk/s/vVVt3SY09Z2jpJUN3vI7okuQP+hjY2xHcZTBEGmRggUB4pMGLAYavT1by5nvu/7K4zOetLwixjkfzdzyMsmtgp0uUOv09JtLaZZDc9//4eleAtasgh9csRwyT1LkerSzGmRCkhL/dn7QJfLHbQvqGzl+dzXAXT2g+KjQM3hMmTiFS6B6qjG3/9okIfDZF33Uj/1dPlle1Jlw7qpAx4zIu/H/WodhyLi7R9Z/5Wehn6Cy1a3q7E5u/22EjTSvbMJUyldEjHh9ApliNPOIxkQ3VYWl6wxjDjoxulJeOrfNFatOHsS44DUg2hWsffQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by PH3PPF91320C45A.namprd11.prod.outlook.com (2603:10b6:518:1::d38)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 20 Feb
 2026 06:07:07 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 06:07:07 +0000
Message-ID: <224245ab-b3f5-4ed1-9a33-c8e40bd226de@intel.com>
Date: Fri, 20 Feb 2026 11:36:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 3/8] tests/intel/xe_madvise: Add
 dontneed-before-mmap subtest
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>
References: <20260217023423.2632617-1-arvind.yadav@intel.com>
 <20260217023423.2632617-4-arvind.yadav@intel.com>
 <BL1PR11MB55256B8E68BA4AA4DBC4AA44846BA@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <BL1PR11MB55256B8E68BA4AA4DBC4AA44846BA@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::9) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|PH3PPF91320C45A:EE_
X-MS-Office365-Filtering-Correlation-Id: 802a427a-8ec4-49db-fcc8-08de704646cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2JydGZBeUwvS01Cb0puUE1YdUYvSGhvazRCVGJXMjd2SERlRW5NU2hGMC9z?=
 =?utf-8?B?RTJ3ZUUzalB6ZW9zZHhyN3NOZ2s0UzhpdnpSNmt6OXRheHZBdFBOL2xSNUlJ?=
 =?utf-8?B?cFZ6NTlLaGU2RHhySmhPWUd0d09wZTVBWjZ4dU93azU4Ni9RRGo2SjljT3or?=
 =?utf-8?B?Zk9pWFI1c3dvZjF2dVJoZmZBUFYyRDltcEN2RVhOeHIxVzhKQjZ6UUVmczRF?=
 =?utf-8?B?clM0T2xwbHVPNW1kWjZrVVA0M2U3dUVhdms0bG5EK2lpclhKaUIreVBmUHZt?=
 =?utf-8?B?RWlBOFJ3UWlGMFpabzlQdXdWMDNCaHROdHlBQmI1OWpzRDl5RmhEdnMybmhH?=
 =?utf-8?B?OVVNTUhQQnNyajJtWGk1NkYxTUhmdzJkWHVMYVpoMGNVM2x2UlJ6Vlh1Rjc5?=
 =?utf-8?B?SE1SdmdZZ1JYOGw0VVdScVhCcXltT2N6VmpKNEVzZndrTldRUGpmeHhIZzZr?=
 =?utf-8?B?VytaYUpMdk9zb2dpQmgxQlZPckR1NmJUZWo2SDZmSUtIcEJlLzlJWjRPMmRS?=
 =?utf-8?B?NU05MTU1c1BGMDMvYXN3cFpibkErQks3VFlOazZlb0ZSZ2dPWkYrUFArams4?=
 =?utf-8?B?OXhNWlpHdnFFTVpDTzBxV0puc0RZOVdZcnBVSlE4d3M1Q1M0SDFPMWtacHp2?=
 =?utf-8?B?Y1VDanM4R1BiYXJEMnVGOTJhS3pTMnlVWHhGb1ppb3pDaCtGbitPd0tsa05p?=
 =?utf-8?B?QXdmSmRlOXc0N0pWWE5ORjB1eUVMeVE0d0dqekR6MmFJSERtQ1RyUE5ycnI5?=
 =?utf-8?B?MXhaclMxNHJiN2FKL1JrME52MU5YTkVKdG1aSTB6ZXFudHdKS2FoTGkvRUlw?=
 =?utf-8?B?SElpVmx5L3NZMDVxLy80Vkk2QTAweGpKbjE1bzZwWVZCVFdBYWVGWURYUVBQ?=
 =?utf-8?B?eFV5YjREYkFEN2kvOXBhMjc0ZVBvRVhBWENiL3dEWWMwRHl4Mk5pVUU1ZEx2?=
 =?utf-8?B?WDdIK3lEQzJ2RTdzN0NOMjJVVGQvMFdCNTNpbTg1TDBIemlwamFsR25UeDhB?=
 =?utf-8?B?MGF4bmNOOC8xdkoyU0Q4N3E2bVMvRy9nVENySWlybGt5cUZaV2J5VTJFNU1D?=
 =?utf-8?B?NjI3VTJNWlVqMGdZTlltZWVSU0FVY0ZMcVRKbjhKMU5RdXErK0FsbjlWT1pI?=
 =?utf-8?B?MjQwYWFHWUVmSCtpWTVPaDZBQkhsRlQ1aVM5RVF2YnpSNlZ0SFJ3RUtWZG8x?=
 =?utf-8?B?RDdvdHNmQXJwNkhYa09jdGRNVkZ3OWEwUGdsMXdUdUZRMm9Nd3RYOUpEYTN6?=
 =?utf-8?B?YjZXNWh0RXZ4c3VMRDJMVTZGYlNZOGlCN2orTEQ1azF0cVlFR2VNMlNrYVY4?=
 =?utf-8?B?cmgzQnYzZjl5THZUdmtWMVBGZ3BFSnlraWk2eG84UzFuMHBzdUNFRWpuNXZT?=
 =?utf-8?B?Q1dzTTFuTThTdmgvY21YQ2wxOG9VYWJpWXoxS1Z0VW5iWVlZQ0tTdjlVZCta?=
 =?utf-8?B?ZFRiZVUzd0RVUjlueUxUYkJ2cGFEV1cyc3gzT2l3TVMxU2FBS2RiVGVQbDlI?=
 =?utf-8?B?NStoazJzUXJDcjdyOFlIcDhxUWxSTngxekNLRzdjODZyWGJpQ21zWHA0cGoz?=
 =?utf-8?B?UDFGcWt4eDd5YXZ5ZjQ4L1ZaZGZacXd0T2hRdjV3V1dLZSswakhXYmtFODBl?=
 =?utf-8?B?UzJMb2NzVVo5SDV0TDU1akxoT2JQQTlpbDdudzBlSytFdFh0b2JOR0xDUjd5?=
 =?utf-8?B?MmswZHB3cWNCalR3a0Nwc0lnNHBDVjRHQm5JUVBGNUJjZkp1ZlVyTkpURjFn?=
 =?utf-8?B?dmErNU5sUDJ3UG9WSjlPaE85UFdFM29XT0lxYTdMbVZyVGg3THRMRytIQ3FZ?=
 =?utf-8?B?aGxxdXNITHAvblUvemtIVWZVRXk3OHBjekV3TWdROUllTng0U21wYkE0YjJx?=
 =?utf-8?B?aW5kbVBtYURNZ1hobEtqa1lSNTkyQWUrSDB0bmxwRkgybW9XRS9EU29nMkc4?=
 =?utf-8?B?Um9sMVFkRisxUU16SXN4MTh6YVFHb3pBdWRiNE5nMytRV3N4Q0hycm1yc0RG?=
 =?utf-8?B?VllDc2lDdVVhaHlpMkR3ODBtWEF6OHZnTlNpMlR6L3VtUUpLVEVORVQvNEZR?=
 =?utf-8?B?b0hUWVYzVHZRdFdjc2hqbnlONURJVlZpbDBrTi9nb05ZSlhZdFQ4VGx0Y3NH?=
 =?utf-8?Q?KvNI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHY5S1JFS0pCb2R2d0lvR3g1UkpHUDNpY05PRjBJMnc1THBaOFBCUHNHa2FL?=
 =?utf-8?B?Y21SSGZaMFU4bUNTR3JjWGxvN1VIV3ZFcVhxbkEzUzBUZ2FIcExhZXFhVWI0?=
 =?utf-8?B?ZzNqRFJrYUR3QTVoUVgrdDQ1cnloZVAzY0h2TmUxL3hROUd4YnZyUnRRejRC?=
 =?utf-8?B?ckxHUGVMTlJheDJrYk5yQmUweWVLdUltczZlcnRpOEFyb0pXdExrOHloN2gz?=
 =?utf-8?B?WjlWUk9UVXZoRVR3cUx5VDVHTkpYVHJpTFY2TnFmbUkzVUNIdWxqeWR5TW8z?=
 =?utf-8?B?c0lUNDFCdEcyMm5RLzMzcDl5T01heTJCZVg5QjNQUDV0ZmpYaTVzTi9iRy9r?=
 =?utf-8?B?VmVZU1BLZTdVTHB4c0NZV1JTYWlaRXFERGlXNVdtV0JSQVlHQmxjQ3d5RWRP?=
 =?utf-8?B?S1NpcU5LOTlwNmZNYzFDNVlOZndUeGRpUWFZRGVDaWowc3hmalAyZE15ZWhG?=
 =?utf-8?B?andWOFNWMnJpbCtHRmNHbU13VTBUNDEzbWFJOGFwN2w1aGRKVDRFbmpnM2Zq?=
 =?utf-8?B?SWhENkREa3k1M1J4VStrbHkwcGlTcGQwTkNIOHNPbFNEUEo2eEZRWlZFUVpQ?=
 =?utf-8?B?bXQzaFIyelBsWElJU3lwbDhDblNmejZoMVZTWGlyYThPdWFkbGZ3KzVDZHNM?=
 =?utf-8?B?eUlBYTJpZHcwR0s5anNnb1B0V2pDVXF3R0NvY3Z5TTVxcUd1NmkzelJTTzhW?=
 =?utf-8?B?d1FFUTRsa05XM1hEV1AvTUFjem9SUk05ZkNHWElLbUNFYWJjSiswSVEwTUt3?=
 =?utf-8?B?Ty9WYkJSQnRrMEZxQzUxWHZ0WFVMMytPTWZjcW45QWNtUmdPOTR1alp3VXBi?=
 =?utf-8?B?cWJVR0tKZU5MUm01NG0rRzF6L3RycUxXaHcwM1M5a3pGYlhQb3VlNUdLbHh3?=
 =?utf-8?B?SHZtK01jUG1XbFBNY2k5MjhsSHpNeEVjai9DYVAyekIyNnVlcGgvQ2liNGdP?=
 =?utf-8?B?bzV1YmJ0WnE0NGwvWWd2Y0crU1ZrOFFnanFyaXZ5WWluRmZpenhGS0w3Z1M5?=
 =?utf-8?B?RytIcUpWVEJTeUtlRXNuRy84a0kxTVRSWmNoWGRURFo5VVpYS2JBVEEyMi91?=
 =?utf-8?B?aElQdGQ1UTl5V2tMU3BPYWNvTUYyUk5JOU9CTlNqVzFOcHNhWVcySk5KNEl2?=
 =?utf-8?B?U2hLL1JFWERZM1pCTlptZGpVRndYcnI3VGdLMGVha1ZNa0F5ODU4ekw2aEdk?=
 =?utf-8?B?TllMUjZ6UFN2WEZ4ZWFDbTdNMjV4QlFaMGNHS3pncmtFM2lTWXA5VTNaL244?=
 =?utf-8?B?WnloN25rVlFXcjYxR0hNTDdZWEN4TFVHZWlYanRXM3QxSlJoNnNMTDlhV25x?=
 =?utf-8?B?c0FCcTNXb0dsUDRrWDczdFlqYmprRWRlSlJ6WmdBZ3ZTY0VvY1RkZDBQYWJ0?=
 =?utf-8?B?aEZmZk85SS9veDcrMitlYmJWckZ0YWtZWHVEVERQZEkwNzdybERYY1hzTHRT?=
 =?utf-8?B?TUpISDRPRXJ5RC9xTGVOUjdvVHlQbkxnaGpza1F4OFRPVi9ZY0ZLZ1hLamFJ?=
 =?utf-8?B?R25rTUhrUjJsbGhHRGE0MzVzS3Z6NjE3R0pubC90aHYvVWpqRi9aMktEMnp5?=
 =?utf-8?B?WC9MQXQvUFZuOXBoOEU1aFFQNy8yRGJaWkoybkgwUzM2QzJRa2Y5ejJEelI2?=
 =?utf-8?B?KzlqVFVsS21NM0l6Y004YkN6d2FJdUxYL0tMNUllcUhlVDNRa0hXNDZLc1E2?=
 =?utf-8?B?SzY4L2VNV3VQZCt2Y0M4UjdzcmhkYmVRMzBrOUlUeE1vUTlQUGR2SzVreWho?=
 =?utf-8?B?QldnWTBPa2pCSUJ5OGN4d2l5RG9uV1hnNk9MRyt4VkdiNnpiQ1NLSk5mKzFE?=
 =?utf-8?B?OEVGaDF5TzduNnlNU1UyL2o0dXQ2a0JOVlRXL3VpUGo3SDBXbVlpMEJYMEdU?=
 =?utf-8?B?Ylc2Mk1VM2I4UG9NdjFjTEE5Mzd5YXNVY1JQNHNqK0xONzJPTWdnU0lKdzEy?=
 =?utf-8?B?VVJnMTQ3bFRlTW85djBlcUp6NEVLSEl2c3VPSk5QRnJ1QS9EZHFUZ2UxTS9K?=
 =?utf-8?B?aFloTHhXZFZMRE9qQVUxSXlpVzEva3htcndhV3FTRm9pQ0ZrQTRqbld2Zkpr?=
 =?utf-8?B?NVJIb3VDUFBjMjVnY2loeUJoK0NwaUFQM1VMUVgvZzhpUXZ6RkNDSDF6RUNQ?=
 =?utf-8?B?ZnhWSFhRMFRPZkoza0xHKzlFMFhrcEd0Y3pvR2xoRWhFemRmR3hPckJYaHNl?=
 =?utf-8?B?Ykt2THdJbE4wTzk2ZkxjNmpReU4zdVhmLzFYQ2cxQ0w1d3hGaWFYK050VTlo?=
 =?utf-8?B?UXFaVUN2ZXF0Q2RXcTV4YWl3eiswS0pUMjlYL3pPWlpkM3FUSWNLS0UxLzNq?=
 =?utf-8?B?QllDc05CWGRZRFE3d3E1ZlRFZlZZWkM5VDZYb21QRHhQcWNsVDVtZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 802a427a-8ec4-49db-fcc8-08de704646cf
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 06:07:07.4927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FSzR0nTKZ94bczucEokFktCiOph9NZKDuRBD2yLtVslAc8qSdXXHg73wLq5XFrgNqQEM1svLwnU9bt+Hdxoh8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF91320C45A
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


On 19-02-2026 10:28, Gurram, Pravalika wrote:
>
>> -----Original Message-----
>> From: Yadav, Arvind <arvind.yadav@intel.com>
>> Sent: Tuesday, 17 February, 2026 08:04 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Brost, Matthew <matthew.brost@intel.com>; Ghimiray, Himal Prasad
>> <himal.prasad.ghimiray@intel.com>; thomas.hellstrom@linux.intel.com;
>> Sharma, Nishit <nishit.sharma@intel.com>; Gurram, Pravalika
>> <pravalika.gurram@intel.com>
>> Subject: [PATCH i-g-t v3 3/8] tests/intel/xe_madvise: Add dontneed-before-
>> mmap subtest
>>
>> This test validates kernel behavior when mapping a BO that was already
>> marked as purgeable and purged before mmap. After purging the BO under
>> memory pressure, the test attempts to mmap and access it. The kernel should
>> trigger SIGBUS or SIGSEGV when accessing the purged mapping, confirming
>> that purged memory is properly invalidated.
>>
>> Cc: Nishit Sharma <nishit.sharma@intel.com>
>> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   tests/intel/xe_madvise.c | 219
>> +++++++++++++++++++++++++++++++++++++++
>>   tests/meson.build        |   1 +
>>   2 files changed, 220 insertions(+)
>>   create mode 100644 tests/intel/xe_madvise.c
>>
>> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c new file mode
>> 100644 index 000000000..7dbe70f42
>> --- /dev/null
>> +++ b/tests/intel/xe_madvise.c
>> @@ -0,0 +1,219 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +/**
>> + * TEST: Validate purgeable BO madvise functionality
>> + * Category: Core
>> + * Mega feature: General Core features
>> + * Sub-category: Memory management tests
>> + * Functionality: madvise, purgeable
>> + */
>> +
>> +#include "igt.h"
>> +#include "xe_drm.h"
>> +
>> +#include "xe/xe_ioctl.h"
>> +#include "xe/xe_query.h"
>> +
>> +/* Purgeable test constants */
>> +#define PURGEABLE_ADDR		0x1a0000
>> +#define PURGEABLE_BO_SIZE	4096
>> +
>> +/**
>> + * trigger_memory_pressure - Fill VRAM + 25% to force purgeable reclaim
>> + * @fd: DRM file descriptor
>> + * @vm: VM handle (unused, kept for API compatibility)
>> + *
>> + * Allocates BOs in a temporary VM until VRAM is overcommitted,
>> + * forcing the kernel to purge DONTNEED-marked BOs.
>> + */
>> +static void trigger_memory_pressure(int fd, uint32_t vm) {
>> +	uint64_t vram_size, overpressure;
>> +	const uint64_t chunk = 8ull << 20; /* 8 MiB */
>> +	int max_objs, n = 0;
>> +	uint32_t *handles;
>> +	uint64_t total;
>> +	void *p;
>> +	uint32_t handle, temp_vm;
>> +
>> +	/* Use a separate VM so pressure BOs don't affect the test VM */
>> +	temp_vm = xe_vm_create(fd, 0, 0);
>> +
>> +	vram_size = xe_visible_vram_size(fd, 0);
>> +	/* Scale overpressure to 25% of VRAM, minimum 64MB */
>> +	overpressure = vram_size / 4;
>> +	if (overpressure < (64 << 20))
>> +		overpressure = 64 << 20;
>> +
>> +	max_objs = (vram_size + overpressure) / chunk + 1;
>> +	handles = malloc(max_objs * sizeof(*handles));
>> +	igt_assert(handles);
>> +
>> +	total = 0;
>> +	while (total < vram_size + overpressure && n < max_objs) {
>> +		handle = xe_bo_create(fd, temp_vm, chunk,
>> +				      vram_if_possible(fd, 0),
>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +		handles[n++] = handle;
>> +		total += chunk;
>> +
>> +		p = xe_bo_map(fd, handle, chunk);
>> +		igt_assert(p != MAP_FAILED);
>> +
>> +		/* Fault in all pages so they actually consume VRAM */
>> +		memset(p, 0xCD, chunk);
>> +		munmap(p, chunk);
>> +	}
>> +
>> +	/* Allow shrinker time to process pressure */
>> +	usleep(100000);
>> +
>> +	for (int i = 0; i < n; i++)
>> +		gem_close(fd, handles[i]);
>> +
>> +	free(handles);
>> +
>> +	xe_vm_destroy(fd, temp_vm);
>> +}
>> +
>> +static jmp_buf jmp;
>> +
>> +__noreturn static void sigtrap(int sig) {
>> +	siglongjmp(jmp, sig);
>> +}
>> +
>> +/**
>> + * purgeable_mark_and_verify_purged - Mark DONTNEED, pressure, check
>> +purged
>> + * @fd: DRM file descriptor
>> + * @vm: VM handle
>> + * @addr: Virtual address of the BO
>> + * @size: Size of the BO
>> + *
>> + * Returns true if the BO was purged under memory pressure.
>> + */
>> +static bool purgeable_mark_and_verify_purged(int fd, uint32_t vm,
>> +uint64_t addr, size_t size) {
>> +	uint32_t retained;
>> +
>> +	/* Mark as DONTNEED */
>> +	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	if (retained != 1)
>> +		return false;
>> +
>> +	/* Trigger memory pressure */
>> +	trigger_memory_pressure(fd, vm);
>> +
>> +	/* Verify purged */
>> +	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +	return retained == 0;
>> +}
>> +
>> +/**
>> + * purgeable_setup_simple_bo - Setup VM and bind a single BO
>> + * @fd: DRM file descriptor
>> + * @vm: Output VM handle
>> + * @bo: Output BO handle
>> + * @addr: Virtual address to bind at
>> + * @size: Size of the BO
>> + * @use_scratch: Whether to use scratch page flag
>> + *
>> + * Helper to create VM, BO, and bind it at the specified address.
>> + */
>> +static void purgeable_setup_simple_bo(int fd, uint32_t *vm, uint32_t *bo,
>> +				      uint64_t addr, size_t size, bool
>> use_scratch) {
>> +	struct drm_xe_sync sync = {
>> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		.timeline_value = 1,
>> +	};
>> +	uint64_t sync_val = 0;
>> +
>> +	*vm = xe_vm_create(fd, use_scratch ?
>> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
>> +	*bo = xe_bo_create(fd, *vm, size, vram_if_possible(fd, 0),
>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +
>> +	sync.addr = to_user_pointer(&sync_val);
>> +	xe_vm_bind_async(fd, *vm, 0, *bo, 0, addr, size, &sync, 1);
>> +	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC); }
>> +
>> +/**
>> + * SUBTEST: dontneed-before-mmap
>> + * Description: Mark BO as DONTNEED before mmap, verify mmap fails or
>> +SIGBUS on access
>> + * Test category: functionality test
>> + */
>> +static void test_dontneed_before_mmap(int fd, struct
>> +drm_xe_engine_class_instance *hwe) {
>> +	uint32_t bo, vm;
>> +	uint64_t addr = PURGEABLE_ADDR;
>> +	size_t bo_size = PURGEABLE_BO_SIZE;
>> +	void *map;
>> +
>> +	purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, false);
>> +	if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size))
>> +		igt_skip("Unable to induce purge on this platform/config");
>> +
>> +	/* mmap the purged BO - access should trigger SIGBUS */
>> +	map = xe_bo_map(fd, bo, bo_size);
>> +
>> +	{
>> +		sighandler_t old_sigsegv, old_sigbus;
>> +		char *ptr = (char *)map;
>> +		int sig;
>> +
>> +		old_sigsegv = signal(SIGSEGV, (__sighandler_t)sigtrap);
>> +		old_sigbus = signal(SIGBUS, (__sighandler_t)sigtrap);
>> +
>> +		sig = sigsetjmp(jmp, SIGBUS | SIGSEGV);
>> +		switch (sig) {
>> +		case SIGBUS:
>> +		case SIGSEGV:
>> +			/* Expected - purged BO access failed */
>> +			break;
>> +		case 0:
>> +			*ptr = 0;
>> +			__attribute__ ((fallthrough));
>> +		default:
>> +			igt_assert_f(false,
>> +				     "Access to purged mmap should trigger
>> SIGBUS, got sig=%d\n",
>> +				     sig);
>> +			break;
>> +		}
>> +
>> +		signal(SIGBUS, old_sigbus);
>> +		signal(SIGSEGV, old_sigsegv);
>> +		munmap(map, bo_size);
>> +	}
> Can you please move munmap out of block


Will move munmap outside the block as suggested.


> and one thing did not get how igt is receiving the SIGSEV
> if I comment the SIGNAL code am not receiving any error from kernel. Can you please paste the output how SIGSEGV error will be seen from kernel


Signals (SIGBUS/SIGSEGV) are delivered to the process, not printed as 
kernel logs. The signal handler catches the fatal signal and uses 
siglongjmp() to return control to the test, which then validates the 
signal was received. Without the handler, the test would simply crash. 
This matches i915's gem_madvise implementation.
You can add a log for "dontneed-after-mmap" test then you will get SIGNAL.

Thanks,
Arvind

>> +
>> +	gem_close(fd, bo);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>> +int igt_main()
>> +{
>> +	struct drm_xe_engine_class_instance *hwe;
>> +	int fd;
>> +
>> +	igt_fixture() {
>> +		fd = drm_open_driver(DRIVER_XE);
>> +		xe_device_get(fd);
>> +	}
>> +
>> +	igt_subtest("dontneed-before-mmap")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_dontneed_before_mmap(fd, hwe);
>> +			break;
>> +		}
>> +
>> +	igt_fixture() {
>> +		xe_device_put(fd);
>> +		drm_close_driver(fd);
>> +	}
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build index
>> 0ad728b87..9d41d7de6 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -313,6 +313,7 @@ intel_xe_progs = [
>>   	'xe_huc_copy',
>>   	'xe_intel_bb',
>>   	'xe_live_ktest',
>> +	'xe_madvise',
>>   	'xe_media_fill',
>>   	'xe_mmap',
>>           'xe_module_load',
>> --
>> 2.43.0
