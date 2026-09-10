Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EA5C79FB9
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 05:28:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC77C10E238;
	Thu, 10 Sep 2026 05:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IxywQhDA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A7910E238
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 05:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789018073; x=1820554073;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v4hzh0RLpMhvJzPNjjPLj3+8ENXgr26XQHgNEXmEZpk=;
 b=IxywQhDAdOs3wWHAiDt1j87QHhvThIc0opMfoxyWErPmA8rW7403rYhq
 cNKPZrUQIlPAB5P/pp6EapPfdfUKKnDiHpK1686JJCjTYkChSRFBS7/cU
 0JznUvE+cl/vHAExEvlMjSlLxx0r+NTpI8U2E4uqO7wQCTK77MNauAVLO
 uBU7gvkRP4v0a7zI33iFSZptsfyBCDZ+AUK9RviCiOOlhzYpjbbTRRQmm
 6pvaebmWX35zRc/5ZVlK8zBSYWtczdSAGD+QMUgbBEhHq5DAAVAhow6U9
 nBIFLEnFct+/G5rx2suLq2nGMSkdaDsP28YL/1bZkO3NRYrNtTQ5iQq+9 g==;
X-CSE-ConnectionGUID: 5/5r86XLRE2xydNNGvTO6A==
X-CSE-MsgGUID: Va6eCtEmQU6IzZgAbIZ7zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="91974214"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="91974214"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 22:27:51 -0700
X-CSE-ConnectionGUID: hBiX7acASeSD2a9vK+Jtiw==
X-CSE-MsgGUID: 009G0+8eTLShGiQC9oGpoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="273492928"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 22:27:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 22:27:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 22:27:50 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 22:27:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vWilEUD3YPAdlGfvDTgl6sDHivSQ9roRTKBJjRIbU3IJTPr8iKLbSpw4D3FWxwRzzFIPWdztVXxrSiklIMO+Vipq7oWtxSSsT1TpGn2NJ8xRR3OgfBzKbMs4Fsdl6i+SpBXwr9FMSBJFcXsXKaxX9CsbE0QXiC9U62qH7G9kqFnjMWwZhh+w4RsjN3xZ8rEbQoHZ/vRn6P8NvORSCr8jvR3CrhlUBQUdJ//zyPdwfULw5zvJZmvDNR+zRs/JT+Vx1WuKUkPIGbILjL4boRr7ub0oJi10RzPneG9HIrAxJMDueevEyez28QcIv6ne4WKnVOu3G2s6LrTNnYUkjHmq3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcrsetb6yxlur14FRTuufotS+/Iuk2W5e8DcmU74Of8=;
 b=qNMqkw8Ph1spxmg1fh7g7fFzAgk8SiDxyIUr+tyS/fqC7bWHB4nVmfyCZ3qfy5Wd/S7m+OWuKNCEbXXsP2Hfg/iNlXqPm6QioB9tkyMExc+EewPSmkO9QxqIg6W0VAVUoSyFvx+/89M1StWjfeY+tS096g4lrqMn2R3vdqWuA1a4c0+MtCJGrDJzkgn8SnRzztX2zx2LDuR3EoRh4/2N6Y1yuJjs2Rfsh53y5P83yE6Z882MrxHdfxeiKS81bkQ0MbxjrSEnIcE9dngIC7gtnDJFZNS/+/Ac0rMorG+y4JPjumjvwx6hQ09mIwwcir2xXkDLyGUjsTZkFx54QM8kFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by IA3PR11MB9087.namprd11.prod.outlook.com (2603:10b6:208:57f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 05:27:42 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 05:27:41 +0000
Message-ID: <76a44bc0-1326-4991-b6c4-fbf3a968d14c@intel.com>
Date: Thu, 10 Sep 2026 10:57:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/intel/perf_pmu: Fix double free of drpc in
 test_rc6
To: <krishnaveni.palanisamy@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@intel.com>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>
References: <20260909090014.52978-1-krishnaveni.palanisamy@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20260909090014.52978-1-krishnaveni.palanisamy@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0083.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::9) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|IA3PR11MB9087:EE_
X-MS-Office365-Filtering-Correlation-Id: f32eede3-0498-4c1e-a8e0-08df0efc3c15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: T2IbaDywJHFLycBi1w+0Xhp9ubztjDUTcxY/PLYVywE21rB/rgDrbJmHxUyStH6XufscpSK/tY2fodkxQUoCPUQGfCmnCa7lvzpU0QDg39oYTJVrf9nvX0QfBXBman7kF4h788xDaYpqqPvhWeK96h4iVIRRRSBsoaIQ2EqEjz7xpwOA9MCDY4+EcTIeKFcpsa7rdBKEVcLyFtLqRY49leJsJ6Nj3d6TqNbGfmrfnwjGqK6a3gLbFSb13ZCl+ye6wniRjpe4TnrAoZAUDc7HolTXff5gt1aQ160+h4PjgugWQ+FldWP325rqV1ILuUtQf6MWzAbVdEsv8pYyvfQq2D5PIlneTWDszb1Bw9IcQdpsibJgiIEh96UeC8LvotbypFXa1n9M2tkWEOWCBLIKYurlKLj/Vj9bwd+rQ+aq0HMP0Wo0pgZcZKzsB51GuQFHc28Tp3cZTsl+PnG7Iu9OLo/5xspSzuaFf+6ReU8xGG5ZXRK7Tre+eEDDusCJukXB0Rn7ljApjJcthsPnRPv0SGx7FaAHugCStyefUs6vqzjOV8KS7CKoE8WazriSysYdm/V9i3avYGeKk3DFEh8L8+iY6+0k02T44D4qznZ1CtOMGKArzTutb4MWAiTtYZrlPdFbmfiFl2Sj7kLNRWcMjPzGNQfPdVi0Cn8Cr3pGUxU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Smc0TXNFZDZlUUl2WklCMXRPWncrVnpVY1JCUk5jbkVXR1Axc1E2SERmQXVU?=
 =?utf-8?B?azZiaGN5OXVwdXVuV2pJczBiOHZiN0VFNE9haStEc1BTWklvcWs5anc1clVz?=
 =?utf-8?B?Y3ZYbTJTVmk1c1R3MUpqelBLSzN2UVpJVERCUE9xem1LVXBjZUpYMTRxMzBN?=
 =?utf-8?B?c2pjcU01Z1JsYlNsK21jRVFGeVh3TURZbTl4VG5pN3hoNVZpTGw0N1JGeUtG?=
 =?utf-8?B?M2tHUFVnNHNGOU9nbmg2eVMrZ2hBUkl4U0dXVFVCYjV2ZGllczRlZXBZeWtM?=
 =?utf-8?B?Yk04SFBqdUFhMnhoSkk3eStGSFpoTktCeVBPTCtuSDd4NGhzaWFUTHdzL0dW?=
 =?utf-8?B?YmNmaU5qZ0gxWXRteXNLY1VKMHF2OFNXRmJyZ3R3Znl6bFZIOE9jMGdRaHJ4?=
 =?utf-8?B?bkhPM2EzcGVVQ2JkRzMvUjJkc3A5M3p4R1JJSnlBeXRiNjJMRmhZUFFEVmQ1?=
 =?utf-8?B?b3ZNbGwvb2Z4Z2RQRTRDd2lWT1VYb0p4bDZJMDBJWFN3cUtNa0ZJRHYwRHVx?=
 =?utf-8?B?OUt4SktLQWNkWUY5bWdZVFgwWjBRTlZRbDFOZDFsN2UyVlFyeDRON0JWZHQ2?=
 =?utf-8?B?S1dNRzRFMWxyZ0dlUnRZZUU2Um5NNDJERyt6R21LbnpWT3Njakk1QndFTURj?=
 =?utf-8?B?a2dTT281ZGNPdzJRZUppZ3M0UGV3WkFUV0d5S3l2SUZPR2tXSEdKdEFTaGxk?=
 =?utf-8?B?VjlUMTAvbVdaK2VPWktnMEp5dTJDSFJCRnY2bmNPVTVoSjZ5ZzdhVis5dS9x?=
 =?utf-8?B?bEpoYUdqSXhBdHh4M1Z4MGxYUWpTbUQxRHYrM3VSaHIydHNzcng1YnJxS0RJ?=
 =?utf-8?B?alE4OU1vUm00MEJYaEUwN0ZWYWdhWE1pVUExUDlKbGNFSlhmOVNrb3hIV1JW?=
 =?utf-8?B?T0h3VnI5NTdCVzZjNjhvVkNJSEJaRUlPU0lSeEo4ODVVVVhmelgycjlYeG05?=
 =?utf-8?B?NGp2TmJ6RGpyUlFCWkptZnJQRm1kZDhXR3JTQ2dyVW9LOEtucmpUaDloZHlr?=
 =?utf-8?B?R0lNRFRNN0RraFRFM1FhaEtEckx6Wkw5cG5wUEx2QlJnY24vZ0tIMEdUQm42?=
 =?utf-8?B?QVp6SkxHeHc0TlZuOFhOSXgzY2hvekF1ZzQ3anZ6aGlRV0ErSjdhOE1jakF1?=
 =?utf-8?B?UFpoN1E5VWU0RlA2Q0h0eFYybVVQaG9SeFZYbW5MeU1ib081OUFheXNQcmFI?=
 =?utf-8?B?VFloVzFqVTkwYy8xUE9lWkl4NEtLVGhNaFQ5ckV1MVRhZG5YalFrV21Tdjcw?=
 =?utf-8?B?YXVwVnNSOUdCclBDcWVvcnUvVDhoeVR3TS9rZ3BjWnZvakZTSmZPakNJZEVl?=
 =?utf-8?B?bWUwbDNnd3hJVHRvWEMzeTdtbGdDTGNFK1hNTGpuenZLd0x3TkRvMlg5MjBU?=
 =?utf-8?B?WlJhRUtMUkdWQWtTd3IyUFI0NFJlMW5LMEFUOXA3UXZFcEFyTkJ2cDA4OWJD?=
 =?utf-8?B?eVAyZzdnRHFSaWZaV2lJMFVaZ0hOaCtIL1ZKUGdVR1lGS0pldzRUM0Z3MkhT?=
 =?utf-8?B?VW9GMHZ5cjZlajNMcVgrLytVVWh5aXdNWnl6TFRjMVVubzJNbXEwZ3pTUGZw?=
 =?utf-8?B?ODR0WUZlWTc3cmcybm5zdVlsRnFTcFlEdTlRdVRvKzNlTUlnamI1OTRQV0wx?=
 =?utf-8?B?TDRldEtoUzhHVUdQUUZnakhwRGlibnFkRjdMTTVDaTdtOWNSMW9EY01hVVl6?=
 =?utf-8?B?RkdXR3ZkNElrbm5DKytKTStFVVdramcwbE1WTnRJWHh1a1ZlUXBCZ2ZXNHQr?=
 =?utf-8?B?b003cytLU0FPSXlwc05zM09USEdoUGF0VXJEb0xRWUVQTVYrczhPU2NzUFhi?=
 =?utf-8?B?cXdybHdJcGNXblU2MHdQRTR0ck9KdEtXK0F4K3YyQnpXN2hoakxPNFNvRUZ4?=
 =?utf-8?B?NjRDdlI1WHZ0UnhmSzhBTjBoUjJYSThwK0ZEMWdPS1A2bHltbU9LYVlPa2Vl?=
 =?utf-8?B?bGFWQlBBTTJuUTl0UEFybmNxenNPbGsrSlVjTVJUVlJHYXlUUlFoVm5DVUk1?=
 =?utf-8?B?UkRVQkx3bnlJQU5Fdk9VSTN2b1RyZFZ1RVRsTW9ORk8xUTEyTXJTYitzRnpk?=
 =?utf-8?B?bHM5TnVlUmduSS9aaE1VUVVTUkRwazRkbFh5YWcvWStBRGtIT2FsUnhobG56?=
 =?utf-8?B?ak1ZcHpYYXBQb1dZTm1iRGJqS0V1RVJTMUhCeExoSmN3YmtJZE5GTGhubmcy?=
 =?utf-8?B?T2djaHl4YWdJTFRrMDNQdUdpRkdXMU5Ec0c3MHZCeE8yam8yQytFVHBDbjdG?=
 =?utf-8?B?ckM5Z21QU3BVVHdUNXJKWGNzRC84cENrQjk2TkJ0bUp1QUJBRXkrMVB6aFgr?=
 =?utf-8?B?ZnhPWU1OemE3T2REN08xRVF1dHJlZGZSTGIrOUFYTWt2V3poN1JKdz09?=
X-Exchange-RoutingPolicyChecked: xv6fUDggh2Rzo7MBcU5XfrmGJgXlbOhen0ZcuadejO8PyO/1o65rS+6vd3g/R33O0bNPK2PXhBMj5gOZ01PoTJXVdvE4MDtv5bLS5rDGDPV67UwY2QPu30RjJ1YkidJTD3BSgeCsy/1BXIxfTC/Byln7TW8cB0XokDUPYR0IeV6iEqnuETlcYt+4NG67M6F+bkJtJKJTr3UTVQN3shypbLgZS91wG+OOW7SI9EXyUL/IkJnTDe7pDvEOxMYBP5OOn8+Q+Coz7tMv+iiDqPzZ7VsKJmny1BGF+qrBe1uyvIGpKkfvRqcrwLQlUDZrbsQ0B0BtIJ5We6ILYIvTUIofnw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f32eede3-0498-4c1e-a8e0-08df0efc3c15
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 05:27:41.3896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aeJlRcRRR51hk58G50A/UHpPnFO+lBqbu76uVN4LeEo1hKZ26RDcBM6Glpw1TdAbeAAGx0n53J2zivcr+ZewzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9087
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

Hi,

On 09-09-2026 02:30 pm, krishnaveni.palanisamy@intel.com wrote:
> From: Krishnaveni Palanisamy <krishnaveni.palanisamy@intel.com>
>
> test_rc6() frees the 'drpc' buffer returned by igt_sysfs_get() at the
> end of each phase (initial wakeup, post-S3, post-idle) but leaves the
> pointer dangling. If a subsequent phase is skipped or returns early,
> the same pointer could be freed again, resulting in a
> "double free detected in tcache" abort from glibc when the test exits.
>
> Set drpc to NULL after each free() so the pointer cannot be reused
> accidentally.
>
> v2: fixed the indentation (Anirban)
>
> Signed-off-by: Krishnaveni Palanisamy <krishnaveni.palanisamy@intel.com>
> ---
>   tests/intel/perf_pmu.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
> index 1e389958f..4dc13d6dd 100644
> --- a/tests/intel/perf_pmu.c
> +++ b/tests/intel/perf_pmu.c
> @@ -1766,6 +1766,7 @@ test_rc6(int gem_fd, unsigned int gt, unsigned int num_gt, unsigned int flags)
>   					    ts[1] - ts[0],
>   					    tolerance, drpc);
>   		free(drpc);
> +		drpc = NULL;
>   	}
>   
>   	if (flags & TEST_S3) {
> @@ -1806,6 +1807,7 @@ test_rc6(int gem_fd, unsigned int gt, unsigned int num_gt, unsigned int flags)
>   					    ts[1] - ts[0],
>   					    tolerance, drpc);
>   		free(drpc);
> +		drpc = NULL;
>   	}
>   
>   	/* Wake up device and check no RC6. */
> @@ -1847,6 +1849,7 @@ test_rc6(int gem_fd, unsigned int gt, unsigned int num_gt, unsigned int flags)
>   						    ts[1] - ts[0],
>   						    tolerance, drpc);
>   		free(drpc);
> +		drpc = NULL;
>   	}
>   }
>   

LGTM.

Reviewed-by: Sk Anirban <sk.anirban@intel.com>

Thanks,
Anirban

