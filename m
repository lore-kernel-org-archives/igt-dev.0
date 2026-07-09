Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF7FC43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 10:11:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B2410F4B8;
	Thu,  9 Jul 2026 10:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fao8E/ep";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891D310F4B8
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 10:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783591837; x=1815127837;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TeRKSraWyNVRrWbfN/7Tkv0yn72/O0HFAlGJdLYTUEg=;
 b=fao8E/epI0MK4MoBq5H9hDhDhCGa5p8Q/svTiJhzisFpt/6W1Wu/z7LF
 XkqEOl1+tCnASiLR3WJcbMg3g5JSfLzeMkLkUxe/UMuBUJWWRG8j+So8R
 h8guZGczMlPw7nVxSr+xp4B9AXwMJCHQfLR6XKabvdiCnN6hZDTxQOWv8
 l1Ro4ZpUjN2jRT4Ft8J0UO+so3E72SEhWD8VVTLNrt2hnO/j5dCQS3ot2
 zvftGH0KP7OXhAboB4h756T4etn/ZbnJ2fqi71332XZF8QZ/90tMCnbba
 K0LN3TngZ4x03JHj96G94DQ5iKJdC1Z/eJqwzV0Bjxiibe7YFqWKYDcFn Q==;
X-CSE-ConnectionGUID: 2Y2Zx0R5RYKy1mwBd6EduA==
X-CSE-MsgGUID: X4NitZd9TkaC0TWL6NPmUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84369313"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84369313"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 03:10:37 -0700
X-CSE-ConnectionGUID: VdDUMEaVSxGsd5M+h1C0UQ==
X-CSE-MsgGUID: 6H6yTOuJQ7auJtkCkG7v0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="258411758"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 03:10:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 03:10:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 03:10:35 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.18)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 03:10:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yPoL071dq1MAKomxSE50HHBTZ0tEYzG0KmdPPjTEs2CWDCj6mDSm2qrR1LHOiH9U712szCqXw1LM1cRLQGczJKob/kKUlFiuET8EXOF4u6gs4WPR3Jh0FSJCcaMW21I6etbc49Oodk4c5Ac0wV+gFFXQOS82aeynB6q9TpJtrjSXZdqwWmY5djA7DtDMzSZz7Ki1kHa1x0yBdgPIKvPBN7Ksdo1qtPqkyij/dGWp5DsegUL39TdQiEYr/Cq+eEwz6Pxd9ty0xxY+Ul51tKGOesKfQYPLJeYobY3uRm38XevRMt7U6OVPDnMVtJ6/hjyKW5UrSu7ufxYAajlvPtYJFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uI/UVUEuWOQLWThqxYTBGzpapP2Apf2j5fgxAzMZV6o=;
 b=SQ4BvMHqO7CPb8QuUWODb4HeBIP7TTOgdoM9eRg0so0dUfTFc3InEk1GoeEEWWI4PHynrYXzBvLCRIku4vF+uWiHnj8s2o6n4r/5KFpTGttCh25LY4DIRN+PW5T08IT53El1eAKQaoL2uRk5jZHWJOZG4SubluvPI+PB1MmnSS5u0Owfcdtj/v5xpFQTNU06Pmqd9kFsHetp5PIxlBkzsna72pOxDwz58MYLJIRCBzRO/4cq9SYGkw59wAVCgDg9uqC19p3Z90ih+/0j28MWSyDQtqi/AbjqUWhUfV24OoAs4Zz3jqvZ5anKv0ITV9h2wXX+w0pBmd3nNWICDhFnHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by CY5PR11MB6281.namprd11.prod.outlook.com (2603:10b6:930:23::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 10:10:32 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0181.008; Thu, 9 Jul 2026
 10:10:32 +0000
Date: Thu, 9 Jul 2026 10:10:22 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <vitaly.prosyak@amd.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH 1/6] lib: Add generic platform filtering framework
Message-ID: <54q7apbxvlbjnetpug4gp3katgkm4ivvvf6dwxghownef6obdm@iu36bjunermk>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260706235130.157557-1-vitaly.prosyak@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260706235130.157557-1-vitaly.prosyak@amd.com>
X-ClientProxiedBy: VE1PR08CA0030.eurprd08.prod.outlook.com
 (2603:10a6:803:104::43) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|CY5PR11MB6281:EE_
X-MS-Office365-Filtering-Correlation-Id: d2343b5a-e48a-4272-df20-08dedda24f56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|18002099003|22082099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: Jm156PTfte8ncfPLsrlYbtKFquNBhKpvaZSAS9s1HhUFGP5nt4RuIKd9LMHbCao0Zxm0zxk/WWGmNBiE3RoCVAwAoEgRfeF1tLCN1ay5q6WHuak7zDxlaJF6Dq4GNvDZLdEKUnOyBrowk78i0Wl050ha6ID1BLG6coidXz3Q++NLdnrXdg8gt3GFJ6NZ6KP+UKnGZ23hw+tA+RYQ7paJMC6Jg623EfggcF27BbOQ9PfIbs5uKiulG/q7T7FzyVXumriTNNAJ9LrvBOv2/oPU/Zy0hmYjL+u7csTrmXfVhKbBW7DX22avhXRXQ+jjB2mHsCKk37kMaktgklyqx3k2TNQY7rC0Wy/Zwg54xl+S5Mtml0eYRsiaMW647NFRIQXJ6jqcfT6JHz9ltcl3RLx8pD0oUECSP6sPMzqs0aVakaUbPBF5kgkmLBCbXMEPBnGCJjdMGEn+XaFfU5gy2vvC1SXCmZ5txNKQH2u0fXzvXRdm7Nn/zWppOaJW7D/p+o2uDiaDwwFfvsqmwLpE1abfWjepaBOyIpinz9z7xmaoTnE2opppCQgH6c3lb1QJRAnux2HuvLUnOYXkdSuijpvP0eApzA5IWJNZ8bnf74nSyUdZyUJtJKk90VcST31b2U+HNpfPqIl8miUfuzZ2xnsXZyIMaympsJqNyXLKYSCgY6Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUJuS3Uzdis2eCsySjdKWldpamtkaCsvQlBmeEhoeStjcFBnY3FnMWZxb21R?=
 =?utf-8?B?SDBoZ25iWGJsakhTandza0pVck02M0NoZkkxWEFZWEpmaDYrRlZpb213Vmw1?=
 =?utf-8?B?cjhzMWdQVVNrV3BDVHVObHNtSzhUc3NYS281NGl6cDBVRnRJTFZ1c0taSkxm?=
 =?utf-8?B?UXhOVjlEOWhDMUQrSWtrZm1GMTlOcGEydkMrZElrYTlCbnFnQzlqd2lSVGt2?=
 =?utf-8?B?U3l0dUR1VWxJTHdkRVd4MTFIMkNjRlNzUXhnallDNDNrRXpucjFycnk0bVk0?=
 =?utf-8?B?QzBWSWlyUklnbENRVytoTGJMZUlTM25zckFHMHN0eXVPbU40UW5STzNZaFZk?=
 =?utf-8?B?S1ZjcFFJcXp4M29xZVVzME1WSFhEQ1NpZVVBbzN6SENPZXdhYmYwZjBnZ2dJ?=
 =?utf-8?B?UVlvWTAvTVhidnVNMXAwM2g1Z0lPSWZNcHdRNzcvM01LRVVHdDlmWDVxOVlk?=
 =?utf-8?B?MHFPVzFkeTkzOHRIZTY5WU5jc01iNHFYR1VpV29wY0srK0I3T25MeDhCTVpo?=
 =?utf-8?B?TW1EMTVHV2RyYWExUmxPcEFobkM1REpIbDNiQmVjU3BIS0FXR2tQaUM1SVh0?=
 =?utf-8?B?d3lIeXBWYkc4Q2RBQnFtdDNaa1Q2SThhZnVwYVg2RlNjRnhBeUlPL09hYlJO?=
 =?utf-8?B?UGhpazM4ZHhTWjRaNnRhS2Q5TFZLa3RKR0U2V0x0d0h6d2lWNnZrL2RlOXpa?=
 =?utf-8?B?UW1xQnpWazBwWjFFTVhFYTBuWUhSR1VqOVo5N2crTXJWN1o2ZXpCamlWVzN0?=
 =?utf-8?B?NTdPMVFqL2tQT2hhUGF1Y3p4YVNaa0lHL2toZnhNUVNjelI5eUlYSndzK3dq?=
 =?utf-8?B?T2tyK0NvamhId1Fqd0ZQV2tEMDFKYmdxdU1wOEJ6MGlYL2F4S2UvM0F0T0tl?=
 =?utf-8?B?TlNJSHlLSlNGSW9DWEJMUGNHajJEU1Z0OVVBU0liZUVGQ3JTbnNtUnkwNHFv?=
 =?utf-8?B?NUhwUkxZdkcyaXUwRkVtRjdzUlVCaktxMG9ZTy8zZEZBUk4xelJRUmRwUWJX?=
 =?utf-8?B?WjFrVlpSc2JCdmVqWVYrSDVNVk4vaU5IcHRSZlo5M0V5OUdKSElJekxIKzUw?=
 =?utf-8?B?WkZkS25zbnd1MGJIaEZFN21sZFJZc0Y5YXFNY2tHdGlIdy9RUkhuQkh1bEc5?=
 =?utf-8?B?RWM0SlQ2UVRXbW53NlJ5TUtKL3FmSnF4akowWGpwY3lIa01Ua1hGMCtCZUoz?=
 =?utf-8?B?ZWV2Mm1lNVJwR1NEaDR6cWxTaEZlVTNCeDZzNTJGRUtYTEdkKzBOelM4Mk9E?=
 =?utf-8?B?OVhOMnE5VktNQmhIUzdrTFMyN0JnQkZTTnNtM2h6bkUzcjMxaUw1QjBISGcw?=
 =?utf-8?B?Q0xRQ3pwaDROY0VFWGlieHh0UzZaUzJ3UHNaTysycmdUZDg4blV0MHdnU1ZZ?=
 =?utf-8?B?ZEZITmd0UzE1dEtjTytUQWhLWGpFR3ZGNXZlaGpLZVVGeXFDNHEvVk5kM3Zs?=
 =?utf-8?B?a3FxVmZ1MWpzdFFvQ1lMRllBZGJmNzNkTFBSamhyOE5kQ3IwOUFRRjdibHpm?=
 =?utf-8?B?eFJmOGpXSzNpMWQ0cTA5cXVoNVAzZkVuSjVxcVhCQ2NKZGtmcW9FdXE5Mzc2?=
 =?utf-8?B?VDBMNnRINm55NGJZbm9CalRzRE94TXgvMlg1QWNJbDFTUUtIb29TbE1EQTUx?=
 =?utf-8?B?M2IzV0szaXJSMllJbGZ1ZngvK3FvNzJPb1FDMXc1ZGxqWlN0bi9kZnhaME5F?=
 =?utf-8?B?RkV4T2RIQS9MaDVIWFFOYlZLQjZjaUxwbVlEQUJ3Y0Z3QlVyYXA0MkdpbTlZ?=
 =?utf-8?B?NG5rZUxXZE1NbTY5STdEZFJWcE5mZnVDOTJ6QkxDTUI5dGMvaE5UaTVZZnN0?=
 =?utf-8?B?akV6eEk4bERCNjB4cDh5bTVkazRrTmFJMGcwaVcrSzdFa0ZtU0pFakhSM0Uz?=
 =?utf-8?B?YjJhaFhqaTFPQ3g0dmJnS2JiMjlYNTJnWXl1ck5XaDBZZUtjTTNJV1lSYVYy?=
 =?utf-8?B?QldZWmd0Z3VJbzQ5WXdvazVDdWdLRWdLeThWMnV3TWhxR2EzMDVLM0NNdkpr?=
 =?utf-8?B?U0F2YlNtMHAvOGdoRmtrUUI0cDZmRk9OMHVINysrSHpCOEVFRGxOamRRYzFh?=
 =?utf-8?B?SVN6Y2Y3eWtVaGZvMlhtL0dVZUNybjk3dHhQSUpMYkpjYkRzUUw5dmNjZXhB?=
 =?utf-8?B?dHIzb3dlWDQwc1JkdGFESzB2VlBpT2FlK2xaZ2p2ZTRlOHFzSDZjOGRBOFFO?=
 =?utf-8?B?bFgrdC82R01oYjQ5TCtMMkdrR2pmWUZaSWE0djhva0UwZlFXVHJMUE5jV29o?=
 =?utf-8?B?WXcyWE1vNGZ6VDFTc0FOanM0b3RhV04xRlRCcnBvbk5XOFhzVnA5bzZmMjJ2?=
 =?utf-8?B?SzB1SndORmVKVWZqNWdKclVjcjc2b3o2NXN3c1BhQlQ0dnovQUNzMkNoTGdS?=
 =?utf-8?Q?uQHJuamTRfaXHWQQ=3D?=
X-Exchange-RoutingPolicyChecked: Vre085wX24qZ7OCkLVZFDtdXhIeBiORevmgsogFhcv4h/652Tm2xY5bvC27+7Xqys/KviEEABO8ndYSdIRVEjiw++CZ0eFrJzttQt/wh1kpwgcAE8+7Q1gtz3NAF1CR2r/7lK3fOOFVY9lMIC5HMzwQuN4DKu/WEqz4OGS85RsesXbH94JagYI1eBB4X4ZltDnqUYNs6hT93/FeTDfNL9Ond0iTEVYmYAIlQFCuWgmWJdTrAKafoM3tj7MdDqRlGPJczIEtS+sqEK+sPYy05BCywVpzExvRVAPYdV1+eMoYGuESEEtHdCe5vsICzApl6xQt2fPbfpTzE7ophl49iKw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d2343b5a-e48a-4272-df20-08dedda24f56
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 10:10:32.1637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xSed9gsBqVbRcVfcqBHkmCLVJxVXybOMZQUnk14LdmDR6MyJ2KMNzi4jzpc8Hejryp/suqzDOtgcBhyehTF3jotHm5DhNqGIDR2wUoBAL60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6281
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

Hi Vitaly,

I left some comments below.

On 2026-07-06 at 19:50:13 -0400, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Implement vendor-agnostic platform filtering system that allows any
> vendor to plug in platform-specific test skipping logic via callbacks.
> 
> This combines both the interface (header) and implementation in a single
> commit as requested by Kamil Konieczny.
> 
> Key design elements:
> - struct platform_filter_ops: vendor callback interface
> - struct platform_skip_entry: vendor-neutral skip rule representation
> - enum skip_source: three-tier priority (built-in, config, env)
> - API functions: init, should_skip, require, dump
> 
> Platform filtering is automatic - tests only need to call
> platform_filter_init() once in igt_fixture. The IGT framework
> automatically checks each subtest before execution via __igt_run_subtest().
> 
> Example usage:
>   igt_fixture {
>       vendor_platform_filter_init(platform_info);
>   }
> 
>   igt_subtest("test") {
>       // Automatic filtering - no manual call needed!
>       test_code();
>   }
> 
> v3 changes (addressing Kamil Konieczny's review):
>  - Squashed header and implementation into single commit
>  - Removed unnecessary comment "Function prototypes..." from header
>  - Comprehensive documentation in separate commit (docs/platform_filtering.md)
>  - Automatic filtering via __igt_run_subtest() hook (no manual require calls)
>  - Fixed code style: include order, SPDX style, checkpatch clean
> 
> Addresses feedback from reviewers:
> 
> 1. Jani Nikula:
>    "I would have expected an attempt to make an IGT shared filtering
>    system generic enough to plug into any vendor's platforms."
> 
>    Resolution: Implemented vendor-agnostic callback-based design via
>    platform_filter_ops structure. Any vendor (Intel, AMD, Qualcomm, etc.)
>    can provide their own backend without modifying core framework.
> 
> 2. Kamil Konieczny:
>    a) "Add also example with config file as env vars are not convenient
>       for large tests lists"
> 
>       Resolution: Comprehensive documentation added in commit 5
>       (docs/platform_filtering.md) showing config file as RECOMMENDED
>       method with real-world examples, wildcards, and best practices.
> 
>    b) "imho you can get test name in require, no need to repeat it"
> 
>       Resolution: Went further - v3 removes igt_platform_require()
>       entirely. Filtering is now automatic via __igt_run_subtest() hook
>       in commit 4. Zero manual calls needed in subtests.
> 
>    c) Code style (include order, alignment, igt_debug vs igt_info)
> 
>       Resolution: Fixed in commits 2 and 3. Includes alphabetically
>       ordered, SPDX headers use // style, checkpatch clean.
> 
>    d) "No need for this comment" (function prototypes comment)
> 
>       Resolution: Removed unnecessary comment from header file.
> 
>    e) "Please squash this into second patch"
> 
>       Resolution: Header and implementation now in single commit.
> 
> 3. Multi-GPU support (integrated + discrete):
>    Current design queries platform once in igt_fixture. For multi-GPU
>    scenarios, tests can call platform_filter_init() per-device with
>    device-specific platform_info.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Change-Id: I370aa9f91b9d23e0fb79f3f04d8edb5cd4c57460
> ---
>  lib/igt_platform_filter.c | 579 ++++++++++++++++++++++++++++++++++++++
>  lib/igt_platform_filter.h | 122 ++++++++
>  lib/meson.build           |   1 +
>  3 files changed, 702 insertions(+)
>  create mode 100644 lib/igt_platform_filter.c
>  create mode 100644 lib/igt_platform_filter.h
> 
> diff --git a/lib/igt_platform_filter.c b/lib/igt_platform_filter.c
> new file mode 100644
> index 000000000..5e2e7c744
> --- /dev/null
> +++ b/lib/igt_platform_filter.c
> @@ -0,0 +1,579 @@
> +// SPDX-License-Identifier: MIT
> +// Copyright 2026 Advanced Micro Devices, Inc.
> +/*
> + * Generic platform-based test filtering framework
> + *
> + * This is a vendor-agnostic filtering system. Vendor-specific logic
> + * is implemented via platform_filter_ops callbacks.
> + */
> +
> +#include <ctype.h>
> +#include <fnmatch.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +
> +#include "igt.h"
> +#include "igt_platform_filter.h"
> +
> +/* Maximum entries from config file and env variable */
> +#define MAX_CONFIG_ENTRIES 256
> +#define MAX_ENV_ENTRIES 128
> +#define MAX_LINE_LENGTH 512
> +
> +/* Filter context - holds all runtime state (no globals) */
> +struct platform_filter_context {
> +	const struct platform_filter_ops *ops;
> +	const void *platform_info;
> +
> +	struct platform_skip_entry config_entries[MAX_CONFIG_ENTRIES];
> +	int config_entry_count;
> +
> +	struct platform_skip_entry env_entries[MAX_ENV_ENTRIES];
> +	int env_entry_count;
> +
> +	bool initialized;
> +	char current_platform_name[64];
> +};
> +
> +/* Single static instance - initialized on first use */
> +static struct platform_filter_context *get_filter_context(void)
> +{
> +	static struct platform_filter_context ctx = {0};
> +
> +	return &ctx;
> +}
> +
> +/*
> + * ================================================================
> + * HELPER FUNCTIONS
> + * ================================================================ */
> +
> +/* Helper: Trim whitespace from string */
> +static char *trim(char *str)
> +{
> +	char *end;
> +
> +	while (isspace(*str))
> +		str++;
> +
> +	if (*str == 0)
> +
No need for extra line here.
> +		return str;
> +
> +	end = str + strlen(str) - 1;
> +	while (end > str && isspace(*end))
> +		end--;
> +
> +	*(end + 1) = 0;
> +
> +	return str;
> +}
> +
> +/* Helper: Match wildcard or exact string */
> +static bool match_string(const char *pattern, const char *str)
> +{
> +	if (!pattern || !str)
> +
Or here...
> +		return false;
> +
> +	if (strcmp(pattern, "*") == 0)
> +
If there is an "if" that would cause an early return, then you
do not need to separate the return by newline.
> +		return true;
> +
> +	return fnmatch(pattern, str, 0) == 0;
> +}
> +
> +/* Helper: Check if entry matches platform/test/subtest */
> +static bool entry_matches(const struct platform_filter_context *ctx,
> +                          const struct platform_skip_entry *entry,
> +                          const char *test_name,
> +                          const char *subtest_name)
> +{
> +	if (entry->platform_data && ctx->ops->match_platform) {
> +		if (!ctx->ops->match_platform(ctx->platform_info, entry->platform_data))
> +
> +			return false;
> +	}
> +
> +	if (entry->test_name && strcmp(entry->test_name, "*") != 0) {
> +		if (!test_name || !match_string(entry->test_name, test_name))
> +
> +			return false;
> +	}
> +
> +	if (entry->subtest_glob && strcmp(entry->subtest_glob, "*") != 0) {
> +		if (!subtest_name || !match_string(entry->subtest_glob, subtest_name))
> +
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
> +/*
> + * ================================================================
> + * CONFIG FILE PARSER (/etc/igt/platform_skip.conf)
> + * ================================================================ */
> +
> +/* Parse one line from config file */
> +static bool parse_config_line(struct platform_filter_context *ctx,
> +                               char *line,
> +                               struct platform_skip_entry *entry)
> +{
> +	char *platform, *test, *subtest, *reason;
> +
> +	/* Skip comments and empty lines */
> +	line = trim(line);
> +	if (line[0] == '#' || line[0] == 0)
> +
> +		return false;
> +
> +	/* Format: platform:test:subtest:reason */
> +	platform = strtok(line, ":");
> +	test = strtok(NULL, ":");
> +	subtest = strtok(NULL, ":");
> +	reason = strtok(NULL, "\n");
> +
> +	if (!platform || !test || !subtest) {
> +		igt_warn("Invalid config line format (expected platform:test:subtest:reason)\n");
> +
> +		return false;
> +	}
> +
> +	/* Allocate and copy strings */
> +	entry->test_name = strdup(trim(test));
> +	entry->subtest_glob = strdup(trim(subtest));
> +	entry->reason = reason ? strdup(trim(reason)) : strdup("No reason");
> +
> +	/* Parse platform using vendor callback */
> +	platform = trim(platform);
> +	if (ctx->ops->parse_platform_config && strcmp(platform, "*") != 0) {
> +		/* Vendor-specific platform string */
> +		if (!ctx->ops->parse_platform_config(platform, &entry->platform_data)) {
> +			igt_warn("Failed to parse platform: %s\n", platform);
> +			free((void *)entry->test_name);
> +			free((void *)entry->subtest_glob);
> +			free((void *)entry->reason);
These are automatically cast to void *, no need to manually do
that.

> +
> +			return false;
> +		}
> +	} else {
> +		/* Wildcard or no vendor-specific parsing available */
> +		entry->platform_data = NULL;
> +	}
> +	return true;
> +}
> +
> +/* Load config file */
This comment is reduntant with the function name. Expand it to
contain some more details or remove it.

> +static void load_config_file(struct platform_filter_context *ctx, const char *filename)
> +{
> +	FILE *f;
> +	char line[MAX_LINE_LENGTH];
> +
> +	f = fopen(filename, "r");
> +	if (!f) {
> +		igt_debug("Config file not found: %s\n", filename);
> +
> +		return;
> +	}
> +
> +	igt_info("Loading platform skip config from: %s\n", filename);
> +
> +	while (fgets(line, sizeof(line), f)) {
> +		if (ctx->config_entry_count >= MAX_CONFIG_ENTRIES) {
> +			igt_warn("Config file has too many entries (max %d)\n",
> +			         MAX_CONFIG_ENTRIES);
> +			break;
> +		}
> +
> +		if (parse_config_line(ctx, line, &ctx->config_entries[ctx->config_entry_count])) {
> +			ctx->config_entry_count++;
> +		}
> +	}
> +
> +	fclose(f);
> +	igt_info("Loaded %d skip rules from config file\n", ctx->config_entry_count);
> +}
> +
> +/*
> + * ================================================================
> + * ENVIRONMENT VARIABLE PARSER (IGT_PLATFORM_SKIP_CONFIG)
> + * ================================================================ */
> +
> +/* Parse environment variable entries (semicolon-separated) */
> +static void load_env_variable(struct platform_filter_context *ctx)
> +{
> +	char *env, *env_copy, *entry_str, *saveptr;
> +	const char *env_value;
> +
> +	env_value = getenv("IGT_PLATFORM_SKIP_CONFIG");
> +	if (!env_value || env_value[0] == 0) {
> +		igt_debug("IGT_PLATFORM_SKIP_CONFIG not set\n");
> +
> +		return;
> +	}
> +
> +	igt_info("Loading platform skip config from IGT_PLATFORM_SKIP_CONFIG\n");
> +
> +	env_copy = strdup(env_value);
> +	env = env_copy;
> +
> +	/* Parse semicolon-separated entries */
> +	while ((entry_str = strtok_r(env, ";", &saveptr)) != NULL) {
> +		env = NULL; /* For subsequent strtok_r calls */
> +
> +		if (ctx->env_entry_count >= MAX_ENV_ENTRIES) {
> +			igt_warn("Too many env variable entries (max %d)\n",
> +			         MAX_ENV_ENTRIES);
> +			break;
> +		}
> +
> +		if (parse_config_line(ctx, entry_str, &ctx->env_entries[ctx->env_entry_count])) {
> +			ctx->env_entry_count++;
> +		}
> +	}
> +
> +	free(env_copy);
> +	igt_info("Loaded %d skip rules from environment variable\n", ctx->env_entry_count);
> +}
> +
> +/*
> + * ================================================================
> + * PUBLIC API IMPLEMENTATION
> + * ================================================================ */
> +
> +
> +/**
> + * igt_platform_filter_init:
> + * @ops: Platform-specific operation callbacks
> + * @platform_info: Vendor-specific platform identification data
> + *
> + * Initialize the platform filtering system with vendor-specific backend.
> + * This sets up the filter context and loads skip rules from three sources
> + * in priority order:
> + * 1. Built-in rules (highest priority, vendor-provided)
> + * 2. Config file /etc/igt/platform_skip.conf
> + * 3. Environment variable IGT_PLATFORM_SKIP_CONFIG (lowest priority)
> + *
> + * The filtering system is vendor-agnostic. Platform matching logic is
> + * provided through the @ops callbacks, allowing each vendor to implement
> + * their own identification scheme (e.g., AMD uses family_id/chip_rev,
> + * Intel could use platform_id/stepping).
> + *
> + * Must be called once before using igt_platform_require().
> + */
> +void igt_platform_filter_init(const struct platform_filter_ops *ops,
> +                               const void *platform_info)
> +{
> +	struct platform_filter_context *ctx = get_filter_context();
> +
> +	if (ctx->initialized)
> +
> +		return;
> +
> +	if (!ops) {
> +		igt_warn("Platform filter ops is NULL, filtering disabled\n");
> +
> +		return;
> +	}
> +
> +	ctx->ops = ops;
> +	ctx->platform_info = platform_info;
> +
> +	igt_info("Initializing platform filter system (3-tier priority) for vendor: %s\n",
> +	         ops->name ? ops->name : "unknown");
> +
> +	/* Get current platform name */
> +
> +/**
> + * igt_platform_should_skip:
> + * @test_name: Name of the test
> + * @subtest_name: Name of the subtest (or NULL for test-level check)
> + *
> + * Check if a test/subtest should be skipped based on platform filtering rules.
> + *
> + * Returns: true if the test should be skipped, false otherwise
> + */
This comment should be placed a before igt_platform_should_skip.

> +	if (ops->get_platform_name) {
> +		const char *pname = ops->get_platform_name(platform_info);
> +		snprintf(ctx->current_platform_name, sizeof(ctx->current_platform_name),
> +		         "%s", pname ? pname : "unknown");
> +	}
> +
> +	/* Priority 1: Built-in array (vendor-specific) */
> +	igt_debug("  Priority 1: Built-in array (vendor-specific)\n");
Drop the comments and igt_debugs from this section. They do not
provide useful information about the implementation or
application state.
> +
> +	/* Priority 2: Config file */
> +	igt_debug("  Priority 2: Config file /etc/igt/platform_skip.conf\n");
> +	load_config_file(ctx, "/etc/igt/platform_skip.conf");
> +
> +	/* Priority 3: Environment variable */
> +	igt_debug("  Priority 3: Environment variable IGT_PLATFORM_SKIP_CONFIG\n");
> +	load_env_variable(ctx);
> +
> +	ctx->initialized = true;
> +	igt_info("Platform filter initialization complete\n");
> +}
> +
> +bool igt_platform_should_skip(const char *test_name,
> +                               const char *subtest_name,
> +                               enum skip_source *source,
> +                               const char **reason)
> +{
> +	struct platform_filter_context *ctx = get_filter_context();
> +	const struct platform_skip_entry *entry;
> +	int i, count;
> +
> +	if (!ctx->initialized) {
> +		igt_warn("Platform filter not initialized\n");
> +		if (source)
> +			*source = SKIP_SOURCE_NONE;
> +		if (reason)
> +			*reason = NULL;
> +
> +		return false;
> +	}
> +
> +	/* Priority 1: Check built-in array FIRST */
> +	if (ctx->ops->get_builtin_rules) {
> +		const struct platform_skip_entry *builtin = ctx->ops->get_builtin_rules(&count);
> +		for (i = 0; i < count; i++) {
> +			entry = &builtin[i];
> +			if (entry_matches(ctx, entry, test_name, subtest_name)) {
> +				if (source)
> +					*source = SKIP_SOURCE_BUILTIN;
> +				if (reason)
> +					*reason = entry->reason;
> +				igt_debug("Skip (built-in): %s:%s - %s\n",
> +				          entry->test_name ? entry->test_name : "*",
> +				          entry->subtest_glob ? entry->subtest_glob : "*",
> +				          entry->reason ? entry->reason : "no reason");
> +
> +				return true;
> +			}
> +		}
> +	}
> +
> +	/* Priority 2: Check config file */
> +	for (i = 0; i < ctx->config_entry_count; i++) {
> +		entry = &ctx->config_entries[i];
> +		if (entry_matches(ctx, entry, test_name, subtest_name)) {
> +			if (source)
> +				*source = SKIP_SOURCE_CONFIG;
> +			if (reason)
> +				*reason = entry->reason;
> +			igt_debug("Skip (config): %s:%s - %s\n",
> +			          entry->test_name, entry->subtest_glob, entry->reason);
> +
> +			return true;
> +		}
> +	}
> +
> +
> +/**
> + * igt_platform_require:
> + * @subtest_name: Name of the subtest to check
> + *
> + * Check if current subtest should be skipped and call igt_skip() if matched.
> + * This integrates platform filtering with IGT's standard skip mechanism.
> + *
> + * The function automatically determines the test name from igt_test_name().
> + * If a skip rule matches, calls igt_skip() with the configured reason.
> + */
This comment should be placed before igt_platform_require.

> +	/* Priority 3: Check environment variable */
> +	for (i = 0; i < ctx->env_entry_count; i++) {
> +		entry = &ctx->env_entries[i];
> +		if (entry_matches(ctx, entry, test_name, subtest_name)) {
> +			if (source)
> +				*source = SKIP_SOURCE_ENV;
> +			if (reason)
> +				*reason = entry->reason;
> +			igt_debug("Skip (env): %s:%s - %s\n",
> +			          entry->test_name, entry->subtest_glob, entry->reason);
> +
> +			return true;
> +		}
> +	}
> +
> +	if (source)
> +		*source = SKIP_SOURCE_NONE;
> +	if (reason)
> +		*reason = NULL;
> +
> +	return false;
> +}
> +
> +void igt_platform_require(const char *subtest_name)
> +{
> +	enum skip_source source;
> +	const char *test_name = igt_test_name();
> +	const char *reason;
> +
> +	if (igt_platform_should_skip(test_name, subtest_name, &source, &reason)) {
> +
> +/**
> + * igt_platform_filter_dump:
> + *
> + * Dump the current platform filtering configuration to stdout.
> + * Shows all loaded skip rules from built-in, config file, and environment
> + * variable sources. Useful for debugging which rules are active.
> + */
This comment should be placed before igt_platform_filter_dump.

> +		const char *source_str;
> +
> +		switch (source) {
> +		case SKIP_SOURCE_BUILTIN:
> +			source_str = "built-in array";
> +			break;
> +		case SKIP_SOURCE_CONFIG:
> +			source_str = "config file";
> +			break;
> +		case SKIP_SOURCE_ENV:
> +			source_str = "environment variable";
> +			break;
> +		default:
> +			source_str = "unknown";
> +		}
> +
> +		igt_skip("Skipped on this platform [%s]: %s\n",
> +		         source_str, reason ? reason : "no reason");
> +	}
> +}
> +
> +void igt_platform_filter_dump(void)
> +{
> +	struct platform_filter_context *ctx = get_filter_context();
> +	const struct platform_skip_entry *entry;
> +	int i, total_count, count;
> +
> +	if (!ctx->initialized) {
> +		igt_info("Platform filter not initialized\n");
> +
> +		return;
> +	}
> +
> +	igt_info("\n");
> +	igt_info("═══════════════════════════════════════════════════════════════════\n");
> +	igt_info(" PLATFORM SKIP FILTER CONFIGURATION - THREE-TIER PRIORITY SYSTEM\n");
> +	igt_info("═══════════════════════════════════════════════════════════════════\n\n");
> +
> +	igt_info("Vendor: %s\n", ctx->ops->name ? ctx->ops->name : "unknown");
> +	if (ctx->current_platform_name[0]) {
> +		igt_info("Current Platform: %s\n\n", ctx->current_platform_name);
> +	}
> +
> +	/* Priority 1: Built-in array */
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +	igt_info(" PRIORITY 1: BUILT-IN PRODUCTION ARRAY (VENDOR-SPECIFIC)\n");
> +	igt_info(" Source: Vendor implementation\n");
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +
> +	total_count = 0;
total_count -> builtin_entry_count to match other counter names
and have more descriptive name for this variable.

> +	if (ctx->ops->get_builtin_rules) {
> +		const struct platform_skip_entry *builtin = ctx->ops->get_builtin_rules(&count);
> +		for (i = 0; i < count; i++) {
> +			entry = &builtin[i];
> +			total_count++;
> +			igt_info("  %2d. %s : %s\n",
> +			       total_count,
> +			       entry->test_name ? entry->test_name : "*",
> +			       entry->subtest_glob ? entry->subtest_glob : "*");
> +			igt_info("      Reason: %s\n", entry->reason ? entry->reason : "no reason");
> +
> +			/* Print platform data if vendor provides dump callback */
> +			if (entry->platform_data && ctx->ops->dump_platform_data) {
> +				igt_info("      Platform: ");
> +				ctx->ops->dump_platform_data(entry->platform_data);
> +				igt_info("\n");
> +			}
> +			igt_info("\n");
> +		}
> +	}
> +	if (total_count == 0) {
> +		igt_info("  (No built-in rules)\n\n");
> +	}
> +
> +	/* Priority 2: Config file */
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +	igt_info(" PRIORITY 2: DEVELOPMENT CONFIG FILE\n");
> +	igt_info(" Source: /etc/igt/platform_skip.conf\n");
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +
> +	if (ctx->config_entry_count > 0) {
> +		for (i = 0; i < ctx->config_entry_count; i++) {
> +			entry = &ctx->config_entries[i];
> +			igt_info("  %2d. %s : %s\n",
> +			       i + 1,
> +			       entry->test_name,
> +			       entry->subtest_glob);
> +			igt_info("      Reason: %s\n\n", entry->reason);
> +		}
> +	} else {
> +		igt_info("  (No config file rules loaded)\n\n");
> +	}
> +
> +	/* Priority 3: Environment variable */
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +	igt_info(" PRIORITY 3: RUNTIME ENVIRONMENT VARIABLE\n");
> +	igt_info(" Source: IGT_PLATFORM_SKIP_CONFIG\n");
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +
> +	if (ctx->env_entry_count > 0) {
> +		for (i = 0; i < ctx->env_entry_count; i++) {
> +			entry = &ctx->env_entries[i];
> +
> +/**
> + * igt_platform_filter_dump_to_file:
> + * @filename: Path to output file
> + *
> + * Dump platform filtering configuration to a file.
> + *
> + * Returns: 0 on success, -1 on error
> + */
This comment should be placed before igt_platform_filter_dump_to_file.

> +			igt_info("  %2d. %s : %s\n",
> +			       i + 1,
> +			       entry->test_name,
> +			       entry->subtest_glob);
> +			igt_info("      Reason: %s\n\n", entry->reason);
> +		}
> +	} else {
> +		igt_info("  (No environment variable rules)\n\n");
> +	}
> +
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +	igt_info(" SUMMARY\n");
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +	igt_info("  Built-in rules:     %d\n", total_count);
> +	igt_info("  Config file rules:  %d\n", ctx->config_entry_count);
> +	igt_info("  Environment rules:  %d\n", ctx->env_entry_count);
> +	igt_info("  Total skip rules:   %d\n", total_count + ctx->config_entry_count + ctx->env_entry_count);
> +	igt_info("\n");
> +	igt_info("═══════════════════════════════════════════════════════════════════\n\n");
> +}
> +
> +int igt_platform_filter_dump_to_file(const char *filename)
> +{
> +	FILE *old_stdout;
> +	FILE *f;
> +
> +	f = fopen(filename, "w");
> +	if (!f) {
> +		igt_warn("Failed to open %s for writing\n", filename);
> +
> +		return -1;
> +	}
> +
> +	/* Redirect stdout to file */
> +	old_stdout = stdout;
> +	stdout = f;
> +
> +	igt_platform_filter_dump();
> +
> +	/* Restore stdout */
> +	stdout = old_stdout;
> +	fclose(f);
> +
> +	igt_info("Platform filter configuration dumped to: %s\n", filename);
> +
> +	return 0;
> +}
> diff --git a/lib/igt_platform_filter.h b/lib/igt_platform_filter.h
> new file mode 100644
> index 000000000..d64450489
> --- /dev/null
> +++ b/lib/igt_platform_filter.h
> @@ -0,0 +1,122 @@
> +/* SPDX-License-Identifier: MIT
> + * Copyright 2026 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef IGT_PLATFORM_FILTER_H
> +#define IGT_PLATFORM_FILTER_H
> +
> +#include <stdbool.h>
> +
> +/**
> + * SECTION: igt_platform_filter
> + * @short_description: Generic platform-based test filtering framework
> + * @title: Platform Filter
> + * @include: igt_platform_filter.h
> + *
> + * Generic test filtering system that allows skipping tests/subtests based
> + * on platform characteristics. Designed to be vendor-agnostic with
> + * vendor-specific backends.
> + *
> + * Three-tier priority system (checked in sequence, first match wins):
> + *   1. PRODUCTION: Built-in compile-time rules (vendor-specific)
> + *   2. DEVELOPMENT: Config file /etc/igt/platform_skip.conf
> + *   3. RUNTIME: Environment variable IGT_PLATFORM_SKIP_CONFIG
> + *
> + * Vendor Implementation:
> + *   Each vendor implements platform_filter_ops callbacks to provide:
> + *   - Platform identification and matching logic
> + *   - Platform-specific data structures
> + *   - Built-in skip rules
> + *
> + * Usage in tests:
> + *   igt_fixture() {
> + *       igt_platform_filter_init(vendor_ops, platform_info);
> + *   }
> + *
> + *   igt_subtest("my-test") {
> + *       // Automatic filtering - no manual call needed!
> + *       test_code();
> + *   }
> + *
> + * Config file format (/etc/igt/platform_skip.conf):
> + *   # Lines starting with # are comments
> + *   # Format: platform:test:subtest:reason
> + *   # Use * as wildcard
> + *
> + *   navi48:*:*:All tests disabled on Navi48
> + *   alderlake:i915_pm:*:Power management tests broken
> + *
> + * Environment variable format (IGT_PLATFORM_SKIP_CONFIG):
> + *   Same as config file, semicolon-separated entries:
> + *   export IGT_PLATFORM_SKIP_CONFIG="navi48:*:*:Testing;navi10:amd_basic:*:Broken"
> + */
> +
> +/* Maximum platform ranges per skip entry */
> +#define MAX_PLATFORM_RANGES 4
> +
> +/**
> + * enum skip_source - Source of skip rule
> + */
> +enum skip_source {
> +	SKIP_SOURCE_BUILTIN,    /* From vendor built-in array */
> +	SKIP_SOURCE_CONFIG,     /* From /etc/igt/platform_skip.conf */
> +	SKIP_SOURCE_ENV,        /* From IGT_PLATFORM_SKIP_CONFIG */
> +	SKIP_SOURCE_NONE,       /* Not skipped */
> +};
> +
> +/**
> + * struct platform_skip_entry - Generic skip rule entry
> + *
> + * Generic structure for skip rules. Vendor-specific data is stored
> + * in platform_data field and interpreted by vendor callbacks.
> + */
> +struct platform_skip_entry {
> +	const char *test_name;          /* Test binary name or "*" for all */
> +	const char *subtest_glob;       /* Subtest pattern (fnmatch) or "*" */
> +	const char *reason;             /* Human-readable reason (required) */
Your logic appends "No reason" when it is not provided, so it is
technically not required by the implementation.
If you wish to emphasize its importance then bail out in your
code when this string is unavailable or use
(should be provided if possible) instead of (required).

> +	void *platform_data;            /* Vendor-specific platform matching data */
> +};
> +
> +/**
> + * struct platform_filter_ops - Vendor-specific operations
> + *
> + * Callback structure that vendors implement to provide platform-specific
> + * filtering logic. This allows the core filtering framework to remain
> + * vendor-agnostic.
> + */
> +struct platform_filter_ops {
> +	/** @name: Vendor name (e.g., "amd", "intel") */
> +
> +	const char *name;
> +
> +	/** @get_platform_name: Get current platform name */
> +	const char *(*get_platform_name)(const void *platform_info);
> +
> +	/** @match_platform: Check if skip entry matches current platform */
> +	bool (*match_platform)(const void *platform_info, const void *platform_data);
> +
> +	/** @parse_platform_config: Parse platform string from config file */
> +	bool (*parse_platform_config)(const char *platform_str, void **platform_data_out);
> +
> +	/** @get_builtin_rules: Get vendor-specific built-in skip rules */
> +	const struct platform_skip_entry *(*get_builtin_rules)(int *count_out);
> +
> +	/** @dump_platform_data: Dump platform_data for debugging (optional) */
> +	void (*dump_platform_data)(const void *platform_data);
> +};
> +
> +void igt_platform_filter_init(const struct platform_filter_ops *ops,
> +			       const void *platform_info);
> +
> +void igt_platform_require(const char *subtest_name);
> +
> +bool igt_platform_should_skip(const char *test_name,
> +			       const char *subtest_name,
> +			       enum skip_source *source,
> +			       const char **reason);
> +
> +void igt_platform_filter_dump(void);
> +
> +int igt_platform_filter_dump_to_file(const char *filename);
> +
> +#endif /* IGT_PLATFORM_FILTER_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index c45a96530..898d21cb4 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -38,6 +38,7 @@ lib_sources = [
>  	'igt_params.c',
>  	'igt_perf.c',
>  	'igt_pipe_crc.c',
> +	'igt_platform_filter.c',
>  	'igt_power.c',
>  	'igt_primes.c',
>  	'igt_pci.c',
> -- 
> 2.54.0
> 

-- 
Best Regards,
Krzysztof
