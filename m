Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FEBD3CCBB
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 07:48:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2B910E6C5;
	Thu, 15 Jan 2026 07:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fA29CeVB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A5810E6C5
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 07:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768463289; x=1799999289;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QJAZn7d2MZWuxbhhJj1ai2q5CbpfRWEo9UUwKowRvn0=;
 b=fA29CeVBu7t0dBYzAzU24H5BWPHRupa4eDEH6XZM03hUZR4DtBo2KIHL
 4A6mw6E16dc99QrsJzTTDutZN+LzwmIT/6Sk4weP+FvnH08QjWy1lD/D4
 AItjA7oggDNC7Vzou2v5IK2G8ST79YJ8DXwPNLQDlw5ePy9RiK08cHcwA
 sXOsORLnAd2cXGKtlWdNtK3FpUdEHR1TiwV8PdGw+mDH6h//3EN60p1Rd
 QVxcwKmN+YjK4l8sZ+IqCUul4GgO5qgFjOKRjPj6FhSCEundbYraDjkPJ
 VsJihFdrXHpCQiectWf0jIrcKIUKTHcBRZ50oFjmrmpGEAjyFokABSP12 w==;
X-CSE-ConnectionGUID: +Hbe8oIhRHKwL/gSEaEXXA==
X-CSE-MsgGUID: ckXlOb2CT6Ciyq83AMMD3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="57321019"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="57321019"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 23:48:09 -0800
X-CSE-ConnectionGUID: kwX+4snRRtaAHDYlRI3Xrg==
X-CSE-MsgGUID: qdNwNTu1QJKCSE5Nde0i+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="205174226"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 23:48:09 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 23:48:07 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 23:48:07 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 23:48:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=puGF6I66kHvzdMd7giMmweefGJhQZy0pKlfdCnEbRoVvNaZn4FPCca2uMIHggAikNCB4Iq4KqLvnH4lPAVFMtEkVIJ7gEgWe9erFBFbIwnHAbe1S0Ly/PjOprx1LkZfMyt9HhLquMZNh4kDuvbpxA9eKaOdon3o1wb4NwnkJeXheJKOStqhCN9+X5a2HYh11H16jAjwfmeaSt9X3CMrf/gus0eHRLVyp1aLE1W/704I96in225PKUrO/qTrdmRsNDk0kt2tXytHvWdXMrziydsSIvUxnvhbqMxQNs0/Zs0KnZCJUPl9NDXqVWlEUsyvPuZM4b3dbbMYrjwA/1tzMvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VrRVRsdvPk0jNb8EUcz18rskfPhyTnGwqrj/dpV984=;
 b=YLhWAB55sEwDVob1hEGXw0jaFUXskXXGZJqZ5/FN+C6bspM4JDpuxlhu9yxNIReW8KWhTnMXiHGEMqks3Wl9mnYOA2d7zb9ixMt1UnU5EYwakoeJjfmsodjM0OZvxaOJbBjb1BrrJJxAwKLVCNcNEEhAb5jTKx3t4GFbstdO+52Q/GwfZeY1WA4v/oz3D2H2extA5LOswL5xx2CQ4p+7WKmeMcOKst27lF1sG/myorTdfsj7yNmWiF5+2YiR3iclX769htkQFt1REvCGRZwsjTHMNxj1QRpqodqA17MweSoQxaohQ2/UcaXJZ2BQCXOHNJTUNZZtH24UKHUj+z2ppA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by DM6PR11MB4513.namprd11.prod.outlook.com (2603:10b6:5:2a2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 07:48:06 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9520.003; Thu, 15 Jan 2026
 07:48:05 +0000
Message-ID: <48007721-3524-4b68-9533-4ef83d56d4f7@intel.com>
Date: Thu, 15 Jan 2026 08:48:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 03/10] lib/xe/xe_sriov_provisioning: Add string
 conversion helpers for scheduling priority
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>,
 <michal.wajdeczko@intel.com>
References: <20251125102312.43142-1-marcin.bernatowicz@linux.intel.com>
 <20251125102312.43142-4-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20251125102312.43142-4-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0162.eurprd09.prod.outlook.com
 (2603:10a6:800:120::16) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|DM6PR11MB4513:EE_
X-MS-Office365-Filtering-Correlation-Id: ab303b90-66b9-4e95-cf59-08de540a6b0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXYweTVldWMzSDZTcG1Zdmo0Q1huSEdvaXVOSHFQdGRja0pYdi9Kb2pMd0JZ?=
 =?utf-8?B?MVgzMk1ETnRKQlVkNTdHWUlTUEk5UjhtbGJLKzZERFhXbnhCK2dxOWdRb0Fa?=
 =?utf-8?B?VnBQUWVqVjVvZk8xYUpWTTJ0OWtsWmIyRXZwTWY5ZkIwM25ndXpMTFNDcU9J?=
 =?utf-8?B?UGxGM0IxaVJNeFMzRU5QdlY1YTVyS3NHc3JySllSdWVtRmhFbjNwdUFUN200?=
 =?utf-8?B?WkR1R0t1UDREWkcxcFlzZCtLK3BTSUFVb3dIMGU5UEl6V0hFU09YYTJFT2ta?=
 =?utf-8?B?U2EyMGRoV05yN2o4QTArRjN2TUlFT01TV2tMQSswekp0YmtOWlNPRTd5S21n?=
 =?utf-8?B?cFRwWnpNZ2IxalhLRWw3cjhqY2NqRG85Rm1hdGV4eDY0Q0E3c0RPaHRKYzJ5?=
 =?utf-8?B?TnIyczhkTDNYNlVWVHpVVVlsQ2ZxOHJ5M25VSU1CSDZwb3BZY1ZSNEh6bTJS?=
 =?utf-8?B?bE9ZOGlpY0plSlhNcHdNVDU1dTRKMFg1dklhNTJPL0QyaUxhZkIwSEY3Wi9B?=
 =?utf-8?B?UUpqTVczMGwrazNuQXYzaXNpNkZhclFkLzhkWisyTnBlUmNJUU8rbjVhSk55?=
 =?utf-8?B?dkMwejZVMTB1SkxBeGZNNlFlZW9lcFJ1UHlMaFo5clRVa1c2c3Fydis2Ujdr?=
 =?utf-8?B?QitqbmtEYWtFbmhOSmVWUGVMcWtOWlhYRTAyNUxXekwzRVEzU0c3QVVacEtP?=
 =?utf-8?B?UEx4bGw3V0VHUjhwR05lOVdWbmZ1eDNqdm4velpiVUR2WFNuYVlZUW5uWWo3?=
 =?utf-8?B?WDV3UEk5b1BiaFkyV3dMeFVKRjdYUmpIRnNyNi9jank0RW10eTVyTmlWU0ll?=
 =?utf-8?B?bko2b2U5SVc3SW9OanRsL0d0a3Y0N0FrNGgrZ1dtazF1dS82TU55djIxSjI5?=
 =?utf-8?B?NzFaMVY4ZjZka29pUzdSRXhlZlRKOXdHdndwd0Z4TDR1UlFTWCtxb1JFWUQ1?=
 =?utf-8?B?NTZpakdBdkNZenVkSzlxWGFXQ3VWZldvNG5jNTVNZWdGamJPamZ5REJvRldK?=
 =?utf-8?B?M0xod1NHQlVGdnp1dW4rSHhvY2hVS1RaRUM1M2JkRFhRTWs5UUN2blA5c3hK?=
 =?utf-8?B?bGJySml5SkszajhDV1BjNU0vWFdaY1UwRk8zRGxMQWlieGhjMVZEUDlJQk9L?=
 =?utf-8?B?WTlUTDhNaC95WFpFck9rQWtkNlNhKzJZWVpzNXlMRE92Nkk4Z0Z1OG9NVVRV?=
 =?utf-8?B?UmtscmxNalhmaDJTNEV6SHRxcFREYnAydTBGOHl6U1c5QitPdy96NEFJVjYr?=
 =?utf-8?B?aFZIRnJTWlJGSCtyeElESlJrOVRVTzExZ2RTNVhySUQwSk9oSXY0N0hySVRh?=
 =?utf-8?B?QVdzeVFmc0tCYzM2bUtTNnpNeUV6UzdBUTVXb3laL25YQTJjOVZjQ3cwOHJQ?=
 =?utf-8?B?anRNVG4zSExqaVlsWENNTlRPVlY2eWZXbUZXZm5jTXdMZmM3U1ZrbEZjN2p4?=
 =?utf-8?B?azNTaGFQTEZoSWd0VnFRYjZPUUR6bWFYeVhjRkprYUozdFVnMjNINFlUVmI4?=
 =?utf-8?B?S25ZV3Y3QnJlVjJTRGNJbG1RUCsvVW1OT1o1S09KUWw3aStobC9qdlVVS1ZS?=
 =?utf-8?B?L0JGMDZCQXdEelRCZE4xK2dEaHBubjFSUXdLWWNEM2JQVWRPV3RIRWkrMDhq?=
 =?utf-8?B?SlRsNmpSTjBsSm9GZXA0d1ZueVRhUHFUM3NqRzJCMWREOWJtNEFuRURPRDZk?=
 =?utf-8?B?Rm9XOGFkQlNzL1M3ZTNzS21IYiszRmtZY21SRUNYeEhkbTdVWmgycytQYXhC?=
 =?utf-8?B?SS8rRlduT2RGT2RMeDN3dEdCSW9lZVN4NTc2T09Zc3JuM2Y5bUxVZ0ZyWHhT?=
 =?utf-8?B?cm9ISWhHWTFZVVQzR1ovbnhQTDdlaE5qc0pHZTNOL3cvZkRVTU45UmJvYTBJ?=
 =?utf-8?B?c3NaZWxZY2hzcHU3T3ZzbU1qa3pXQXR4ZU1TdkJRbWVCbEdIMVE0OURNcjVU?=
 =?utf-8?B?T0UzeHUrWWs0eEpOK0M0NmVPNzhNRjRYeTNNcjU5aE1LNlNPWVZsQlBmcWxr?=
 =?utf-8?B?UFF4ZnVUNUlhc0NQTktzeUVPUm91YkVMRi9GUW9aNTY0ZVFndzJJTjd3Ykhs?=
 =?utf-8?B?ZWRtVzNTbU1WOVZtWS9xRGh4dDlVYzdNdkIzQWtpM0xZVjRad3B1clNLZXEv?=
 =?utf-8?Q?RISQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjR6eUJKMlcxMTNUQkZrZktqMkhEcDhNUVo5c0drNjIzcU8ySWc4RlB4dGZV?=
 =?utf-8?B?bE5mNklNK21WY3Bwa1NKallpQTBFNWgwa2ZTYjlYUlhFUWQ1OXV2RHhwdmxE?=
 =?utf-8?B?N2psNitlS1kwYWpPRUlEMzJWY0w4L1lyUjNQUHJzcS8rcHZLS1N4dkdrYWZ3?=
 =?utf-8?B?NERITm1JaC9sTFpHMEZXMnhUbnRBUDJQd0tJRFBleFV3dFc1cWFLUjVPUnY1?=
 =?utf-8?B?WG1pd1ZmT2NlU2ZvQlBlOHYyekFEZEc2RUlIbG5pdzloWlNFMkhUeGhFYTFY?=
 =?utf-8?B?QmVsNjVEYW9ZNTNDdnRIWE5tdTViang4eWdLS3laeXpUMlJlY0pKaER3ZTE1?=
 =?utf-8?B?SzNFL3UyajlUS1BqWmhOVnJMYTA4T0QyMEk5dUxVR3hENDZIK0YxYlBGNXBP?=
 =?utf-8?B?NkRBOEprNlM3VE9qZFdIaEMyTXhrVTR6dEsxa3M4dGZTUm1PWG02bmFzcUI0?=
 =?utf-8?B?NTg2N1ByRzMzeWVGNkk0VHBqK2cyajV2aFlibTNsazJ0WXgvK2tCUHoyVWtu?=
 =?utf-8?B?UjRqdXVXVHpCM1FhYjRvTGR1VmVCMFFzUFVKVHpUUjhRM2VpY3VneUQ3REJY?=
 =?utf-8?B?ZlRTQ2t4WXR0OGNSSWxjTWFiS0REQkFDc2R6em1uM0xCbk5YWWUwN2hucExQ?=
 =?utf-8?B?MFhoTEc5NmRXZ2NmS0pwSzBoSUppSXdURCtRanZ5ZkpXMmVaVThHSzNwelNt?=
 =?utf-8?B?STR3VG12aHFhdUVjdTFYbW5mSi9kbHFnOUloYVh0UHV2VSs1OW50SDFLaFNT?=
 =?utf-8?B?c0x5eFBYOGorVkUxL2pmd05uRVQ2a2dZMkpDVkFRT3FoRmk0dzM2OWNnL1BW?=
 =?utf-8?B?RzRmZnFscFh2eGhjaVRWU1hMTDVJUzNldnI0dTFkYmdJZkJhSVlMd2xRMkNO?=
 =?utf-8?B?UTd4dkxSb09FWmN3WVBNMTRCQXMwMTg3aDVMc1I0ZjNjUXpGenVQc0ppc1Fw?=
 =?utf-8?B?dnRjYTNwRHFZbTM0SFhUMWNnZW5sM08wb3JtTjB2VDNOQ0xiVGxEWTV0anFI?=
 =?utf-8?B?b0RsWHJOVG5rZlRsRm1zd1hKZWxWTkpidGtQNXhWSVE5ZUlDVlVJT3NHZ0ZN?=
 =?utf-8?B?REhGb0FpbWhMYXVueGhGZ2dzR2U1dmIvd3lOd0NNTHl5NlZMem05MWV0cjgz?=
 =?utf-8?B?dWRuc2ZodGM0eWRldTRWRGZ3eUJtTS82ZnA4eFpqSlVjTHo1dkZha1lwTXNY?=
 =?utf-8?B?VmxUdXdRRlU4Vmtwd3hRQTVaSG5BdVlTRGFpOFJyaUpaeUIvcUQvTHVYTG4w?=
 =?utf-8?B?L0tVYm9oSTRIOFNUMlkvNWlQb0ZPV2UvcDVTNlhFOVFreEZUMkcybFBqdExk?=
 =?utf-8?B?T2M4R0wxcG9rbkhxNjVVQVRvREllOTNMWkRWTjdvUkJxd1hjc1ZRWHpQaGI3?=
 =?utf-8?B?RStPYnJDc1Z5OHp0eHgwcUNQdi9pWjRYTCtSbDVYYlZQZ29ldGh1Wi9GazVW?=
 =?utf-8?B?Z0U4aE9hdnlYWW5rRTFhanBMSDdTTXZNMnJaSFVCaFc2SlFNUk1tbTZhaXBi?=
 =?utf-8?B?UEpjZ204YWxwT1RFY3lHeWQxOTNDZGlZYWg3eHk0Und5VFpuUDViSXl3SjhQ?=
 =?utf-8?B?UVdXai9IcXdscjVYT3BpclNCNDJHSDlhZlA0a2FTeVZ2cW9Bc1NoZGpEc0Ex?=
 =?utf-8?B?TUZ4S095SHpXMGxoNXNZZUtGeDJ1VDZHQjhlQU1GTC85Qml4WjIxeUZSMXVY?=
 =?utf-8?B?R3Baa0RlT09VQ2wzZTMwRG9CeUhVcE51YndIdXFTc0pia0xmdXZGbWhlNmZF?=
 =?utf-8?B?TVlUM041aWZDUEVDNlRldEJ3eGVJM2krOXlQYzh5ZDNPd3lrakpSWlJyUGRY?=
 =?utf-8?B?VWUwNE1CeUV4bVR6WEhzZjJtMzhCeTAzK3M0TTdnMUFhM3ZzWnBwSGxpSC9B?=
 =?utf-8?B?U1ZpK21UOUZiYS9KSlJqcGttMWpCUVg1VmltZDFySnp2cFp1N0M0dEN3UTZ4?=
 =?utf-8?B?VTFKSTBQdW4vM0xQeEI0bXhLdGZLQUd3emhPWjZyNmNINGZTVnRJUyswNTIv?=
 =?utf-8?B?d2lWS081TklpSkNxaVc3VWZ6OGVHMW5lZGZMUE1Ec0VkaFJGVThyV1BBSEFm?=
 =?utf-8?B?Z2ZjR0ZwMk8vNXpyakpnalh2RTlzL2RPN2NlcmJuYUo1d0V3SXFBbXdYWUs2?=
 =?utf-8?B?bU0rTEI0VGJGaEdrS2R4M3RzUWpOOEtzN2NtRE9BbkJwS1daVHdqR0o5dXZn?=
 =?utf-8?B?M09IQUYyeFpORVZERmdBdm01Y1dqVUhRb25LV1Z0U2tKQVdrMCs4eXFHNWxw?=
 =?utf-8?B?YmszU1VSR1N4SDBvK041QXpsSkRLQnNHbUZyaFVkWXBaWStCTTJEWmd4Q280?=
 =?utf-8?B?VWpjZmVCSjdhN1VUVFgxejJ0L1h4WHZaOHlQWkw1NGd5OUFyK3RhZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab303b90-66b9-4e95-cf59-08de540a6b0d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:48:05.6491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RibZlNZjLiFz4KdyLyMSEJa27rsg7yVSlETBXcjScLQQNVoCcGkXTpMlI7h2ntyCOEz4hpR7aEnXXCXNGVohbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4513
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


On 11/25/2025 11:23, Marcin Bernatowicz wrote:
> Introduce helper functions to convert between xe_sriov_sched_priority
> enum values and their string representations.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   lib/xe/xe_sriov_provisioning.c | 58 ++++++++++++++++++++++++++++++++++
>   lib/xe/xe_sriov_provisioning.h |  2 ++
>   2 files changed, 60 insertions(+)
>
> diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
> index 116cd3255..c2a1db4bc 100644
> --- a/lib/xe/xe_sriov_provisioning.c
> +++ b/lib/xe/xe_sriov_provisioning.c
> @@ -5,6 +5,7 @@
>   
>   #include <errno.h>
>   
> +#include "drmtest.h"
>   #include "igt_core.h"
>   #include "igt_debugfs.h"
>   #include "igt_sriov_device.h"
> @@ -599,6 +600,63 @@ void xe_sriov_set_sched_if_idle(int pf, unsigned int gt_num, bool value)
>   	igt_fail_on(__xe_sriov_set_sched_if_idle(pf, gt_num, value));
>   }
>   
> +static const char * const xe_sriov_sched_priority_str[] = {
> +	[XE_SRIOV_SCHED_PRIORITY_LOW]    = "low",
> +	[XE_SRIOV_SCHED_PRIORITY_NORMAL] = "normal",
> +	[XE_SRIOV_SCHED_PRIORITY_HIGH]   = "high",
> +};
> +
> +_Static_assert(ARRAY_SIZE(xe_sriov_sched_priority_str) == (XE_SRIOV_SCHED_PRIORITY_HIGH + 1),
> +	       "sched priority table must cover 0..HIGH");
> +
> +/**
> + * xe_sriov_sched_priority_to_string - Convert scheduling priority enum to string
> + * @prio: SR-IOV scheduling priority value
> + *
> + * Converts an enumeration value of type &enum xe_sriov_sched_priority
> + * into its corresponding string representation.
> + *
> + * Return: A pointer to a constant string literal ("low", "normal", or "high"),
> + * or %NULL if the value is invalid or unrecognized.
> + */
> +const char *xe_sriov_sched_priority_to_string(enum xe_sriov_sched_priority prio)
> +{
> +	switch (prio) {
> +	case XE_SRIOV_SCHED_PRIORITY_LOW:
> +	case XE_SRIOV_SCHED_PRIORITY_NORMAL:
> +	case XE_SRIOV_SCHED_PRIORITY_HIGH:
> +		return xe_sriov_sched_priority_str[prio];
> +	}
> +
> +	return NULL;
> +}
> +
> +/**
> + * xe_sriov_sched_priority_from_string - Parse scheduling priority from string
> + * @s: NUL-terminated string to parse

typo: NULL

> + * @prio: Output pointer to store parsed enum value
> + *
> + * Parses a string representing a scheduling priority ("low", "normal", "high")
> + * into the corresponding &enum xe_sriov_sched_priority value.
> + *
> + * Return: 0 on success, -EINVAL if the string is invalid or unrecognized.
> + */
> +int xe_sriov_sched_priority_from_string(const char *s,
> +					enum xe_sriov_sched_priority *prio)
> +{
> +	igt_assert(s && prio);
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(xe_sriov_sched_priority_str); i++) {
> +		const char *name = xe_sriov_sched_priority_str[i];
> +
> +		if (name && !strcmp(s, name)) {
> +			*prio = (enum xe_sriov_sched_priority)i;
> +			return 0;
> +		}
> +	}
> +	return -EINVAL;
> +}
> +
>   /**
>    * __xe_sriov_get_sched_priority - Get the scheduling priority for a given VF
>    * @pf: PF device file descriptor
> diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
> index ab5347fd6..c9b321d58 100644
> --- a/lib/xe/xe_sriov_provisioning.h
> +++ b/lib/xe/xe_sriov_provisioning.h
> @@ -136,6 +136,8 @@ int __xe_sriov_set_engine_reset(int pf, unsigned int gt_num, bool value);
>   void xe_sriov_set_engine_reset(int pf, unsigned int gt_num, bool value);
>   int __xe_sriov_set_sched_if_idle(int pf, unsigned int gt_num, bool value);
>   void xe_sriov_set_sched_if_idle(int pf, unsigned int gt_num, bool value);
> +const char *xe_sriov_sched_priority_to_string(enum xe_sriov_sched_priority value);
> +int xe_sriov_sched_priority_from_string(const char *s, enum xe_sriov_sched_priority *value);
>   int __xe_sriov_get_sched_priority(int pf, unsigned int vf_num,
>   				  unsigned int gt_num,
>   				  enum xe_sriov_sched_priority *value);

LGTM, just please fix the typo:
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

