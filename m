Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346B710F995C
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 17:27:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C3D10E0DB;
	Wed,  8 Apr 2026 17:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IpBbsOtS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FCC110E6B5
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 17:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775669242; x=1807205242;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZjzDRzsS45D6tsTWIIZAfopJ0l/NjJ0Jtxub0UYY7Ik=;
 b=IpBbsOtS7dIcZ98O8AULmI47St7UONifJYJhnxkozQidp9PlkBipOR1W
 sa56IG/ZuXgVNhnNZzs+ioEejx3kkbc9c5pPF/9BheHBxSf3WE2orjXqp
 5W2053L6CPWiLsXDDV/YdK3GIW1K1DqhcKGTNTlJh+9GNsSzpjfYPLeyF
 EAdPVww1UTy25qhuQNfk4/cHYAGgySalJ62zhFNueFldpHmnja/3m/KJu
 Yu+hWAAWfgaHpxLvuanrcsJWmOBCBxb0OZMASr+ETlfThzQrRzKo0LHl1
 deXaz+EPkDdYyiA6+UuTGlf4CXQPBGO5ywT+Gu5qdX5/+88s64dZ+RJMJ Q==;
X-CSE-ConnectionGUID: 3cC9oiQ3QRmIBdAqczsnzg==
X-CSE-MsgGUID: d9+h54ChSASbEpisqtSwnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76849054"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="76849054"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 10:27:21 -0700
X-CSE-ConnectionGUID: ma+B+jgiSjWKVboJ86EGaw==
X-CSE-MsgGUID: Fh/q4/4xQEG3OLN6aH3neQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="222018795"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 10:27:22 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 10:27:21 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 8 Apr 2026 10:27:21 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.69) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 10:27:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZpc930RI9Tj3TnMFqaF8hEFNni6SDzw10RDjNBMekGf7JbjMzv2vzfcEoky1k5+9S1T7x7NmVBY6qoqNCAIjMf5Q5hpdKDxoTuPyfxYnRqdHg6ZCH6FttMMF1oCV11lBT8758b/YGshBvfc5UUCcpxAer34SNT+Eckr3Ao9vtMgmt1CKFPxn2397NdsKMNFuz7PaijVuVJz5uB9MwUgctTAVXrpeTdl9bHQm9Zv5zrc+lxLv08GjcChut6LLergdclEb5/0jPEr2iBo2as85YcqGJyvysTsD+OPCUHquqqyPCJanaszYcUoqbAMi6dPakS+PMVPKJEOz2ahREQ2wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQkGsjXuTXwhivvZfpclLHTFC5UndTVoPif7DRd1v9k=;
 b=ZuT69oXAQ20WExUtT9PUa0EZRaNTMmUznJx9l2SYh2soCBC+YKYGIzW2MGziqbuW8T9Scqhgrs1UU0AYUkh0w0GEIZfjhuov/CGeq3NPzVVrrWtxcaIUCoBjLezt3i2ByGX137X6gIEoOWC0pft9VBvL51NoYExmvcl4rh4LpM7tqZQojJWxA5mKX3qcL0oGVbXuFzQXw5PRU72eOsM9yfurcqFUiElcxddlaiyLqLDqGor5MhftyK2ZJnzSjmn2uraPFzGVmCvgc49oAYv4RzvYw2hua79WPhZADFSuy+bwIOgTIjx9xywdawUgP7INMr8LVbjTOJvHeyjSVx6bjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14)
 by DM3PPF1939049CF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f0b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 8 Apr
 2026 17:27:18 +0000
Received: from DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::2ddf:5a8a:8a8f:c429]) by DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::2ddf:5a8a:8a8f:c429%6]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 17:27:13 +0000
Message-ID: <e526ec30-e249-45c1-9261-e3040b2d7b2b@intel.com>
Date: Wed, 8 Apr 2026 10:27:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: tests/intel: only check multi-LRC support for parallel submission
 paths
To: Xin Wang <x.wang@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260408071416.808087-1-x.wang@intel.com>
Content-Language: en-US
From: Daniel Charles <daniel.charles@intel.com>
In-Reply-To: <20260408071416.808087-1-x.wang@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0182.namprd04.prod.outlook.com
 (2603:10b6:303:86::7) To DM4PR11MB5232.namprd11.prod.outlook.com
 (2603:10b6:5:38b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5232:EE_|DM3PPF1939049CF:EE_
X-MS-Office365-Filtering-Correlation-Id: cc5b4d15-1b4f-46ec-b0ea-08de959412dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: vKq5InACSIiaPizcSCPMJgeaOTLtE38FSL6plLKGoLUGzFysz1jnzE18Pnisf3RWh8M11yQi8sRIZ9EAk3bS4afSzbCoqoGSt2pyMRjweJQBOB7pItmsS/O5kSPU6IQTUt7UDbzajhF5fDZ7z26BSFvmbrd2L4q1Nykw6QSQBMj1WIW7+SeDkhR99zTqXDdYXeUleUQRI0e7aUkIivPYBX7yrCIqpoRCC6an5cbcon85/YsPm+gcje+VBYB3phhjL8YNTOq0fZe2HLLkl4YFZzHJfYsl+w/xum4fHbaxw7wn5WMMg0v1q7JGYedBiNDDCef6F3rcyd5lXsUTskMECGVe/RJoWWd2tw7vGF3OzYqp35znE60KhVSYgcYLkikB34/YfYgabrlsopXhNF+E41QJBxeKY8L26wpPa5oIfUxi0YazsipPG7tUO0yqwnZ0FMUP1/V9q+2Hm8boXbc0ytjvCUYI1PQRvh9FKu1/4ED4/HudYbinWUK9whVyuwxHk6jJOlw2kmuuyJxRQZznqP3rKGndn4tDuFIQkABRe6m/rbzUO8LkJuJ35lVQA8vf0AlDjP3ILlw1a36HK5FCASuORTTmw9BEfUdIIOcdsYLUUbXEbjT/3d1sUWzj0zhztPk/HVbaXaJZAXuDVhKdy0MA1qfz5VDEYgIKKTk7O0rYSErGC7PNznQvPmEsepj+beq9GA4Hrbkpo9GgBn6BMQO8nV4kaCh49fMuLtNQPSk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5232.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzQyblR2R1IyNEhmZ3M1MDZSYVdtL2ljS3NDVDE1K0g1QjFyNHhRZkdaRkVv?=
 =?utf-8?B?MEZaZDJERElockhCM1VDcVdubmtWY0VzbTdITE5SYU81U3dyZHdkSnBTU3Fy?=
 =?utf-8?B?eXBOVUF6anFOeUpIcHV4YjVHU1VOMkNVV2FZMFRXVWNPUnFVck1SWWE4NVBP?=
 =?utf-8?B?R0ZJUnN0WVpYOFR6TnJzQkZLT253V09MTkJKRzJHTmh3UnNqZExmTi9PTFpH?=
 =?utf-8?B?ZVNrek5ubVNnR2lwUGw5cDVaNUVFZTI5bjl3ZFlNYm1nK09UaWRaTjJwZDVI?=
 =?utf-8?B?R0xrM0ZnT2MzdkVvK0dCbjQ5QjlyTFo1SkQwcWRhMWdnSSt5OEkydHhsdTNZ?=
 =?utf-8?B?MkI4UkJKb0FyZXAyUkVoY21lVkhKd0h1MVRzOHhGU3kzUW82ZFpFT3V2QWRs?=
 =?utf-8?B?U3ZPaVhvdHJIcldQMUpQOVBHZXVHdm1aSlBJeGJTQk1TMUUwdmFnVitEVmky?=
 =?utf-8?B?c3VsUENTRUxCTHgvZ1FycDF2eHg0L2I5dUk4ejluKzQ1RTNDTlVRKzZhQ3pC?=
 =?utf-8?B?REZyUmt5NHprSFVSb05pWEFTUnMyQXcrb3pmdnptZWJqSTNDZW9UT1VJemtj?=
 =?utf-8?B?eUJOODNXMW9keDFKU1ZIWVlXaFFuc1kySjZaL1ZzUGMxc2VSNkw5bkJVRDhp?=
 =?utf-8?B?TklhMG9EZnlpcS96dE9ISExFNXJoZmJ5dmIyc2YwWFBiMGtnZXlSTDlTU1VS?=
 =?utf-8?B?dTBzaTNXTExUS25NNWxyb256ME5OejVYbUM2SnVMa2kwVWgrRmhJUlNxcGsr?=
 =?utf-8?B?SnY5cVpXSDR0eUhHYkI1TVZ1a3M2U2FpcUVldHNrdjAyeW8xQk9YbkF6YnZV?=
 =?utf-8?B?RVRkenVESnh1RVBibGh1dnMzNk1BRTRpeWVtajVma2tJZTRHT0dPb3N2UDdw?=
 =?utf-8?B?L1Y4YnlNTmJZYlRHQXBkRi95WjlveGU4ZWc2Yks5bHYvRjZ4MUhNN3EydXdL?=
 =?utf-8?B?VWJzNGxUQlJrMmlQejZLTHNUOTVpUjFUMEp2QWhMRkptSWV1cDdTQk9nRlkr?=
 =?utf-8?B?cTdFMG15cGVFL3NIbkpQVy9kL0FDY0xqWXpIZEVtRjhzRno0bldEYW40d3Uw?=
 =?utf-8?B?WnVuY0RCaDBFaG1XQUFnUXp3T1ZHMXcybFBibCt1R0RxN3JaQnVEdjJIUEtu?=
 =?utf-8?B?dTA1NWFZbVdBWW5vZjFyK3BEcFZLenJ1MnpYN1d0WEdnd3dXVkkxeDgwYWVs?=
 =?utf-8?B?TWdVMGFCdW9CUDhKa01EdHhWcSs2T3ZZd0N0Zi82N1o2VTgzL2gvZWV3TGZ3?=
 =?utf-8?B?YkJ6ei84RTMxTVRISEJIbjVJQURZL1B4RFFKMFRzUjErWTh0bFh0Sk5Hdzd6?=
 =?utf-8?B?eVhma0ZqSXNQSHBYTFRDMTNGQVpEZWltdTJVQ0xvTVJmTi9wZ1d5bGpqdFhv?=
 =?utf-8?B?WGdFSDJVeWNUN3BXTHFqNG03d2F6T0xPcEUrNEdvaUdEU2twQ05BOXNjVGRm?=
 =?utf-8?B?VGZsdlZuVzBOcE9qN3JMRXZlL1pKL0F6aDhBbVIyUytCbldKQ2hvT203alNX?=
 =?utf-8?B?ck53N3FCZE5MZ1RIbmNrODZpMUJvbksxMmtlTDZrQktwYTFWa2NhRHNLWWds?=
 =?utf-8?B?YlBmZVp6Q01CQnJoY0tBYXNnTWdvQWQxMFlEYjgwNlhnR25sdUdpZlF3VWhY?=
 =?utf-8?B?bSs2Sm5LMEZIL1dDdmhPK1Z5YWQ3OXRPR1h0NDJKNlZGNnF3Zmh5eVJKblZi?=
 =?utf-8?B?QUFGeGsrZXQzWTEwMmExaTA5VVd1dHk3SXVDNGRwV3hLN1dtMnhLNkt3WUxs?=
 =?utf-8?B?ZGFUMWxqbFRPMWpUNXhjamd4Ylp3NkdmdWllZHNkSWFMdngvbmdITDk5b0hj?=
 =?utf-8?B?ZVZxclRSc0U0SDA5alRxOURVbzhzdXc2bHZXamhEV3hraFc0c1VkdmtWWnlU?=
 =?utf-8?B?bHo5YlFtOXpCUnJpMzZEWVc4d1J6cEQ5aVdlanJUOWsxNkxlVkxNbUZYRG1F?=
 =?utf-8?B?VVo2eDUrWk9GRFdoQVhteG8vY2p6YkdSWXJ2QVNVNlBvVnU3ZjBHOVRrQmxI?=
 =?utf-8?B?eEE2L0d3cWZobXZlci9uT05rdjN5NlRiSStjNzNXRE5SWXM5TXBNaXk5OUZJ?=
 =?utf-8?B?VWhObDl6cnBOWlBYakNKYnFLWERIb1hDVjF5L0xIcHlhWW1Rdk5ZQ2haTXl4?=
 =?utf-8?B?U2lCQ1lNeXQyT3ViNjZxTEkwZyt1K08rUW14VndFdlpxTDRqa2VJanhoTVJD?=
 =?utf-8?B?cDcrYXRKRFcraXJuOFZkNHV2SkJTZW9PWkFYdEpoYlpHY2VvbEtVNTBCdW9q?=
 =?utf-8?B?Nm1PMDFFOTREOW1JSWtJbzcyQ1dSRWJrYll2VzRPWkpTak5LeVFWS1A5L2Ft?=
 =?utf-8?B?QWYyT0VtNmNacWt3UDg3ZHhseTc4enhtRjRralRtZ1NnWG50d1lodz09?=
X-Exchange-RoutingPolicyChecked: Bj0a/ElAa3CyuIxqD9doWI9UyExTCTLdyZroSGaX19KRjBzATcr51kk3OmurELBkBAne7bumHW/gmrgHHPGnGUF+uPNaeKlqIre65kBN9NzA0R5HElcbKGG0fhH6tHUhblTOhdnUQ/M/FWnLxI+PGgUDVfS+3gUsqYn5feLqIu01FpnLn9w8RgR7SDGKDHAFKOTJLpjnla1aw0MNCCnd5wUep9cxAsU/kU0WFnH1zUuyV+ITENgPyFZW0HwLjR3FNij8WGEzMTecz6yr1NzrUsbNM9/AcKA98nd6pm2OaJI4cVy8hzduK3Oqo3ByueZ7dCnMOETPl+lBHY5ZwnPjCg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cc5b4d15-1b4f-46ec-b0ea-08de959412dc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5232.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 17:27:13.8656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bxyi9OVOQ7+HVeUYb0tcvZ1B+IGyPKg5nn5hlGun59U+VmtU3coaH6PkUw6E3F9+zLUGk2IVa4rVcfLbT0fAa1UXKJggelYvwHI/svhEYuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1939049CF
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


On 4/8/2026 12:14 AM, Xin Wang wrote:
> The previous commit "tests/intel: skip or adjust tests for non-multi-LRC
> engine classes" unconditionally guarded balancer test functions with
> xe_engine_class_supports_multi_lrc(), causing virtual (non-parallel)
> subtests to be skipped on engine classes that have multiple placements
> but do not support multi-LRC.
>
> Only parallel submission requires multi-LRC support; virtual balancer
> tests should still run whenever num_placements >= 2 regardless of
> multi-LRC capability.
>
> Fix this by making the multi-LRC check conditional on the PARALLEL flag
> in test_exec(), test_cm(), test_balancer(), and utilization_multi().
> Remove the check entirely from test_all_active() which is a pure virtual
> test.  In xe_exec_threads, move the filter into the caller threads() so
> that VIRTUAL threads are still spawned while PARALLEL threads are skipped
> for non-multi-LRC classes.
>
> Fixes: 09d91fcf2961 ("tests/intel: skip or adjust tests for non-multi-LRC engine classes")
> Cc: Daniel Charles <daniel.charles@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>   tests/intel/xe_drm_fdinfo.c    | 3 ++-
>   tests/intel/xe_exec_balancer.c | 8 +++++---
>   tests/intel/xe_exec_reset.c    | 3 ++-
>   tests/intel/xe_exec_threads.c  | 7 ++++++-
>   4 files changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index 3c113ed5d..8449a4f17 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -673,7 +673,8 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
>   	igt_assert(virtual ^ parallel);
>   
>   	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
> -	if (num_placements < 2 || !xe_engine_class_supports_multi_lrc(fd, class))
> +	if (num_placements < 2 ||
> +	    (parallel && !xe_engine_class_supports_multi_lrc(fd, class)))
>   		return;
>   
>   	igt_debug("Target class: %s\n", engine_map[class]);
> diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
> index 3c6ec45f1..4aaef7666 100644
> --- a/tests/intel/xe_exec_balancer.c
> +++ b/tests/intel/xe_exec_balancer.c
> @@ -57,7 +57,7 @@ static bool test_all_active(int fd, int gt, int class)
>   	int i, num_placements;
>   
>   	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
> -	if (num_placements < 2 || !xe_engine_class_supports_multi_lrc(fd, class))
> +	if (num_placements < 2)
>   		return false;
>   
>   	vm = xe_vm_create(fd, 0, 0);
> @@ -187,7 +187,8 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
>   	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
>   
>   	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
> -	if (num_placements < 2 || !xe_engine_class_supports_multi_lrc(fd, class))
> +	if (num_placements < 2 ||
> +	    ((flags & PARALLEL) && !xe_engine_class_supports_multi_lrc(fd, class)))
>   		return false;
>   
>   	vm = xe_vm_create(fd, 0, 0);
> @@ -402,7 +403,8 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
>   	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
>   
>   	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
> -	if (num_placements < 2 || !xe_engine_class_supports_multi_lrc(fd, class))
> +	if (num_placements < 2 ||
> +	    ((flags & PARALLEL) && !xe_engine_class_supports_multi_lrc(fd, class)))
>   		return false;
>   
>   	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 95191139d..66580ea44 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -184,7 +184,8 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>   		fd = drm_open_driver(DRIVER_XE);
>   
>   	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
> -	if (num_placements < 2 || !xe_engine_class_supports_multi_lrc(fd, class))
> +	if (num_placements < 2 ||
> +	    ((flags & PARALLEL) && !xe_engine_class_supports_multi_lrc(fd, class)))
>   		return;
>   
>   	vm = xe_vm_create(fd, 0, 0);
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index 7b8100c5b..40a6c0c6d 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -85,7 +85,6 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
>   
>   	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
>   	igt_assert_lt(1, num_placements);
> -	igt_assert(xe_engine_class_supports_multi_lrc(fd, class));
>   
>   	bo_size = sizeof(*data) * n_execs;
>   	bo_size = xe_bb_size(fd, bo_size);
> @@ -1211,6 +1210,12 @@ static void threads(int fd, int flags)
>   					continue;
>   
>   				while (*data_flags >= 0) {
> +					if ((*data_flags & PARALLEL) &&
> +					    !xe_engine_class_supports_multi_lrc(fd, class)) {
> +						data_flags++;
> +						continue;
> +					}
> +
>   					threads_data[i].mutex = &mutex;
>   					threads_data[i].cond = &cond;
>   					if (flags & SHARED_VM)
Reviewed-by: Daniel Charles <daniel.charles@intel.com>
