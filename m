Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7A9C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 21:07:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E5610F935;
	Fri,  3 Jul 2026 21:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ji52SLko";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1A410F93C
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 21:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783112776; x=1814648776;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=H0+AV7DtwBTxi3Td4/U3rFN9599gUSbhnCtTohnfPu8=;
 b=ji52SLkopiys8jMoABEkV73FnMiamWQwudO/6QPdFJL/v5no0U6O8qi9
 obWvJHompTi1h1WRrvcZlbh4Yy/qE9CriRxDsgswjB0v9HuZ7favw40jx
 p0iivjHr6pQZspWA+nBDVIYlH1takQuj6VKYTj0TQJELtFwkmGrs7TI4V
 u5r3S2eJKI/+YZpJCKR5fOcKoiY924ZaI4ZLbxOJ/rF7ASK++0VlGN0zr
 v3OifRHoQtkr56SOvr+mfCfo5aYYXxHFr/zZRO4DFxElz8Iulg1EMPcAK
 NuXkLpjgyfu5JINXw02FiIdFfxMKbuDRSeKCoDl/4ozE1r6WZwCg0Y0er g==;
X-CSE-ConnectionGUID: JJfw0KHqQZKyCUeiKAblrA==
X-CSE-MsgGUID: ngEMttGuTL28ik8syPxCyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83725531"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83725531"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:06:15 -0700
X-CSE-ConnectionGUID: 3ggsiiQVS2aqfMFcmiMJoQ==
X-CSE-MsgGUID: vqkVpPRDQZiVxKuQ+0uqSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="257079615"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:06:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:06:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 14:06:15 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:06:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zuq7neAa9HQSJ6IDf2UqN22Ds0ETaLxRFdcTvqXi5iYzIrluu5anHfxRkAomv9EKX7C2+hsE/dcIYVCB38+E3yAFD1uxY4/FT5t3nLCgw9SPn2E+otDJaCiaijbd2uT2bqBHXgEReb+CXTdOmWSh6PH1mnCUmpHUl0tKmUu+YmIABRYAw7191A9xiJ8nR2hPqn8kfrtdglkjblfLtKLu1oL00+Z69U2e1MSDTDLBP7/0iTnRAGBHBETIsw46kucoogCLmBz+pOML5CcTvN2mnpAhGVPol6tf7rMO2j7741A6mApcZ61QQE0d7yIVyEmeLz5Hn+cUXJr4KURu5bdRDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXxrf7KGDqUK9J6J24bsJwXjt14eIqx+UV0YeprS0F8=;
 b=mXzCLcntQbc0pCmgs+6Wc1muRGKhOYdbcC+VdeDJUzY5eJkDQNuzr2Z9mwH+7N0SlPJsOrcH++FblCocfLxvgIu5R2t4WGjVkqh8CY6N3Lk8AiCeH6xGonuSdhuV5caENgXf2fcosVGGtZaMAvlzTqW0haV9JvD3AOxfKyHCScUITS09NpOH6upRS4B+z+coCVLQmCpoD5Y7AgiudZJ6El0P1PFAvmHu5FBDIsAnrcaKmNGOlE2WL2tGQ6KUAOdNhopxdIn9Uhn7kkU7MFHIxtxOjdITFU75omWUwx4D4vtopXizVn2/toVnFSfKzlio/PT4vceW/ZdNiOGb4h6uuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by CYYPR11MB8307.namprd11.prod.outlook.com (2603:10b6:930:ba::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 21:06:13 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 21:06:13 +0000
Date: Fri, 3 Jul 2026 23:06:07 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 21/31] tools/intel_gpu_time: link with minimal
 sub-libraries
Message-ID: <ngklt6i46nswtyleomivkafgjxtuix7u7adyggymxsjtbtxaml@34rzg6phjs34>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <e68fa6b6ec44fddbcd016399caf7fd5ad17b66a4.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <e68fa6b6ec44fddbcd016399caf7fd5ad17b66a4.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DUZPR01CA0306.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::16) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|CYYPR11MB8307:EE_
X-MS-Office365-Filtering-Correlation-Id: e52ad1ef-8bf2-4d54-ddc3-08ded946ea10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|23010399003|376014|366016|1800799024|22082099003|18002099003|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: /Fb9T3AhxY/+YRPLtjYzHoi2SElIaSZvP+CRUcxSZq4MPGTuU/r6iEmVm/fg5Rva2RW/C1qvtsEbyUX/reEV1E+dXvYchDJilSBPEcr8lY+FDiCtz+iHPa7kN67Y/zlDmbiqlbNLHZZJiLsj0tnvT6ZhRNHMnoqTSwjehphV9G5mIpDvV6oSLInqGpZnIBgCaNm/iuJ8X2k+uziDrH5p+QTWcM5On9XM5LN8bo5yyLLkbuABigIR5pwiiEy2MaPgGlfUlBJ6TSIRmCoQ25EGuLX31DRMCOH8v++YsNCdjaf8S10cAO0Cy/b3+Lto9/ZT+sp0Qvn05P7SeOm18FPcXUGC+KOM6hqD8AGHquyZgCjwaGDHbtW2V6ljNptNepbzWxZ5pXvMi1Wn720QbED4g+YfvgBjp3YQ5hmsrdS+dvdS8REyn57ZGl/De6AGBtCHp9gmZgygL1PEYRL3mheiziNtmV6EZmSWDzohqwuEEK9xJr5oBpUihQYT1DcqojtwOUOGzzM/4MoT2WE7Q1VhfNHIi32rV5TyS0vAH7T4aAEJtnTZD+pnnq9SeYNOtg8oQwJyyW8cHnBJ63ARoJeqbJdgk5P81+cLVpQafFCVQS9qL8H8b9h0XSGx83tnXlh6pcQRx+MKbdrWZMQtc1vlP7wt/M29jW+sFGiYgzOiDiQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXdPSnBnS3k4TGh2N2RMeERmOFFuMkNvbnJlTkpaSkREVnVIekI0Q3QzK2dU?=
 =?utf-8?B?cW9sellYYWFWb1RnUkpkM0xZeitTcGw0U2hRNWJWZDlJWU9hM1BSREh6ckt6?=
 =?utf-8?B?Smp6dzRUZUdUVG40QklqVnlXVXpjZzBIZmJ6ZUFmN1BkQkhZTk9idlUwV2ZG?=
 =?utf-8?B?NWRCQjR6d3JxcmRCMElkT3ZBV05uUm5tY3BaaURvRUMxZEM1WkdDdmpKU0Mw?=
 =?utf-8?B?cDVIRXFKL0NQcUdxeS9NQ2tRNy9VTGU3UFgxWU5YSnVJTXViY1kzWnJNVmdP?=
 =?utf-8?B?OW1HME10c0Vlc1NuekwyY3UxNnZ1cnRUNDhWU3dDZkZFZDRXZTdXek0wekZa?=
 =?utf-8?B?SzRWc2IxTks2QXUwSjNEZ2hmYnZwbExtYjhHVWVvOWtjcURQcGtEU1k5Z3VG?=
 =?utf-8?B?NXJzcmkxK3BSSXhCUTJmYTlySDEyM3RPVjFhUkRPbnNBVVZkZEMyRytrU0hY?=
 =?utf-8?B?SlJldGNhazdQZTJEUGFzakNHTnF2emJZeTlXSTdIZURVK2F0bldsdmVaNm9F?=
 =?utf-8?B?bk5kOURteEh1YXE2VW1hL2ZxZENuT1BPTXJyVmlKdXBFVjRrL0VlMjNQL2Yv?=
 =?utf-8?B?VWlWRHVFRUxWZG9RYlBLNThpUUVBZmU5Sk1aWFFyYXpBVW5QMHYwcDUxbWRa?=
 =?utf-8?B?YldGOEozQUlOUCtLM1dEajFUOWcwOHlMbGM3dFdRa0FWRG1oOHVzNjFZcjVw?=
 =?utf-8?B?NUVERWJ6N2tod25uZDhiajB3OW1ST0k1NDVtQVBTWGdTS2MrK2FKclUyam1o?=
 =?utf-8?B?Ly9GcFB0N1VidHFORVlQMVhkQ1FhVzE5YUtjM3g2UUk4dmphQmtrK3dYNS9M?=
 =?utf-8?B?Zk5PS2F1ZFUza1EveXhDVHVKcXRSSERUTHhJV3QvLzBaelpJYTJRU2pCdEdU?=
 =?utf-8?B?RTNRakpmZFM2ck5nek1QalVBNGNKcWt4TjdGUTZSclg1amd2Q2wwTXpjSlgz?=
 =?utf-8?B?Qkt3YTFGczRDYzNGRlBub2liK0I0bHBmYWowSlZqRDBxN1NRYTRaRE5ZQ2JN?=
 =?utf-8?B?V3Bod3JrdldCL1NXQ25NRkxKN253ZzltZUl4OWZqOHAzYW91dzVuTGhVL0N1?=
 =?utf-8?B?Z0grenY3bVpOSUtyZFRrMlVrUGhjRFpNWWd3V2FvQ1Y5NnlpeXY2TVJwVVMr?=
 =?utf-8?B?ODQzN2pmTDY3dEtmZEw2R1VSeXY1U1VCQjdJd1ZhNXlTM1lHZmkvYmExbVBB?=
 =?utf-8?B?aG9XZWk5VitYV0FJR0cxaEUwaXkxUmtZeHUxMUxzSElZWjlqSGVzbXNhQVNz?=
 =?utf-8?B?STJGeWRGalNvZHgvYmRvcEFkNTNQMXd2bDF5RjZQVGF2OXJuaEp2OFVhcDEw?=
 =?utf-8?B?cVBDbm1uYzNvN3hSLzF1Z1o3TVdSS3VUZUlDNTE0cWR2NTZ4YmtFUHphYkVq?=
 =?utf-8?B?OGdGU1IzYmdhdXBXWVR2dHY0ekdlZFhXQmNvenIzUnN4MzdjNmhxOVBYSU5J?=
 =?utf-8?B?M2NzTHZYR0NrSzZpMjkxeGlLci9hSDBhU1U3dTgxenV3eXNlV2h0YVRMc05X?=
 =?utf-8?B?ZVBPdjlWT003K2gzUmZSaFA3R3NNMVVOdEpqZkI2NFZCY3ZxUHdGQ1lJVHJw?=
 =?utf-8?B?YXpNdVlUbHNHY1VlQjRiWURweG95ajFwR09HOVJuK2w0R0RQVzlPQXhHVG0z?=
 =?utf-8?B?b0UxTlRoZWE4eFcxcTZFamtVQ2Z2NEpZTXN5M0Q2dlVQcFdzTGlpVEpncU56?=
 =?utf-8?B?a0k4a0l1dStkUkR6MktpUnY3aWVGd0Y5bmRwOUdZMEdmTWN6WGhYOEY1NkZi?=
 =?utf-8?B?L2QvdmFnSjZvSDlhZEd3aFhKZitZZU9XL3I5MFN2SFptM240aTRJZ0V4MlU0?=
 =?utf-8?B?T1RhRVM0SStaSWRzdVczbEMyQURheEdEY1cxL2JtUGxUNUova3JDZGRqNHhr?=
 =?utf-8?B?Sm8zL1kzSENPU2h0MHVaaGYrU2k3Yjc4akpUU1RlRDUyVUoveVJ4ZjAwNytN?=
 =?utf-8?B?OUQyemw1NjhsVnd0NTFJaVFKOXVDZXFXTjMyZDMwYTUyTzJtZUM2MVJab1hY?=
 =?utf-8?B?MVFMeU1pelhZRGRnMUlWdHJINUViMG1pS1lKbEdQeTdjd09EcnpTRWZCL2tZ?=
 =?utf-8?B?WHh5U0V3NXI5Q0hYRTQ0eDBGRGp3blMwQ0FKOXdlL2NzZSszSTZHU2VHdldM?=
 =?utf-8?B?N2c3ckhKVnFhelNBcUxnWFpYN2ZRZVZiVFR0Y0MzYlE2VHdZNlpOZG5DQXIv?=
 =?utf-8?B?M3FMZmdQcXJwK2xEbmZsWjZRUCtRdjRzRkNmUVBoL3JZUTR3dzQxbExJaUc4?=
 =?utf-8?B?RUNua1pqcEhSYnBYeG5vZGhvaURNUGhqdHBKeHU4dXJ5R0dEQllqbDA5b3dF?=
 =?utf-8?B?RDBrbHdKbUt3MG1XM3VjbFlORTRFQ3d4Qlk4Z2xEaU9qU3ZmbmtIaUJ0MTNW?=
 =?utf-8?Q?8vZxk47SEuMVgTELAj4JH/gQUbqRLq5hJOEs0uLcZK+Gc?=
X-MS-Exchange-AntiSpam-MessageData-1: /C3aeRvQzLSIvq0w15pFEZvmuAvQMeyjZxM=
X-Exchange-RoutingPolicyChecked: JJl70LlCYDwUQ27XD476ZdxRs3zfNtr9s1cH3NpRXLg6FNy61zDP90w2THjo7kX7a1U5U+RpB3tjXq/2Dk94MtQifLkK3nh5jDvrPbSHb4mot4tq8yIvc55Tune8i1ahVMdSdaIfR8G4T9LpmH8/nKGThbSYnQjay3SEyTL2FykvnbsNRKn0pcPNGq9uxJVvMtu/Tor29BiEvcmnjcANwT61AG1tRFSbDNSoznTvZqh9EZBZdR7LbIVJFllQ8GUSwjiKYvbXnQHkm7WBdbX35ivW/sryVXChL9MtdCvMP+A2NS5gwnOYEJIGHobYBLZfbFeOJ77TAjr2R2t5PqCHAw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e52ad1ef-8bf2-4d54-ddc3-08ded946ea10
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 21:06:13.2116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Uw2TQ6pfwwOuf1pVbGcEoEitSWo6UDIur+aRFDzFE6Kubr6Fd57u95syZQwpdz40IMtoKTyoEVPr27iGwXR7VcaLw81CgVXB+hBZaq3bX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8307
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

On 2026-07-03 at 16:28:55 GMT, Sebastian Brzezinka wrote:
> intel_gpu_time only needs the register/MMIO helper subset, not the full
> libigt.so stack.
> 
> Switch to linking against lib_igt_reg_tools.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   5   (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 0978f8f11..2e8ceea36 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -21,7 +21,6 @@ tools_progs = [
>  	'intel_display_poller',
>  	'intel_forcewaked',
>  	'intel_framebuffer_dump',
> -	'intel_gpu_time',
>  	'intel_guc_logger',
>  	'intel_hdcp',
>  	'intel_infoframes',
> @@ -100,6 +99,11 @@ executable('intel_lid', 'intel_lid.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_gpu_time', 'intel_gpu_time.c',
> +	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> 2.53.0
> 
