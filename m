Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCB1F3ED73
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 04:56:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D0A10E02E;
	Mon, 20 Apr 2026 04:56:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="db8FLlpA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FEA510E02E
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 04:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776660963; x=1808196963;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Nx6ztbM6HKRdaCVZbgEI+n8MmIo6+mdxYFTLyaGSirY=;
 b=db8FLlpAC7kEbrSBHpcjhNomRBkZkiCQTwDb0TNpMs5D0SHPQlxrejf0
 jvbnJlM/DEeRsNjmW/ftpTOWRLEVNVFbmb5eq3ecoI7dbiaFOR2L9Q91Z
 Z2TdEmE6KTUVrqg7YDWfyBjnzqgihD4t6mmDAyQCUFQYB4h5DDP7hCoWj
 WLZmcxv35SA9bagLa6FpsN9cz8c7bSIIl3rfcG9bh4ukKrFB+l3ZRqK3/
 GbwkUD472mM+s0rOov05t4kbKc1cFf1Cb8TjuMhBwtgTH8ZpA2zEaMngA
 8C5E97QKXhIjW5MPz7NyLsgj5l6N2k2ZHZrc0vkMIsyZDGYZziATu1M/z w==;
X-CSE-ConnectionGUID: gYGEeuuRQ62yINK0RqaUUw==
X-CSE-MsgGUID: FV4p/lTPStGleF5O8R8J3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="87870741"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="87870741"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2026 21:54:51 -0700
X-CSE-ConnectionGUID: MuuJSkEgSXSSiXEXBIUCZw==
X-CSE-MsgGUID: kY+lUFgBSBi5Ab+YALOGOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="228461950"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2026 21:54:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 19 Apr 2026 21:54:49 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 19 Apr 2026 21:54:49 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 19 Apr 2026 21:54:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H12SvdFOu2GMwLYjwtE3gIIhb5WStr6rC5Y7q8EGdIpCVHDneDmVtwNUdUrPvRjRCNYQWsSP0tAqz19xPk7Ch3dVvMCYPq+xeumqMISMfKjxR/WSgK7arfC6r0kv+K12CP0e5iOUbYX94av57Dqw/Vphqoro82h5zm2+youBb4PFYimYz82Qun1uarrCuiV7/8SxwXHVOcoclmYsQDD+A4vxDgv3vWztHMu/00t4eTu54q5nESJf508iK6L9tpO5CcBV5bYvohcdWdpVIcRp+tZiNgYFw0C7RSC2yLOKzh/R4iLRoQaVV1Wf2yMZI9Lyd3ij0w+Njsk1/U6BNfO3CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYPwNho7H+/yl/EMVM05yzdxYu85VCR2Y7a5LuLjT6g=;
 b=HPtfZRPS7nj2c/JMVJqKPCNue332Mxtl0mcaS6JrfFAPcdIPbsWOLX8K+5mFW598kL+HeetO8LKQBSwt+UEfWPD/ZajRzLl1IUIJEpanRTIeKvkv7ic8O0/WnJliOp5CQXIBzLYy/FlG1twC03RsBoY1T8Cq5JYZeaWAjQaHVEQxCRfwIt5mfsokeu6dG/PYNP1ZZREWb+tncQFbXl/gG5qO0dPHtmbMea1ySXh4Bd9ucvei/DGrM789eTbgsZ1D+XkwxXJR8TOEKgX4/CZSHZzqDryPfcNS91F87jbpeJ68KW5fN/SmC/PtU/5Gi4pb5bSfk6HjZb1Vmn53JPr0lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DSVPR11MB9555.namprd11.prod.outlook.com (2603:10b6:8:388::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.14; Mon, 20 Apr
 2026 04:54:45 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4%4]) with mapi id 15.20.9846.014; Mon, 20 Apr 2026
 04:54:45 +0000
Message-ID: <6ed8a4ec-9351-4929-973a-7844731687c8@intel.com>
Date: Mon, 20 Apr 2026 10:24:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] tools/intel_vbt_decode: sync intel_vbt_defs.h
 with commit 1b85a9b04681
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>,
 <kamil.konieczny@linux.intel.com>
References: <20260417041031.2187889-1-ankit.k.nautiyal@intel.com>
 <20260417041031.2187889-2-ankit.k.nautiyal@intel.com>
 <4b8f88f0-e1c2-4702-a262-651b3104545b@intel.com>
 <3bd2ed35-97b4-40f0-8d18-21e23f697826@intel.com> <aeIL84BK_pmBS48s@intel.com>
 <da72e919b7cbd787e793f0141697f7c37957f998@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <da72e919b7cbd787e793f0141697f7c37957f998@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0239.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::15) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DSVPR11MB9555:EE_
X-MS-Office365-Filtering-Correlation-Id: acfba58a-bf4c-40be-3662-08de9e98f119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: GZY+WPJoJQaW4aVA/3fnIbcsw0IVSrOaeAJHkN1f+zGEadrKcG0bAlXY3HOZ9C6921iw6ckqGxSP6IDBbfOjj7ipUNfhN9yt5IoJHTdsb6isW7SNS2P0l0B1wkmMo6uL2wrNb2+Pk4oey6pK2Ncj1ps2J/Pqc6SaIvPlonGWbw7+Fw+RUvcSemYu4hy3f4iLvx0VNIO1ZQYV090C85WZAZ9BkWuje68hJkix2S3cfPetskWTRgWB4PSjnq313l4HZnYcR0pC0Ex0siVPdG9FtAy7uF87k3efUHM/UJFhplwt5E88+DYGLiZpqMP5MMSJMgjVacSDZWkMOcw4Tt/Q6qxLn4DCKCyV65xf78VzfmiLgpay2oN1b4WLPS69bPN4LzSKWJVmCqu1N9yZoQLrdYIio9i1SCywEegi/SDP1jaoApZULWNNNA9UcindZvDsoOwrwyUuaZ7Eufv6OFlp+BaXYL47bsiOHTPXVL1BiB4tyxvbnwRwqWodARH6VDU8Fje6MfucLQNrxh3KDJiby+Geo2xgY59vQOhRLpgv1aW21mgPpqp91gc2IzkwtTohlhEYmbnFfW/JBRs7Yx3p87U76CXd1o6uLwy0gwLCi4eutERaDI86tQr+SsGsFoTxD4Fh6fMaW9pnYxTGxn2cYeHYAlc/OYwYGPh+uAESTTjGLFN5iVyYULjJu5DeFaZyCEIPaf72QqtaOHLoPij/cTpuprtXGEnCrQZpW0rsCuI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmNVOEczbmdDNlVHVDJQa2lwOHVsZ3VHVDZHYndDZnNvN0dXTzA3cFk2TDAx?=
 =?utf-8?B?a1RVTmR3RkZvclJtMSs1SHREcnVQUlJ1VzRwYUFkWHl1U3dIUys4eUNMTzZQ?=
 =?utf-8?B?T21OMVFRcG9JSWw4TjZrbW5aWGRKTzZ2dFl2UW0xUzFWVDdRREpIQm50bzNZ?=
 =?utf-8?B?QmNoTFZHUDFrRVVlSFMzTllDWUpBTUZPOWZ3S3BKYlovSDFNaFZJeURnZzhQ?=
 =?utf-8?B?UWhDN0d4NFNXQmxhU0o3WWJqdmRoMFRSMm1OYzNaVjhtUzg3YmpyL3RPMFlC?=
 =?utf-8?B?aHplT2lXTTZLazlaSjZFd3IxdzYwTmVybDR3RlZva0EzeTE1OHJiSFRXNHdk?=
 =?utf-8?B?MjVzUDErZDBNaG1oanlEMGtSUkpaYy9hVkJuVkZra2dTN0h1ZCs2NGphRlZK?=
 =?utf-8?B?RG1FbzRNYUNVRG1kTE9nREd3ZFlEeGhTRlRXU2ViSTVTNzN3SUQ5UDQ0dWlm?=
 =?utf-8?B?QVRkckQyTmliUXlKSnlOajE0MXZXWHhTM05LUFNnS1hSZVJYMG9iK0lqQjls?=
 =?utf-8?B?dzJiT2F1QkpoRlZMWW1kTVA4TnV6bS9qN243bm5VUGxWdkVoZW1WQUY4RmlJ?=
 =?utf-8?B?bmx0bFE0L1psNHdRL3JIb2VVcFVUODhkMFp4T2RlbVhZWkdIdFRnNDQ1UENY?=
 =?utf-8?B?SDdxejBSSzJaV092UWtoZy9KT2k5UDNTT3JHQnVZMlJET2d3QnNmTVpDZlcz?=
 =?utf-8?B?MmhiQWFpQWc2b0RPcWtwLzY1RjJTdmU0ODJQQ0NVNWlQZ1loYW43MnA3OWc1?=
 =?utf-8?B?NXNPWGlHSjJLOXQ4MG5lNmZGc0J3L1AvOFlXWitrb2dNRUlkSzQxL0MveFVm?=
 =?utf-8?B?U3dueGNHZTV1d05tc2tWUzR5RE0rRXFkZTdPNEtReFFnTmJIbHlONTBFb3lk?=
 =?utf-8?B?VFZJNmZQTlhkVlNLZnRMamk4SVdhN2V2MGJCZVVCbU92Sm1vcXZ2c3dZb0FW?=
 =?utf-8?B?Z29YdS9IMHJPK0RueTZnMEZnOWdWT0NxMmd2ZllMWjk4RkwyS2FXQzdoazVx?=
 =?utf-8?B?bm1OMmZpUVd0STlDZ0p1RDNlMHhacnpFMHBpNGFSN0tzeUFHamg3YUxjeGRU?=
 =?utf-8?B?aWZpSWYyNXIzTnZqaGhWSlBucDdXcWpLWW5kblozZkgzNHNiQTJ2S3l6dmhX?=
 =?utf-8?B?Tk5LaTRrVDFjMUp3YXdJNVhFWmsxT3lwOVVKT1lxU20wNUpPWUJwenBmbE5r?=
 =?utf-8?B?TVd1U3dSUEV3U1U5TFFBN3FZTExnVEdxcGJMbys1NlA0SXV1MTdxNjdtdzd1?=
 =?utf-8?B?U2xaSllBVXJkVVhwZmVSS0JZaXMyYUxldCtlZk53cFVDM2w4aTFmVUNILzZK?=
 =?utf-8?B?OXBCZEtBNkQwbThEMjFDZitQek1ZYXNUVEZmOEdIdmJiSU5sK0pXdThIUHBi?=
 =?utf-8?B?QXFObkFKeHFYaERpQUZXUkhLZER2TWhROGE5b3R3T254OEhnV2dpbXdUUlVx?=
 =?utf-8?B?KzVjTEQyODhWYXZJeS93REQrODgrd3g4cWk1T0FCRXNMUzIwQnlBeXJhbG1Z?=
 =?utf-8?B?SVVmU2Rrc0lYVUhhL002TytIOWFiVDJLamNsNzNNVHdIUUdKRkdQZUUxVHpD?=
 =?utf-8?B?YmpWL0ZMb01nSHpIRGtTa1FlN2UzZklsK2s5Umh4ZHZmemVvMWV5YVNMNmE5?=
 =?utf-8?B?TW80dmdaazV5eTRaMndRUVZiNmt5YWk3TkFTR0xiUTJsL2Q5NGUxazE2ZXVj?=
 =?utf-8?B?TVc2Slo4eTRXTXpPRTBTOVVwUmJMQ2NDdTIveWR2eXlmRUYvTVM5akJ5d21O?=
 =?utf-8?B?UmNlZ1RKU243MWNMWnVJcitqckU3NWpZZ2UzbklRUExhejBia0VSQTdmblhB?=
 =?utf-8?B?eXdUVGRaTGFyQkRxNDdBQnFwUk1WMXp3YVRnZXU0MVFlRDc4VHJMSEV4UWpR?=
 =?utf-8?B?R1dpR0MxNXBoOTlTL2tRV25ZMUpCQ09BWFlWVGFrcFNCQTJ5cmVuZ3R4cXpB?=
 =?utf-8?B?V0FhYmpRb1o1UjkrdDRkc2Z3VGFhaFdFY1poclk4RDZja013YW5yd1g3dWtm?=
 =?utf-8?B?N3dGcHk2Mm5FVlZzZkJ4Z1ROZlhSNVp3aXBhY015ZjhkcjVRbnZ3bThneGJl?=
 =?utf-8?B?cjBxeVVuMlkxQkYrbUFCWHhtWG5UdHpSU2xhR0JiMWNmZjYxOThiWjhDM0dS?=
 =?utf-8?B?QmNVeWhqcXZ2UGhXZWlWSmNtbUFoK2VWa0FHNWcxNjhnOHNCZ05tbjhsUUxV?=
 =?utf-8?B?WC9YS21tWkFyUlNEajJiQjVuRnZtM0FxbytrdEN0WkZneHNGSXFBNlBWcDBI?=
 =?utf-8?B?aVl4eEY3c0dVMHBHcUYyaSt6ZG5pMm5nQzBVQnRlcHpCdllNMHdJbVZNNUVK?=
 =?utf-8?B?VGRjWVpQRUc0L2pwSnprcmZPQiswQ1ZRMlV6dm1YNmlLZDg0WGFCWjZhV1FJ?=
 =?utf-8?Q?+ecUmcS8dLrH6eh0=3D?=
X-Exchange-RoutingPolicyChecked: VTXCPeftl/DddooCmHL8kch4LtCvz8wgwmR+jq2zBZAKdrEq+a20n143wGbAYP28A+PBOPd55yFRFB14KX88A8qZ8yL35/69LPGF6XmiGU/qAczAK+RDXVgNYcc4ceHYUSTh4pR4UOrUGrEjXNQeZIpA6Fg58HVjBg2VJl0hzHIXCvYTLborZVxRWwU31P7RkKWhSFysjeUUEcjyJbxXPTHofUPugSKA9lErvI1/2ZZe0AjWYcJFGK9wQ2IZ2fTbBvHOphZ3mIgM9AV6MzKaghhhT4Zi+OarSE0d1r+nSo1kHRX52vidL05bRwg6reWzUfpp0hbU+IcI45PUfELZoA==
X-MS-Exchange-CrossTenant-Network-Message-Id: acfba58a-bf4c-40be-3662-08de9e98f119
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 04:54:45.3536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qG/K4V29rk8I2H9/RVA/Ag8K1pwSh4zFpG3vGD2S0ZFt/vvlN0MEJFd5UInVEIQu0zf7Dt7QcdOgm1lLx8rtbqKl3CYby0spPvI0lpJBIVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9555
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


On 4/17/2026 5:24 PM, Jani Nikula wrote:
> On Fri, 17 Apr 2026, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
>> On Fri, Apr 17, 2026 at 11:47:14AM +0530, Nautiyal, Ankit K wrote:
>>> On 4/17/2026 11:09 AM, Karthik B S wrote:
>>>> Hi Ankit,
>>>>
>>>> On 4/17/2026 9:40 AM, Ankit Nautiyal wrote:
>>>>> Synchronize intel_vbt_defs.h with kernel commit:
>>>>> 1b85a9b04681 ("drm/i915/vbt: Add edp pipe joiner enable/disable bits")
>>>>>
>>>>> Bspec:20142
>>>>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>>>>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>>>> ---
>>>>>    tools/intel_vbt_defs.h | 1 +
>>>>>    1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
>>>>> index 6612d3a4ec49..550a9bfba868 100644
>>>>> --- a/tools/intel_vbt_defs.h
>>>>> +++ b/tools/intel_vbt_defs.h
>>>>> @@ -1090,6 +1090,7 @@ struct bdb_edp {
>>>>>        u16 edp_dsc_disable;                    /* 251+ */
>>>>>        u16 t6_delay_support;                    /* 260+ */
>>>>>        u16 link_idle_time[16];                    /* 260+ */
>>>>> +    u16 joiner_enable;                    /* 261+ */
>>>> The variable name should be 'pipe_joiner_enable'. With this updated,
>>>>
>>>> Reviewed-by: Karthik B S <karthik.b.s@intel.com>
>>>
>>> Thanks Karthik, will fix this and send shortly.
>> How was this even different? You didn't retype these by hand into the
>> igt copy of the header did you? The proper procedure is to actually
>> copy the whole file from the kernel tree.
> Yeah, this. The commits aren't in the same order as in the kernel
> either, and they're missing one.
>
> I've scripted this years ago, for both PCI IDs and VBT defs, and I've
> shared the scripts too. Here's my current version.
>
> Change KERNEL and IGT paths to yours, update the repos, cd to IGT, and
> run.
>
> BR,
> Jani.


Thanks Jani. The below script worked like a charm!

I will update the series with the generated commits.


Regards,

Ankit

>
> #!/bin/bash
>
> SINCE=962601ac4c78
> KERNEL=$HOME/src/linux
> IGT=$HOME/src/intel-gpu-tools
>
> declare -g -A map
> map["drivers/gpu/drm/i915/display/intel_vbt_defs.h"]="tools/intel_vbt_defs.h"
> map["drivers/gpu/drm/i915/display/intel_dsi_vbt_defs.h"]="tools/intel_dsi_vbt_defs.h"
> map["include/drm/intel/pciids.h"]="lib/pciids.h"
>
> cd $KERNEL
>
> for infile in "${!map[@]}"; do
> 	outfile=${map[$infile]}
>
> 	echo "processing $infile -> $outfile"
>
> 	last=
> 	for commit in $(git log --reverse --pretty=%h $SINCE..HEAD -- $infile); do
> 		if ! git cat-file -e $commit:$infile 2>/dev/null; then
> 			continue
> 		fi
> 		if git show $commit:$infile | diff -q $IGT/$outfile - >/dev/null; then
> 			last=$commit
> 			break
> 		fi
> 	done
>
> 	if [[ -z "$last" ]]; then
> 		echo "last update to $infile not found"
> 		continue
> 	fi
>
> 	for commit in $(git log --reverse --pretty=%h $last..HEAD -- $infile); do
> 		prefix="${outfile%.*}"
> 		base="$(basename $outfile)"
> 		ref=$(git cite $commit)
> 		git show $commit:$infile > $IGT/$outfile
> 		cd $IGT
> 		git commit -as \
> 		    -m "${prefix}: sync ${base} with kernel commit $commit" \
> 		    -m "Synchronize ${base} with kernel commit:" \
> 		    -m "$ref"
> 		cd -
> 	done
> done
>
>
>
