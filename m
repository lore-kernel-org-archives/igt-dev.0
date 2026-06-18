Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFE1CD98F0
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 08:04:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D36F10ECBB;
	Thu, 18 Jun 2026 08:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fA/MmasZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E836010ECBB
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 08:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781769858; x=1813305858;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hRE93UcDDpGARyrWR6bhQo41riGzQa0bGm9i1xyljHI=;
 b=fA/MmasZwmAY6NP5273V/Se4qgEKFsWG55H/ezikThk/nmeqEp9sl7hk
 FTz/RkL/NeV6A+dutaSkOO+YvQ3dCDeKS55+It8QBaYedbTmCWrEBgZD2
 5IEuy7Z8AwcNdsvMi4wn+C+bnbVmCc5lqckGX1gj4qWu/jEzvDCLvl2zQ
 5m9L2g87NstKJGpF7/m58QGneChfCCoBKwEwD+UTi4HBaWt3o1TBUiPR8
 aDddtQMnM9MZvEulEl0RAQbojN9zR2v0fjykCefIhJrL3i+JwtvihlRhr
 18zYc4ZQH2eQ3n1JgtwyQMv1+Do1BXxamTOUhJCjOL9DVk3ehV8721+cr g==;
X-CSE-ConnectionGUID: 1re65Ow0Tdif4Ojs5FweqA==
X-CSE-MsgGUID: TgJnKo9JRiWxDoIQUHt1Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="108142755"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="108142755"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 01:04:17 -0700
X-CSE-ConnectionGUID: 42CdgJCKTWush3eDaZhCUQ==
X-CSE-MsgGUID: GCBeDvVUQfSYyd+eeRKL7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="243939870"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 01:04:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 01:04:17 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 18 Jun 2026 01:04:17 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.9) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 01:04:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qea/fsQqtAkW0foJbXfZ7L01eUAjnLQSkqUonc0qCcA+S0WmTgh5HvtnnL0paBmEkaaj1YvS5+tSBzibVd4P2W+xdQXHHiwUIMCpWrLN0wfHVCwyqu3prz5NWRV9dbRXEcfJ/seiClD45eGn0UJ+RUBFlSWEZ5usZKuUnMWtHfeQ2h503VDxJgkmpNOgKZowyAxfV6LZ6bph1UFvpTvtQx+ZnnEoZRKyVud8jV65cdtVVGz95tEpgpGgLBec5x40OqnG6uHH9j2EST4n/06GENqLd8nByKpSeCJ1QDYabegiC1hjz5qTi2BN0G86YddQlWR08XE58DTlkP14nI0VfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgAssb9WSXXOlcahDjf8iAuf/y1vpFouDTVWg/3tNHk=;
 b=ErY5t2Tejd3wnl1DUXA7jGLsAP4meu4hZNYdkKmhfOmR8zUUqM3vYm+LA2cxGXulZ5FZ9ytld9umKA2tIULpmqsgaFs2MRssUrDtdYsotpj0JqJdgVCS1khKMNkKLGVJzKatljwe9ooCUucJgDLQ6kSOLSvRjz64VKNV3YNVSDVsEI+rRjZqnbtBUD3h3FZKJ6lUL2te9JH2lKu1ZsF+4AGpOZL1+o4RIPaJ/bSqq4FBp3KLOKb17PeIAeJ1k7NjX7v8WG2q5y0Pf4PTBPmazYmLHSBGfYOiaz6r3wHlTznoCldeb9QAXZcjMjVF7+FZBUuC/7C55IxbekRyFd9fcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA3PR11MB9133.namprd11.prod.outlook.com (2603:10b6:208:572::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 08:04:14 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 08:04:14 +0000
Message-ID: <a63d0993-e834-4f9e-91fe-a0a2d4ec4694@intel.com>
Date: Thu, 18 Jun 2026 13:34:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 1/3] Revert "tests/kms_hdr: Move capability
 checks inside dynamic subtests"
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>, <sameer.lattannavar@intel.com>
References: <20260618063347.2940031-1-pranay.samala@intel.com>
 <20260618063347.2940031-2-pranay.samala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260618063347.2940031-2-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0174.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::8) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA3PR11MB9133:EE_
X-MS-Office365-Filtering-Correlation-Id: f4388058-4718-4cfe-d37a-08decd103009
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|42112799006|366016|376014|3023799007|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: T18TIdXmsJ8JYG6UXtY63eBPV1t/mJm/+CE7R5rTbaEAuWjv+CsfRUICPgOcE6J5CpZim+VXxexeWdDsZQAMeE2P2ORvDrnfPlYPbvVYzotCwh8EoUzzDKkhzCH13k2HpGby7qM995RZ9ft2zbIGODGBX6YeMyUhP5y7iZT39pVPSZBnISZz0aGYUpJWWNq/qxZ4rC+zrQZYbG9p1hw37k+adIyQcA9bWfmNNwNkhiSimC6X3QwVUh0aNFWRFsHSOeLolJyd5FBVLlr3Tl1tECcr2Vmcj7IvM0gingZCPrEQBWKTcnUJJ5G71sKlXZ3g25yPNu+zMFmP7QgGRqgituxxD9GxBTUIyYyYG1jyigmjGrdq5nTVVBNV3fIsMfMuOhjxZAz4AI6w3WtOPr6dj437mZYp9NQrG2WDJXN6XXiQF7GHN9+jsAiOlEag8miucpieHGpVUG4fl8//TqIu8yY9LJ048Igzuo2/kOs9jYG8P/t1haaTGxXm7fTj8xkBsYZgLxxA7aW/DqOyj6wLISssX1z/28Z2+M8Btt0suAL8u3yCtA7wUAxxyLbJeaZ13d5Ifr00yJ4kyEOyRy9qiRWIy/Z7FZqC4EcjSfbsnyuT/fer7A+6MNWb+P5ifpFkBVIIjYDICfev3MY7q+Eq5ikJxKjEmfE+U9D4/akVx7PCbkSfYTHaHMKHRDQicpRs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(42112799006)(366016)(376014)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3VnWlNQek91RkNyQU90bGNjRnpaMitSWEpLcUJVWDcxS2VUdEY5Y0UzWnhs?=
 =?utf-8?B?NEVvTkZVMXZ4VS9XV1FKZTA3M3UyR2lNb1JOdWZTWFJlQldtYWVDV0lJOXo2?=
 =?utf-8?B?eFRTVVhoZVY0aEJNcHJFSTFXdUljRGVhdE9nSjV0N3hRSTdldU02MWJlV2tO?=
 =?utf-8?B?d2RobHVkYk9DalNLTUNXUXNFM0ZLVzlydDFaV25Rdk1DR0NDcVV2QThpWFFD?=
 =?utf-8?B?bmdqdmFtM09LS0RLSjJIWU9CYU9IeGdOT1UwL0tJL3Zvb1hLbUp0Ymw0UWdm?=
 =?utf-8?B?UEN6cmZhVlhHTGMxaWdPeTNBbndwTmdBSVFFdnZRRVBjeUZ6MFpTV0xROU11?=
 =?utf-8?B?aGVncFBwSmV3MHJURmNNYUFuU3JaMXlTTGFTaXRzaEc1aTN0Smk5NFFhazlF?=
 =?utf-8?B?ZmYxY0xLOUlFbEdZTThQbFFSNFhXMVJMSWJZb1FENkthY0VSWDMxd211VE5r?=
 =?utf-8?B?UC9JcStkK1NDYisvaEV2T0l4dDBUbmRoSkI0cHJBTk9nSEw2aDB4RFVNSzVl?=
 =?utf-8?B?TUR4ZE44YkdvZzhiTXlmTE4yWFRKRTFsaVBBRkxsVk5mUjJHZm1Cd1V0c2lh?=
 =?utf-8?B?algxeHFIR0ZnNW1ZMkRMRFFRcE9CRW5LSjREcDhFMTBiSWFuQ0JoNHNDbU0z?=
 =?utf-8?B?d2FCQzlZeXZSTW9ZRFg3bGtBQndCZHRHK3gyWmh3SXBZbkg5UnZuWnFkdlg2?=
 =?utf-8?B?Zk16dDJYWG9WeUk5UHZOaThNTHVlRzZKZUVXYktOVzhhMy9jMnAzWGF1cHhG?=
 =?utf-8?B?N3ZKQTRtOGZOdk9VZ1IrTE1UWFF4Mzc1U3AzZzhLRUtyMUZRV2lNUmJxSCt1?=
 =?utf-8?B?NU1jaFFMQm94SVpwYmJhcXJwN3dSNUcxVXBVeWtmTzlHVVJmTEVVNUNGMGRu?=
 =?utf-8?B?Wm55S21UdUM1V0UxeWE5d1doblRZUTZuRWp0VXdlc1FhTUR1eXpsUTdJcTEv?=
 =?utf-8?B?VUhEcERsOG0rMWVTOXVsNU1ueE9PV0tGVDVpQ0dsbTM4Y2tUY3JCc2JQaXNE?=
 =?utf-8?B?VGJ1UVNmRjc2czhQYUREc2xiK0p0MHpPQUNGTXVOckQvaHhsRE95OVE3Z0VH?=
 =?utf-8?B?UTc2YU9SNmU5WXNXVTlJYTlpbEVrQUlEdkxkM0MvNmh5eitJSXVYb2l3VW5M?=
 =?utf-8?B?TEFMalEyZmhpbk9Pb2pKMVArbFRkNHBWZDB6U216aEJZNVRsc3VNVHFGU25K?=
 =?utf-8?B?WXJaSTMzenMvMGFjdCs5UTVpek8rVjhTeFF3M09Mc0Q0ZlFkMTE0b1hVS0Jj?=
 =?utf-8?B?c1VlYUhmNVFrWHNqdEpjVHR2UnRNcDM2RmNJc2NCNTZ6WDhyaEkyV3VBaVZE?=
 =?utf-8?B?WEllOW82dHVTMFlod3hiVkQyT1hRZU5BZ2tIM0JBMUVOZktKdVNRbnhkSzF6?=
 =?utf-8?B?NGhuSlBUSWk1K3Q5bTJKWW5Idko2c0VNWkpJVmF2NS9GOEVPTlR1RHlNc1ZK?=
 =?utf-8?B?R3kyUmRleWxLNFY3ZVdMamloQTZjbkpOOVRLdDJhUVBtRDQ1a25mVEtob3Qz?=
 =?utf-8?B?NXFaeGRvQkgwY3hqbnVWc2ZnQWZMakcrVFp0UmlPc2hLT0FFVXkrS2trVXBj?=
 =?utf-8?B?TlBockkvUXNobXhRYjlmcFEwekEzU1NEWnAyUit0K29LUkNya3JyaFBvUzM5?=
 =?utf-8?B?WURvR2xvSWE4L3dGdktZaFdwckUycTJwSkluQ09iUytReithVk43OGhpb05a?=
 =?utf-8?B?bGdXZzBmZEY5VjN3UHk1NTRsRDhHTXFxQUNwbUc4ZjN3L2VoNllsOXZtS0w5?=
 =?utf-8?B?ajhScXhSbG4wZzZlR1NJbytjOHp5TUg5SDlBOTdwMG5ZSkpvUnBSaCtZUVhE?=
 =?utf-8?B?a0tTQVFKNmxpeFBGbWFZY0RnclhUOG1hQk1NdDg3ZHNZTExUdjVlYTJYcklE?=
 =?utf-8?B?SDE3Rnh3U0pFcitQREpURjlSb1h3Y2M3TWJ3RlRMd0VWRDQrekZqZkxkNGVC?=
 =?utf-8?B?TlR3WFFGSVJzVkdobFhwUGFQQlVvOHBCOS9RYUlXS0xaQmhENXRkeU9OaFVY?=
 =?utf-8?B?SkdnWUlQb1FzUUNzZDJYSjFDL3psRlZuTlgxZzRadjBqSGRBQ0I0eFZpTXg0?=
 =?utf-8?B?dXlnbGszT1VQSWFjY1FGam9DVXJkaHN6aStjQnBCcWowQkhlcTRPUDF0aXVn?=
 =?utf-8?B?NUVsdUMyampGbFBGblJFMFZmc2liSm1BUVByTUZRcUJJNlpIbzVLWE12dVNj?=
 =?utf-8?B?Yi96cmVsSm1wMWNnS1grM05PWFlYUzNBMnJtT09JU3c4dDZHeFlGdHVFYjVw?=
 =?utf-8?B?K09sbHkzNG9XZ1JYU1lVd0U3d05KYU9QNzdwRGt5Tmg4b1hLaGRYd04xODJ5?=
 =?utf-8?B?SGczNmJwZWZkT2ovYU1QVE9Rd2RxbWRYbWRnRXdaTjIyejQ2MzVnUT09?=
X-Exchange-RoutingPolicyChecked: WUZMo1IVblL7llbJATu66JeFWTV/2Id//VGTnp+ZB19MU4NjWYqoQM/+giqzxDYk4EcrmXGsZt/DjcAA2ZZFikC72D+Orh6uskUTKGmIA4w2QiZb7ekR3mjKnxhEzrWGmHuMgEz3++nWGtEW5KAp4HgNHdX+W2W06W3UyRRZEAP5RZaADTcrBYMR2vpozFT6vrUNIWbyfVo6Ay+l9MAQ/VcIvD2Zd159kZhgp6GEBqHlMCoHGVg9efQ7KVLUWgwCwlmk6Or6NnFoukd33OaucnmZhwcosZpShwW2qNCm1oDdBbP6bRvgaEnYev02l/vtg+2PB7T/aQzZ1knVNKFPLg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f4388058-4718-4cfe-d37a-08decd103009
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 08:04:14.4154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JDKkD+TZ9SIfE+xvkF1MGE9vhF5J2lEybHQfOhCkK00lrHaOeqOA6CdNVRO3MYuyKzXEQN6fr8EsIlLBLs8cEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9133
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


On 6/18/2026 12:03 PM, Pranay Samala wrote:
> This reverts commit d9667a6fd6468adcdb5542d741ac423339a20556.
>
> The previous change moved output capability checks inside dynamic
> subtests to avoid losing valid results when a later output failed a
> check. However, the real issue is in the helper behavior rather
> than the kms_hdr test flow itself.
>
> Move the checks back outside the dynamic subtests and restore the
> previous behavior. The issue will instead be handled at the
> helper/API level by updating igt_get_output_max_bpc() to return
> status, allowing callers to handle read/parse failures explicitly
> without changing the existing kms_hdr control flow.
>
> v2:
> - Update commit message (Karthik)
>
> v3:
> - Add the missing changes merged recently (Swati)
>
> v5:
> - Ensure remaining formats tested that might succeed (Swati)
> - Update if condition for clarity (Swati)
>
> v6:
> - Make v5 changes as separate patch (Karthik)
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_hdr.c | 175 +++++++++++++++++++++++++++---------------------
>   1 file changed, 99 insertions(+), 76 deletions(-)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index affd38887..7127a56b3 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -255,6 +255,17 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   	for_each_connected_output(display, output) {
>   		igt_crtc_t *crtc;
>   
> +		if (!has_max_bpc(output)) {
> +			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		if (igt_get_output_max_bpc(output) < 10) {
> +			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
> +			continue;
> +		}
> +
>   		for_each_crtc(display, crtc) {
>   			igt_output_set_crtc(output,
>   					    crtc);
> @@ -266,29 +277,24 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   			for (int i = 0; i < ARRAY_SIZE(hdr_test_formats); i++) {
>   				prepare_test(data, output, crtc);
>   
> +				if (is_intel_device(data->fd) &&
> +				    !igt_max_bpc_constraint(display, crtc, output, 10)) {
> +					igt_info("%s: No suitable mode found to use 10 bpc.\n",
> +						 igt_output_name(output));
> +
> +					test_fini(data);
> +					break;
> +				}
> +
>   				data->mode = igt_output_get_mode(output);
>   				data->w = data->mode->hdisplay;
>   				data->h = data->mode->vdisplay;
>   
>   				igt_dynamic_f("pipe-%s-%s-%s",
>   					      igt_crtc_name(crtc), output->name,
> -					      igt_format_str(hdr_test_formats[i])) {
> -					igt_require_f(has_max_bpc(output),
> -						      "%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
> -						      igt_output_name(output));
> -
> -					igt_require_f(igt_get_output_max_bpc(output) >= 10,
> -						      "%s: Doesn't support 10 bpc.\n",
> -						      igt_output_name(output));
> -
> -					igt_require_f(!is_intel_device(data->fd) ||
> -						      igt_max_bpc_constraint(display, crtc, output, 10),
> -						      "%s: No suitable mode found to use 10 bpc.\n",
> -						      igt_output_name(output));
> -
> +					      igt_format_str(hdr_test_formats[i]))
>   					test_bpc_switch_on_output(data, crtc, output,
>   								  hdr_test_formats[i], flags);
> -				}
>   
>   				test_fini(data);
>   			}
> @@ -530,6 +536,40 @@ static void test_hdr(data_t *data, uint32_t flags)
>   	for_each_connected_output(display, output) {
>   		igt_crtc_t *crtc;
>   
> +		/* To test HDR, 10 bpc is required, so we need to
> +		 * set MAX_BPC property to 10bpc prior to setting
> +		 * HDR metadata property. Therefore, checking.
> +		 */
> +		if (!has_max_bpc(output) || !igt_output_supports_hdr(output)) {
> +			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		/* For negative test, panel should be non-hdr. */
> +		if ((flags & TEST_INVALID_HDR) && igt_is_panel_hdr(data->fd, output)) {
> +			igt_info("%s: Can't run negative test on HDR panel.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		if ((flags & ~TEST_INVALID_HDR) && !igt_is_panel_hdr(data->fd, output)) {
> +			igt_info("%s: Can't run HDR tests on non-HDR panel.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		if (igt_get_output_max_bpc(output) < 10) {
> +			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
> +			continue;
> +		}
> +
> +		if ((flags & TEST_BRIGHTNESS) && !output_is_internal_panel(output)) {
> +			igt_info("%s: Can't run brightness test on non-internal panel.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
>   		for_each_crtc(display, crtc) {
>   			igt_output_set_crtc(output, crtc);
>   			if (!intel_pipe_output_combo_valid(display)) {
> @@ -545,73 +585,56 @@ static void test_hdr(data_t *data, uint32_t flags)
>   				data->w = data->mode->hdisplay;
>   				data->h = data->mode->vdisplay;
>   
> -				igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc), output->name,
> -					      igt_format_str(hdr_test_formats[i])) {
> -					igt_require_f(has_max_bpc(output) &&
> -						      igt_output_supports_hdr(output),
> -						      "%s: Doesn't support IGT_CONNECTOR_MAX_BPC "
> -						      "or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
> -						      igt_output_name(output));
> -
> -					if (flags & TEST_INVALID_HDR)
> -						igt_require_f(!igt_is_panel_hdr(data->fd, output),
> -							      "%s: Can't run negative test on "
> -							      "HDR panel.\n",
> -							      igt_output_name(output));
> -
> -					if (!(flags & TEST_INVALID_HDR))
> -						igt_require_f(igt_is_panel_hdr(data->fd, output),
> -							      "%s: Can't run HDR tests on "
> -							      "non-HDR panel.\n",
> -							      igt_output_name(output));
> -
> -					igt_require_f(igt_get_output_max_bpc(output) >= 10,
> -						      "%s: Doesn't support 10 bpc.\n",
> -						      igt_output_name(output));
> -
> -					if (flags & TEST_BRIGHTNESS)
> -						igt_require_f(output_is_internal_panel(output),
> -							      "%s: Can't run brightness test on "
> -							      "non-internal panel.\n",
> -							      igt_output_name(output));
> -
> -					/* Signal HDR requirement via metadata.
> -					 * A framebuffer must be present for the driver to accept
> -					 * a metadata commit. Use TEST_ONLY so hardware state is
> -					 * unchanged.
> -					 */
> -					igt_create_fb(data->fd,
> -						      data->w, data->h,
> -						      hdr_test_formats[i],
> -						      DRM_FORMAT_MOD_LINEAR,
> -						      &data->afb);
> -					igt_plane_set_fb(data->primary, &data->afb);
> -					igt_plane_set_size(data->primary, data->w, data->h);
> -					igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
> -					igt_hdr_fill_st2084(&hdr);
> -					igt_hdr_set_metadata(data->output, &hdr);
> -					igt_require_f(!igt_display_try_commit_atomic(display,
> -										     DRM_MODE_ATOMIC_TEST_ONLY |
> -										     DRM_MODE_ATOMIC_ALLOW_MODESET,
> -										     NULL),
> -						      "%s: Couldn't set HDR metadata\n",
> -						      igt_output_name(output));
> -
> -					/* Reset IGT display state; hardware was not changed. */
> +				/* Signal HDR requirement via metadata.
> +				 * A framebuffer must be present for the driver to accept
> +				 * a metadata commit. Use TEST_ONLY so hardware state is
> +				 * unchanged.
> +				 */
> +				igt_create_fb(data->fd,
> +					      data->w, data->h,
> +					      hdr_test_formats[i],
> +					      DRM_FORMAT_MOD_LINEAR,
> +					      &data->afb);
> +				igt_plane_set_fb(data->primary, &data->afb);
> +				igt_plane_set_size(data->primary, data->w, data->h);
> +				igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
> +				igt_hdr_fill_st2084(&hdr);
> +				igt_hdr_set_metadata(data->output, &hdr);
> +				if (igt_display_try_commit_atomic(display,
> +								  DRM_MODE_ATOMIC_TEST_ONLY |
> +								  DRM_MODE_ATOMIC_ALLOW_MODESET,
> +								  NULL)) {
> +					igt_info("%s: Couldn't set HDR metadata\n",
> +						 igt_output_name(output));
>   					igt_hdr_set_metadata(data->output, NULL);
>   					igt_plane_set_fb(data->primary, NULL);
>   					igt_remove_fb(data->fd, &data->afb);
> +					test_fini(data);
> +					break;
> +				}
> +
> +				/* Reset IGT display state; hardware was not changed. */
> +				igt_hdr_set_metadata(data->output, NULL);
> +				igt_plane_set_fb(data->primary, NULL);
> +				igt_remove_fb(data->fd, &data->afb);
>   
> -					igt_require_f(!is_intel_device(data->fd) ||
> -						      igt_max_bpc_constraint(display, crtc, output, 10),
> -						      "%s: No suitable mode found to use 10 bpc.\n",
> -						      igt_output_name(output));
> +				if (is_intel_device(data->fd) &&
> +				    !igt_max_bpc_constraint(display, crtc, output, 10)) {
> +					igt_info("%s: No suitable mode found to use 10 bpc.\n",
> +						 igt_output_name(output));
> +
> +					test_fini(data);
> +					break;
> +				}
>   
> -					if (igt_is_dsc_enabled(data->fd, output->name))
> -						flags |= TEST_NEEDS_DSC;
> -					else
> -						flags &= ~TEST_NEEDS_DSC;
> +				if (igt_is_dsc_enabled(data->fd, output->name))
> +					flags |= TEST_NEEDS_DSC;
> +				else
> +					flags &= ~TEST_NEEDS_DSC;
>   
> +				igt_dynamic_f("pipe-%s-%s-%s",
> +					      igt_crtc_name(crtc), output->name,
> +					      igt_format_str(hdr_test_formats[i])) {
>   					if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND |
>   						     TEST_INVALID_HDR | TEST_BRIGHTNESS))
>   						test_static_toggle(data,
