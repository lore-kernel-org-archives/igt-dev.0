Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF95CFD376
	for <igt-dev@archiver.kernel.org>; Sun, 30 Nov 2025 16:13:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE55C10E041;
	Sun, 30 Nov 2025 16:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O3hvfNby";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C5410E041
 for <igt-dev@lists.freedesktop.org>; Sun, 30 Nov 2025 16:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764519182; x=1796055182;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3GAb6RLBX74X2IilMbxuFU2NyLvk376/SRV++F+GaEk=;
 b=O3hvfNbyCo5tLNj0yIXmX4ziKNQTWpz+WNRdz0IGEjbn62t5YFS1oLrA
 IMO8t2RzeHzERlpg/qZJIhter5nOm/52+/oa71Xo3yZINQmHdG6F7sDVY
 fbQwBK7vg4wr4r353/OCqoOIkj192EZD/DFLYpbFpxcVvPuxY/8tghVdC
 mVU+L1q2hICwG57ZnCIMkV4LEtOCqcyEFES8sWDx7yElo8WvTCPKR7U3q
 XaWsZAJc58nMWzLTtJ0pUrfq6NDEPzgj+1RmUjkIITvYDf2v2yMSqwlTh
 fyfxDi2wVBu1g6yoF3jZUw/gKj3xcdqacAs9eqsIbkHkz4w2v9VvBTnHV Q==;
X-CSE-ConnectionGUID: NSv+gPh4QY6xEZAKOr2Ftg==
X-CSE-MsgGUID: mPs2rum9Ri+5/7uwkyLZEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66418048"
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; d="scan'208";a="66418048"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 08:13:01 -0800
X-CSE-ConnectionGUID: k/mUH682SRWBsm8/zIH+5A==
X-CSE-MsgGUID: 9bIP8WZ3SE+Kf6+CUz1hgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; d="scan'208";a="224832200"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 08:13:00 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 30 Nov 2025 08:13:00 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 30 Nov 2025 08:13:00 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.64) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 30 Nov 2025 08:12:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdYcQM30P47AOUcZXZ9z0gXbiWj09cmRFSu4hCJ3E2c9D+LTIewidygOujsM1403Y9WOScWKkU3E3oVU4yScBlYalZ+jZpSia2mVcVKFwiaScJKcAE4zWn+obWY79Cu6NiDhKqDCusgy/9vq6/E1H+8Mh7Z7xZPqP0Xw8curYP0S1j9zE0Cg66gqrXV46rWhC5/ZzdRxhycqogh2UuaelKPm6XWeiqvo5l+BLbjIR7rcdnC35NsqXrzD7z9Sr1ZtYN/yJJoQA556wsTxcWxDFk+9zGtBEuDio2e1h1plRD7S87/E18GOulg3PoYorHpWoIObG+CFZVFu80akS4kUAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4TrvayGljDc/+MlYeYZuj21XRwDHSXKrcF8umw+87c=;
 b=XfEewwKDySjCjtNvfgz51PvPjdTrg6z2kKCgvYR2ve+/lRoe20CVlS0smEfjkDUlcWzYlh7FMX5VSf1kgOXxBg6WPQZRNVBx1FVxVuxRem7dHEThl0J8Gagouoh3yiQy5joOL1jD20fU7ptDPYipHgKKC90GyauC3rP0hqWjCMC1J1vsVjjuDyiPI5hP0TwSwtJSv376I45RA969ZllElPU+Ecx7GHofErCwht4bNrIEJ9QXAH9XBfxuv34FXcs3tpr3Ja7b8lnnZzSZQO6j/YlsbaEptS07+8j3HL9RTpXTWp6xie8y+mmxnjZQ0o156JQV/ljboNNSLM1p5+HqNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by PH8PR11MB8257.namprd11.prod.outlook.com (2603:10b6:510:1c0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sun, 30 Nov
 2025 16:12:58 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%5]) with mapi id 15.20.9366.012; Sun, 30 Nov 2025
 16:12:57 +0000
Message-ID: <c5e9e43c-28ff-4841-b4b6-a0f1ee76abf2@intel.com>
Date: Sun, 30 Nov 2025 17:12:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_sriov_auto_provisioning: Add
 restore_auto_provisioning tests
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>
References: <20251128114300.669377-1-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20251128114300.669377-1-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0129.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::27) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|PH8PR11MB8257:EE_
X-MS-Office365-Filtering-Correlation-Id: 91c046e8-ee69-4ed8-10c2-08de302b5372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmVxNUJXUVR6QnVZcHhJc3Q5emVRcUFzWDFPd1FjUGRya01kNjRSeWdJZC91?=
 =?utf-8?B?UTA4MXc4NWFrN0ZjNDJmRHRhSE84REwrV1JiYjJlLytXRWRDSFA1UzRxRHAz?=
 =?utf-8?B?NURGVVh5YlQxWkFaSWE4Skwybi8zTzg0NXFyYVlPNDNWT244QVlZYnczTDR6?=
 =?utf-8?B?RlJ3RDZOcEZUVTZ2T2ZIT01GbEFRbWhZcGJRY2pWbmczMXNDb2t2TTJmWk1o?=
 =?utf-8?B?WjZpYytpWWh5a2x1akRCWkRVL2grMkwzZmhxTnNwVEMrQU9tRVh3ZFo4YXhn?=
 =?utf-8?B?ZEVDN3Z2SjdOUEVBNEN6Ly9zOWwyNXBSR0t4ZnAzYk1GUFovVVdaTkN1dVVY?=
 =?utf-8?B?cUVnbzR3d2s0b1ZEaXFvN3U5SXVaNkZOblR0bU1URFBTR0FLWFhKVFd5WTN3?=
 =?utf-8?B?aGc1c1RWTHN1WHh6TUxTNGdleHJiTW9sYVpheWFTZWs3MnVtNVNUSHo4WGwz?=
 =?utf-8?B?d2pwVG5PcnRZM2FRY0NsbzJKbS81RHVCV2NGNDQwUmRCaG5MdmZxUjNsdkRL?=
 =?utf-8?B?aFY1MjR2MmlBYndTODFiTUtiWjJkMnpqUERxUFJLbjE5VkF1dkRtUVF0YTN5?=
 =?utf-8?B?bkd4UzFYcWlYUlVCbGpRMzZtU09TcDN4K0cxV1hhcnNhdUZ1TS9ncjhsZGx2?=
 =?utf-8?B?UUI0aVpENGd1UWdUMEZ0bE40WDBucGt6WWx5Y3JhNTV5YXB1WGVENmVKSjJ5?=
 =?utf-8?B?ZmwrWWpTVnhvc1VhWFdIZkxQMlRvdmc3U3JaSytLUjJiMitDWmQrQU9KOFVh?=
 =?utf-8?B?ellqZHllekoxazRkMEtOc3c2cm9HMExZSVhYZnNBNGx6Mnd0VGFrcDFud2g5?=
 =?utf-8?B?S2xQUk0rRGorUUswbGVyZWNkM0xGaWVSbjljNWhLVStvaVR6K3ZzSVV5a1h0?=
 =?utf-8?B?cDdINjVqbnpucWNtOXhBWDNFaldEUnh4WFhvODltdVNuODB5dFA1WEF2NDg0?=
 =?utf-8?B?M2xsMTJGYTJtZkNMKy9XeWhXM2FxSnRlMmdwYlFsSTFZRy9jVTJvbklVUFIy?=
 =?utf-8?B?SjQ1eXRGUE5HNDliMElCeXNCMzZ1REQxcXl6K04ydHQxTk5PQzcxQnV6dGk0?=
 =?utf-8?B?Yy8vVnRzQ3NrclVyZXRYNUNFR2dsY0JzT281L2FSY001dnlwQ1UxQy9samUv?=
 =?utf-8?B?Uml4SUhlczBBbWlBa2FHWmM0bldoYkJ5M3FiWDRHcVFLNEw1Zjc5RXU4ZGZv?=
 =?utf-8?B?Q1dFRm1wOWU4bGNOQS9JNFhIYXhMajZaSzh2Z09XQVBQcjZMZ2NEY1hoZGtO?=
 =?utf-8?B?OXpaa1VIWEJpS1hRNzVrUVErVnljaXNwYzBvMTNCeFZvcFFsNXo0dCt3djNX?=
 =?utf-8?B?dGRMV2pONU1HcU81Q1RpVDdzUnZ2NFZPWWowSWU1Z0prekVxaFJwbElLTUc1?=
 =?utf-8?B?MWJ0Q2svNUxMUEdZSVB5RjUzSi9DUVBIeHgrODkzeDFUOWVkUW91b29RNU1Q?=
 =?utf-8?B?d0d1RW9Ub1dvRytzcXZ6VkhyZnVtYTFOcVRMckdjYkFwT2xhUE1Dd1NPV20y?=
 =?utf-8?B?VktyL1p5elhKSUVtWmRpd2h5WkNFL0VUWDMyZXJBc1FIZG1zVDRRNEFqRDl6?=
 =?utf-8?B?SzZpWHpuSXl3QjRpR21QVktCSXdreEZzK3JhZngxblBQWW04VWhNNFlyMWlY?=
 =?utf-8?B?WjlRWVZVc0ZvdXkvQ0UwMVR6cENvSnR1SzF6bCt6WW1ielJsbzY3N3E0NTN5?=
 =?utf-8?B?NWMrYkR4b2ZsMExXSzRyT3BGZG0zRFZES0tnd2V6Qi9jazVEQ3JHOVJLL01P?=
 =?utf-8?B?OHNrNUg2SllYeHMwSW4yOUxubGNoN2M5ODdCSzN0M2hIbHNiNXZHWWtTVlZz?=
 =?utf-8?B?VmVYRDdhY0V1YzU0NzRVOXBWTWhZZUJPRStuQjdLbG5zSWgrRk9yN0gvS2dz?=
 =?utf-8?B?anExaWNVLzN4VDU5bDYzZnpRTlhmYXg5NEtJR3FBMkpxdmRWeDYxMzVhTUJi?=
 =?utf-8?Q?XGJJAUB+i2DNkyON6Og87Do6WHFMvLoc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0RmMkdwMGl4WjVEb1BISVZ6ek5ha2ZmSGVrbHUxSVA4cGFxb2Vka0k1UkN0?=
 =?utf-8?B?UjR2eklJR0NUdVVtRXNKa3k2NGxGVElacnM0MGdyd3dyZG5ScWVpNGVJQmdr?=
 =?utf-8?B?OHY1VWRsNzZSVjVkY3BneHI1L3RMM2o3WDZWNmNueXFXZTF3enpIdCt2TDdT?=
 =?utf-8?B?TXZIUGx5bjh5dHR4bnk4MVdRWkFxemVLK3FOYm9Ea3dtSGJZQWQ5UXlxU0Ft?=
 =?utf-8?B?MFRQdmYvb25PM05GWkdiWWpOclVFelAwQmg5alZjQ0dLaTFKQzQxaUU4aHRH?=
 =?utf-8?B?aktoOHVWMC9nazUyYk5aRmhwV1RCZ1RTYncrOXJnSWt2WmhibXVQTFpFdnp1?=
 =?utf-8?B?N3RySjd3a3REb2RZZThyNXVyc0NkL0RyT3MvN2dMSnlvVGpqSSs3K25pVlMr?=
 =?utf-8?B?ZWpSd1RlUzFxKzhVbzRYNEVQZ240c0FSeU5wWXkyS21WV29LbUNqdkdwUExm?=
 =?utf-8?B?cUJ3UHA3SW9GaUpNMmR2eWZtcEJENmZ4VjZRNldRMnVydjhjaVBlU2xwM3RS?=
 =?utf-8?B?NUpsQlQwS0lPc2RBZVBWUnhmRHQrSnJuTUsrYVRlcmhrc0NyQUxKK1pTMVpj?=
 =?utf-8?B?MDB6QVVhRCs0OU9rVmFSb3lEdThKZzBtdGFRQWl1R2FOVHZYUU5MR0dGdHMy?=
 =?utf-8?B?RDFkZzdKVDVjT3JReFM2Nk9nVXlvUGc2TEhab1RBNE16dHdFdnFXbDJGNmJZ?=
 =?utf-8?B?UXlsbC9jelBwVmV1dk1wdE91czdZQlJwRzU3M2luK0pUQmltU043UE8yVGwy?=
 =?utf-8?B?ODBoamxTa0NiZEVJdTJsUXlkNzR4Z1pieTJzVDVtVTBUUXB2eDVPdHFhRUt1?=
 =?utf-8?B?Z2JDQjhLUG5FSFRGZkRJYmhmLzYzQ2pRRnJuR3UzS1dRWkNVRXNQVTI3bEMz?=
 =?utf-8?B?cm1VeDRXaG15Wmx2MTc3NWlqT2ZYdktXdWVXcVhYZ3gzOGtqTm8xaVVKV1g2?=
 =?utf-8?B?Tno1MlZPUWVlU1U1TkJwNmd2OWJIc2R5bXJteGxvVE13bkFDME5sVk5CQUZl?=
 =?utf-8?B?d0xESE9zUnd2Y1U2emxwczhHR0J6M3JPSlk0ZitOcC8vVXNxL3ZvVVJlRVFO?=
 =?utf-8?B?YlphTlNnbW5sMjltdTJUM3h4dlNGVTBQWHc3Y2lIYWFKR1ZqSXNJSmtyWVhC?=
 =?utf-8?B?bHBoblphb2hXVDVBdUptZ1JNK0N5YWk3ZzZNek1uVzBYaUlnUktxNitnVzBr?=
 =?utf-8?B?TzhSRjNlanVvSTBhemthR3FaZ0ZydmhzMWZHSGF1K1NKVDlnTktJNE1GUDhP?=
 =?utf-8?B?N2YzV1FxQ0t6dXdiUzNWaEVWd09HaTE5dk96bGk2UEdOT3hXNHdUQnZncHdR?=
 =?utf-8?B?bFlZUTlPOU9HT25BZ3FUZ0dad0UwQ2FnSjNmaUo5K2QwMHFUNDlUVGVZb3hq?=
 =?utf-8?B?T3cwd1RaU09jU05WMFprcmd1aXJkR05VdTdMQmI5QStkUjdiMTFJeFpqMVRx?=
 =?utf-8?B?TkZ1VndJV2RzZmFxM3VDNUtuQmczb0ZvMDgvL3E3QVo1cDNPemd5Q1NlaVdC?=
 =?utf-8?B?TERXM3NER01EVHNyeVFZVysxMnBCRE5qTVpoN1hjbE1sR25xdXQ4Mnl0ei8x?=
 =?utf-8?B?bHVoSUovanVVcE5vWE5NZWFkOTVsTWdlV2dwQVl3Vyt4dWNZR0Y1Mnpmc3U3?=
 =?utf-8?B?UG1pVS9WOE9IUFdQekd1SVRDYU5GMXFSQUM4NVM5N2lNVm1CV1dVZ1VuaE4z?=
 =?utf-8?B?VGQwaEVqcE5jZDVpeHJNVGZFb3hSZm93YS9ZWUtNVjV6c1ArU2tVT3NQQmp0?=
 =?utf-8?B?dzVjWGI5YWYyWVFzalRqdmd5d1FsRmx3MW5sUjFXTnpxNGdFdVJVZHZzRU9a?=
 =?utf-8?B?SW9hOWZGZEhTQzR4L0pqeU9KS2pQdjhWdjE3RE5jWXJmZjE5a1Fubnl3b3JK?=
 =?utf-8?B?UGg0MVZjak9wZlpHZjdsTE1oTjIyT2Jra1A0c1BGU2RFdDVSZGVySVNKMDJx?=
 =?utf-8?B?Sm9LdzFBNFV6R1FGaW5wMlNudjdBUmhBNGswa1VzOVBDWkU5eVF6NVlpbmYv?=
 =?utf-8?B?L29WcjRRTU1JemZMb2dLelhsTWw1aVJ0YWpHQWd5VW81UmRJV0tJQWs3OUNO?=
 =?utf-8?B?b3R4ZEQvaXlTQjlqTjNqTUViejNiOE5ucGlrN0YrQ3lmOE1SdittSzUrOUxp?=
 =?utf-8?B?MnR3MnhORDJ4VGR2V0d2YmVWcWNSVlFkOWptSnNnSjljRWo0Vk9JSlJRRUxY?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c046e8-ee69-4ed8-10c2-08de302b5372
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2025 16:12:57.7429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AmCpZmSfWHeGbKPTQHUyaz11fgPjWqVKkyjXBi8dxn1kU0ohVUAFFH2KWFN9uI8GoNzepZqO8lbKotq3YLNJ1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8257
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

On 11/28/2025 12:43, Marcin Bernatowicz wrote:
> Add subtests that verify restore_auto_provisioning with:
> - disabled VFs (succeeds; idempotent)
> - enabled VFs in auto mode (no-op)
> - enabled VFs in custom mode (-EBUSY; succeeds after disable)
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

LGTM,
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> ---
> v2: address Lukasz's review comments:
>   - Fix comment style
>   - Add blank line between prerequisites and subtest body
>   - Correct subtest name
>   - Add assertion that dummy_value is applied
> ---
>   tests/intel/xe_sriov_auto_provisioning.c | 142 ++++++++++++++++++++++-
>   1 file changed, 141 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_sriov_auto_provisioning.c b/tests/intel/xe_sriov_auto_provisioning.c
> index 451c3c5ca..e6350bc68 100644
> --- a/tests/intel/xe_sriov_auto_provisioning.c
> +++ b/tests/intel/xe_sriov_auto_provisioning.c
> @@ -290,6 +290,104 @@ static void check_selfconfig(int pf_fd, unsigned int vf_num, unsigned int flags)
>   	igt_fail_on_f(fails, "selfconfig check failed\n");
>   }
>   
> +static bool empty_shared_res_attributes(int pf_fd)
> +{
> +	struct xe_sriov_provisioned_range *ranges = NULL;
> +	enum xe_sriov_shared_res res;
> +	unsigned int gt;
> +	int fails = 0;
> +
> +	xe_for_each_gt(pf_fd, gt)
> +		xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt)
> +			if (xe_sriov_pf_debugfs_read_check_ranges(pf_fd, res, gt, &ranges, 0))
> +				fails++;
> +
> +	return fails == 0;
> +}
> +
> +/**
> + * SUBTEST: restore-auto-provisioning-disabled-vfs
> + * Description: Verify restore auto provisioning when VFs are disabled
> + */
> +static void restore_auto_provisioning_disabled_vfs(int pf_fd)
> +{
> +	igt_require(xe_sriov_pf_debugfs_supports_restore_auto_provisioning(pf_fd));
> +	igt_skip_on(igt_sriov_get_enabled_vfs(pf_fd));
> +
> +	igt_assert_eq(0, xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd));
> +	igt_assert(empty_shared_res_attributes(pf_fd));
> +
> +	/* check second call is noop */
> +	igt_assert_eq(0, xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd));
> +	igt_assert(empty_shared_res_attributes(pf_fd));
> +}
> +
> +/**
> + * SUBTEST: restore-auto-provisioning-enabled-vfs-auto-mode
> + * Description: Verify that restore auto provisioning with VFs enabled in auto mode is noop
> + */
> +static void restore_auto_provisioning_enabled_vfs_auto_mode(int pf_fd, unsigned int num_vfs)
> +{
> +	igt_require(xe_sriov_pf_debugfs_supports_restore_auto_provisioning(pf_fd));
> +	igt_skip_on(igt_sriov_get_enabled_vfs(pf_fd));
> +	igt_require(empty_shared_res_attributes(pf_fd));
> +
> +	/* ensure auto provisioning on */
> +	igt_assert_eq(0, xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd));
> +	igt_assert(empty_shared_res_attributes(pf_fd));
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, num_vfs);
> +
> +	/* ensure noop */
> +	igt_assert_eq(0, xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd));
> +	igt_assert(!empty_shared_res_attributes(pf_fd));
> +	igt_sriov_disable_vfs(pf_fd);
> +	igt_assert(empty_shared_res_attributes(pf_fd));
> +}
> +
> +/**
> + * SUBTEST: restore-auto-provisioning-enabled-vfs-custom-mode
> + * Description: Verify that restore auto provisioning with VFs enabled in custom mode is rejected
> + *		and auto provisioning restored after VFs disabled
> + */
> +static void restore_auto_provisioning_enabled_vfs_custom_mode(int pf_fd, unsigned int num_vfs)
> +{
> +	enum xe_sriov_shared_res res;
> +	unsigned int gt;
> +	uint64_t dummy_value = 10;
> +	uint64_t expected[num_vfs + 1];
> +
> +	igt_require(xe_sriov_pf_debugfs_supports_restore_auto_provisioning(pf_fd));
> +	igt_skip_on(igt_sriov_get_enabled_vfs(pf_fd));
> +	igt_require(empty_shared_res_attributes(pf_fd));
> +
> +	/* ensure auto provisioning on */
> +	igt_assert_eq(0, xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd));
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +
> +	xe_for_each_gt(pf_fd, gt) {
> +		xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
> +			for (unsigned int vf = 1; vf <= num_vfs; vf++) {
> +				xe_sriov_pf_set_shared_res_attr(pf_fd, res, vf, gt, dummy_value);
> +				expected[vf] = xe_sriov_pf_get_shared_res_attr(pf_fd, res, vf, gt);
> +				igt_assert_lte(dummy_value, expected[vf]);
> +			}
> +
> +			igt_sriov_enable_vfs(pf_fd, num_vfs);
> +			igt_assert_eq(xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd),
> +				      -EBUSY);
> +
> +			for (unsigned int vf = 1; vf <= num_vfs; vf++)
> +				igt_assert_eq(expected[vf],
> +					      xe_sriov_pf_get_shared_res_attr(pf_fd, res, vf, gt));
> +
> +			igt_sriov_disable_vfs(pf_fd);
> +			igt_assert_eq(0, xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd));
> +			igt_assert(empty_shared_res_attributes(pf_fd));
> +		}
> +	}
> +}
> +
>   static bool extended_scope;
>   
>   static int opts_handler(int opt, int opt_index, void *data)
> @@ -432,10 +530,52 @@ igt_main_args("", long_opts, help_str, opts_handler, NULL)
>   		}
>   	}
>   
> +	igt_describe("Verify restore-auto-provisioning when VFs are disabled");
> +	igt_subtest("restore-auto-provisioning-disabled-vfs") {
> +		restore_auto_provisioning_disabled_vfs(pf_fd);
> +	}
> +
> +	igt_describe("Verify that restore auto provisioning with VFs enabled in auto mode is noop");
> +	igt_subtest_with_dynamic("restore-auto-provisioning-enabled-vfs-auto-mode") {
> +		if (extended_scope)
> +			for_each_sriov_num_vfs(pf_fd, num_vfs)
> +				igt_dynamic_f("numvfs-%d", num_vfs)
> +					restore_auto_provisioning_enabled_vfs_auto_mode(pf_fd,
> +											num_vfs);
> +
> +		for_random_sriov_num_vfs(pf_fd, num_vfs) {
> +			igt_dynamic_f("numvfs-random") {
> +				igt_debug("numvfs=%u\n", num_vfs);
> +				restore_auto_provisioning_enabled_vfs_auto_mode(pf_fd,
> +										num_vfs);
> +			}
> +		}
> +	}
> +
> +	igt_describe("Verify restore-auto-provisioning with VFs enabled in custom mode");
> +	igt_subtest_with_dynamic("restore-auto-provisioning-enabled-vfs-custom-mode") {
> +		if (extended_scope)
> +			for_each_sriov_num_vfs(pf_fd, num_vfs)
> +				igt_dynamic_f("numvfs-%d", num_vfs)
> +					restore_auto_provisioning_enabled_vfs_custom_mode(pf_fd,
> +											  num_vfs);
> +
> +		for_random_sriov_num_vfs(pf_fd, num_vfs) {
> +			igt_dynamic_f("numvfs-random") {
> +				igt_debug("numvfs=%u\n", num_vfs);
> +				restore_auto_provisioning_enabled_vfs_custom_mode(pf_fd,
> +										  num_vfs);
> +			}
> +		}
> +	}
> +
>   	igt_fixture {
>   		igt_sriov_disable_vfs(pf_fd);
>   		/* abort to avoid execution of next tests with enabled VFs */
> -		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)");
> +		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)\n");
> +		if (xe_sriov_pf_debugfs_supports_restore_auto_provisioning(pf_fd))
> +			igt_abort_on_f(xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd),
> +				       "Failed to restore auto provisioning\n");
>   		autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
>   			    igt_sriov_disable_driver_autoprobe(pf_fd);
>   		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
