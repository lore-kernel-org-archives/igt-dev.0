Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DDFCE8E77
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 13:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C201110E29A;
	Thu, 24 Oct 2024 13:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ftN4IkKw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C0310E29A
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 13:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729777564; x=1761313564;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZqIJkGX+xu/Txjr4QhGuEPKF3LodKF4kPzgxsffSf5Q=;
 b=ftN4IkKw2Jzvbgm6D2YsA5iq6sH4JsLBU/RWYiurATGXo+J+FQehY14j
 Ls6PfBSIZsSLyAWHQOXadhoVt6ldWk/kyC145um6Gltb6w3q+uxOtQYIn
 /lSCdjYREURCBDph6rwDWIh65lIWB24uBxJqrzXsEj5IhuH30zVHOpBu1
 2au1RVJ8hf5v2QwZbcS4QxVe4bWsysP0muIlj4MmNZxNwKBJVsp87fgW+
 Cng8mY5677jAvVsTEVNxfUQIpdqP0VWuMFbOTG3Wi0rNYcjVYeZKjMoAY
 9L1CCcK/TQvvoN0XHkjRQRWnX1nR6LDOWyTVLPNbW5ANZgrqatflcoSGs Q==;
X-CSE-ConnectionGUID: H3n/yzyySV+kiHvXwbP50w==
X-CSE-MsgGUID: 9kc48YbsRO2OnYno92Nmrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="39994740"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="39994740"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 06:46:04 -0700
X-CSE-ConnectionGUID: Cp76XjYFRTeNlkzSNep87Q==
X-CSE-MsgGUID: iLLDlrwzTNiccC2ucuXvqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="81412028"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 06:46:03 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 06:46:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 06:46:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 06:46:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NtXrcmqDWaWsWNvHkoaOxesnbPMYNQ9yXoxhtq29SG4Ffi6w/iTGo8heLFC4QZ5FqVHIT9WcfAKkpmHs95vaR06BdV5e4D/IcH+oRxFo9C8NvXqljNP67OCTN3kAP/N8GikSD20dsMDzG7FJqogA4NTz3FFrCiQtqknbmgLshJLHJHFqMDpCkPLi6STRfusXbSGUvXK75Hsy28rk48VuSXsCKzI5bIZUTcA+K9smC5UbSyJEFEhGQCWqWRcJVS8aKcD/TJ3j68m3Nf+LcEh0M+lAbjqjE0qzwv+sgG6byauzMcMvxvpVCDbS+Lr3o3Ip8ykhHrQPJOaFXbasb/Qs0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Gpr9SZeompj9lcpE4duyM1N/wEnjWp1JGDr3uxcCak=;
 b=tL8xghNg4EU86EYIKVxX/O/TCdsRCRpoClGbaFNVFDqcXEnUXjUnnM93ggoRl6eI8nmln14k9l0q+eNLhPsMzwMRy99ANbNQS0ZjA34pluNZ+6tATpoOq/yigpWeQNFwIZh+TUCF+hjZq7CYP0XVGNgXp83s70mJwf23pXfuPzZzJwXyqC3u9PEj4RIIK/IKyk3mbjnJGc8qxYuuBJXz+2fEZ2nY1xplsHDJyJ6pxyatqSaBXL065z0ocm//wg6LB7+lPeJrJ5e3mcxKmgs2Wx5ehCzIutGYVAvD3zm1Kq72cjcrboFYRHq5i/RWoBLgHwkbyHrEyB6HGAX5uW2Hpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SJ2PR11MB8423.namprd11.prod.outlook.com (2603:10b6:a03:53b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Thu, 24 Oct
 2024 13:45:59 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%7]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 13:45:59 +0000
Date: Thu, 24 Oct 2024 13:45:48 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/2] runner/executor: Check for error at writing
 dmesg dump
Message-ID: <wfetyjmy34erijop7ffm5ywke7hx5q3i4za46u7m6xljry6iza@acdponikqdlx>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20241018161820.76014-1-kamil.konieczny@linux.intel.com>
 <20241018161820.76014-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20241018161820.76014-2-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: ZR2P278CA0053.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:53::11) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SJ2PR11MB8423:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fcf713f-a481-42ef-d474-08dcf4323152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|27256017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3RxNVZsdUNGcnMrVHZiRmd1ZUpNb2YwZ3YwNjdDMlpZK21KMklPSTFGOHA1?=
 =?utf-8?B?WlM5NzhzaG5vMFIvVGdzd0RuSXlROWZ0UGtqYmx6amZVMkhJY2d5eG0rSDcv?=
 =?utf-8?B?YWtmWm5IYWxkbHdYVkRjVnJwSXRrbzJIWlNtSCtXRXlkTE5FeEpxcWRsaTl1?=
 =?utf-8?B?ZU05RVJzQmhSMTJIVDZWNkN4b2JwaXA1RFJqenp2aW15c0w5VjdSYlovRU16?=
 =?utf-8?B?VUkzTUlzNnF6WGVPd3kraEIrRHl0MzBuZEdyRkxCemN6ckIyWURMd3lRVE04?=
 =?utf-8?B?em44WG1iV1ZBMU1iVXRJRlFtNEJRMThxMEo4RE15SDFlckdtbzRMOCs4Z3Ey?=
 =?utf-8?B?dS9mNmF3SUljVyt0bnY2L296YXorRnVWSkRYU2dqSGl3MVB0ams0QnBUK1Aw?=
 =?utf-8?B?N1pVdENBOGVMNUNieVRpMW1NMWF4MkJlNzhHM0NjR2NFUGxTalcyZ0pDd0dt?=
 =?utf-8?B?TEdId0o2aFRhakZwNUN5V21ITmIwY0o4K2Q2VUJwdTdXZXRFMEsyVXFHblVv?=
 =?utf-8?B?THFsYk1VYzdLc1J1UHRUd05sZnV2QzF0N0NyalFpeGdWU09Qc0RpTUN6aTly?=
 =?utf-8?B?VVdWTTVMS1dJN0N4MGZ6WEI5bHU5WUViUXMzUk1nV0Rma1pJZXZraGFkNWw1?=
 =?utf-8?B?S1pSamVNSEhYQTRSc2xpYWpIMHMzTWk4aUZ1SGxnSFQzRklDdVV5Tm5Yd2dM?=
 =?utf-8?B?WnpORlc4T3pCTG9JRkY3cWJGaFplaU41M2dHazdqT0tTN1NaTU5Jc1kwem5i?=
 =?utf-8?B?OW1aYWtUYXYyZTd5Qi9FUWhrb2hnL2hxbWxQUWlpdXNlRTRFenU3b3hYc1lS?=
 =?utf-8?B?QkRsdkc4ZERZOGpmdzl6S0gxVy9OQlVLZjhTWDQrUnl6enZHRUQvRHdJSlZi?=
 =?utf-8?B?aHBHY2t1Z0VrSStCK2JsUElVejNFbys3a0dJZDZyVi84L0xwN2pHNEJFOWNh?=
 =?utf-8?B?ZHNNTVNEaWZKcGZ3ejkzMDRSWlhGTzBWeU42cnJGTUswUjBUY3kzWExNdDN4?=
 =?utf-8?B?UUVMWU90Z2JtOVBQdFlRUmhyQjdxdThRWGhEQUczRXBqd09BWm5XMGl4QXNO?=
 =?utf-8?B?K0ZqRXltZmtCY3ZZQ2kwZXY1eFBPRmh1RW16azNzWTNYVXRJR0YwUVJqWXlj?=
 =?utf-8?B?d2RFVTQwR0NZS1ZHUGRzbWlqRzZNbk9BVW9weGtmMjNkd28rNzFDbXhKOEsv?=
 =?utf-8?B?QTg5TEk2Mm1NNzMyUUpUNy8wUHNmdFRJTUxuaWdsYXRTSFZTNndwSTJtTExV?=
 =?utf-8?B?OFF3SFBVZE5QTWN2aXNkWVpKd1hnNlNLTjFSYjYvZzRHblh1K2JXSHRqWnYv?=
 =?utf-8?B?T0t6a0RKUmVHUDY4UGdkbFFHOFRvUHBIS2VDOFprVU81WjlVTHJURmxPUjFi?=
 =?utf-8?B?Qy9QMm9YRVNNUi8yNjZhU0dici9uYkZ3N0FPU05vd0dMdkZmSTFSRlZ0am5E?=
 =?utf-8?B?N0RGQm9aM3JNb0JHdTRIT3Nma1ZLalRpc3lKZ2pTQXZsczlCUng5Y1hzc3la?=
 =?utf-8?B?aEh5RFN3RDNnT3dTa1FtTjRST0dHUjluVmRBallFSFJkTW5XUEI5a1lKRXI2?=
 =?utf-8?B?Sis0clNJKzhsYndMckRKR2owUFFCK0pCODRRSnNLNmg0OEZxakl4V2M3T3gz?=
 =?utf-8?B?RmxZZW9oRGUxbENOYzl6YmUyN3Z5TVlDRVBDd0VmZ1F4ZlV2MUcxNE5hNE1y?=
 =?utf-8?B?NkxoWG00NndkRjh0TEpJejhYc3JRZEhud3h6V25ldTNuM2ozR2JGSTc5aHdp?=
 =?utf-8?B?Qm9uZXFsdy9wckdMN1BHNEVKbVQ3MTFqeDBKd2RsREI5N3hLb29RVFJFcGJB?=
 =?utf-8?Q?w69/NRcXIlJe9x8gf3EPTWL0itQEFm8AVEFHs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGZOZEpSRFZja0QyZU5xSjBQK1dHSWRVWVV1T0pCbnRXdlRsNGJnSUZ3ZFNJ?=
 =?utf-8?B?WW9tMXV5ZVJ3UkdCUEUwdnRiWEwxVjRqOWxKTkErdWdBZCtEVTAvUVF1WG43?=
 =?utf-8?B?a3dxMG5mMDN6TzdDb1g0R3l1Y3h3eS9nZmI0dnlNZ1pOSVNDMVhXQjcxeDdC?=
 =?utf-8?B?YUlhTTkrdmtOeGc3RE5ZZ1dIM1M4MmhSTHdVRldBQVEvOGJyVVJLZjJpbUZW?=
 =?utf-8?B?S0NJVWVKV2d2OXJ0eXhnWloybzFVdmNBQTVLVXZTYzl5WlNoczkvR0dTS0lW?=
 =?utf-8?B?WTNxQmNGMEVZWHo3NTdjOFpqVE8ydnVIV3ZvblYxaGttS0lQbHdPVVZCc05Z?=
 =?utf-8?B?K2tBSzhpQ3RCNHRsZjJyZ1hnVUY3K2FtZE45eTE3NW5hQ3RuWnNMNU1GN0VO?=
 =?utf-8?B?NVhIa3pDVXJDZDNqMW9HQjg3dDI5SVhLSGc2OStxVGtRSHp2cEEyS0VOUjM0?=
 =?utf-8?B?UzIyQ1VFRTcrUUpuSzdSWmZJQ0p0Z2lSOUp2QnBJT3FESzI3NVcydFJBTUNL?=
 =?utf-8?B?K0RzOS9XT3FWdDF1WGJNTXlKcGZHQ3NMT3FkM3dlbXl5clJXTmQxcTlOMlhC?=
 =?utf-8?B?ZCtvek1SMXZ1ZERTd0pLbit1OHFZMHRnc25PNFpUOHNYeEFTOHZvZUg2UldX?=
 =?utf-8?B?ZGRZVGhPZnRwYTU0MUkwVjF3dXI4TEJmUWYzTGRMQW9jRkg4aWFxeS8xVG0y?=
 =?utf-8?B?ZTlVRHFCL1hQYVQyN2gwK1VRSFR0K1NhTjRCSnZJYXFzMFpaNE9ZYVpBZGxS?=
 =?utf-8?B?WS9DbUNxVVdBUWJubDFOcit2TW91NUhRZnpqcDFZQ3V4Umtuc3dLc3UySVdZ?=
 =?utf-8?B?TTZGb0xKUmVqWDlXM0lwVGhQOE9jZVQ1UWZQRVQ2UmpzWThOYm04WmdOTGxs?=
 =?utf-8?B?ZmJHWDZXWU1jdlhCQm1jeHRKZUFSbmRncXY3ZlhFQi92L2ZFRndXNVM3a1dC?=
 =?utf-8?B?YjErUWRRUjFWcHcwWWhaUmlmMXRDeXFBVEFnVWdJNXFPRkNGdjU1NldvK25s?=
 =?utf-8?B?YnYwaEhkRFhqbzU4SXRWbSt0SDQyVDFPQk9KWE9qZWVCMytOcUNhaDBRa2pv?=
 =?utf-8?B?NDRoSUVRMW85U1F4S0Q5ZDlPb01HL0RmeGR3UWNsbjByQjBPSGYvRklFbXUz?=
 =?utf-8?B?a2tuRVE4UE1MdEJ3alk5d1VpZ3BqeU9FQUlHNGJ4dmxZbjRweGlBVHlNbDFC?=
 =?utf-8?B?NEJtQ0pnU1p4N0JIL2FDaHNjTml2MjFDTjJxYlU4OWVUZy9oZ3U0TTJiMzl1?=
 =?utf-8?B?UXNIMHMwd0pWVjFRVmplUjhoM0JzbVZ3ZklaVU9CcFhMZlNMU1FjTEEvMEhy?=
 =?utf-8?B?b3pvckdvQm9aWEQyaTJiKzJTREtxaUtmWVl3QU13N2pLMnZRZmZFYTh2T1lt?=
 =?utf-8?B?cHZWMmVnenRPV2ZRckM4TWFWeHdMTnpycEhvTkpnZGZ3VWpnZ0swcEhGREZG?=
 =?utf-8?B?WFBxZlk2TnlLMWJrY1U3S1g1dWF1SjdmWVJaWnlJUitnSGMxRnZuYUZCQWpw?=
 =?utf-8?B?eTI3S25XeWJ2enptV2xiOWp1UkhHY1JqSU93QkpvVFZhZzhJc2NwU1R3NjJH?=
 =?utf-8?B?OWFpWm85SnJsUXZFNCsyMTUxcXErZ3g1ODNGYUlJeTZoby9JbkVyZTREMEtI?=
 =?utf-8?B?TjBBOGdzeTFyZm9nMEIra1ZhWW9XWllaMERCOS9USlcwQXFScnZIUVVqMjBn?=
 =?utf-8?B?aUVDMFNQaUh2b0lKRUpaSmhXMlNFYkpDcloxZDZ3UU5TdTRQaFVFanJlS1lj?=
 =?utf-8?B?OEs3a0ZIMmVJQkpuUVJsdTlCUnh4Q2JkZ1ppd2tmbTNPRUhtLzlHakhJei9t?=
 =?utf-8?B?TTZ3eWtwSEEvZjE5bk1PTTBWcGlvTmdVQmZxb0RaMDdGd3FybXZTWXdzZExJ?=
 =?utf-8?B?ekxaVEl4MEN1bjczZXo2a2FHbFhubG9qTUVsUjhHMWF0M0FUUTU1cForS1VQ?=
 =?utf-8?B?VlJpLzg2TXMxb2IxNXJPNVlOSzFxeHFwdkc5WGI2bVBBWi80SlFzVDB2eURp?=
 =?utf-8?B?ZldNS1BYLzVnV241OXFNODEwS2xGa0E3dXhCcmFxdHMzRmlDdlhscGRBRkVh?=
 =?utf-8?B?WUpTUWV4VHlDcE5jWGErZ05lbW5PdVkvWHFNVWVCbkNJM2J4cnUzN3RWcWFw?=
 =?utf-8?B?L25kL1IyL054TGhwK2NkNVR4VGhPYlZUNyswWm5kSVNadGZmbG1qeVNSaDVx?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fcf713f-a481-42ef-d474-08dcf4323152
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 13:45:59.4398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xvnTrS3wGzo1JfB4vrvvadZa7zidivWasW6QR94T8S/ohVF0nUJ1tEgvKkGFN73A2Wt5U3434MVJCqzS9/pkM03RtVXihXDA9XihQitsDJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8423
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

Hi Kamil,

I looked through the change and found only one thing that could be
added, the rest looks good to me.

On 2024-10-18 at 18:18:19 +0200, Kamil Konieczny wrote:
> In processing kernel dmesg there are checks for error at reading
> so add also one for writing.
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  runner/executor.c | 29 ++++++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index ac73e1dde..3939f92f1 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -600,7 +600,7 @@ static long dump_dmesg(int kmsgfd, int outfd)
>  	bool underflow_once = false;
>  	char cont;
>  	char buf[2048];
> -	ssize_t r;
> +	ssize_t r, w;
>  	long written = 0;
>  
>  	if (kmsgfd < 0)
> @@ -654,9 +654,32 @@ static long dump_dmesg(int kmsgfd, int outfd)
>  			return written;
>  		}
>  
> -		write(outfd, buf, r);
> -		written += r;
> +		w = write(outfd, buf, r);
> +		if (w < r) {
> +			if (w == -1 && errno == EINTR)
> +				w = write(outfd, buf, r);
> +
> +			if (w < r && w >= 0)
> +				w += write(outfd, buf + w, r - w);
> +
> +			if (w < r) {
> +				long err = -errno;
> +
> +				if (err) {
> +					errf("Write error while processing dmesg, errno=%d\n", errno);
You could include `w` and `r` values into this log as well.
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> +				} else {
> +					errf("Cannot write dmesg chunk: %ld < %ld\n", w, r);
> +					err = -1;
> +				}
>  
> +				if (comparefd >= 0)
> +					close(comparefd);
> +
> +				return err;
> +			}
> +		}
> +
> +		written += r;
>  		if (comparefd < 0 && sscanf(buf, "%u,%llu,%llu,%c;",
>  					    &flags, &seq, &usec, &cont) == 4) {
>  			/*
> -- 
> 2.47.0
> 

Best Regards,
Krzysztof K
