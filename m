Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B12C3ABD8
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 22:42:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD8C10E047;
	Wed, 14 May 2025 22:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C6FGREru";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E6110E047
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 22:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747262533; x=1778798533;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=G/IUDHZ+YCrfpJeBB1UPS3HiYs+U4p8cDEBDZgSm2tE=;
 b=C6FGREruR1s8r4HdbZ7hwnPO3EyJ+Ti6YgkarMxGfIQ5YxkVZ7WfEvS8
 46iw7LXbx7qtr9f0pvqL+RFVk/PyHrFyCBKU9UxJqEJnXBbYoFbiMlx0B
 2gfXNTS26fcqmcX+SLzA4ROZO30oZhR9ByWJ6M5H3uXDeRefKsiB/OHMv
 0ejulKRU036PyfBGAsqHww82qzyX8c3yl4dr/lLyHL2AVjrQSFya5puKq
 ISkdwKmxvzHGJ6ZmzR3EN4ZpC5NjQsI+w9H8aNQrdCjnjsJRYOQ+aIiv4
 tTc9tYUi1HZP9u8pTWxcRDbZs+ci3qdqitVbTbvD06A4XEPkZOPfX6EEv g==;
X-CSE-ConnectionGUID: O1KRzZY/QLS4lrYPu83Qag==
X-CSE-MsgGUID: 6JK8aqfZSMegmdxNWTSCqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49298591"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="49298591"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 15:42:12 -0700
X-CSE-ConnectionGUID: vh4seazjT4mReuYNcGLAow==
X-CSE-MsgGUID: r/OJdGq1Q/i2pyZBl0F3KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="138231669"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 15:42:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 15:42:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 15:42:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 15:42:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRt5/Jyqn96ca6pXyqeQvyCGwKNGy6UkP6Brrg601qeGQmWqB1X7ON27hd3qEha/PiAddnbMnPzs6uE09LSaeVc4G4vx4i9VzpLbq3RNQ1ziNkPivXFIF9tljZM1FwFqOma7e8lJv8j7o67c9Z+Fq0XKdlXtlqVqFn/12R/jqrse+8L4GtE3XZbXCPkI4mCxYNikEbf+hlJ6V42Hp127hvzlgBAkfQqNq9tlxKavlSoj4qS34/HVwILNvrM2IjkEzwSeHjB5x3hih1HlTsom9ZltidvheLXCeGcTo8AB2f53MroofOXxC+l/5Fr5DMWwZQa8kN+2OCVygU0a2YgnDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AvZQ8SAbpKolGTf6pCpIh/ca2lIuK7giLwJZU0w51mo=;
 b=g91yRwUk3/BPileTQXXc5p5pd2bhOjzs/9b8x707FORXSDvwMS3c/744GlGE6ywy4I5v2u38m3ipIRibeU852XMmr1A+xeX+Pa95K8MI8XFvri1ZpAhFzIdvgDuA49N7HaV8n6Jr5lCK9Mw3riNMOyfxUGsJYIJT7kru/A5/G7yJiPMhC40O5xuHj1QMhwb6VbMTJCD1RB1jDQCVLVNC/oRv4daguPlKsanGwoYQ1R3WFZzyNJBJPr6ZWOCrRdQMUsOyxXsaCKbFHkElp7AROKCx8QM1KEWq96oNHAKZqmpKZYlWra10JQbxIhuMvb/ZMNhHAXzw673eThPGReEj2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7401.namprd11.prod.outlook.com (2603:10b6:208:433::18)
 by LV2PR11MB6071.namprd11.prod.outlook.com (2603:10b6:408:178::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 22:42:09 +0000
Received: from IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::beca:81e2:677:2958]) by IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::beca:81e2:677:2958%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 22:42:09 +0000
Date: Wed, 14 May 2025 15:42:06 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v3 4/5] tests/intel/xe_pmu: Add tests to validate
 engine activity on all engines
Message-ID: <aCUcPgBZJI63fS2O@unerlige-desk.amr.corp.intel.com>
References: <20250512070551.774270-1-riana.tauro@intel.com>
 <20250512070551.774270-5-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250512070551.774270-5-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR13CA0152.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::7) To IA0PR11MB7401.namprd11.prod.outlook.com
 (2603:10b6:208:433::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7401:EE_|LV2PR11MB6071:EE_
X-MS-Office365-Filtering-Correlation-Id: 50baa4b8-6016-4b8c-3f69-08dd93388f68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDd1RXR0c2lkVE14L0hobkczL0ovSXl1YjNnTlZ5UDNzSVZqQkdqaE12ak4w?=
 =?utf-8?B?RmxrRkNqbXNiU2RmWTZCeCswYkdkS3R1cFVGaXYxVTRMOE1CQ000emdxdkJk?=
 =?utf-8?B?VFVibXNkZC9jWTZMdVhiWm9CSVdBN0cvNHo2VVgzWjhIb0krUUJsODhoampn?=
 =?utf-8?B?OS9Wb1o1dlFmTnpvR09GaFRtNW9DKzQ5ODlUaW9MMFRINlV0UTQ4VUx3YTRX?=
 =?utf-8?B?ZzBZeCt5ZW5MYnV3Z2RGMnlXM2hKSmpnWlRyaWZKbCtpbmtad2szVGNtdDlt?=
 =?utf-8?B?RzZHK0t3M1hlMW1RRXZWVS9nN256enhFU3JkVWkvQXdrWEVIcDE1S0VkMjZH?=
 =?utf-8?B?Ui91MThNa1NINGEwdkRTdEIwMzlWYkdhNW9ZQ1RaSFpnbk5PUW40UzFVVzdj?=
 =?utf-8?B?UVJGZllFTzYyWlowWmd0WkxhcnErSmVBWFVieFM5eGtzcjY4b09oZVp4SHYx?=
 =?utf-8?B?UkcweEVuUG14ajlQL3ZYdjdXNnhUVzIyb2RiWlNqRkh2cExTUkgzT21TaFJw?=
 =?utf-8?B?QTVHelgvMjh3K2U4TlhFbzhMV0JNZmNsWFI4OVptRXVQOVFNVHRBMGo2YVFq?=
 =?utf-8?B?WWZ6cU84YWFOS1FCYS9OejVXcUhCT1dtYWc2RSt4eGRrUGVldGpONlJVOXQy?=
 =?utf-8?B?Sk8ySlRvZ3Z3V2N6OXE2WTIvRzNvVXpYQUdyVU9NNk5qOE5SMHFKdmloV2Rt?=
 =?utf-8?B?NFlpNDYrVUJKaFlxZStZaThoWC9kVmpQMHpTVDNjRjJDSE54V2NMbEk3ZXFi?=
 =?utf-8?B?SmdiUGJic0Vva3BKNEpxS0t3YXVYWlNkZGxFcHdxdEk0KzlaS1FzbU5zNDAz?=
 =?utf-8?B?a0V6S0tXaTBrWW1QNFlXdjRKR3FpTTEvR1E5RTRVc0Y1MXFYcWVERHVNQzFs?=
 =?utf-8?B?bU9PMGY4OVNadVVSOVR2eFVIL24xanIzUkZrWFhSdWVabDlNUXpVU0NLZ004?=
 =?utf-8?B?WnBQVHk0ZnVIQTQ1L2ZoZENleXA1Y3VlanptenJDY2V4bVNzR2hiZzFQdStG?=
 =?utf-8?B?OGFmUVQ1aUM3RzZGU2Q3RFlWYms1WTJuR0NRWU5kRTdSM3BOSUd4ZmpmMmQx?=
 =?utf-8?B?NGQyZXliTUhBRTFpVlVuYUlIWWFvM2ZFaHhrT2Q4aUw2QzIyZ0dieTE1VUhr?=
 =?utf-8?B?QWpjWjJaYjF6cU5uVHRCeFpPa2gvMjFtdk1GSDBHQldVa2tYYVdCYThnOWdS?=
 =?utf-8?B?QkVBTm1hVHZsMmttdnJyRGRoUm90TEFubTd6U1ZjMzlmY1p3U25ncnJLV1hC?=
 =?utf-8?B?bFRLbTczRmVWNUgxRDhaLzRPQ0lwNW9OOXdKNG5QcjY2NkhZY0gwWVZrZ0JB?=
 =?utf-8?B?SzZESGhGV2xHV1FGRkxlSU1wRFNEQ2VyamdTSGhmZjZZaGppWHluc3Ftd21X?=
 =?utf-8?B?S3N1ZEY0d2kwam4wdmk1cVZSeVNKcDBRN3VwL25taUpuVVQ4a1dQMEY0bnE3?=
 =?utf-8?B?VkxzeFl5cCsySm9SdnBSUm1aSXgyOHFrWmtzajlkdjZicUVIbG02Tzg1aDdG?=
 =?utf-8?B?dDgraG4ydkx4U2hqaHYvVmNrWTVwSTJsYXlHaGR2b2NxUE93cHozZU9tWnVH?=
 =?utf-8?B?SHh1OFpkYlk2dXRqV25CcnhqMnNHYmd3Tm95MlBaempvNVRXYVJEMVBkUDZm?=
 =?utf-8?B?U1JzVHlpZU1MUThDOGFxeS82VUJobFVBeXppOERHSkR5ZVNhUENMeU1tdXU1?=
 =?utf-8?B?ZmpYNng2WkJoMkdPYUxvMmYxVE1OcFlXQjRtQWhhdDZaK1lGeG9OK2lqTGti?=
 =?utf-8?B?bVVsZFpzcjRDSmRJdzI1L2tKbWhreDlIbzU5TStuZmVDWVJQNGdVaC9FSUNP?=
 =?utf-8?B?bkloOURSUFdPUTJrVXY3L1hKMGZ1VXQxbXlpTmRzS1ZHNjI3TURoSUZjRkFi?=
 =?utf-8?B?dmQ1aTEvbGpWNkFiRTlCM1JaQ01LUDVFWFh4Ymg0aHdYcEp5T3FEWlJmM0p3?=
 =?utf-8?Q?vuy4Seb5mnE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7401.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3B6Y2tsNWZhaGYwMkxmQlBNeXBNa1ByV2U0cUxraVFXeHV2L0NkRVJEdFhU?=
 =?utf-8?B?eUFuOS93V0FCRnl5WFQ4bjB0ZjE4WWI4c053eHh5c3ZVRHhXbmRmK0cxdXR6?=
 =?utf-8?B?TXFpSzBCdUJjbXFucExDZWlEN2M1Q0hVdy9jaGg1SkZDRFhyWDdwYUZLNU9Y?=
 =?utf-8?B?MjdqcTJ1ZHgzVENoZ3BzNlhRcUsvKzZLZnhMYUNnMU5yaDRuWlI3cFNjOGd1?=
 =?utf-8?B?RkYydjg5enNwRU5BajhRTzJWWkpaTlRYRmhKN0VuQTJmQUd6Qkl1SzhEbkMy?=
 =?utf-8?B?STdIV0daNjZSVFoxWjZramY1MjVGeXRSc2UwV1lPRzQrNksydnBSZGZ2bUh4?=
 =?utf-8?B?OG9QQ0RFenV2T2c5TFNocmpNNjBzeVFzMEtFRVA3SVZjV0swaTlmN0lVMjNB?=
 =?utf-8?B?M0VJVk5uMTlaUjZWbWpVcGNaSFlzTVdzdDVwRWIxdG9QTWlQRFF1bDR0TlBL?=
 =?utf-8?B?MWRQTnVFTUxQNlVBamZVSkVwVEh1YXVXRUI1MWpsczc2aWtlWlE0enNvei9t?=
 =?utf-8?B?ZSt0M3NybGovVHNCM1ZrU1daZ01TYXdxb3EyM1lYdVFaQWtxYzcxV25KUTVR?=
 =?utf-8?B?MXh6bUhSOEdseTNXVGZGenczSXRqWStoTlVhb1AxWmI2Z05uYUY2MHU3cDJo?=
 =?utf-8?B?OU8xRGZoN1psQ2t0ZU5lZTk5VUlSN1VlaGdFdW5hYW1IU1ozTWxWSDRGQUIr?=
 =?utf-8?B?UExnREVwVEtSRnhPMmU2cTRPNDZUdzdRcUNVeWx1TTkvSDgxMmRPek8wVStC?=
 =?utf-8?B?cTl1ZmhTNGdPUUJWWnRGZkdmV3E5V1hzdFVIUFdRbEtZVWJ0ekI2NCt0VlRr?=
 =?utf-8?B?QmJWdGIxenlaVE9ReUk2ZjZHK3BIZ3lnTUlKSTBVMmsycktkc28wT3d5OUg0?=
 =?utf-8?B?ZFMrREl3eTBYUGUrejhjTHFFV3pxUjlQbzR4YlpMM3FvTkU5KzUrT0JZcW1Y?=
 =?utf-8?B?TEt6QmFNUExHYkdPbkY1QWhTa2tjZDNzL2k1VysyYjhUaTE1OTZ5RGxKMTVV?=
 =?utf-8?B?Zmt5d1ZWdzMzZ1FmZ01Hd05qVENjb1RxN0NoNXBDblU3a1k2SjdFeW9VWFpK?=
 =?utf-8?B?ZmdzYmxNMVBWVUFwMmRoeks1YTFWSU1YNlB4aW1iQVRFYlkzZkM5Z3RiKy9R?=
 =?utf-8?B?bFpUM041b08xL2lmOVI2RWUzSnExU1p3MUpnYXFNa2w4VXlVcDN5c1NIbTNu?=
 =?utf-8?B?eXBKbm5QeURncmZGa1hxeUN4T0huTXgybjFlaEVGTS9vR3k3L0N1emluTkF2?=
 =?utf-8?B?WXVLZFFOK25pSE42Ukl5VkFsTTVEKzNOL2VqNUtsb2lnSGgwZytQSTZ5ZFlI?=
 =?utf-8?B?dDBVRFczc3lMcVNtaUtGbE5xeEZVZmYwdE04SzF4TUlCbjI5eG1aWHRyNWVs?=
 =?utf-8?B?TnM1ak9sS25CZTE1OHF6dDZ2YzlTeTZMeGhsbmtadWtFNERjOHV6azQzQzZG?=
 =?utf-8?B?OVZudm55OWJxNmZpUkdMUW54c0tQR01aSzRCZ1pNenV4V00xaEt4QXFMV0xH?=
 =?utf-8?B?aU1MOHRUNU9BOURvREpHTHRZRVFQZitHaGlPNjkzSEhZT2IwUmFVM0dtOFhx?=
 =?utf-8?B?bndidVQzQUJTTFE1VDdzMzVDZWp4MFpIZWw4L0pzYjFTTVVNWHBQcWpHT2E3?=
 =?utf-8?B?eGNIcnZmd3dyOUZxc2dTck43UEdTMk80MERKM1d6UVU0SU1XdG1zdDR1akh2?=
 =?utf-8?B?RkZVbnh1MUNMZWFjWE4vNVIwN2s0VHcwUXM5dWozWGNSeC9ZanJSK1Ixb2Jw?=
 =?utf-8?B?Vk5IajZ5R00wQlJyaktPVEs5Zk1SdUNBWkwvVExKU0FMakhWZWFiZXVCZzZ3?=
 =?utf-8?B?dVJuUmxKazBhNzZxazk5SUFWUkRyVE9aaUdmejZxRGc1ZURnOEQ3OENIZDhP?=
 =?utf-8?B?emJBR3dzdVhkZi9pa05MWnAwV2dIM0dlN09RZThyZndnQVUyektlM2l4QWJH?=
 =?utf-8?B?RDdFeXdnMmRERmIrMVZpelQ2M2RGU2FVcnhtWE9SbDlhS0ZvamJvNlA2RkxF?=
 =?utf-8?B?S3JWU2JhNDlLRWdiSEduNE16TjBmYWdTNWhzUGNYaElnblNhaUJjZi8xY05L?=
 =?utf-8?B?dk9icitQTFVMdlhiT2RoUFV1Rlduc3VQN3JLUnFKS1pxSlYxcUxjVlYyeGRo?=
 =?utf-8?B?bUI5cTUxbHlmaGhKMERSNHVpTlVJdmpXL0lmc0E3cmJHMjZZblpUN3YyRVVZ?=
 =?utf-8?Q?4jkciyg1PfWWCPhz2kjdwDs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50baa4b8-6016-4b8c-3f69-08dd93388f68
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7401.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 22:42:09.1431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZZVFX9k1M+M0oico0jqIXFNv9rGP4p27WV2q6R/1KlaskJqYckFra8hdrgbVv2Cw8JZop2UzAC7pgu0yau9XCrzgqMO4CxIbJdFRMfZxpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6071
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

On Mon, May 12, 2025 at 12:35:50PM +0530, Riana Tauro wrote:
>Add tests to validate engine activity by running workload on
>all engines simultaneously.
>
>Also add trailing idle test.
>
>v2: use allocator
>v3: use flag per engine (Umesh)
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> tests/intel/xe_pmu.c | 68 ++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 68 insertions(+)
>
>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>index cd56fcd54..1a9b015d9 100644
>--- a/tests/intel/xe_pmu.c
>+++ b/tests/intel/xe_pmu.c
>@@ -32,6 +32,14 @@
>  * Description: Test to validate engine activity by running workload and trailing idle on one engine
>  *		and check if all other engines are idle
>  *
>+ * SUBTEST: engine-activity-all-load
>+ * Description: Test to validate engine activity by running workload on all engines
>+ *		simultaneously
>+ *
>+ * SUBTEST: engine-activity-all-load-idle
>+ * Description: Test to validate engine activity by running workload on all engines
>+ *		simultaneously and trailing idle
>+ *
>  * SUBTEST: all-fn-engine-activity-load
>  * Description: Test to validate engine activity by running load on all functions simultaneously
>  *
>@@ -307,6 +315,58 @@ static void engine_activity_load_single(int fd, int num_engines,
> 	check_all_engines(num_engines, flag, before, after);
> }
>
>+static void engine_activity_load_all(int fd, int num_engines, unsigned int flags)
>+{
>+	uint64_t ahnd, config, before[2 * num_engines], after[2 * num_engines];
>+	struct drm_xe_engine_class_instance *eci;
>+	struct xe_cork *cork[num_engines];

struct xe_cork *cork[num_engines] = { NULL };

relates to below comment.

>+	int idx = 0, engine_idx = 0;
>+	int pmu_fd[2 * num_engines], flag[num_engines];
>+	uint32_t vm;
>+
>+	pmu_fd[0] = -1;
>+	vm = xe_vm_create(fd, 0, 0);
>+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>+
>+	xe_for_each_engine(fd, eci) {
>+		engine_idx = idx >> 1;
>+		flag[engine_idx] = TEST_LOAD;
>+
>+		config = get_event_config(eci->gt_id, eci, "engine-active-ticks");
>+		pmu_fd[idx++] = open_group(fd, config, pmu_fd[0]);
>+
>+		config = get_event_config(eci->gt_id, eci, "engine-total-ticks");
>+		pmu_fd[idx++] = open_group(fd, config, pmu_fd[0]);
>+
>+		if (flags & TEST_LOAD) {
>+			cork[engine_idx] = xe_cork_create_opts(fd, eci, vm, 1, 1, .ahnd = ahnd);
>+			xe_cork_sync_start(fd, cork[engine_idx]);
>+		}
>+	}
>+
>+	pmu_read_multi(pmu_fd[0], 2 * num_engines, before);
>+	usleep(SLEEP_DURATION * USEC_PER_SEC);
>+	if (flags & TEST_TRAILING_IDLE) {
>+		for (idx = 0; idx < num_engines; idx++)
>+			end_cork(fd, cork[idx]);
>+	}
>+	pmu_read_multi(pmu_fd[0], 2 * num_engines, after);
>+
>+	for (idx = 0; idx < num_engines * 2; idx += 2) {
>+		engine_idx = idx >> 1;
>+		if (flags & TEST_LOAD)

If you initialize the cork array to NULL, you can drop the if here.

With or without, LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh

>+			end_cork(fd, cork[engine_idx]);
>+		xe_cork_destroy(fd, cork[engine_idx]);
>+		close(pmu_fd[idx]);
>+		close(pmu_fd[idx + 1]);
>+	}
>+
>+	xe_vm_destroy(fd, vm);
>+	put_ahnd(ahnd);
>+
>+	check_all_engines(num_engines, flag, before, after);
>+}
>+
> static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *eci, int num_fns)
> {
> 	uint64_t config, engine_active_ticks, engine_total_ticks;
>@@ -674,6 +734,14 @@ igt_main
> 	test_each_engine("engine-activity-single-load-idle", fd, eci)
> 		engine_activity_load_single(fd, num_engines, eci, TEST_LOAD | TEST_TRAILING_IDLE);
>
>+	igt_describe("Validate engine activity by loading all engines simultaenously");
>+	igt_subtest("engine-activity-all-load")
>+		engine_activity_load_all(fd, num_engines, TEST_LOAD);
>+
>+	igt_describe("Validate engine activity by loading all engines simultaenously and trailing idle");
>+	igt_subtest("engine-activity-all-load-idle")
>+		engine_activity_load_all(fd, num_engines, TEST_LOAD | TEST_TRAILING_IDLE);
>+
> 	igt_subtest_group {
> 		unsigned int num_fns;
>
>-- 
>2.47.1
>
