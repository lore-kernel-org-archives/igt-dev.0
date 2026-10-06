Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5DBCA5FED
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 16:06:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C103E10E12D;
	Tue,  6 Oct 2026 16:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g/K04nBg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F73910E3F2
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2026 16:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791302766; x=1822838766;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=G048Gz9FH/6g31Omxju5A+0+GuHAokeT6BWGj5U2Yh0=;
 b=g/K04nBgEXDRRX3lTbbZcCYcJXe2dokLAZy2jRmF3x86xO9ZXLkuArI8
 Qafztk0oWp+qT+m3JyKVOKaiu28n8MOkCQMFJTKKW2vblJ3wleSqh4kIN
 vxUGyGGcKWrU5Tag/CSRsiFB86SwacwlAC9atdbs7WXHTSRZdS7sUkmdb
 We3NoorvbeAj3qdN3l4U1L2ck79i+Q7qPJvUt65c/7QCY/tP8Cmvte/yH
 7OYn1x/hMrdWpQquwZHTl3XBNSXBqvrYILu87n6JSnzWpm0x9pPkvUJEZ
 sky4LVe3xwQIeUnWeP4tX2wJjOc9/zreNBhQnnTifZ1tp40icUR+bw2cR Q==;
X-CSE-ConnectionGUID: 2XnbtpxUTweTiBQ+NvFbzg==
X-CSE-MsgGUID: dAMorsSnT+uFt57+hW6PcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="56126"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="56126"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 09:06:06 -0700
X-CSE-ConnectionGUID: /UIeobWWQHywLiyTLWXrhg==
X-CSE-MsgGUID: 4Fz6Rz2KRPSsmRIPelDMfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="1286314"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 09:06:06 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 09:06:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 6 Oct 2026 09:06:03 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 09:06:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xhm8oTW5H0Evr1iq7FnZYI2f38fRVuNYPtJouvL4Ij8Q0/tebqLx+4ajdVnCiUUFN9MmOh9vYQ1f3EG8wE1izV9OByPK/lDpJaAHC3cTGAFAR+rjuULAPzsNx7cBtT+AruSmKdZ8Xui8IHnmAoj2ohO5Isu08TqkzitRlUTcexQhIzMGl8o2Q7IkhS4m+ap4rbEgC331I96/efLJK+z/baxM0q9HOJM2u2bH8F5+U3aGTt8HULbEPTjyzDFA5XK1ugBlevWws36xs1IzGBpvxYUD884XlKIjn3xzL6awZRLJ5XLVNzIfgqm39VFMDcWgvMdmKn81YHdTS0/hF04CuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQdwIlkTx4X0jtE3k0gTGhqfgoMsDhJT4VOpiHfyBv8=;
 b=I7F8yNrMbql1+fjNBmVuOZEaTDsVRuZIlhCQsp/9Kjbcj9Uh1MPMqK+RGUnoJgwA9t8jI4kXDRM91cPet17iqQNUocNaRY9gX3AP2J+LdFmXPKfddsHCZ33tZUrexoe4Xeg3vUpYqt21OhgjmzpvLQwLGqlGfhvJ0QSWViN1c6gSjfUy6+QMT5YAFDfl3OpXk9NLXB07b25SBTWcUhqK8ylhzTYLTE5xUI14rnn2/tO0IzPF9rtyKGUesrfwKP9qDUyZOJhdsqDlrVcL4ggwFroQHvUrw9m1Ly2K5lHBHQspYSpbHKYDaP9iPUq6zneVYAtJlRr4vYuhNUNy5+gNAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB5100.namprd11.prod.outlook.com (2603:10b6:806:119::11)
 by SA3PR11MB7527.namprd11.prod.outlook.com (2603:10b6:806:314::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Tue, 6 Oct
 2026 16:05:53 +0000
Received: from SA2PR11MB5100.namprd11.prod.outlook.com
 ([fe80::2e36:25c7:b8d7:1a67]) by SA2PR11MB5100.namprd11.prod.outlook.com
 ([fe80::2e36:25c7:b8d7:1a67%6]) with mapi id 15.21.0472.015; Tue, 6 Oct 2026
 16:05:53 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_pmu: Do not enable VFs in
 unrelated subtests
In-Reply-To: <20261006144440.alu37vjplb5igvxx@kamilkon-DESK.igk.intel.com>
References: <20261006-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-v2-1-38f204d54553@intel.com>
 <20261006142331.ofwjxlkvt6an5tit@kamilkon-DESK.igk.intel.com>
 <87tsmydhs7.fsf@intel.com>
 <20261006144440.alu37vjplb5igvxx@kamilkon-DESK.igk.intel.com>
Date: Tue, 6 Oct 2026 13:05:48 -0300
Message-ID: <87qzi2ddb7.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0222.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::17) To SA2PR11MB5100.namprd11.prod.outlook.com
 (2603:10b6:806:119::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB5100:EE_|SA3PR11MB7527:EE_
X-MS-Office365-Filtering-Correlation-Id: 43555d8e-365f-4c13-1ecd-08df23c3b24c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|260925022911599003|4143699003|260925021311599003|260925021911599003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: qreicCUODB10fOVbmQLRUtrLgsZGC56FoB/NwD4rEbOGytxaAl+tgA5u+ZLEfv6N5p+YWVCLnTrF5Vx92Wh+HnLc/0svSWRQDjwGPULiyhIecOO07Clv4Cki0xAbGxqlYX3jeEiUvC+Go/HNe2twnBfS2jhIGmcumZ4oSPZDI3MzVHxUMFH7yLYxFWtgVT5TCyj/OmZGmV9UMTOHNSwsJJqLm4VeRStqfoBnhPURykrSo26Y4Zv8KNqGuvX5PD0+msI0dyht6r//r5pm61joOYF17DsasHT+5p2lvNdI+R4Q7NTtXRhkPCftojzSq7g8YvZ4rp2hPJFF+/vAvay+K2nWd/ze9JjzAYdII/+vNIHQpGZIkE8G/n2HKMPYYLAdnmRsj8uXltgt6zaEmOhJBPUPHhYfwsuRa0b9xGjomYxn7l0dyht4RPYD34wbJmha2YAvoSNoOUhn2uPDBgQTsUdFtZmeVCv/aaOh7OEdXLytoRteJ4D0zcHeCB3RuGpA0COsqw4o7De4VwATWmr1eDN8YYXgrbwEhpzRXlFSqogYmiq7jnymxJ3YSLDkKG2/oUMr9YCnFRmLWd7gMizmPor2i5A+B3g9GX2nfKBY0DdWn41hvsqyHv3RlvRgyUwJlQ/AEnSg4YSneZp3bQlx1blf0ty6g66fEsw8PM5EZTU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5100.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(260925022911599003)(4143699003)(260925021311599003)(260925021911599003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+HF0xycrRJTDSZnV/bW2iTGFaHgA3zof0D2Oh7fyFL3LpH/mn0Pek9zB0HaS?=
 =?us-ascii?Q?dvZHTJi1LlJ7hLqyqTH6vmCFFX7CrCaKmoeCTafs83sMIJqIWg0ZrFtIE5LP?=
 =?us-ascii?Q?2I6aePnbWpUqJonjkGihrTDkJ9nlEiEqIAyKe4stUeOfASlqPn1I1pjzydWA?=
 =?us-ascii?Q?/ACc+kj6rnCC4K7rruhcOxXQ3zPsBTtqPsO9+IYXDZF1LCkLCMLylARTrUVP?=
 =?us-ascii?Q?22A7O8UriUjjtQDYvO/dBnxlhD5bL8tMc90jbBCp/j98lIEwzhs7rvECsROR?=
 =?us-ascii?Q?ot1WCU+imPWbll0HnmwksXXD2FDB8fKULUafoCqUizizhpFy+OXPBY5dMAUO?=
 =?us-ascii?Q?cJA+x3Pk4vkc8evfmqDtaueZSk60euci6mPgBfGNBKA2fVkBlGBK0v87EbQU?=
 =?us-ascii?Q?LcR0CJRa78HC1EubvCRS9BQ3fxb/s0i7qCWiEIb2i0Ww+FF+6KSLhN2rcAcw?=
 =?us-ascii?Q?z6654uZqiPOx0mXqBtguCUwyiS7G3qvmSGLwcUXJxSQwqthuLiXIdGtbjK5G?=
 =?us-ascii?Q?Dz46nYRTN8ASK9ughNhqduxEpjfcPyQA4JSQw15mOHpvlFeltWoWcCIN9tEe?=
 =?us-ascii?Q?9HB2+m3g7ROYsEvFnRsvrnoZHkoOO0ZZQ+c0w97Fwdr+GMsSPwzs5XAsnKd8?=
 =?us-ascii?Q?NJox0FwweTNINq/6RvwPSaTnT0fXB/u7yZ6HToTf9deSZgzaiun6qT4qkTym?=
 =?us-ascii?Q?+tZyO9Sy88MtYH6aaVFLvcFaqhtb+iL/UpR1lNXRVV2hC/LAlOEBxRKecB0Y?=
 =?us-ascii?Q?EtTXvNdq1/MHpj9byi/uOh5QWlvNemhH2W+OC8F6145nvu7/csuCT+CG8FFW?=
 =?us-ascii?Q?1CL96bN2FZ/8OsargyTEOKSYCGxfPHz8bLbDRdVXd5b1UpN/J/mN5DSPQQVm?=
 =?us-ascii?Q?BgbBYzUYZ3TR9Oj/BJqWrWRStDmLyp1FrDcUTPhQNBAgf2WnbCeWmCisPUvB?=
 =?us-ascii?Q?3hOSIZn4TzRcUUXTh7YCaffnvN+FA8qCNiNtueqQJWxlldGWQIIUprbYoM7d?=
 =?us-ascii?Q?g6GJr5P2V4GHzDPbIEBu0swr6fX/A6pqjZ6G3mt1AoMwTYGakQvzo/Cl7mHB?=
 =?us-ascii?Q?i+s0ZOxoCYtJbqs2FKvsmWdkYB2H98cyRehAqzkoBOLKssKD6BXSSGrFgODG?=
 =?us-ascii?Q?fj5HoyKoNbNL42Y3+cMDmN6i/adr58YCdIKEjyctp64xZDaTkNU8znoJX35R?=
 =?us-ascii?Q?3pGSb91J6BRerKuzxWR150SV3pFehA3azoXyhqzXe0VcbOkobLP1Dnwie3U6?=
 =?us-ascii?Q?hLGqCuwH2rpRYySSqkqramIhzuX4MX82dBxYfU+fhF9ow7LEtuu+/hXdL3RK?=
 =?us-ascii?Q?PJ33IY7wTm2J/8+aDC1GwsamCW7yHglrdEmqHQ9wXwz2D8H8v5Btb566dbiN?=
 =?us-ascii?Q?K42eQiJSpCohIdWXE8LFFmFcZ3k5EXwp+9qvImBtl4wKtK4iu5xSXTmcS4hO?=
 =?us-ascii?Q?mOSEGSKdy5Meh5vm9+W2XUvpQ81PPnTPq1RpyFlqvXjMVNeUtZVQX7WC35Qo?=
 =?us-ascii?Q?oijh10Vdhl6kJrkgKxWe670M/HwHnIdsHhZ7lOEhgHa0E4t0CkYyM3eJIXpa?=
 =?us-ascii?Q?Gpe4vwL5iIwVd4GxVA6SeDvhH3ob+FnpdTp0XXBAEcWX7C7x5Uh8TO9k2Cvr?=
 =?us-ascii?Q?qfvwOX3GGE+wMZiJdiAiNyBb3pYq51BZM8Qqq1xa+s1SPZNLoj/1rfc2qpX2?=
 =?us-ascii?Q?30pD3w4um/Qo1dJ4MkdPd9VCSno1XR5is6ZjU3GgzHk3K/0txX2XiRk6aE2+?=
 =?us-ascii?Q?JA0FhXFEGA=3D=3D?=
X-Exchange-RoutingPolicyChecked: v/2lZbDDrAI2tmxz/HU3jXthDKfkdnycMlY5g3gcNkjwzk3HbPKvTeROwSTPz9ajnl4idk5p3VPEu7V9UYIJSuYS6PAS3esPBizOORTSBVxnDerFnnb+Y6AAPZn2CJ66a0E4xQsrsSNhWbK4H2ieBQA7T+AIZJtL2Z8wYuBMkMhbULQgaIpLzlfyfQJVvgSK1puJ8OQGCgF/nLUQpcybw74O/ljgY+1waJ6DDi2JmOdUSrOMaWWZ1JL7p1Dqs72ImJpytN9eL0QriUnSsONEpqyLF7fDPYjWzrrRXIUH1fG3ecznNxHy7N0FEHomIQ/BBIi0mI6zC+DwS+pq/y4XQg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 43555d8e-365f-4c13-1ecd-08df23c3b24c
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5100.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 16:05:53.0604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iq5wYbQcBHaxv3Tk1di5x4ELeelCgXVgpwdSUK+mhHxzKXMV+6zdpWzgkQWpKs+6wj2hfo3L5W2BvfH0QpcbLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7527
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

Kamil Konieczny <kamil.konieczny@linux.intel.com> writes:

> Hi Gustavo,
> On 2026-10-06 at 11:29:12 -0300, Gustavo Sousa wrote:
>> Kamil Konieczny <kamil.konieczny@linux.intel.com> writes:
>> 
>> > Hi Gustavo,
>> > On 2026-10-06 at 11:11:19 -0300, Gustavo Sousa wrote:
>> >> The test xe_pmu has a subtest group that enables SRIOV VFs as part of
>> >> its fixture.  Even though the fixture is part of a subtest group, the
>> >> enabling/disabling will happen regardless of whether those subests are
>> >> selected or not (via --run-subtest).
>> >> 
>> >> As most subtests in xe_pmu don't need that, avoid doing that as a
>> >> fixture and rather incorporate the enabling/disabling as part of a new
>> >> macro called test_each_engine_with_vfs().
>> >> 
>> >> v2:
>> >>   - Add "intel" to commit subject prefix. (Kamil)
>> >>   - Fix argument name of test_each_engine_with_vfs():
>> >>     s/num_vfs/num_fns/. (Kamil)
>> >>   - Enable/disable VFs only once per macro call by moving the call to
>> >>     xe_for_each_engine() inside the for-loop. (Marcin)
>> >> 
>> >> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> >> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> >> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> >> ---
>> >>  tests/intel/xe_pmu.c | 21 ++++++++++++---------
>> >>  1 file changed, 12 insertions(+), 9 deletions(-)
>> >> 
>> >> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>> >> index d41ebba1faef..eda56c078653 100644
>> >> --- a/tests/intel/xe_pmu.c
>> >> +++ b/tests/intel/xe_pmu.c
>> >> @@ -124,6 +124,15 @@ static bool has_engine_active_ticks;
>> >>  			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class), \
>> >>  				      hwe->engine_instance)
>> >>  
>> >> +#define test_each_engine_with_vfs(test, fd, hwe, num_fns) \
>> >> +	igt_subtest_with_dynamic(test) \
>> >> +		for (num_fns = enable_and_provision_vfs(fd) + 1; \
>> >> +		     num_fns; \
>> >> +		     unprovision_and_disable_vfs(fd), num_fns = 0) \
>> >> +			xe_for_each_engine(fd, hwe) \
>> >> +				igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class), \
>> >> +					      hwe->engine_instance)
>> >> +
>> >>  static bool has_event(const char *device, const char *event)
>> >>  {
>> >>  	char buf[512];
>> >> @@ -1192,26 +1201,20 @@ int igt_main()
>> >>  	igt_subtest_group() {
>> >>  		unsigned int num_fns;
>> >>  
>> >> -		igt_fixture()
>> >> -			num_fns = enable_and_provision_vfs(fd) + 1;
>> >> -
>> >>  		igt_describe("Validate engine activity on all functions");
>> >> -		test_each_engine("all-fn-engine-activity-load", fd, eci)
>> >> +		test_each_engine_with_vfs("all-fn-engine-activity-load", fd, eci, num_fns)
>> >>  			engine_activity_all_fn(fd, eci, num_fns);
>> >>  
>> >>  		igt_describe("Validate per-function engine activity");
>> >> -		test_each_engine("fn-engine-activity-load", fd, eci)
>> >> +		test_each_engine_with_vfs("fn-engine-activity-load", fd, eci, num_fns)
>> >>  			for (int fn = 0; fn < num_fns; fn++)
>> >>  				engine_activity_fn(fd, eci, fn, XE_SRIOV_SCHED_PRIORITY_LOW);
>> >>  
>> >>  		igt_describe("Validate per-function engine activity when sched-if-idle is set");
>> >> -		test_each_engine("fn-engine-activity-sched-if-idle", fd, eci) {
>> >> +		test_each_engine_with_vfs("fn-engine-activity-sched-if-idle", fd, eci, num_fns) {
>> >>  			for (int fn = 0; fn < num_fns; fn++)
>> >>  				engine_activity_fn(fd, eci, fn, XE_SRIOV_SCHED_PRIORITY_NORMAL);
>> >>  		}
>> >> -
>> >> -		igt_fixture()
>> >> -			unprovision_and_disable_vfs(fd);
>> >
>> > Hmm, maybe that last one should stay, test should do a cleanup,
>> > after it ends with igt_assert() or skip, for example:
>> >
>> > 		igt_fixture() {
>> > 			if (num_nfs)
>> > 				unprovision_and_disable_vfs(fd);
>> > 		}
>> 
>> The cleanup is already done in the for-loop generated by the macro. Do
>> you see a case where we really need this extra cleanup call?
>
> When test fails due to igt_assert(), code execution jumps to
> next igt_fixture, so also no cleanup will happen in for-loop.

I think skip and assertion failures actually make the program jump
back to where the igt_dynamic_f() was called, no?

Here is an example code (saved as tests/foo.c):

    #include "igt_core.h"
    
    static void run_dynamic_test_logic(int index)
    {
    	igt_info("Running dynamic work for iteration %d...\n", index + 1);
    	igt_assert_f(index != 1, "Intentional IGT assertion failure on the 2nd dynamic subtest!\n");
    	igt_skip_on_f(index == 2, "Intentional IGT skip on the 3rd dynamic subtest!\n");
    	igt_info("Dynamic work for iteration %d completed successfully.\n", index + 1);
    }
    
    int igt_main()
    {
    	igt_subtest_with_dynamic("container-subtest") {
    		for (int i = 0; i < 3; i++) {
    			igt_info("\nBefore calling igt_dynamic_f().\n");
    			igt_dynamic_f("dynamic-subtest-%d", i) {
    				run_dynamic_test_logic(i);
    			}
    			igt_info("After calling igt_dynamic_f().\n\n");
    		}
    	}
    }
    

, and here is the output of compiling and running it:

    $ ninja -C build tests/foo && ./build/tests/foo
    ninja: Entering directory `build'
    [1/9] Compiling C object tests/foo.p/foo.c.o
    [2/9] Generating lib/version.h with a custom command
    [3/3] Linking target tests/foo
    IGT-Version: 2.6-g095481e279a9 (x86_64) (Linux: 7.2.7-200.fc44.x86_64 x86_64)
    Using IGT_SRANDOM=1791302421 for randomisation
    Starting subtest: container-subtest
    
    Before calling igt_dynamic_f().
    Starting dynamic subtest: dynamic-subtest-0
    Running dynamic work for iteration 1...
    Dynamic work for iteration 1 completed successfully.
    Dynamic subtest dynamic-subtest-0: SUCCESS (0.000s)
    After calling igt_dynamic_f().
    
    
    Before calling igt_dynamic_f().
    Starting dynamic subtest: dynamic-subtest-1
    Running dynamic work for iteration 2...
    [61375.969517] (foo:1196168) CRITICAL: Test assertion failure function run_dynamic_test_logic, file ../tests/foo.c:6:
    [61375.969520] (foo:1196168) CRITICAL: Failed assertion: index != 1
    [61375.969527] (foo:1196168) CRITICAL: Last errno: 13, Permission denied
    [61375.969528] (foo:1196168) CRITICAL: Intentional IGT assertion failure on the 2nd dynamic subtest!
    Stack trace: not implemented
    Dynamic subtest dynamic-subtest-1 failed.
    **** DEBUG ****
    [61375.969512] (foo:1196168) INFO: Running dynamic work for iteration 2...
    [61375.969517] (foo:1196168) CRITICAL: Test assertion failure function run_dynamic_test_logic, file ../tests/foo.c:6:
    [61375.969520] (foo:1196168) CRITICAL: Failed assertion: index != 1
    [61375.969527] (foo:1196168) CRITICAL: Last errno: 13, Permission denied
    [61375.969528] (foo:1196168) CRITICAL: Intentional IGT assertion failure on the 2nd dynamic subtest!
    [61375.969530] (foo:1196168) igt_core-INFO: Stack trace: not implemented
    ****  END  ****
    Dynamic subtest dynamic-subtest-1: FAIL (0.000s)
    After calling igt_dynamic_f().
    
    
    Before calling igt_dynamic_f().
    Starting dynamic subtest: dynamic-subtest-2
    Running dynamic work for iteration 3...
    Test requirement not met in function run_dynamic_test_logic, file ../tests/foo.c:7:
    Test requirement: !(index == 2)
    Intentional IGT skip on the 3rd dynamic subtest!
    Last errno: 13, Permission denied
    Dynamic subtest dynamic-subtest-2: SKIP (0.000s)
    After calling igt_dynamic_f().
    
    Subtest container-subtest: FAIL (0.000s)

--
Gustavo Sousa
>
> Regards,
> Kamil
>
>> 
>> --
>> Gustavo Sousa
>> 
>> > 	
>> >
>> > Regards,
>> > Kamil
>> >
>> >>  	}
>> >>  
>> >>  	igt_subtest_group() {
>> >> 
>> >> ---
>> >> base-commit: faad2cd0e3e8eb2e18111c2358823a7bdfb56d94
>> >> change-id: 20261005-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-e24c1cd95d71
>> >> 
>> >> Best regards,
>> >> --  
>> >> Gustavo Sousa <gustavo.sousa@intel.com>
>> >> 
