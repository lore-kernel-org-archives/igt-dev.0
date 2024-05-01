Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752FCC4345F
	for <igt-dev@archiver.kernel.org>; Wed,  1 May 2024 12:05:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3B110F4F8;
	Wed,  1 May 2024 12:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VA/mKEs5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D3C10F4F8
 for <igt-dev@lists.freedesktop.org>; Wed,  1 May 2024 12:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714565122; x=1746101122;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4Hmk6GP0uFImbLtg9kViWHZSkJYAm3kW3beK0IcmqW8=;
 b=VA/mKEs5OiEroRavbgm8gg2UqfeAhcisbSRbE4yAmiWT+yt1K3aEMKvh
 7EK9HVPFPb9CMTNFBR01EEAkgYpLIRfSbP667E3/TDcFttCeMf/CXoHqe
 ijgOoMx/qlpuLrPjsUklE7vpYITU/C74teiZ6tmOrk+s0AqMphJsGwMwY
 YGPPnqsOata/UEpnE+0TvIBwe2q8GVka2aoIA6K77g3ap6WPxjkh6IJOE
 MzWsLZXGeT/khPVNx4aeDs7ibT7D20fR9sjP+9FDbgD2AEYenlvUQnnuk
 7LNh1EsmIuwCtQy2AII5s1Q4ak6WUbTNvuylDNJKyXS8xzxXRZFbI7bFD g==;
X-CSE-ConnectionGUID: JvyBHNlWTjitAouv9D/O8w==
X-CSE-MsgGUID: gGcGU5eKRHC5bNJ61CUyVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10463769"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; d="scan'208";a="10463769"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 05:05:21 -0700
X-CSE-ConnectionGUID: NwVYJTwCSh+mSh9bZAhP/w==
X-CSE-MsgGUID: rscRaOykRlSQpGkDa1vaGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; d="scan'208";a="31560851"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 May 2024 05:05:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 1 May 2024 05:05:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 1 May 2024 05:05:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 1 May 2024 05:05:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgauEwmUqGF014HFy+7/Ld1vSGsSIJQKLHIUzpGh98UohiwxL68i3lzOmqesSnI0ruYHqdpI3Kx4ulCF9WIiFf+xQbz7fL+tzUNwCrl+63PB0Or6pi5XzB4sDsxZMudBPCU8aGDTbC1Dwe/NeQ9O8IEV4GzYPv50EMOr5HwDBAs9xv+pegMk2tuL0d+ZpwUpF2GregmYLGj7sxPumWUFvz7ivQngVJefjq8hyt0RUzW1ONknH0wUaQP8DydMBsKrYRDXl0vmvqxelaSpIMa60javmLqjUQ02c4vWRXdSJ4qNWVa4T7pSb6QrCRgkxp0js1GTy3FhBo38s07c+XA7OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Hmk6GP0uFImbLtg9kViWHZSkJYAm3kW3beK0IcmqW8=;
 b=OURzdcfp9VFISrJYsF72vxEgj8RKVj1tozIzYllNRy+i5XZLT8LKwbhKtWQ18hrx+TQpQ/aJE1/5xesQpQnKB3NwlmOW39WUlyrS3r7c6GJ30p0cT4ZSdXdKvZX4LssnyslyxWnGH6ivvqj65e8tR9Wb8WdgVi+8/fMvDk9NIBuiUJ/VYTKxbUJIEknt8CFC6Wj+eaOCu80zrHwr3XgusC/GX6YMUulwg6yd8ydC/sHEqYz2xs5+Ty5NPxwghJA0d2KN+W+IG4FFEUZ4S0kflGzEBSZLyGPyVi6NzMHZ+iSd2yaNUl/nvjOi6b5+54+Mlv+HQ15V3rPz4b/PK54QBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SN7PR11MB6852.namprd11.prod.outlook.com (2603:10b6:806:2a4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Wed, 1 May
 2024 12:05:17 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7519.021; Wed, 1 May 2024
 12:05:17 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH RFC i-g-t 0/2] helper function
Thread-Topic: [PATCH RFC i-g-t 0/2] helper function
Thread-Index: AQHamywYCEc2IeAo/kSvm/cwXTzvpbGBuHiggAAVlQCAAHfAMA==
Date: Wed, 1 May 2024 12:05:17 +0000
Message-ID: <SA1PR11MB6991C253924B409D1D8DC58792192@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240430182747.589234-1-krishnaiah.bommu@intel.com>
 <SA1PR11MB6991BA2418A132F04239526792192@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZjHIlgozTn+cph0I@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZjHIlgozTn+cph0I@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SN7PR11MB6852:EE_
x-ms-office365-filtering-correlation-id: eb3844b5-3d2e-40c8-8224-08dc69d6f7a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?ZVlZMTRucDRpMXZUT0hHY2ZUdlFFd2NoZmJoSE1lV216V3JhYVBDNGdWbWxQ?=
 =?utf-8?B?S0pNcTZLbG5qRXRkQXRwN0I5aGl3a3BsVGFZblJERWdUS0JLcEVmTVJKRGpD?=
 =?utf-8?B?UXNpNkVVSzNIMlA2MlM2eFp5czd4NGRCV29oNm9mZ1FtbnZKK3NBaUM0ejdq?=
 =?utf-8?B?R0ptRGpYTjhMWXM3RDh4eDlmMTJYZEo1MzdvWSs5TEdQcFQ4Z0xvSUxrU2lR?=
 =?utf-8?B?amNjT0tXRlEyNnhMOUpiQ0YvelY2djhaKzJQQUVzK0ZUeXVDUFRLc2dnU3pL?=
 =?utf-8?B?T3RpNldqZGU5cjBwSjBoN3FuK2VrM3lQb0FEWDRmWkZFbGwyOGVqWURuKzFF?=
 =?utf-8?B?a0J2M3FadHZrRGZhZDQwTk9DRlJqa2I5VXdIcGw5dUJldHhNaEZjS09FSnNs?=
 =?utf-8?B?SFBkWWJWeWxuVDVWbDFpaEFCSnZnRE14QUs0V1BacUUxVC9YZ08rSUIyYkI1?=
 =?utf-8?B?YWRheWdJTFJWZEpwNWV5aHhhb0lwdU1oYnJiMFdKM29Ld1g0MlZ6SkY3ZHor?=
 =?utf-8?B?cTNQeE1ncU90UzBYa2ZKN0toSmVJTFFmcUVPeFh6cmtQVU9BQlVTQWVTeDJW?=
 =?utf-8?B?c2pNK3hnOWwvRElham5QWGpzeTlaYnRNN0MveUdCalpoQXhGY2tvaGQ5UTB6?=
 =?utf-8?B?ZVk2a3N5aExuNEtOQTE4anBEcDRRZzBQdFp4QzBQcWtMVld0bVpyMVJkanlX?=
 =?utf-8?B?alpiR3dSV3laRURMZ2M5cjJ5M1ZwdGJ1MDhQWVJsbHJkbFZJOWNIVFY2MndT?=
 =?utf-8?B?OEtiRW45NUlBR2dRbytSeXliQkwyS0tON3Nwd3dtMTlpT3kxYkxGeTJzSlNI?=
 =?utf-8?B?Y1J0aWxKem81WkhEeWpSUHlpZ0NLR2FRWm1jZXZTNndoc2tZd3BPRTNVY0VW?=
 =?utf-8?B?VFBBMGhPWDZ4L3BSWE5HL3FOd3ZnK1ZpZThFREpsU0hRNEdlWWtRSlF3Qi9l?=
 =?utf-8?B?OXhZbGhRNVhwS0JTRUN4dVpaN3FUeEJxQW84dHVFVjJ5MTU0OGVtR3Bqakt3?=
 =?utf-8?B?TlMvMUFSRjExSmpwSWdEd2Z4SmovSjFtblRjTkdvVkxjdzc4T0d2QWtoN1Rw?=
 =?utf-8?B?WnNQdzY4T3FWVkNiWTVVSmhmQXZUUHI5d2Z6YnNRWWEwWjEzVkVreEpLMXlp?=
 =?utf-8?B?VzZyTmtLYndoQ0ZETHo0NXJJSUM5aE9qd2tFVXBEY3IrU3JQd1JNYzhiSEEx?=
 =?utf-8?B?c2xPQ0hOckF4VFZpcExyWFBxa2F2SG8ybW5rOG1iY1lvcXNRVWh4S0xXQnpT?=
 =?utf-8?B?bFlKaXMwTnpoUnAxUUdrdTBjclJacW1Pck9WTzdzd2d0L2hCR042eFU2TU1W?=
 =?utf-8?B?Y2RZajdTMmZUSVd5QXlXSDJndTBCOXNzYktQZ3BqRUs5eHVRcjcvcnc2dVJN?=
 =?utf-8?B?cE9EZmNKSi9UL3QwRFR1b05aQkpIbmxJN1d6c1E2a0hCVXN5QmlWeDh0Qkp3?=
 =?utf-8?B?TGRTTkpRQ0ljd04zVEM5S1ZmVkxyOTE5bWN3cDRqaVYrbDM1dm5Vb3MzZDZq?=
 =?utf-8?B?R1ZpMTR4bTNqbXhXblFSak8vVzdBZkcwYmlGN2VkYTZ1RE1nbklKVVBsYmlW?=
 =?utf-8?B?eTdnWUpsVk9iN1BZKzhRTWVIY2tjZ0tySExsK3pSM3I0a2dwM0hkRUJ2T2hs?=
 =?utf-8?B?WTF0K0ZmL3FWS09rMk9tN0RLZW9wZUFtTHVrd1Arb2l2ejl3RURFejdXdTlE?=
 =?utf-8?B?V3lEZWFYRE03NHQ4M3RuZnZQZWZxbjAwL29YbUp4V0FrU1MvbVFJWVl1RHla?=
 =?utf-8?B?Tkk4RVJaM1E2aVFrcG1haytQbHhmTmZvUVpHYUZDc25qTDZvaE02OVF1bnR2?=
 =?utf-8?B?SFFBMFRvOElxbmY2ejBCUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWpJakRrRUsyZlV6K2FMdHBscVg4Wm1pYXEzay8rYkI2YkNqUHVrczQvQmov?=
 =?utf-8?B?SFczV2VmR3BlSEdob0EvZ0thc2cyekJVcnorYi9QaEZtMVpaVVY1U2J4aGdW?=
 =?utf-8?B?VG1INWMyODN3eU1LUUo0eDEzdUNqWGVBcWVsVys5cldCMm1OdW5ueGJ1eUNs?=
 =?utf-8?B?Y042R0t5ejlvcnc3R1dUQk8vZmhUNHJoUW9PTisyd2lYaThKYzNkVjdVbXI4?=
 =?utf-8?B?a25TR29zbGVqRVBydzFzVU9RMjZyL2hMbmFqaUFPS3V2NWhNdEpsczByaUtk?=
 =?utf-8?B?SjVDU2ZDSU1Wdm9PcGpzcjRyWmJ1UFRJeFRxcm1FbElWS29PMk9yemZEUlRT?=
 =?utf-8?B?Q1MyL2dCaEhwTnI5b2RDTVkybUhqTUtEM1dwWHhJcHpZRVl2cDRNRDJ2ZHpa?=
 =?utf-8?B?UzY1akdTUHZSYUVOZVJDZ3pxd0FQbjhWL2dkazJ3RnhwNXpBZjJLSGVKV3Qx?=
 =?utf-8?B?eS94NFFQdUN6dTI1TnZ3RFpJSEY1N0kvRnpRUEg1eDd0SDF5UVFuRHVoWHBh?=
 =?utf-8?B?bVFGaWFZeXNUUTBMM0RVSXp4Q1JKVFUwUCs4MUJaRmVrbXpmRTFrVHUzZVU1?=
 =?utf-8?B?OCtRTEw3VUJBdFZmZTNNY2p5LzZneXpJOW45d2hBL1dtb1JoUDlsTVBqb0pr?=
 =?utf-8?B?TWdOK1o0WW9qd0tPbWh3RTE5TDJTM20zNnhPM0Iwd3luTktwakNEdTMyUjJh?=
 =?utf-8?B?M3FJelQraVRTNHJ3VkxDTjBucGMzczdNeURiVmJKL3hwY0tua2RDNk5yUUFE?=
 =?utf-8?B?YW1tRGQ4SUdSQWtHT0tOdS80Q29NNlAyUXhvY0Zkejk4Si9rTHlVN0tMRHdS?=
 =?utf-8?B?NDNxM2tOTmdqdXVzcTFFdWZwRHcwRWZPZ3BnWGNFV0xpeUgwOEY3TDlLZXFS?=
 =?utf-8?B?S3M5dFlKTFhmZUJRS2FJODVoM3V4K0t2eTZPS3VlNjJHVWJxS0JRWm1PYm9U?=
 =?utf-8?B?Z0dxZHN3dlc5c0NsQzd6ek0zTDNRRUREWVlKWC9RSmErNkxQVnZLOFd2ZjVI?=
 =?utf-8?B?dmVvMjBLSzR6dkhnTFNpT3d0ckFXaHVFZ1JDSENjOGRUTFUzZk5NQW51L2Ux?=
 =?utf-8?B?M1AyZEh4Ky85anA4bFNkTXprYTJobVh3c3o1QW1mYSt5VVJscWVOL25CMld6?=
 =?utf-8?B?R2wrNkVmejJYSTJYV0ZyVy9LamF0NUg5aG8wa0RNdXZSZnpoSDM0V1RBZ2J2?=
 =?utf-8?B?NzNCVG8zRDdxbTRyK1FDTTZITG9DaG9RRG9pei9jazdkWjRFSHRZa21jR1hk?=
 =?utf-8?B?bVFLaHRvZ2ZBbERLbDdaeGdjTzdTbTlpRUVnY0EzNTRHMjduMkdLYzlWVzdC?=
 =?utf-8?B?c3FHRE40N3Fid01lWXpLTU9aVWJzVWdCTHIzSWZBRm42SVEweDFReExPRG43?=
 =?utf-8?B?ZzcwZWlrZzhhb1RMb2czWm4wOWc4OWdBVFhXRjJHMHJuWWJuT2FINWZ0bFg2?=
 =?utf-8?B?ZURSYldYZHpnQXJXaDFTejYyL1lFWnRqMTZCK2VUcVpFVEpkT1V0bm1JS2N4?=
 =?utf-8?B?ZlUwSUtuZFlQcXArVHo5VE1CQktiNlhpUnlXdzlBK3kyUFlTOTJFMXZha1A0?=
 =?utf-8?B?U3J6TXNCdEJNbzduQy9hMnE4N0xpYUVKSE4rSjRYZW9jZUpheTFDb01jTnlT?=
 =?utf-8?B?UWtld1BVTG5iQlpkR1JSSnErdkRlcDRYcVFVY1IwN0NVQlUwM3ZNSlBwZU1U?=
 =?utf-8?B?Ym04NXMwejB5VHpoQ2N3bG51RC9lV0tQSzJ3TzdiS0pGR2xKZ01zQjRuZTc5?=
 =?utf-8?B?QjdtSy9ycXhyTVhKTGxwRXpYdkZVVzZOZVNucjJRbTIyTXE3Y2k2MEpKbDZm?=
 =?utf-8?B?QjdRVzRZMlVFZzdQRFI1dVVrQzAzZUt4eFZVS3FCZXptSU1aTkd5Wi9TVzg5?=
 =?utf-8?B?cEttd3BWNmhWQm82MWpVaHJzaUMvUnVEYUdNTlRaY0dheE5HTlY5dGNKWTJP?=
 =?utf-8?B?YU1QVWZ0dlkwWmkyRkNaeE11QnlOMExadzRZN2JwNnRXOUR5emNndmsyMEFt?=
 =?utf-8?B?VnRJYzlxT0xwb2twQThQbTAydk84R2txSmZQWkdjV0hyTExkUjF1dndsbGFZ?=
 =?utf-8?B?VlMwVkhoT0lRYjZXekNGaUdFWUgxVG9DYk00bElFVEZxVXFqQVFYOVdoK0or?=
 =?utf-8?Q?HxR7IIJtvm8FtOR+9N8QCX580?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb3844b5-3d2e-40c8-8224-08dc69d6f7a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2024 12:05:17.8167 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hg4jI0auOpIVLRukrrAmtW2RkXqzZL8zWcdK/Z4ZljMeLTJTGNX1tzsHIXs5VpsBSlPOJD9v4BdUxINoE/Yx7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6852
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

SGkgTWF0dCwNCg0KUGVyIHlvdXIgY29tbWVudHMsIHdlIHdpbGwgdGFyZ2V0IHRob3NlIGhlbHBl
cnMgZm9yIHN5c3RlbSBhbGxvY2F0b3IgdGVzdCBvbmx5IGZvciBub3cuIA0KDQpTZWUgYSBmZXcg
Y29tbWVudHMgaW5saW5lIGFsc28NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBCcm9zdCwgTWF0dGhldyA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+IFNlbnQ6IFdl
ZG5lc2RheSwgTWF5IDEsIDIwMjQgMTI6NDQgQU0NCj4gVG86IFplbmcsIE9hayA8b2FrLnplbmdA
aW50ZWwuY29tPg0KPiBDYzogQm9tbXUsIEtyaXNobmFpYWggPGtyaXNobmFpYWguYm9tbXVAaW50
ZWwuY29tPjsgaWd0LQ0KPiBkZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBHaGltaXJheSwgSGlt
YWwgUHJhc2FkDQo+IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIFJGQyBpLWctdCAwLzJdIGhlbHBlciBmdW5jdGlvbg0KPiANCj4gT24gVHVl
LCBBcHIgMzAsIDIwMjQgYXQgMDk6MzQ6MTlQTSAtMDYwMCwgWmVuZywgT2FrIHdyb3RlOg0KPiA+
IEBCcm9zdCwgTWF0dGhldyBUaGlzIGlzIHRoZSBpbXByb3ZlZCB2ZXJzaW9uIG9mIHRoZSBpZ3Qg
aGVscGVycy4gSXQgaGFzDQo+IHNvbWUgY2xlYXIgY29uY2VwdHMgb2YgY3JlYXRpbmcgYnVmZmVy
IGFuZCBjb21tYW5kIGJ1ZmZlciwgYW5kIGNvbW1hbmQNCj4gc3VibWlzc2lvbi4gV2l0aCB0aG9z
ZSBzaW1wbGUgY29uY2VwdHMsIHdlIGFyZSBhYmxlIHRvIHdyaXRlIGFuIGlndCB0ZXN0IGluDQo+
IDwyMCBMT0MsIHNlZSBwYXRjaCAyLg0KPiA+DQo+IA0KPiBTdXJlIHlvdSBjYW4gd3JpdGUgYW4g
SUdUIHdpdGggMjAgTE9DIGJ1dCB0aGVzZSBoZWxwZXJzIHVsdGltYXRlbHkgcHV0DQo+IGxpbWl0
cyBvbiB0aGUgY29tcGxleGl0eSBvZiB0ZXN0cyB5b3UgY2FuIGJ1aWxkLiBUbyBnZXQgdHJ1ZSBj
b3ZlcmFnZSwNCj4geW91IGFsbW9zdCBhbHdheXMgYXJlIGdvaW5nIHRvIG9wZW4gY29kZSBzb21l
dGhpbmcuIE9yIHRoZSBoZWxwZXJzIGdldA0KPiBzbyBjb21wbGV4IGl0IGFjdHVhbGx5IG1ha2Vz
IHRoaW5ncyBtb3JlIGNvbmZ1c2luZy4uLg0KPiANCj4gVGhlIG9wZW4gY29kaW5nIGFkbWl0dGVk
bHkgY291bGQgYmUgYSBsb3QgYmV0dGVyIGluIHRoZSBjdXJyZW50IElHVA0KPiBzdWl0ZS4gQSBs
b3Qgb2YgdGhlc2UgdGVzdHMgSSBqdXN0IHdyb3RlIGFzIHF1aWNrbHkgYXMgcG9zc2libGUgd2hp
bGUNCj4gd3JpdGluZyBYZSBpbiBhIFBvQyBzdGFnZSBhbmQgdGhlbiB0aGV5IGdvdCBtZXJnZWQu
IElmIEkgY291bGQgcmV3cml0ZQ0KPiB0aGVzZSB0ZXN0cywgdGhleSB3b3VsZCBhIGxvb2sgYSBi
aXQgZGlmZmVyZW50Lg0KPiANCj4gTGV0IGdpdmUgc29tZSBleGFtcGxlcyBvZiB0aGUgbGltaXRh
dGlvbnMgb2YgdGhlIGN1cnJlbnQgaGVscGVycyBpbiB0aGlzDQo+IHNlcmllcy4NCj4gDQo+IHhl
X2NyZWF0ZV9idWZmZXIgLSBUaGluZ3MgSSBjb3VsZCBjb252aWFibGUgd2FudCBpdCB0byBkbyBi
ZXlvbmQgd2hhdCBpdA0KPiBkb2VzIGZvciBhIHN5c3RlbSBhbGxvY2F0b3IgdGVzdC4uLg0KPiAJ
LSBJIHdhbnQgdG8gdXNlIG1tYXAgd2l0aCBubyBmaWxlIGJhY2tpbmcsIHdpdGgNCj4gCSAgc2V2
ZXJhbCBkaWZmZXJlbnQgZmxhZyBjb21ib3MgKE1BUF9TSEFSRUQsIE1BUF9QUklWQVRFLA0KPiAJ
ICBNQVBfQU5PTllNT1VTLCBldGMuLi4pDQo+IAktIEkgd2FudCB0byB1c2UgbW1hcCB3aXRoIGZp
bGUgYmFja2luZw0KPiAJLSBJIHdhbnQgdmFyaW91cyBwb3NzaWJsZSBhbGlnbm1lbnRzDQo+IAkt
IEkgd2FudCB2YXJpb3VzIHBvc3NpYmxlIHNpemVzDQoNCldlIGhhdmUgYSBzaXplIHBhcmFtZXRl
ciBhbHJlYWR5LiBNYXliZSBkbyB3aGF0ZXZlciBhbGlnbm1lbnQgaW4gdGhlIGNhbGxlciBhbmQg
cGFzcyB0aGUgYWxpZ25lZCBzaXplIHRvIHhlX2NyZWF0ZV9idWZmZXINCg0KPiAJLSBJIGFscmVh
ZHkgaGF2ZSBhbiBleGVjIHF1ZXVlDQoNCkNyZWF0ZSBidWZmZXIgZnVuY3Rpb24gZG9lc24ndCBj
cmVhdGUgYW4gZXhlYyBxdWV1ZS4NCg0KQ3JlYXRlIGNvbW1hbmQgYnVmZmVyIGhlbHBlciBjcmVh
dGUgb25lLiBZb3UgY2FuIGFsd2F5cyBtYWtlIGV4ZWMgcXVldWUgY3JlYXRpb24gcGFydCBvZiBj
cmVhdGUgY29tbWFuZCBidWZmZXIsIHJpZ2h0Pw0KDQo+IAktIEkgZG9uJ3Qgd2FudCB0byBiaW5k
IGl0IChlLmcuIGFscmVhZHkgaGF2ZSBzeXN0ZW0gYWxsb2NhdG9yDQo+IAkgIGJpbmQgZm9yIGl0
KQ0KDQpUaGlzIHdvdWxkIGVuZCB1cCB3aXRoIGFub3RoZXIgcGFyYW1ldGVyOiBpc19zeXN0ZW1f
YWxsb2NhdG9yLCBzaW1pbGFyIHRvIHRoZSBjdXJyZW50IGlzX3VzZXJwdHIgcGFyYW1ldGVyDQoN
Cj4gCS0gSSBkb24ndCB3YW50IHRvIGFsbG9jIGEgbmV3IHVmZW5jZQ0KDQpUaGUgdWZlbmNlIGlu
IHhlX2NyZWF0ZV9idWZmZXIgaXMgdXNlZCBmb3Igdm0gYmluZCB0aGUgYnVmZmVyLiBZb3UgbmVl
ZCB0aGlzIGZlbmNlIGFueXdheS4gSWYgeW91IGRvbid0IGNyZWF0ZSBpdCBpbiBjcmVhdGVfYnVm
ZmVyIGZ1bmN0aW9uLCB5b3Ugd291bGQgaGF2ZSB0byBjcmVhdGUgaW4gYW5vdGhlciBwbGFjZS4g
Q3JlYXRpbmcgaW4geGVfY3JlYXRlX2J1ZmZlciBtYWtlcyB0aGluZ3MgY2xlYW4gdG8gbWUuDQoN
Cj4gCS0gSSBtYXkgb3IgbWF5IG5vdCB3YW50IHRvIG1lbXNldCBpdA0KPiAJLSBJIHdhbnQgdG8g
bWxvY2sgaXQNCg0KWWVzLCBhbGwgdGhvc2Ugd291bGQgYmUgbmV3IHBhcmFtZXRlcnMNCg0KPiAN
Cj4gVGhpcyBpcyBxdWlja2x5IGdvdHRlbiBvdXQgb2YgaGFuZCBmb3IgYSBzaW5nbGUgaGVscGVy
LiBJIGNvdWxkIGdvIG9uDQo+IHdpdGggdGhlIG90aGVyIGhlbHBlcnMgdG9vLg0KPiANCj4gSWYg
eW91IHJlYWxseSB3YW50IHRvIGJ1aWxkIHBvd2VyZnVsLCBjb21wbGV4IHRlc3RzIGluIGEgZ2Vu
ZXJpYyB3YXkNCj4gZnJvbSBteSBleHBlcmllbmNlIHlvdSByZWFsbHkgbmVlZCB0byBidWlsZCBh
biBlbnRpcmUgZnJhbWV3b3JrLg0KPiBUeXBjaWFsbHkgdGhlc2UgaW52b2x2ZSBidWlsZGluZyBv
cGVyYXRpb25zIGxpc3RzIGFuZCB0aGUgcGFzc2luZyB0aGVzZQ0KPiBvZmYgdGhlc2Ugb3BlcnRh
aW9ucyB0byBhIHRlc3QgcnVubmVyIHdoaWNoIGV4ZWN1dGVzIHRoZW0uIEJ1aWxkaW5nDQo+IHNv
bWV0aGluZyBsaWtlIHRoYXQgdGFrZXMgcXVpdGUgYSBiaXQgb2Ygc2tpbGwgYW5kIHRpbWUuIEkg
aGF2ZW4ndCBzZWVuDQo+IGFueXRoaW5nIGxpa2UgdGhhdCBpbiB0aGUgSUdUIHN1aXRlcyBhbmQg
aXMgbGlrZWx5IG91dCBzY29wZSB3aXRob3V0IGENCj4gc2VyaW91cyBjb21taXRtZW50IChsaWtl
IGEgeWVhciBwbHVzIGRldiBvbiBqdXN0IHRoZSBmcmFtZXdvcmspLg0KPiANCj4gV2l0aCBhbGwg
dGhpcywgSSdtIG5vdCBzYXlpbmcgZG9uJ3QgZG8gdGhpcyBidXQgSSdtIHZlcnkgc2NlcHRpY2Fs
IHRoaXMNCj4gaXMgZ29pbmcgdG8gYmUgYWxsIHRoYXQgdXNlZnVsIGJleW9uZCBmYWlybHkgc2lt
cGxlIHRlc3RzLiBJIGNvdWxkIGJlDQo+IHdyb25nIG9yIG90aGVyIG1pZ2h0IGhhdmUgZGlmZmVy
ZW50IG9waW5pb25zIHRoYW4gbWUgdG9vLg0KDQpMZXQncyBmaXJzdCBwcmFjdGljZSAgYW5kIGZp
bmUgdHVuZSB0aG9zZSBoZWxwZXJzIHdpdGggc3lzdGVtIGFsbG9jYXRvciBpZ3QuIExldCdzIHNl
ZSB3aGV0aGVyIHdlIGNhbiB1c2UgdGhlbSB0byBjcmVhdGUgY29tcGxleCBpZ3QgdGVzdHMuDQoN
CldlIGNhbiBhbHdheXMgY29tZSBiYWNrIGFmdGVyIHRoYXQuDQoNCk9haw0KDQoNCj4gDQo+IE1h
dHQNCj4gDQo+ID4gV2UgbWlnaHQgc3RpbGwgZmluZSB0dW5lIHRob3NlIGhlbHBlcnMgYnV0IHJv
dWdobHkgdGhlIGNvbmNlcHQgc2hvdWxkbid0DQo+IGNoYW5nZSBtdWNoLg0KPiA+DQo+ID4gRG8g
eW91IHRoaW5rIHdlIGNhbiBzaW1wbGlmeSBleGlzdGluZyBpZ3QgdGVzdHMgc3VjaCBhcyB4ZS1l
eGVjLWZhdWx0LW1vZGUNCj4gdXNpbmcgdGhvc2UgaGVscGVycz8gRG8geW91IHN1Z2dlc3QgdXMg
dG8gZ2l2ZSBpdCBhIHRyeT8gSWYgbm90LCB3ZSB3aWxsIGp1c3QgdXNlDQo+IHRob3NlIGhlbHBl
cnMgZm9yIHN2bSB0ZXN0IG9ubHkuDQo+ID4NCj4gPiBIaSBLcmlzaG5hLA0KPiA+DQo+ID4gU2Vl
IGNvbW1lbnRzIGlubGluZQ0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+ID4gRnJvbTogQm9tbXUsIEtyaXNobmFpYWggPGtyaXNobmFpYWguYm9tbXVAaW50ZWwuY29t
Pg0KPiA+ID4gU2VudDogVHVlc2RheSwgQXByaWwgMzAsIDIwMjQgMjoyOCBQTQ0KPiA+ID4gVG86
IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gPiBDYzogQm9tbXUsIEtyaXNobmFp
YWggPGtyaXNobmFpYWguYm9tbXVAaW50ZWwuY29tPjsgWmVuZywgT2FrDQo+ID4gPiA8b2FrLnpl
bmdAaW50ZWwuY29tPjsgR2hpbWlyYXksIEhpbWFsIFByYXNhZA0KPiA+ID4gPGhpbWFsLnByYXNh
ZC5naGltaXJheUBpbnRlbC5jb20+DQo+ID4gPiBTdWJqZWN0OiBbUEFUQ0ggUkZDIGktZy10IDAv
Ml0gaGVscGVyIGZ1bmN0aW9uDQo+ID4NCj4gPiBUaGUgc3ViamVjdCBjYW4gYmUgc29tZXRoaW5n
IGxpa2U6IEludHJvZHVjZSBoZWxwZXIgZnVuY3Rpb25zIGZvciBidWZmZXINCj4gY3JlYXRpb24g
YW5kIGNvbW1hbmQgc3VibWlzc2lvbiBldGMNCj4gPg0KPiA+IE9haw0KPiA+DQo+ID4gPg0KPiA+
ID4gSW50cm9kdWNlIGhlbHBlciBmdW5jdGlvbnMgZm9yIG9iamVjdCBjcmVhdGlvbiwgYmluZGlu
Zywgc3VibWlzc2lvbiwNCj4gPiA+IGFuZCBkZXN0cnVjdGlvbiwgYXBwbGljYWJsZSBmb3IgU1ZN
IGFuZCBvdGhlciB0ZXN0cw0KPiA+ID4NCj4gPiA+IHhlX3N2bSB0ZXN0IGlzIHZhbGlkYXRpbmcg
dGhlIGhlbHBlciBmdW5jdGlvbiBpbnRyb2R1Y2VkIGluICdsaWIveGUveGVfdXRpbDoNCj4gPiA+
IGhlbHBlciBmdW5jdGlvbicNCj4gPiA+DQo+ID4gPiBJbiB0aGlzIHRlc3QgSSBoYXZlbuKAmXQg
aW5jbHVkZWQgdGhlIHN2bSBmdW5jdGlvbmFsaXR5LCBuZXh0IHBhdGNoIEkgd2lsbA0KPiBpbmNs
dWRlDQo+ID4gPiBzdm0gZnVuY3Rpb25hbGl0eQ0KPiA+ID4NCj4gPiA+IFRlc3QgcmVzdWx0cw0K
PiA+ID4gcm9vdEBEVVQ3MDMyUFZDTWVsbGE6L2hvbWUvZ3RhL3hlL25ldy9pZ3QtZ3B1LQ0KPiA+
ID4gdG9vbHMjIC4vYnVpbGQvdGVzdHMveGVfc3ZtDQo+ID4gPiBJR1QtVmVyc2lvbjogMS4yOC1n
MzY1ZjgxNjQ2ICh4ODZfNjQpIChMaW51eDogNi44LjAtcmM1LXhlZHJtdGlwKyB4ODZfNjQpDQo+
ID4gPiBVc2luZyBJR1RfU1JBTkRPTT0xNzE0NDk4MjQ3IGZvciByYW5kb21pc2F0aW9uDQo+ID4g
PiBPcGVuZWQgZGV2aWNlOiAvZGV2L2RyaS9jYXJkMQ0KPiA+ID4gU3RhcnRpbmcgc3VidGVzdDog
c3ZtLWJhc2ljLW1hbGxvYw0KPiA+ID4gU3VidGVzdCBzdm0tYmFzaWMtbWFsbG9jOiBTVUNDRVNT
ICgwLjAyMnMpDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQm9tbXUgS3Jpc2huYWlhaCA8
a3Jpc2huYWlhaC5ib21tdUBpbnRlbC5jb20+DQo+ID4gPiBDYzogT2FrIFplbmcgPG9hay56ZW5n
QGludGVsLmNvbT4NCj4gPiA+IENjOiBIaW1hbCBQcmFzYWQgR2hpbWlyYXkgPGhpbWFsLnByYXNh
ZC5naGltaXJheUBpbnRlbC5jb20+DQo+ID4gPg0KPiA+ID4gQm9tbXUgS3Jpc2huYWlhaCAoMik6
DQo+ID4gPiAgIGxpYi94ZS94ZV91dGlsOiBoZWxwZXIgZnVuY3Rpb24NCj4gPiA+ICAgdGVzdHMv
aW50ZWwveGVfc3ZtOiBiYXNpYyB4ZV9zdm0gdGVzdA0KPiA+ID4NCj4gPiA+ICBsaWIveGUveGVf
dXRpbC5jICAgICB8IDExMw0KPiA+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKw0KPiA+ID4gIGxpYi94ZS94ZV91dGlsLmggICAgIHwgIDMyICsrKysrKysrKysr
Kw0KPiA+ID4gIHRlc3RzL2ludGVsL3hlX3N2bS5jIHwgIDk5DQo+ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysNCj4gPiA+ICB0ZXN0cy9tZXNvbi5idWlsZCAgICB8ICAgMSAr
DQo+ID4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAyNDUgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCB0ZXN0cy9pbnRlbC94ZV9zdm0uYw0KPiA+ID4NCj4gPiA+IC0tDQo+ID4g
PiAyLjI1LjENCj4gPg0K
