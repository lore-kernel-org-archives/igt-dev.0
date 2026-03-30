Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF2AFF494B
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 07:17:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E5510E389;
	Mon, 30 Mar 2026 07:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BLDqRqtN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D9F10E389
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 07:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774855066; x=1806391066;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xotgkEkvczIwe9PhDN3LuGOUyzQ+ZmMqaqUmAjR4Jlo=;
 b=BLDqRqtNrvWQPYpIS7E8SYdHDsObvfiJgrOhja+tsDPP/Qk65fFgjVFk
 MLWjZ/dxnFIqKaNzDhbzr2TcMAeTTQgVQZD524HPmfo0HKpnno4Oa75Ow
 Z4vUzxvkoMAzJBPxwasTqUJSi0AFcCA3NgzczEveKmOFOmGdeViceZD33
 0evo3CIUna7HMuyQP+iYx7o4P30cmlg+GiJURlp6AGiALwj0u6zFKwEoH
 8O9T9459A5Lh1rO5BMA+hcw1dgQLmvHEOKGgEgsuWpbNnKWFpDnKZGiwi
 J4bkt4dSgC/ISqmdwHMs+Z+j0wl8WWUeYVU6WoTl2neaxY5xzAuS0+WAi w==;
X-CSE-ConnectionGUID: Z4VDNZjnT0KFcgdNu4G0Eg==
X-CSE-MsgGUID: ao57XcrRQteR/8fuRIYJcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86458485"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="86458485"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 00:17:46 -0700
X-CSE-ConnectionGUID: 0xWIs66bSqGQv51OhJ30BQ==
X-CSE-MsgGUID: EXnwHDIrQ4mWgXW/gqIoyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="222659617"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 00:17:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 00:17:45 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 00:17:45 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 00:17:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VV5E/h2/5E6wPgmdSZ98OQxD8BoiG5NUJ/gt+KQpk6+FiyrcEGFoqn8LO1NaW7FrmkL0fK18T2/UbHZfyJTjfgsacI6NmPW4XwvzMxuXIiFIWK/m5zjoGLtbrjEcnhNS9qnaqTtkY2wTFvMYH7z0SUa4XzKCjvdgTxhvSdmigBwlg+syaTeNEQyNFfw1BZQ6L3frkxgqlxv9PMzcLBBsWQCEzz8u/72RMYCymLk72aeGsQHKrAhA/PFoB93VykB7Woys2KexOv50/LG2vN9JPFQpvhGi1eD/5euJV5viig0QzqOAoi2sE8zyL4Y35qZVZERA2o2v96IZlkBAVTImEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YlMNbpw8kuPvxsdrJzedguq7VkSTnvyrjHww6e4mu4=;
 b=oUWGBk2mrEBxwtNUO3T+unlGho/WbfeEBQpbpjZbzq8xs/+r6qGAUmJZ0aQB4cugTji0aZhu03c2Iz+hx6nfAhBacOIo2HaqWnrpRLlXLCougC+goruJyh1QccMyvsI5iuy1nAcrIfkdGfTFmhqMJaPsYeirIfi04iAs+Zydw+dj9jJmv8pyNOl9z4fLGgy20apCV3OySSbaNpcrIkUvaPF2Nh4ktlKTa9yfKufQNHNexXMvEgkj4y5rF1hVO7/GrkL9809mnXG5FsdsjlV2ChotH/xwyQG7rMnP/Xej8UaZUgzLZEzAZCmQA/DdObn3IV1qtoKxrqhhYR3EGo4F1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by CY8PR11MB6841.namprd11.prod.outlook.com (2603:10b6:930:62::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 07:17:42 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 07:17:42 +0000
Date: Mon, 30 Mar 2026 07:17:32 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v2 3/6] runner: Add attachments directory content
 in subtests results
Message-ID: <77ydcpqprvudigtjr2uk6f5z64trbl5mst6a7f237pc526c6lx@hifj2jiyjh62>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260324131235.712916-8-zbigniew.kempczynski@intel.com>
 <20260324131235.712916-11-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260324131235.712916-11-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: DUZPR01CA0217.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::11) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|CY8PR11MB6841:EE_
X-MS-Office365-Filtering-Correlation-Id: 31a923b4-c35a-4451-4df9-08de8e2c6eb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: qK4sSgkiKRQ1zjOYp0CvXGr7q1Yt2oZw3ohLpVBu4Toh2tTzLT0k19goAz/kLdDX1xaz0nSr4S1Z1D1wYDAq4sAVxh/y3yRjQJQqggalntkP3OJxFJp3DtSmsklm/rwJmXRtxatl+JUivFRe3BDBQS8rPTaEajsixDWRVlipPX/8txyu7jiUO+QLF/scUbH6BAkFjCcDMywq9cLOr0FhkA5GGRQ4uSqY+LbVkTQerni23kK9gIEO4e3UVB7FEIIiP6UlSKbBC4Q98PyJInHRWJkxRJ4W3imSLCdZXZKw/lSuSbyK4sGDJDPGaRh521Pttl0fmc2T0g+l+gChtM619HKI6GNtNk20B+DwH15nickne+6nud+5UU4ufFKWKtxN2Vq+BZ9lsHqgw3HgCW6iX9MIJTsEbA7JlPcRaE6G/5vXsfoB0MKOELSDVKDdAmnUxp7kJ5gRuoSxaFZCtS55Y6JilAaCXv4EQNG3In6KdjMQBHhCrKp2gzeRacFDQFc4IFSDmW/IFptoGA9IXR4QmcZYfIETVkzY+pi1EYqvFlIlOFNst62TZqKJLCRZRcoqmujsFmLXU/n+OffGBKleagFt+v6VPqtGR+6S2k6e/mwCFgVJOjs0sHOe3LNiNgEVlpaXSzzTgpP/mh4jCF5YS1Q3gkSR45A9OnNieu/1CzrFcTFRZZfITuiaZEV4n1p1gxOtx4L2jam7nU25obLZU9yu2S8rjX4KBCDiauY8Wmg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTdwam1kV2hncnpCY1JoY0FvRXNucE9zMkZYZVNtellYSHpaaEZ4cG5zNVBO?=
 =?utf-8?B?OUw4b3lWVW1rdjY1b3g2UnFveGUyWk1MQXVVTVV1dWZVUUN4dGk1Z3lMOXRN?=
 =?utf-8?B?VnBoSEJYRVZCNmJSVms5aUZ1WnRpS3RRald6ZHpyN0Q2OEJRT0V2QTZaOWh6?=
 =?utf-8?B?aTE0QXpzZG5uM2NaWjM5MFRUcytZc3BMckVqS0oyYVpCaUJQeXJkanhoZHM5?=
 =?utf-8?B?ZHFHMGIvOHlHZDdTeXZjQk42RnprclZ3cmtIM3VZWk94OW5Nd3VhV2trbm15?=
 =?utf-8?B?NnlUeTM2dlpib0U2Nml4ZlljSTNqZUhPd01XK2Vsc0pyT2tjNFo2UjFHVnEy?=
 =?utf-8?B?cnVEck00R3NQRlZ1NnJmZ0xwblpPbWJibFZKcndxazVhNkhmMjdlVThUS1J0?=
 =?utf-8?B?a3pRY2YxSysvTDUzZEZqcllxcVhSdXpFTEl3TWtYUjMxUEs0dWt0OFA2aGhu?=
 =?utf-8?B?VGtTQnQzdmpmSDlyclVXQVdPK0hLejJXb0d0T3h0cVlCWldUNG5tOXpKek1N?=
 =?utf-8?B?bEZRaXVzLzdXWGRhZ2xOdjhJT1dmZk45QUN3L0RKRWRlV3FOV1g2UmRGa1Ez?=
 =?utf-8?B?Q3dmTHNzUzBOakFxcGxmckdFMzhvbHZZMVVBSHp2ODZrWWZVN2RGd25vbkxH?=
 =?utf-8?B?OGgyOVo1T1JFZUJuTkZEd01ORUd6TkFLUW5yY0ZZdFNkYXQ3ZzJPV3ArN01N?=
 =?utf-8?B?cEpLd3VEL2VJNlhJM0d4K082Wi9xMWo5YkxIZHRhREVkRnVrc0d2eVhJa1ZB?=
 =?utf-8?B?V2ZJdU05WmRmV1E2U0JaNnMvcEI2Tzkza0pLZlAwS3lzdlRFTUhySFZDQjgr?=
 =?utf-8?B?Vk1BYk42MFhJNWh3ek51SFBsNnNXaXg0YldwazJORCtkRkowbkJhd1E1RU1y?=
 =?utf-8?B?MDJ2UmQwWFNXazB5VE4xRGNVeDlzU3g2MVo1VUNXeVFVU045UWFGWVQxMzM0?=
 =?utf-8?B?bGNjdzJFL2tHanRycTFBY0tDSnV4clN2SmRSakZRLzBlQThSMlpvSjdKV05z?=
 =?utf-8?B?bloyRzJ2ZWc5a0Y1bmQ4UjF3ZG52RXNFcEtJRzBzUGxXalFxV0xjRTBTczI2?=
 =?utf-8?B?TW5UeWEwZjMzd0dNR1BuYUhVK1hXbGJ4MjBVUlFSZzErNjEyMzY0UDl0bmdO?=
 =?utf-8?B?MGlJZ1UxSEZuVXRiTWZXSUhtTEw5OVVtY3d3anQwZWFGOFlVME5WM3FRSm9J?=
 =?utf-8?B?aVJUY05KN3VOOXpIU2NDUzBqdlB4WmJBSkV1MHdadkJwWGhteGtiL1NpSlhz?=
 =?utf-8?B?anRxQVA3cFRXNkhuRi9XYWJ1Y2hQWFI0V1JSM0sybFRFQ3daTm1VRE1haWhi?=
 =?utf-8?B?d2YvNGFhbnNnbHlxcXpRWGtvRUN4REF2ZVlYMjRsTEJHMFFTdTE0OVRqQ0w5?=
 =?utf-8?B?Y01vdVRTQnF6S2psOWtXSGZyUUs2RjJzM0VaL3gvbHlJSFVLSzVQbm5lbk5l?=
 =?utf-8?B?VUN4SDNoRVhWWjVRZmFpY1FqM3hoQXpKaUk3cU1aRnBsZWZxVlFIbklSNHBZ?=
 =?utf-8?B?ajZXcDI0ck9aMm9OcnNoQWVwcjVhdGNyMVc0S1VwRU5HNE1ocHZwVDFIallH?=
 =?utf-8?B?bFdGV09oZWE2Y1lxWTVhTjkvZmRpTndQZjN3Y1p6WEpCa1J5bXM2S0Z2L2FZ?=
 =?utf-8?B?N0FoRndNbFFmWVFBbnlwZUt6K3pzdGtLZVVPaVhzR0FWcXNKd0pKb1dCbTBs?=
 =?utf-8?B?ZTRnWktnTy8vNkhXNXRIZWVMeFlpQXdocENXNmx0dFFURmM2YWNiUlBROHM5?=
 =?utf-8?B?SkpDdUdYUmtuVjRKYjJTRGpSUXJqSzF5SXpXNVpKVDdzOUhDVll4czU5Q0l3?=
 =?utf-8?B?RjFxQXBYVEZaRCszRkoxRmNhYVdUWmNzY2VmRGp3d3N3aHVGajRQZ2dNejRr?=
 =?utf-8?B?RFIxOGpIdU5SbTZzNHNCWVhIMGxTcUdLUzJPVEFBajJySlhjMEpaaTF5Ykls?=
 =?utf-8?B?VjBMVC91U0s4YWJnV2ZTN1Q2dTdGT1FFR0dtTTAveUMyUFA1YzhjQXJabWhH?=
 =?utf-8?B?eFhHcDI4THRXajI2bGRNbGpqRFF5NWxXQ2MvcFR2aCtZbEdQRmpPamlBekVI?=
 =?utf-8?B?NlhNOEE0bmVDbU0xTmtVL1pLUGN2SFBDSFJVcmF0MFE4NDY0MS84ejN0Vi96?=
 =?utf-8?B?L0VrbnYyMEhHSzZERDhBbzFTTkRNb1VJbUlLc3BiOFN1ZDM3KzRjc3oxQ2hw?=
 =?utf-8?B?dm1zc3RheHNPQVJLMjZQMllxOTdVYzdIZ1Jzd0FWQU5VU3F2a2MvNExwREs1?=
 =?utf-8?B?bExyajFRaC9hMkU0SWdUdnlOYnhvWEprWnV4UkFzVHdHWEdJRzNBT05VOFZt?=
 =?utf-8?B?S3NFc2I2cU56ZDBQSTBWNFVwc1laT3hIYzh1eGZxb2oweUJGdDc4OUZrYVFa?=
 =?utf-8?Q?/pIGCMg4SFtOsXkc=3D?=
X-Exchange-RoutingPolicyChecked: RJGfA0Pj1VFW7d/mN8idxWTm1Drcv4JUR3N9OCW9htk68eeTf3awoPQOCbMDGl8wYEuVeHvacqnDzWSxyzyxxhmrkw+uJhSJwpcx/u3eabr2QrJW9tSFmagXOEKvlBlyut7l/QdxdmjCl2y0iwaH9F8xAGrmhwEjA9VctVKMdstZcQ6QLE8wpg9wvg+jbtc1iFNHdzwhJqd4zTTuM7O8hbZf+q8fJfUWxBkNxVi2+8izu6E19kVHjZQ016xd68RH75M6zq/qJ1g7eSvt496rD7v5bugS37/Lpf5B6JyPosyPQDVEwP4n4eEwamjLLTU+ZqivHQr68QAEkpvzAYA+Xg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a923b4-c35a-4451-4df9-08de8e2c6eb0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 07:17:42.0903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4zv+80k5784Q4kmSehK0SGmwm35tQHh3IW4Q+pPRD8N3kh8sruruiuShkayiv1FCSeKGVPOscH/Xm9At2tecNsrB3YK3MFIGYpgujBSRETM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6841
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

Hi Zbigniew,

On 2026-03-24 at 14:12:39 +0100, Zbigniew Kempczyński wrote:
> Files produced by hooks which lands in attachments directory should
> be called in piglit style, what means they should be in form:
> 
> igt@test@subtest@@unique-filename-from-hook
> igt@test@subtest@dynsubtest@@unique-filename-from-hook
> 
> depending is it normal subtest or dynamic subtest.
> 
> Hooks introduced IGT_HOOK_TEST_FULLNAME env variable, which contains
> 
> igt@test@subtest
> igt@test@subtest@dynsubtest
> 
> and it should be used as prefix part (before '@@') of attachment
> filename when hook script writes some content to it.
> 
> Such defined contract between hook script and resultgen allows to
> distinguish subtest/dynsubtest attachments structure in results.json.
> So string before '@@' is a subtest/dynsubtest name in results file,
> and string after it is a unique key of a base64 file content added
> to results.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> ---

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
