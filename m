Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D00CC5DF74
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 14:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0EB810E00B;
	Tue, 18 Aug 2026 14:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q1ZEBXOb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933B110E00B
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 14:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787062558; x=1818598558;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0shH3F2UkNRh/sDscWASHpp7OdfAygYPyY8I84lfT9Q=;
 b=Q1ZEBXOb9qcLj38oxfkyl7W2kEVBKLeUA9+kjvp7ZyZI0MLzX8CrsNIY
 inrDZRh/xkeDei6tkYm2xwFf6PmPRiNE91lSDCT6LDAtdze+IopvMnfQv
 /XUxJ+AAl4qT6J7ItrP+OBLcIU1fvo7QF/QuC+p633ycP+ud3/mYDezCz
 OPv2tLuHSXzFC44MFPAtYhugl1k2SCd4tWy7MF/QbMhVFpaJPy6Fq4c/C
 8XXPjHdqDGFSiyiXs/mUyKC2VpNv0vlxtKvMieu/jytql9/seybnShqlB
 uhNACjOKJW8Oq38vA601cEIKEO+HOdtZsr+RBGewB0wQae6sqodz7DR6P g==;
X-CSE-ConnectionGUID: FOmXSl9lTQ6OWoYlIlZe/Q==
X-CSE-MsgGUID: iQ4/bOqcTWCZww68i030dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98709943"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98709943"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 07:15:58 -0700
X-CSE-ConnectionGUID: Po5nW/6tQseI4wUFPGNoJg==
X-CSE-MsgGUID: 0+kuswz6Q+eK6AlVuGZW5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="264794383"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 07:15:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 07:15:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 07:15:57 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 07:15:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RwojdMnSNRxvw7dOL41WGlr/YZi4AY1rUJNiiEqKiwHH0OsA+IIPVdOrvR0LzSYkRU3AbDm13Wz5DgORo6Icb+2DJXjjStMgnmIowisGIRWuA9Yk8Y9++/cgHJTJq4js8OXBOIzynh32bHu10E30H/ht9QrECJYp4g3NfMecDaw26Owiprg29REpBzcE5GcV6y78v7zNt/tHIeD21bCwfg81PFY7BMsyZpJTKkXEz5v6cruvsZeamsIsrNNI0mxJEMYSdga3LDzV1GsQJ+f00lfpWKvDdZIgtNF4rjD2muIGxHAasDldAGMJxgz23n12+bw06m43urhzR97BZjvEAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLZeu0dfufiAQVDMZVFLwsCMHaoFg5nZb5sHalc0BTM=;
 b=Q4sfGY+9fk7N/Yu4wcG8BCulTlhLDAmbv3Q9B555j3q/78VNIr8R62EMtekn8yX7YBVQZfYj+RzjdXw+tKXvEiCPl1yyPaTHnbUndvJCGeSm1YVH7cj9qcz4oxPau4ZRyPyNJLIyZUIxKAlXyF7L9nQK6pp1O6cUyiM0ffzcJFXxLYgrUO3YH/eKnKDcNFDWM2ByHq/YMRueQE7+U4N3ge/CJ/zjpgsPIYDH5z/l6l35xZajIq8DQ1wJ0uW7KNVS9BnVrDkGVmxGm3bBjfaz7sn0Jl2/KByJPCKbQq86mo2apygcOxOJLR/p5myMvK90Er5BTShHkKVMVvNSLtA8ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by LVUPR11MB9857.namprd11.prod.outlook.com (2603:10b6:408:38b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 14:15:55 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 14:15:54 +0000
Message-ID: <2e051164-f74e-4292-ab5a-68391d3e636d@intel.com>
Date: Tue, 18 Aug 2026 16:15:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/6] tests/intel/xe_sriov_scheduling: Use safe
 scheduling params helpers
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <cover.1787056235.git.marcin.bernatowicz@linux.intel.com>
 <62fd6c4bbb320576d774d1752d5bf2da3d1b4af3.1787056235.git.marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <62fd6c4bbb320576d774d1752d5bf2da3d1b4af3.1787056235.git.marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0018.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::19) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|LVUPR11MB9857:EE_
X-MS-Office365-Filtering-Correlation-Id: 86400525-99b3-4c11-66de-08defd33370f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: lAfsFdSMlDIuaotyOa+rvhIWaMIleBl1GZvTFSTv63p4b/rpYLMzGC1eutbKQ0NHAHW/539/Q9ocDOnh2feU98X4uN0ZEGqsepZiPKzY52IktVW0/RCXZqHfnqrEfNRc9J2YArG2ygM17mMQ65CNtFBVYyMJOzfRLkvOdacEFCUCIy09Xxjc8ASRNMkXr+2MYIaXqkEnQHn6vW7ZH2Q4Vz4zbzn2cAEgQdXKQEEsN1eNPis+1OO1MYT3W6Ug0WegNsJGd4lt3myRvaYDgv7V/KRe6N7Y+XNpACtU0iLB+j5B6pMRJu6QSrjIXxUYVrh9vekNKwcvC+zqyezYZ+Dl3jC+R+YfDniROHCSoXGJJQjcsEdn0Hg6z6mwLK+p5R8Km8dY1tnixC1tSdVf8FzfB1iyOZoc7zRKSTo3bBk0lqCo8laIMUjiJOyVe4wOB/LYm5W1NqMfFKnCX48wyeVTjG4FPze9Zk065sqrGn26gEE8gfhnCiSJAR7x2vBXTuYrAV2MPCF0OEVUHgC9KNSlFCzhrAWJw9brSEqyCKiE3ge86URAvYUgnS2BbezVMgAnd+8nPOD/TzFC28XP7lYpEh0qcaE7tkkX25kzJD4QhaHZHqzkNy64EJi5G69DaK5iTP/lxpssPUn1ZQ0RTezcuCMRDSM8ZW6QVDuVogcbo2c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkJQR3JJeWFuM1h0b1ZtVmNncFJoaXNuRkRpNXRSbjFNaW5XeS8vWnYwdmVT?=
 =?utf-8?B?cG81ZHVhRjFqeDJZMDR0d2VBR3F5TkloOFNjOHNkYnpsY3paNTFBVjhFWUJV?=
 =?utf-8?B?YWtON09rSHVPWkVKaXpYVnBkZnRsM0llV1J4N3B4Y0pjazBCZElpWkVNUHBG?=
 =?utf-8?B?eVhMWXArWnZTZHlSWjJORUh5Z2JGbnNYUVBPMkpLdTRSM2lDQkhld2plSkxw?=
 =?utf-8?B?WFQ2TzdrMXVKWC9iZ0l4TlFwcnRQWmQ5QVhOUCs1SW05dzI5dFFZZzYrSHRC?=
 =?utf-8?B?ODRsa0huQi9pV2lHVjNVaHZUTFBSUDlhTDBEVzQ0TlcxRDNtTGRHRVFhRDVK?=
 =?utf-8?B?TmVsWHozZ3NRMEY1alF2R3dnUHdFa1RGRzQ3ZnRlMnJreElmdWk4MkJXY1Q1?=
 =?utf-8?B?TTBsenY0UHNKTWk0Nkl3S1ZueitRWWhMWExMK0MvcHlUdnBTRGptZFNhd0N3?=
 =?utf-8?B?bHRwRWg4dS9lMWtlRzhvZG1SWkgrMGtDNk1VamJSeGtPdWMrREZ3eEl5UmJy?=
 =?utf-8?B?VjNRRStmZDhVM3BtU0JBaVRrS3J2NnVpL0ljU1RRUjl6UWlBTEVESm1ienpi?=
 =?utf-8?B?cEZzb3lSZXFvMUM1dWx1eExBUkI2U3ppUlRkMVdGOUVBdExyQk1rREMxOTB5?=
 =?utf-8?B?OEVab0hiOWxubm9RYVp4cGhyWUhQVW9XRnZzRlo3eFdkQmxZSGRRMHNTRlNk?=
 =?utf-8?B?WUMxckpGM0IzdGQ5MDJxdkRXclg4STdwTXA5djBVcmJTdzhNTXIzS1FYdDEw?=
 =?utf-8?B?bnRERFhpVGZzV0hNODVReGZtZVUxK3lhMUYvRmxCVmJKdmw4eTI0RUZLWXVr?=
 =?utf-8?B?OCtRNHZ3QVpqY1paczV5aTZ2QXVuSWprNEczUUVnSzZEMHRWY08zMUlteVRU?=
 =?utf-8?B?dnNFMDFrQ3pTZmFnczQ5Vys0UGdCdkk3Q2FQSm82V0NXeHVVY2hSbjNMd3py?=
 =?utf-8?B?RGcwbjZlVkpjZzZsWkl6ZTEzbWt0bkZYOW5KL3FMNVN2Vk1EUHlkY25IaEVr?=
 =?utf-8?B?aWFKZm51dUt1a1F6ZW1pT0d4Mk0vT3lBamlSYk1nOTY3aE1jY0lNQXZIT3Mr?=
 =?utf-8?B?NWZzdDVpZEg0aUlJYXhpNitVamNhT1ZVNWVWZllQZVRvNjRJTExqTWgwV09X?=
 =?utf-8?B?eW91UHpzQ2xNcWR4YVdIc0thRWd6ZnZEQkdMN0lBRzhudExTT2hmYTgrRkR4?=
 =?utf-8?B?M1VBWTJmZFRDSHE4bUJsRFl3SFZGMXFxS2w2WGlSeTZneDVRSjNlNFA3MXZB?=
 =?utf-8?B?bFEvSDNXYXNPRWhyZkgxbURic2RLVlJiVW1ZdzBTSnBvTExSOUdYTFcvL1Rj?=
 =?utf-8?B?TGY0bi9obElVWjUzZmVzd0dPdGF5bm9OSFNUZlIwSXNQcHlVb0pUSUlTNGVE?=
 =?utf-8?B?SUxiRG51bmI0SDBmUWxQWFFyazh6dFNQM0dhZitxTzNVcUg0c2oyM0tlNDdz?=
 =?utf-8?B?Ry9rdWJXZ1c2VHM1aVZSeGNreVBPUWdVMk9ScHA2Y3JxNWJsdVNYOGpmWXBl?=
 =?utf-8?B?THFmN0pWY2x3bFErc25UYkRrc2d0WjdQN0pkaTBTT0NXKzhkOXlISHMyZnJS?=
 =?utf-8?B?TzlMRUkxd3o5NlozY2dYREQwdXdIK3hUT1BERnlrWVowN09SZ0N4OGFwaFU3?=
 =?utf-8?B?dUZ1dUV3d3YzR3JoWElXN3c0SDNBWE51QUt2bk5ZamU3aFlQeVhLMzY1dXVW?=
 =?utf-8?B?RHdxVkc5YjcyT2s4dEhwMUErS0ZzRnNzdzl5am12NnoxT1YyWXBwTGZ0Tm02?=
 =?utf-8?B?eW43Wm9SSHkvd2g0clRxM1NzanZEYXUrRTVvMzk5TEZLU3pEWi80a05JVmdR?=
 =?utf-8?B?OXJONTVEdEdMZU43T0ZNd0FrRmViSjd0Qm1ldy9taUV5U3laNFJYRStzZEFp?=
 =?utf-8?B?eW9XSzZidUFYbFBXU01BOXlBaitYcUVVSUJMRHh3ZUxTaDhwelBzNGtKdjhY?=
 =?utf-8?B?V21PZkVZL3VKY24zSTlPTzhzYUpsUUtWVWV1SGlNempIVWc1SlVIY3FWdkpo?=
 =?utf-8?B?aWgvekwrVExJeUJYblpES2ZaTmJ1S2lqSzBlTjZoWjBSRmpBZ2ZvbzVWaEUz?=
 =?utf-8?B?eVFLNlh5cmxWZytqekJVbllEYWdCVlhkWGlpN3ZVSGRSNUNmRVhoZDBHa25x?=
 =?utf-8?B?NllCYTZtcnhuVnh0V0gvSzNRSVJGTVo4enAxclR6Z2xuL21KUkVOejBkR2My?=
 =?utf-8?B?aGFueEE1QUdOT3NPblRnQnZJeVlleGJ1b2xTUFlPR2kybWNudDdYOGxGcTMy?=
 =?utf-8?B?R2VNdHVZYzJPZzNNclBUbDJkeURyMnRGZlY2Q1dxZHA4MDh2MEsvc0Z2Nko2?=
 =?utf-8?B?ak12cXpLdy9SenU0SFV3alJYcTd1bStqZjh4NzUxZGlwOVc4a09NZz09?=
X-Exchange-RoutingPolicyChecked: Xm37V7yQuibH4vvgm4W1JfQHY5K5mp0ACJETBnjri6igzjjzevssNGw7UGV3Y2XD4r3C7KqjrCCC3wLujBLbdT/VPW4NbUUYWnFC+MEpuIpDgn+1EkImpaAfgFdw+7IfDu28D/ucv/oInOleH4e+hd9+Gzuo/rQqmExvZvLSfWNio7fjIDQLffuh3Sa13Qn3hi2xjDNOvCPPrG4QNvqKAtOo//nZpWDm7LgP7vQfROj9Hv72FadTBYahCYWe/iPnzYWMHTsCBp4nADfoZUW5tOEVXusUMeag49E2CZ8vXWDFtnZkKH0vZFN+fFtGnlBFETic3enhPEKzHn9rin6esw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 86400525-99b3-4c11-66de-08defd33370f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 14:15:54.6782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+kuALopceKonbOP7E6cBkkn4SnuKFC8aIC3zfXsqjq1mlzv+4QxWr0hNXsC9TMf5GahAlv0ylNOB3Bja0+zCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9857
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


On 8/18/2026 14:39, Marcin Bernatowicz wrote:
> The test open coded provisioning as execution quantum, preemption timeout
> and then priority, and reused the same helper for cleanup by passing an
> all zero params struct. On the cleanup path that raised priority handling
> last, so a function could be left with priority above LOW while
> timeslicing was already infinite.
>
> Drop the local helpers and use xe_sriov_admin_bulk_set_sched_params() for
> provisioning and __xe_sriov_admin_bulk_restore_sched_defaults() for
> cleanup, which apply the safe order for each direction. The invalid
> combination of infinite timeslicing with priority above LOW is no longer
> representable.
>
> Assisted-by: Copilot:Claude-Opus-5
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   tests/intel/xe_sriov_scheduling.c | 86 +++++++++----------------------
>   1 file changed, 23 insertions(+), 63 deletions(-)
>
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index 5e4001219..75f1b2322 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -369,44 +369,6 @@ static void init_vf_ids(uint8_t *array, size_t n,
>   	}
>   }
>   
> -struct vf_sched_params {
> -	uint32_t exec_quantum_ms;
> -	uint32_t preempt_timeout_us;
> -	enum xe_sriov_sched_priority priority;
> -};
> -
> -static int __set_vfs_scheduling_params(int pf_fd, int num_vfs,
> -				       const struct vf_sched_params *p)
> -{
> -	int ret = 0;
> -
> -	ret = __xe_sriov_admin_bulk_set_exec_quantum_ms(pf_fd, p->exec_quantum_ms);
> -	if (igt_warn_on_f(ret,
> -			  "Failed to bulk set exec quantum=%u: %d\n",
> -			  p->exec_quantum_ms, ret))
> -		return ret;
> -
> -	ret = __xe_sriov_admin_bulk_set_preempt_timeout_us(pf_fd, p->preempt_timeout_us);
> -	if (igt_warn_on_f(ret,
> -			  "Failed to bulk set preempt timeout=%u: %d\n",
> -			  p->preempt_timeout_us, ret))
> -		return ret;
> -
> -	ret = __xe_sriov_admin_bulk_set_sched_priority(pf_fd, p->priority);
> -	if (igt_warn_on_f(ret,
> -			  "Failed to bulk set sched priority=%d: %d\n",
> -			  p->priority, ret))
> -		return ret;
> -
> -	return ret;
> -}
> -
> -static void set_vfs_scheduling_params(int pf_fd, int num_vfs,
> -				      const struct vf_sched_params *p)
> -{
> -	igt_assert_eq(0, __set_vfs_scheduling_params(pf_fd, num_vfs, p));
> -}
> -
>   static bool check_within_epsilon(const double x, const double ref, const double tol)
>   {
>   	return x <= (1.0 + tol) * ref && x >= (1.0 - tol) * ref;
> @@ -483,7 +445,7 @@ static void compute_common_time_frame_stats(struct subm_set *set)
>   struct job_sched_params {
>   	int duration_ms;
>   	int num_repeats;
> -	struct vf_sched_params sched_params;
> +	struct xe_sriov_sched_params sched_params;
>   };
>   
>   static uint32_t sysfs_get_job_timeout_ms(int fd, const struct drm_xe_engine_class_instance *eci)
> @@ -566,15 +528,17 @@ static unsigned int select_inflight_k(unsigned int duration_ms,
>   	return 2;
>   }
>   
> -static struct vf_sched_params prepare_vf_sched_params(int num_threads,
> -						      int min_num_repeats,
> -						      int job_timeout_ms,
> -						      const struct subm_opts *opts,
> -						      enum xe_sriov_sched_priority priority)
> +static struct xe_sriov_sched_params prepare_vf_sched_params(int num_threads,
> +							    int min_num_repeats,
> +							    int job_timeout_ms,
> +							    const struct subm_opts *opts,
> +							    enum xe_sriov_sched_priority priority)
>   {
> -	struct vf_sched_params params = { MIN_EXEC_QUANTUM_MS,
> -					  derive_preempt_timeout_us(MIN_EXEC_QUANTUM_MS),
> -						  priority };
> +	struct xe_sriov_sched_params params = {
> +		.exec_quantum_ms = MIN_EXEC_QUANTUM_MS,
> +		.preempt_timeout_us = derive_preempt_timeout_us(MIN_EXEC_QUANTUM_MS),
> +		.priority = priority,
> +	};
>   
>   	if (opts->exec_quantum_ms || opts->preempt_timeout_us) {
>   		if (opts->exec_quantum_ms)
> @@ -617,7 +581,7 @@ prepare_job_sched_params(int num_threads, int job_timeout_ms, const struct subm_
>   
>   struct vf_config {
>   	unsigned int vf_id;
> -	struct vf_sched_params sched_params;
> +	struct xe_sriov_sched_params sched_params;
>   	bool run_workload;
>   };
>   
> @@ -1154,8 +1118,8 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
>   							     job_timeout_ms,
>   							     opts, priority);
>   		xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
> -		set_vfs_scheduling_params(pf_fd, num_vfs,
> -					  &job_sched_params->sched_params);
> +		xe_sriov_admin_bulk_set_sched_params(pf_fd,
> +						     &job_sched_params->sched_params);
>   		igt_sriov_enable_driver_autoprobe(pf_fd);
>   		igt_sriov_enable_vfs(pf_fd, num_vfs);
>   	}
> @@ -1196,10 +1160,9 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
>   	igt_assert(job_sched_params);
>   
>   	if (!job_sched_params->num_repeats) {
> -		struct vf_sched_params vf_sched_params = prepare_vf_sched_params(num_vfs, 1,
> -										 job_timeout_ms,
> -										 opts,
> -										 priority);
> +		struct xe_sriov_sched_params vf_sched_params =
> +			prepare_vf_sched_params(num_vfs, 1, job_timeout_ms,
> +						opts, priority);
>   
>   		*job_sched_params = (struct job_sched_params) {
>   			.sched_params = vf_sched_params,
> @@ -1208,8 +1171,8 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
>   			.num_repeats = 1,
>   		};
>   		xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
> -		set_vfs_scheduling_params(pf_fd, num_vfs,
> -					  &job_sched_params->sched_params);
> +		xe_sriov_admin_bulk_set_sched_params(pf_fd,
> +						     &job_sched_params->sched_params);
>   		igt_sriov_enable_driver_autoprobe(pf_fd);
>   		igt_sriov_enable_vfs(pf_fd, num_vfs);
>   	}
> @@ -1280,7 +1243,7 @@ prepare_default_enabled_job_sched_params(int pf_fd,
>   	struct job_sched_params params = { };
>   	uint32_t min_exec_quantum_ms = UINT32_MAX;
>   
> -	params.sched_params = (struct vf_sched_params) {
> +	params.sched_params = (struct xe_sriov_sched_params) {
>   		.exec_quantum_ms = xe_sriov_admin_get_exec_quantum_ms(pf_fd, vf_ids[0]),
>   		.preempt_timeout_us = xe_sriov_admin_get_preempt_timeout_us(pf_fd, vf_ids[0]),
>   		.priority = xe_sriov_admin_get_sched_priority(pf_fd, vf_ids[0], NULL),
> @@ -1566,8 +1529,7 @@ int igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
>   
>   		igt_fixture() {
>   			xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
> -			__set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
> -						    &(struct vf_sched_params){});
> +			__xe_sriov_admin_bulk_restore_sched_defaults(pf_fd);
>   		}
>   	}
>   
> @@ -1618,8 +1580,7 @@ int igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
>   
>   		igt_fixture() {
>   			xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
> -			__set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
> -						    &(struct vf_sched_params){});
> +			__xe_sriov_admin_bulk_restore_sched_defaults(pf_fd);
>   		}
>   	}
>   
> @@ -1627,8 +1588,7 @@ int igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
>   		int ret;
>   
>   		xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
> -		ret = __set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
> -						  &(struct vf_sched_params){});
> +		ret = __xe_sriov_admin_bulk_restore_sched_defaults(pf_fd);
>   		/* abort to avoid execution of next tests with enabled VFs */
>   		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0,
>   			       "Failed to disable VF(s)");
