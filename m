Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2971606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 21:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YKV4QfJz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848FD10E7BA;
	Thu, 29 Oct 2026 21:28:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B358710E1B5
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 21:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793309242; x=1824845242;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jzu5qIjVBhx0xgP3o3k9sg3KCNsZaExF1APZ96kqZzc=;
 b=YKV4QfJzf8xVNiz3CHocd3SqMPk23+jqKAjn0FN5c4yCJgIsI+QHrt23
 MkUVbThqD8MCR0l7sFT+XoYEcE0l7U7m0PgkawIykjM9zkNP+UKwoqmfC
 Kij7DB2shfRqjmrw/kT4QaoByqZOxzqhiwiY6Tu1ZcWUHGda8Fw7PDdr9
 lPbDRUuqm1NzBl7lagjMDPQvB4tk0+tUU3cgE9q0QT+aKM+s0psjFlqk+
 0bY3DoKu9XzQMZhQZFP6wkv92nfoMr1D8YpbY/ef0TkrcmSksaM0fvlZ4
 7aNppC2A46nWGjcDAadN3jpVWAKHilurB0mhJvlcwCPCZbJCm8EdDlNVf w==;
X-CSE-ConnectionGUID: FH39wUMNTC+vd3u0PMIofA==
X-CSE-MsgGUID: V1mjhbgTRNivKQxX6k4ksA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2159235"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="2159235"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 14:27:22 -0700
X-CSE-ConnectionGUID: lT3Zc6LGQgKVEf8SUyBqaQ==
X-CSE-MsgGUID: xV0ohOiIQB+TK2KYT9Jn8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5139000"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 14:27:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 14:27:20 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 14:27:20 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.46) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 14:27:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWlQq62EXxkkoWtHEStfhudoZNxU46ppg0qw1lTAqSpEL5K++5q+3rv09LA3lgZNYga3UR5Wdo1chP9JZbX4V1JFgeXdEMyhblPDxSyYP+OglZlVfLVvOl/l3S4LB1o5EdMQjZ5TOcPYyczb5ROqF7zVHdHnLgCmJR6f44ti8EpLBX03bNL+9B8Q4ODaeAX6VBz+xNbOd8OIs8Q4C4HfejZcuslGpmWg0EKjMavn3a+b36sBO6Lm2K42ldqj8MCAl49DaJ0eWKVyZyL1bG99alslS+hfHSmgacm/v5EuIX/I79Mo2nkjwM6z9uDzyfhi9xgSoDCmk/Yr0xMApNgbuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nw56ibqBtdl3iSvHORNrpi1JOHar2OTMIH7gfWiNmcQ=;
 b=KEawthlOgmvmfGPdXKlAXC6aY18JPfnHl2a7dxB6SOukNRnCpIioLqeFmz0RRl4QJHpx6TV3ZzYBYHuTJgQLhv1o96eu8bbDjQPXonUaR3TKZ1f7W5h0oG4TNUKFbq+nBzC4p2r0TMbxg3FqSKcPYiWDUFyvKDFOsi0Sb8Cc+JlB3IPPcJJACBeRrCie8O/H26nt28JknVojNwKp4AXMN/1zQbv5TEr3aLbLCJ52THdVBBVIntG46pO43h3nC6LZ2kjLrl4mwuZr4aONBqbPNRgkNg+PqQKeN3h17clifl4THQdi/KxfiftnfdTLaeKV0HbG3u2OXoOsleOFaD+Iow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8040.namprd11.prod.outlook.com (2603:10b6:510:238::11)
 by LV4PPFBC38331A1.namprd11.prod.outlook.com
 (2603:10b6:40f:fc02::22d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Thu, 29 Oct
 2026 21:27:19 +0000
Received: from PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::89bf:2274:1371:50c5]) by PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::89bf:2274:1371:50c5%5]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 21:27:19 +0000
Message-ID: <27e692d6-f863-4b1f-96d7-8d660d25f4a0@intel.com>
Date: Thu, 29 Oct 2026 14:27:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_exec_threads: handle reset rejection in
 multi-queue hang test
To: <nishit.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <himanshu.girotra@intel.com>, <kamil.konieczny@linux.intel.com>,
 <gustavo.sousa@intel.com>
References: <20261029070410.1549615-1-nishit.sharma@intel.com>
Content-Language: en-US
From: "Yao, Jia" <jia.yao@intel.com>
In-Reply-To: <20261029070410.1549615-1-nishit.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8PR07CA0041.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::29) To PH8PR11MB8040.namprd11.prod.outlook.com
 (2603:10b6:510:238::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8040:EE_|LV4PPFBC38331A1:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c78c060-46c8-47ba-be32-08df36036960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|23010399003|366016|1800799024|376014|22082099003|261026121527099003|10067099003|261022105027099003|6133799003|18002099003|261021121427099003|261009223027099003|261028144727099003|261026140227099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: e/+Gicz63aPy6pNFDwhcvkdNXfsHS8FtLQMHGly3OBvx92a4P7BRZr+BPfPG1qDlUDbbH37cOWWO+NIzGwvIAwRd0G4oh7xC6jmqFICPdF+9PFbLOUtuXTILiyGSACcsYEZN8R47s+hDuqhoyaQcnFu2Sp/sNf9tC5HPjYjiaRd1m6Qf7qwcv7U/tREQZ8caA9mpRgOKPwLeI5nqOAdR7BcZZfn4+hpvXsATBVjgoE2K/Su6x4BGJ8UOAQiDMXcRc2wX0u0DZer/HYKD7bPUzyXTNsbG+/fdRrpNtN/IZx/KCvAFov7p8IW5K6OS8NNn30GrtdE0J/5SObsxrVh/sUINJrVm1QyJHKoKj/UyTL1S8W7iCWH+5DnO5qA4mb5VymfvYRq/RYiD3mXDQSOjo1lA4UHf2LFKOX2V1vIHbbkQe04U7zHHY74s8FdPQr6ntXNrjROxSX3WV+ZTT84bqi2qXxeCqGAX8UNPwYELziaaGoRKynhrYtJXaF4Q7BoQbtPP6VUEYDEyaulVsgpF4xXUi/+x8/CTCAJDNFTsmMfT71Z71PEA4x0IkZFF/zU7KNCaLJ3a1jJLLpBI1UampeHNqi10/10jCwrhSueYJeEpmQKZKXxOUAZ9kplMk49aY8IRDK7JHZG6lbmtCduoBdew3lNxadm66fSnXFOPMbU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8040.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(23010399003)(366016)(1800799024)(376014)(22082099003)(261026121527099003)(10067099003)(261022105027099003)(6133799003)(18002099003)(261021121427099003)(261009223027099003)(261028144727099003)(261026140227099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uk9PVE93SDRDRjlCRkI4OUk4RUZELzMrK0p0bjZwN1hRMlNlbUNDNkw3ODY1?=
 =?utf-8?B?T09Dcms5Q1dOYXVoS3BKN2pKQmdpMWlUQ0lvYU90SFRYbDBZV1h1bllXbjhz?=
 =?utf-8?B?VGpnbEZCOFFjWkRBK3NrZDFsNHlxbmxnaFZ3cE03MUI4ZFdFcEY3Y2ZpQ3Zq?=
 =?utf-8?B?RnQ0NGVOeDBMeVE2Rzl0dW43Z21FMDdIakVodkVkQlUwVmtFeUt4RWhHVFJp?=
 =?utf-8?B?VEhJYUYzaDRJeUtNL1VLazZsaFZ0MVl2bUxSeW0ycEdOd1NVaCs2MTNHZzRL?=
 =?utf-8?B?cGo2V0FNTzVYZ2lyc052RmFqc0JFMjFqd3lGcTJuUlJ0c09IQnBEM0V4bmpj?=
 =?utf-8?B?cm8yaldTWG5MSXpTYmYvYzlsaVNaSVFRM21hbFAwdW84OTNiaE1IY2Jub0JQ?=
 =?utf-8?B?cS9sV0JYc2FQNllKaDhwY3cyQy9JRHFYQmZHb2lEdWVJd0J1L0VWclFnQUxx?=
 =?utf-8?B?NklDcFhyQUpRVkkzdlAwS2liRjU5ZXp6cEtOVW4xTWJMS0tYVFl4czVBZjhk?=
 =?utf-8?B?eEVFVUpQWHRLZGkyZUNMQ0JOSldIRnNpZEFLMnA0OElOaUJ6YjJRZjRqYWp3?=
 =?utf-8?B?STFQamwydWFiV3NoSGxvOW9yQVI0aVNFSjF3eThFenNTR25xUG15VFgwbEtT?=
 =?utf-8?B?RnByVUhzUjdlOXVteUtBUW5qK1puNnBKZ3FNempkcjhZK0V0NjNKRVZVY1Ex?=
 =?utf-8?B?ZFZZRFBua3ZaQVpldHZQK3RseHQvL0Q4MTdoMzkzLyt6ZFNjYmNzanFTc2tw?=
 =?utf-8?B?Vzl3VlBPS2JaMG10djl5MlBzTW1kTVpLRGlySjh1YXJOaHN1dzgvb1hxTXhq?=
 =?utf-8?B?QVA4M1ZjRUY2YjZ2ZTJmakpqelhqV29vTklPRVE3SkY2UnVVakRiVkYwRSs3?=
 =?utf-8?B?VTRTMlY4WklGZ3RydTRGUGpnQVA5cjE5T2NMUXIwR0hRbndpT0ZwTTV2QlAr?=
 =?utf-8?B?MkJuZlJJazRpVEFDb0Y0dUpZemhRSkxJclU1MkZweWVTanROWFFZWlBRUkFN?=
 =?utf-8?B?WkJvdnJIc2sxbmlnekVSNUpuc01iblpSb2JndllNMnVRRlVBYnNZRnJ5Sk94?=
 =?utf-8?B?bjZvRS9PYlJpOWIrbno5aStRVEYwS1I1OWtPenFYNjFhamRiVkNTdXdrdTA2?=
 =?utf-8?B?bFlLblR4RXdrdUx1clNISTFLYVFPR01sZ2FOM3Q4SHM4REROL1F4c2htWWZz?=
 =?utf-8?B?aUFoMS9NQVlKaHhTMFJVdGwweEowQ2V4Y3JqZTBJTk9LVTA0THZkVXVXQmRW?=
 =?utf-8?B?ZjJKNkIrNjdaOTBTWkRicS9lYnkrUTUrbDFRTkpyMXhrWVFkaUtxVmt5RDI5?=
 =?utf-8?B?R2dlclVIRUtzQ1FKazlHQzVhRGZhUXJSRWxDOEI5a3NvNW5vTUVEYTJNUHE0?=
 =?utf-8?B?ZG1ya1hKMmhYWWkwTEY0dmE1Y3UvekxrclVQNnJQWjZIMFJvbWFnOHVjc1Vu?=
 =?utf-8?B?NWF6ZHBoS3Y2SXBUQUxqUkZraUlmZjRjcW1YVVJCTW1hTlE2KzNOT3IvYnJm?=
 =?utf-8?B?NUVWeDRjUXE4OG1YSXRNRWExcWthOVhvMTE1WlEzU1RaME5aMjV5WXBmUDNq?=
 =?utf-8?B?R0FBeTE1ZWtvRjMxVlRheW4rdjhualBsQnEwOHNuaEJ0SHBpSlN5WjkrV1JD?=
 =?utf-8?B?OExxUDZHaVJZQXhoMy9HZlA5S0VzdkFmVktDSVRPaGQ3SkJDSmV6R1M1d0tX?=
 =?utf-8?B?WEY2RVV0N204V0N0MDNPbWhINzM5QXgvMFptdWw4aGFpZU85eTQ2RkZ0N3N3?=
 =?utf-8?B?MjRQSmdhc1FKQjZZdy96ZFdVa3QzRHNDNkZaREg3UlpDaWlmamlxaUZKdkhQ?=
 =?utf-8?B?Q0VKSUhYQlFKQi95eVMxemswTkxFdG13VVpDbUVKdDQwQ3ZtZVFYeHpNUEJs?=
 =?utf-8?B?UXhYdXhHVWtxVk1sYVdhenJIYnhDSlo1bXYzOXE4dHIwaU1wVTE0OVh6OUhl?=
 =?utf-8?B?N2tBZWZRd3JRcTJRWmdYWllSeVRpVWRUa29GY0J1S3ZlOWxRSTQzaVZHbmlW?=
 =?utf-8?B?UGxuUXNIa0dhSkdsbkxYcmdxOURvSkRTWFd4N1Zab2lzcEdCZ1VVWllNSkRF?=
 =?utf-8?B?QWY3UEJaZGxMVnlaVkZRdXlmMjRxcVFNNXIzTHpsU0c0czVUcjBYbE84WUg2?=
 =?utf-8?B?NmU0SW1LVW02dU9oQVIvMGFEV29pNUJ2aE83eHdLNFJSUVlONkNPbzdjbGFM?=
 =?utf-8?B?VGtvWVFjc0p5QVNoWFJOMXpKazl2RFMwbTNYcytaZTMxeWRIcGMrQ3hiUWdH?=
 =?utf-8?B?U0dGQWhGMlhKbGZkdlloNGtQQWk2NFU1eWhQZ1YzNGxIWjVOeEpyS2l1TTRu?=
 =?utf-8?B?cmxpanpFTXhVdStZMVlZUGRaYlRNTUZJbGZvc2IzRmxSbE9wY0ZJUT09?=
X-Exchange-RoutingPolicyChecked: mSdg8En+he/9B3yIhlkojZmp8jw1gM8Ki3SiJ8Eo6VhoEQ7FBryYA0QAAQBuYKFbOVic7jjgO0yDzUhVXYRPDJi1HHrTzCWkdn09HxX8jCwBeh+P6D6mqpWuSBHor11iXQsTY5DCRKz2KwlS+lH2Z49vLiwSCMb/xKDWLVJKZdckj4XRl0t25/VUaAN2RDE3hloPxu/WNBlX2o+GMu0uf4C4xhbhR+zkWR7Gw8M87deKqq3Kf+ORvjPKENtWURDpo/Yk8EQrRtgOPrwfcpqXTafLVnKEPFGCzHhj2D8e4rx0WWdBsNKGHNhmTof1/5VktyqX5tTXVcsGNOUH0dsfaw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c78c060-46c8-47ba-be32-08df36036960
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8040.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 21:27:19.2324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8c3EZ7Vt1ZlTR17EeyyxRoi/pHec9Bhx8spj/VUBA+yIqxJFovk6NmeR3KOv7yv25xgD/cdG47Y3x+rS6YSlvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PPFBC38331A1
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/29/2026 12:04 AM, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
>
> The multi-queue hang subtests intentionally hang one queue of a
> multi-queue group. All queues in the group share the same reset domain,
> so when the hang queue triggers a GPU reset the sibling queues are reset
> as well and the kernel rejects further execs on them with -ECANCELED.
>
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>   tests/intel/xe_exec_threads.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index 2974fc312..f03f20142 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -766,6 +766,20 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>   			do {
>   				err = igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
>   			} while (err && errno == ENOMEM);
> +		} else if (flags & HANG && flags & MULTI_QUEUE) {
> +			int err;
> +
> +			/*
> +			 * In multi-queue mode all queues share a single reset
> +			 * domain. When the hang queue triggers a GPU reset the
> +			 * sibling (non-hang) queues are reset as well and the
> +			 * exec ioctl is rejected with -ECANCELED. This is
> +			 * expected and should be handled gracefully.
> +			 */
> +			do {
> +				err = __xe_exec(fd, &exec);
> +			} while (err == -ENOMEM);
> +			igt_assert(err == 0 || err == -ECANCELED);
>   		} else {
>   			xe_exec(fd, &exec);
>   		}
Reviewed-by: Jia Yao <jia.yao@intel.com>
