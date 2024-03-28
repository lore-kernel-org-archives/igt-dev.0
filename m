Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F3ACD11DF
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 19:34:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD4410F2D5;
	Thu, 28 Mar 2024 19:34:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RYZZp9l8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBDB10F2D5
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 19:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711654481; x=1743190481;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eIu2Iaa5ri9+GiC0As6LFZrUJU3/n2hEicNiM4nPf9M=;
 b=RYZZp9l8zPoZWwy0xg3NSRNG4sHnzKKDdPKUmKZgta6i3KNspBBDsrV/
 cCVn7uMo0fBCX06QslKEx0DbJtU5RE1fxaGrRZysEtoE4B/coenM5hgm6
 h7TehIs86VLLeZ7yEgpnAGjas1w3NKmZOw0U9mRzJxnzLK9BJmjNL0d6T
 ImaEuQLnY9VM+Lf0hZ2FdTRYpsw+NSYrO9skvCd/qCbEnJ0i6sdJfzb3w
 LgU+r/ZPMm2f5aAX6jJW9A4Wwczj+GfBu9wxhWDrz0Wh0QNbBrQ3HWVVx
 HZRwQ1jEC2f+6QplCRoiWYNiDjtMNUKpJhVikczD0PXUUYGyOqbenJUTf w==;
X-CSE-ConnectionGUID: GZhFqPQqRXKnDdnw3/hQ3Q==
X-CSE-MsgGUID: ylJ+lYCQSRyCMu9U5HFaZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="9788792"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="9788792"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 12:34:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="21402963"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 12:34:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 12:34:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 12:34:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 12:34:34 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 12:34:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=clwgLhhBXBfS8r1Nd43Ll0bXWcss3pwUiMgRUzhh/DSq1GvU1QKbRFPBYFFZc7A9MAl+lsyRLvPSBP0cdBHzWeMc817LCuZ9Y0FAI+NESFz6U0lNP4WU7COft/xNfwPT5aNC/mTNg+8iwkvTm//aEmcz/G9quxy6Tn66PivMrk5wI5FEKjedFKx9vUvYJNqfjQU4+YffyIUf2k7FuUKSEU1h9no8KlL6Fp1fOHZRMUG+DFxaKZUgPoYGZmVekMBhpDwnxytDcrMkfN9cpHhFp65PNMGgHt5boIzDIPYn2asm9xGh/xDV6r1WKytAtCDeKV/jej9f6SL6DKQsr9+G+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lg+aDS38pnl3lEYyN2EiD2nRo4UxyqaHIaEHrteTv+U=;
 b=EerWsGo1NskHXLqPU21o/MB4i9LjM3w2kOEx1V3i5EpjwDOfS7f5xA8STmLa8cXoAqNNo4si1B3AAH9UjNlQG3w03pdob7PetPeyRTWvEA5IP0yeeAXKm0bMkb38V+7+U0LQ/qqc/JSUTltEcl9MPquEwvAYO7sO4vJzT9ggEANC/C88ilv1fFL1pGe2CGzF2ppSnW5uDQiL7G4dnobHgx1ojyFOJY/pBHsfm+/InTft0CjeGLMFuVCVpNufZeQ26j211HP0oFPGX9d1lvmn/3sTSH0gdi9rE6lJwKCnjhTS6bQut9UT7QZVqDdb97/v7Hns4cKTFby12NrWVzC7Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB5231.namprd11.prod.outlook.com (2603:10b6:5:38a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Thu, 28 Mar
 2024 19:34:32 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.028; Thu, 28 Mar 2024
 19:34:32 +0000
Date: Thu, 28 Mar 2024 12:34:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLnhlQkFU?= =?utf-8?Q?=3A?= failure for lib:
 sync xe_pciids.h with kernel
Message-ID: <20240328193430.GI1332995@mdroper-desk1.amr.corp.intel.com>
References: <20240327202100.3910719-1-ravi.kumar.vodapalli@intel.com>
 <171158027930.1055708.13525037316518794315@8e613ede5ea5>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <171158027930.1055708.13525037316518794315@8e613ede5ea5>
X-ClientProxiedBy: SJ0PR03CA0201.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB5231:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kf0l85MbIhG516BD/FYIeP8zlVriBN5CocZYpVF0MYS2bkH69HEnP3dSfx5u6GGwvxkiInYgjSJUDkTMbZAd3dswq32eSxT0tGjo5ryABfbcJ/kuNcpDaHiznStCvSI/YBI+EoRYOlijBb/RXw49RlKSW5pnCnYcNFYoqkjscwTo4CjXFQvcmHhh/kWQH1g66MnSUD4Skr1G84eEz7UspczkhSK69VNix/kridhM/1Q9MAUdkSOApAyfyxmRNwTnaNGumdtV4glq6R5Ksc/LJE3EaNYT8Xtyp2Bq8XXTU6C0OLFoxXd6CgM4Aav2TU4WxIn87fM+1uMlncCrjAI5+yndEQGJbNn46/NQ3OI4++K67PiU5EvE7xE8ogz6BCSF8iiDLIjPrLnNWvt5JO9lXWnzu9ditjskAUFrxzqBHkyOeAwAGDL1uEB6Pd9jWO3qCWmQb38wy2fLqULz0jjAIVSGCQBc/cpfKQjJtLK3RZD/9fkuQmScPsd5hbGonw7nKr5vpjQ3527VjVWsxgA9OXrExY6Tse8WqcF/wvdzKjchrKQi3i4ysd6iLTBVUNY4T4iXKTu1hv9q5eyDEEeMZbjvbQLdJMG2cAr3DeXw/U8Ao7sXV7rD8tvhs3x68vpv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R8qWn5btltnpUHtY3dbRFAar95zhTqNg9xJf9YIGk4ORW3ofGegINvXGP3P4?=
 =?us-ascii?Q?MUsoxvVAo8cIUpLlt5VyLNRkBX7UsS6qeYylVps6O7qWF5AwKqOCyZ2bhZDA?=
 =?us-ascii?Q?/+oKZNBSntw57uals4Z6g6GJuw7FGpNj/a2nRsOzZwI24vlbTptuZ3QwvV/x?=
 =?us-ascii?Q?4m5umzBEgjCB8O/kBvK33TuRYqtg2+YjQSbKoXlk2Rma4CmfzqRQudPORjj5?=
 =?us-ascii?Q?7PiJR+DxicU4tnKkQKspDnibai19VqeiCrOgl1F7sx9ribL/9UPvaChvWDcB?=
 =?us-ascii?Q?VUQAjHlw9ApIZYE9FDOpAk6F9rCdX3XvwRXMo4xqONTLMzJYziGl1Unk8PNT?=
 =?us-ascii?Q?/oBNl1IcwurhQTDe5WCWUyxqiMuETNEFrvYNAfSuaO9y5rYqcQerDXGJCJ+C?=
 =?us-ascii?Q?DSZCc/JM1+f1mSNYyVS6rGGr+iTvXV7QKe0xg0iPKhtgojwkwQTAhZrVJhKb?=
 =?us-ascii?Q?UkQZmzFHFDsZCjU/qjHVU6iEc0vewpnyzI274CmeqIAwINY+o2jtfbOyPyV3?=
 =?us-ascii?Q?prElV5tFLX/9EKRsWY9SSAirc2bhusLbVnnvqfJH2jv+mQ++9DJC3qc9nu5l?=
 =?us-ascii?Q?9YtefziXKaOZLuqrXK59s+CAhJl9YdXOxVgQ0AESWFP4KyFpfG+8Jdab8mkh?=
 =?us-ascii?Q?cWmKuTnPNqneI2Q5jQFUOqi89aom4nexcuSxd7jUL1JgQl/t88Es1ZJoIX7J?=
 =?us-ascii?Q?5kvOm3s4JOAeT4XE5RvxZKkExRll52XCZUB2hIyMkiYDryWiAy3wmb8nO1sf?=
 =?us-ascii?Q?DLKLL8BL7HNgEkH8I7xFs4M/auG6I0mp9qiLeeA0W/QI5KaxT+c830L+x7Lk?=
 =?us-ascii?Q?NXCxBkt3zguoo0l5Rh4e4oQc1+nTPw17V2MiTvOpDWsd4e6qK8S10gZv8hgV?=
 =?us-ascii?Q?bH7bGSn4j0+aSBISoX1sILopfSDMfngWduNrrNAaDwpatTkni0qnQllLsh3j?=
 =?us-ascii?Q?fjx/o8Aj/o32jHxcIMisRGFXAeS2j4vcfXdu3Plfv1Ouaavxdlun6zypUqpc?=
 =?us-ascii?Q?i667+yZE76+Z9aJtGn65EACib9ceO516Cx2/sASAIpKfGe2tJbiMpN3XDQCu?=
 =?us-ascii?Q?ko+i7JjEEqi5oEfqmnOHjTtj7jJWgX5X8kOKUNkZ493iIwCswszyWiVixb70?=
 =?us-ascii?Q?kMnsTWc37IT7BtbO9i4vkFMPaWa1EJSBwoiibIAsjrCj8SK3D+Yl3vQZR44M?=
 =?us-ascii?Q?JfpKHrP+TTZ2X3mn2BPJQHFTrBqdsDGvvwUhxh6N0JUpYxUbe5v/02fRJAeU?=
 =?us-ascii?Q?fG05X1hG6nXVAjYr1eZQXPzKdiRqZ49nwIaCaxFrRWUd8s49QWKcn+nddOHc?=
 =?us-ascii?Q?an2kNRFfAe74S//B06Gm10Yl9q6ADPGG6feR98BPKGdd8iOLnVqtcNVSegN/?=
 =?us-ascii?Q?ZyduplseSYItmWWrX2s9xGobea8+v7x/fg+Yl7uQ79Gg5ol/WtwKNj8eX3tE?=
 =?us-ascii?Q?1mzS62zH39OK+oW+A23U7qC/fmgxTQZ2830cGAu2JDSUnTFQnRMUnKAyLvs/?=
 =?us-ascii?Q?g/pgi4soYrX2UztrF/BhPGYdXj2EN+c8pQMSqSz+Yd0S6SoX1AIleQnPd26r?=
 =?us-ascii?Q?3D3a5mk3Qcv3w5p8k6Gd76SSDWhEVfvUXfTiRhPUxuzzg4gBjcuqOirNaN0I?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf90e99e-313e-4b02-6810-08dc4f5e17c2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 19:34:32.4878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i6PZ2JJBixTIVa6g87pp7tUwVf6KDbYk49N4CT9ZaLrGbTpIvtCMDhC8pZbs7mvj0Cb1kkR/rolWoE7GJ0pRR9+j+CPpbahUs0658fxFt74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5231
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

On Wed, Mar 27, 2024 at 10:57:59PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib: sync xe_pciids.h with kernel
> URL   : https://patchwork.freedesktop.org/series/131710/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7786_BAT -> XEIGTPW_10935_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_10935_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_10935_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (5 -> 0)
> ------------------------------
> 
>   ERROR: It appears as if the changes made in XEIGTPW_10935_BAT prevented too many machines from booting.
> 
>   Missing    (5): bat-pvc-2 bat-lnl-1 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 

This looks like a hiccup in the CI system.  Updating IGT would not cause
all these machines to stop booting.

This is just adding missing PCI IDs that already exist in the kernel and
not changing any actual functionality, so I think we can ignore this.


Matt

> 
> 
> Changes
> -------
> 
>   No changes found
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7786 -> IGTPW_10935
>   * Linux: xe-998-f9c56f1a03b5c35488671e4ffe61e28b12ffe163 -> xe-1004-07c774152cf8a034784b40978a77b5ee66e4779b
> 
>   IGTPW_10935: 30fb47a9a1c4453a367779d4f1c266b1fe399f92 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7786: 1e4a3cd0a4bb3419fb70ed3e01259485b056dcfd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1004-07c774152cf8a034784b40978a77b5ee66e4779b: 07c774152cf8a034784b40978a77b5ee66e4779b
>   xe-998-f9c56f1a03b5c35488671e4ffe61e28b12ffe163: f9c56f1a03b5c35488671e4ffe61e28b12ffe163
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10935/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
