Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FA6C44529
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 06:11:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5F710E29F;
	Tue, 21 Jul 2026 06:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MgsHvr/Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B5510E29F
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 06:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784614264; x=1816150264;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TD8e4e/w8RFLIy8gnPLm8MdLezjGN9wZDTNcnwg4ngg=;
 b=MgsHvr/QRFHW7rcquBZuqrTMohTxc9iuuPO8pGhOG6MPnBIydvn265N6
 FHW26qIB9V/YN3l4aMBadwSgvsiJukf7tQe9fhdi3n00ML0xyU/CEh+j0
 brob1wi5nSs3Pv5PCGIZR/sWHT1cRXljvGwTz+2Ct7lGh/kWA5e/MNw/R
 VvmZBNtg1IGPZdb9wv4gubh2q15BT81fdNST7m1IsvIa6Y4Ku1AbHQqou
 t8R9Tunqvs4fLOII3K0KE4Rasq688zwfcxZe1lASWEbg4g44K7qT2od3R
 jX3o1JfuaWsOqbNsRUWjWBpPt/AJQrXjjARXaZVRK+guHGctNO4AI3/Un A==;
X-CSE-ConnectionGUID: f3eYaG1zQgCCPK910o63LQ==
X-CSE-MsgGUID: K8mMx1EKSduESFVGHkLHIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="96561831"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="96561831"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 23:11:04 -0700
X-CSE-ConnectionGUID: tvMGeWq/QG6qiFSCtYPfPA==
X-CSE-MsgGUID: DrHgrmtbRECBFf/I7ZUVNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="280933964"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 23:11:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 23:11:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 23:11:03 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.37) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 23:11:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twnUfFVXscIfUeUpRRjrp6W7TlbBtRU6lWKw6k0Fci47M4t3h76gCfLiFWqGbOEc8AGiIgpvKT27D/yioUqB5Y9rMggpAR7he4cRmaFqJyPSgDaBDxPN3dAiMQLx1y7jPTy4hVsySqkIioS8ZZ6e7kCQgFdXKCsZWB0dDxNpXJzRQs6a0gpaNCM16JIBj3ueSfjfLw+XpcdRkFE8r08Gp76XvGArKqRdXT1UVBjbUpq7jrGdkhVqGuRtqe4CGURTv+nUGs1u8OzyMff7o+ZxmRbPOozUZhDp2A4qVQF/xtp1cym7dEMdBB35Naje+PY9CDIUPipVKZ4aCGpjjfTvdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UedsTHYqNPNzBId1HmXpdNFgxy3ikA+8wCa8PTyLNw=;
 b=qarhjx2tk/F2adSXM95HnHvh8YnTpzDvrinmhRc0yiXG4tm+PwkWcXxm0hO7a78QuUKZy3DorAoNRBKsTSpzB0wHdzTRNwxkq8n2FPYxSaalHerVj1tRxgcEf0MtQjRSCIa8F4VweBRWGBDIHO/I8pwXJ5evxneLjTVdIEjZ8lWB3b0da1Uq5cjXjmlNbTZuukhTQNkvVbNyFN7dhFNagU3vrZvkkqzLfh7Dn8mJOjHmhY9BKa4WW7y/ZX8gUqNdIAKIRC6+angLMdiqr2XHFBdVOtHLoact6BGXeHQ9WdKMryYT0yaQcZElTXcgSf3iU7eoyHHlMpY0cBelW+VwFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by MW3PR11MB4604.namprd11.prod.outlook.com (2603:10b6:303:2f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 06:11:01 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.013; Tue, 21 Jul 2026
 06:11:01 +0000
Date: Tue, 21 Jul 2026 06:10:49 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 22/31] tools/intel_audio_dump: link with minimal
 sub-libraries
Message-ID: <ddvacienb5vn2ayridre5pzmy5swl2xp33k5ssts5zyp5p72sr@ipw4rd2xtlcj>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <ff8fe734c3988f904167f49964cf7ad579128ddf.1784117512.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <ff8fe734c3988f904167f49964cf7ad579128ddf.1784117512.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TL2P290CA0017.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:3::7)
 To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|MW3PR11MB4604:EE_
X-MS-Office365-Filtering-Correlation-Id: 0060dda9-67d8-4b78-c775-08dee6eed665
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: e+12r+OI3BKeaGgrAPIc27GHuwP0ZwHdtYhkb+RXmqF2iDHQVI8w3UOeYmqnoxbVzmwgZ2b4+jpHQkO7ezNBPgkF2ziA/mNGWVFOf2XraHlF31ozYAkFKk7ppl8vJ6fHWhQF0qiqJb3OvEt1R0eNX0/9+1i7KuegGKcSSaZNBi7FOYHcgSMRQXj9qFjnnKb2pyVvguWKc1b/DN7lhQsOkw0NsGq6mb+I/mRwuLeElGzCE2UKTGfV5xSjRE07pjuz6oej2eezbEcNi+PfLeQnaxz1mv4UkuUa+EToaUvJ4MXx+Lr5a0w62mA0ByYXLA08dIjDM2433icCx2Bu1nkZVb4eKuL22bX3XEfolpAv2IWXiRnH/dN3oKR2h22mJY4crgSLLM8J8ToBduIX/llBiYU8LsRWJ0nJ9NUjtLD+oTibsL52a9mW9xmAQ8DtUgfMMuFGkohX3wYFchPyGZl44SVfsZvdt/e32ty0v8/C+GYQnVdS554jckFWkUmKVLa27CDhxilOEuRtgd++vsrteXwp3f71HFFdMAXh2Duxr+13euKss/RMrmJ292gqlXgwHneWoWVnTmXmudmIjPavhRD0XXWNuOuaRTce5iP3KSIftrIkjmF6K5El2P+B8vS0VlfIkecNxNydMsOlIM9BZJogAiDVPTMQQbdX7vu2cLQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkpwR3Y1ZkhmK0k3WFl6d0xnMGcySThRT2xTb20ySndKL2lFK0lrREZlRkh6?=
 =?utf-8?B?UlFFRXdsZVAxUHBoMDBneGZZVm1zK1BxL1E2OGtkais4elRBM3I1Q0Fwam9W?=
 =?utf-8?B?UXZLVm8rcnk3b3JOYTFJT3lEWE51QmVQZTRIVUxnNjZUNjNMZmVCS21mQldY?=
 =?utf-8?B?cTVkdW8wR3d4QTA4cnVMbmM0UHRiMlk3Qmlrei9nRit2Skk4d0NpTjE4YWox?=
 =?utf-8?B?RHJZc1hNRzEyL2JBRjNTbmQ1K01Wc1k0NEx6M3Bmd01jWnI2R3NTSXBBejRI?=
 =?utf-8?B?M29YSTRJTk9TZzR3anVTc1JUR0poemFvblkzMi8wTEt1WU85RUx3Vmxvb1cz?=
 =?utf-8?B?djRYMWJwajNjcS9DYUx6dS9YSnlKL2FpN1FTbFpRZkROZ3UxaDRzbmFDNUds?=
 =?utf-8?B?azVxbDdMTzJmU3ZKZ0pGUzJCN1dESGdJbFdiVHc1aHAwRWx4c1dLS1FNL2g0?=
 =?utf-8?B?U05VdW5ZczZPWU4rQXRSNkdqNlIvMWMxQlBOQnlkV2xqeWRMVlhnZnF4SlJW?=
 =?utf-8?B?VG9yMzBnVElSL0ZiRk5CRm1kcitNSnFHTTZUQWRtaUUyRk85MDV3NEI3Ump2?=
 =?utf-8?B?T1dvQjE0Uzc5MnU3OW9PT2lGZVk3RE1yWjFlaHNUZmlmTzB5WEVQOWl5b3ZD?=
 =?utf-8?B?bDkyeVVpb3VBdExvcms2M2Z5VTl1VjZ2ZUtuUGlkRUxyZFIxZXNhU0hQWDBi?=
 =?utf-8?B?aTMzdThuR3VEMWhPUkVBNWhQQzVmWFVJb0tNS3I4bDNjU0YzMVFzR3grUE1Z?=
 =?utf-8?B?RDBmUVFzY0VHdTg0NGdSeTRDV1JGMTByeVQxQzJrandxR25GcVd5UzdPdlRL?=
 =?utf-8?B?elVTUTBsOTVVdHJBamRvL25IUTRvelRJTzdxQTc3cmt2WTJnNVpYUXo2dG14?=
 =?utf-8?B?STd3K2lrNjJKaVJ0WlpGUGxEMkNRaVY0c3dham9DOFUreDlHcFY1K29maWlu?=
 =?utf-8?B?ME5DNHZsQkx3TUE4QVpzSGhpNDlVT0VPd1NEZlYxNXJTbUU0MzJjQWlhWXc2?=
 =?utf-8?B?c1UyWjA3NkZBbVV5aUJqU3BGUS9TclByeER1c3BseHhKVCtxQ2pweWtVMEU3?=
 =?utf-8?B?d0ZqblkzanR3by9Dd0E1VmJldGJoVUJLMGtJQWYzenQyTFBRSklDaTFPSXA5?=
 =?utf-8?B?WEV5NFd0cE5oN29KMnczRThPYTVZNkdibUdhUEFFcWU5Q3dhK0R4SVBCdmxD?=
 =?utf-8?B?Qmx5M2ZTbXZ6UVhzelAwK2ZKbmM3R1lZYzRnUmpBU0tkUlZMempvM3BPM0xt?=
 =?utf-8?B?S1FweEN6T04yS2pPdEVTTHFkTS9kMUJiaDl1d0t4RjhqWHBRQXZBcW56V0pI?=
 =?utf-8?B?bXpXMzNoQWFOQzFmVDBzRkxySlRhbjM5U0Urb3VERUFlYXdsbFMrRXlGUUs0?=
 =?utf-8?B?MWRZTWdCWkVYVEpUOVJtTGY1RVdHU2N5a3JJeVBVbFZ6dERiaklqYlUvcnNB?=
 =?utf-8?B?bm1na2FQYmtDSHk0YjE3eGcxdmZoMDZHdnByd1lLVlZpV2s5WWFlZFR0S2I2?=
 =?utf-8?B?YTRoUS9ZTHJzSjFFdGt3elYvZzRObVdwb3VMd3VnemJzZDBhUjVEOHAySUlS?=
 =?utf-8?B?VlVaRzRqS3hoYk45QncwaDRuSGgrSEs3b2ZiZTRzd0VSR3dBeW96TUtIZ2FI?=
 =?utf-8?B?U1JZL1VDNzJDWkNhR3dxTFRkdmNYc1BrSnhCdlljaFluSktTaDBzbU85OGZx?=
 =?utf-8?B?WXY1TUNPdUxPOVkxSUprZytURVZleEkzOU1CNkQ3RHNZOC9KRlZXVEZmUG03?=
 =?utf-8?B?OUVXVGtRTExYcTBrbHp3SkN6NGk5cm45V0RTTzBLWHhzL1UyV0tQS2srQXBp?=
 =?utf-8?B?RDRzbXptSTQ1OU9zbUN3VUkwQmkzcGZOWGZncmV0S0JMaU1XbUFibUZ2Qmly?=
 =?utf-8?B?ZWhqNVV6MWVpR2RScXlLUm4wSWpuc2VxUmgrMG1QL0hwWUxudml2NGM0bENJ?=
 =?utf-8?B?TFdwdDFoNkxYa000ano0VUhFVG1kQkxaMEVDZnNzK2g2VWZWMkVyd08vaXg5?=
 =?utf-8?B?Sk5pbXpabWhZMHhCUjhnd2s1V2YzQ3JwUFhwUit5WklkVEVYWFRZelVBWU1B?=
 =?utf-8?B?N1ZmaitsdHd4aW15aTQ5eGNlR0RWUzBQTlVBVUhZSzdyZWFYeVhJTWVmT3Jk?=
 =?utf-8?B?OWRRRnFTM0FibWtlc1NZQ05aNlRQYXBMZVlaZHM1L2RJNVFrODI5bGdtYmM4?=
 =?utf-8?B?QThmZG9HUFA3bk1tcXgrNGF3V1FiTThLbWdHc0ppMTBrcGt0SjdxVlFBaHVq?=
 =?utf-8?B?Y1BTakswcTJaNU5qY1BBTUJCUUttd09oS1JwS2hVRitiY1c3bHZlejVmRlF0?=
 =?utf-8?B?ODNUTy81VUxEOUFwVTZPNnJxNzRRMjErMy9Ua1BZR2MyZTE0YWY2dkJZejBo?=
 =?utf-8?Q?nTKtyVZmHTp5cED4=3D?=
X-Exchange-RoutingPolicyChecked: Pm2uxfmp3qR70r7LbobxSx905Sw/j49OzYYABqZ6BPswM4FuDjdGRSDiIa7hSpHuWGqWJuJhcpFfK+dTIRzpThFuQrL2X16PgeZF86nT2Gu0JkrQE6lea8+ygvzBLt7v0QvEPVPCwHNggkZ5g+bw8MnqJdG5d+PJIX8FCn+8KFyVoK3J/umPcwNqexaog6V51BhvGX1evjw1U4M8jytQijVffAUrKGKVVf0h+8HPQeZFRmcPoeUXTJCBS9Wzlzfh2YWmtBg3iLoT/aIRVRXmElwTVrVIYJfdPNjqKHrSnqxVgXjndtv9CXV+upXH83qq+5timebn2IU+R3csmNUiUg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0060dda9-67d8-4b78-c775-08dee6eed665
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 06:11:01.4365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MRMaZFfTvm3v8fTyfO6Sfexahoi1jc9ly94G25wxQ6S34ZJCCvfFy9SjTHMQGG3xj3SxbMOkTz+qhrT88T+v09bNWbhUh3JDLIUKkbrdn+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4604
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

Hi Sebastian,

On 2026-07-15 at 14:15:32 +0200, Sebastian Brzezinka wrote:
> intel_audio_dump only needs the register/MMIO helper subset, not the
> full libigt.so stack.
> 
> Switch to linking against lib_igt_reg_tools.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   5  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 2e8ceea36..f9bbb41a9 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -14,7 +14,6 @@ endforeach
>  tools_progs = [
>  	'igt_facts',
>  	'igt_power',
> -	'intel_audio_dump',
>  	'intel_bios_dumper',
>  	'intel_display_bandwidth',
>  	'intel_display_crc',
> @@ -104,6 +103,11 @@ executable('intel_gpu_time', 'intel_gpu_time.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_audio_dump', 'intel_audio_dump.c',
> +	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 
> 2.53.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
