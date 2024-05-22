Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF685C25B77
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 11:38:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770FD10E2B2;
	Wed, 22 May 2024 11:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fx1kksN1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4625810E2B2
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 11:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716377933; x=1747913933;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0xukwFkFx1VDQtblgkNNCNyGt/Qu6BJZWO7VyCV5Kp4=;
 b=fx1kksN1QToxLCJY2yC7VtWRCi1X9fvL+QTRMMweOTBYVy/s4st6ni/J
 wjRYa39fm9giiz37xmk7iTJfK07WjlSpk6Hf/yxE7xdP+C6ZrNvmwSnII
 n0uwdad0vhyDCO94wpNGGFyQf57WjUtie5MdvVqNYhXJraQ1RJEprWvvH
 7KrOjXZqTmCfTyI5vjs5hV5rnqF/uICUnmy8QGuI9FJLqSVCE8bByUSXa
 qZWMJ2MRS0KpUQFDIsBjRguz23UseT7J5IWMmkLHvCs/Gr/f8RdpHvFhu
 3Lp3tcTdHGxdjHStgyH4xwBqi4JrAjnMHlBdL9q+k8G9Dsa3u+b8O00uv g==;
X-CSE-ConnectionGUID: lwSBqF+uSgmSjG79qdrscA==
X-CSE-MsgGUID: gUSHcvQ+RLmFb5bqvYwFEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="23751277"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="23751277"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 04:38:51 -0700
X-CSE-ConnectionGUID: OLAZ9CttTo6j9YnwNoHHJA==
X-CSE-MsgGUID: yblUB95FSBiVVLHqAV9CHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="33372317"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 04:38:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 04:38:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 04:38:49 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 04:38:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=As+pRSQ1dpcPzBydPRrYgX49+H/pIZt6fU0uUXHdLinM68z8Fl6DdTpqLCjii8aZl+TeIPrFtbcZnAL+5V023x06GC3QT5w82XCIEoxryApNvIAAdFY1qCkO3FpvrlJ+v28QzREy745g2E+EeRMVtAXruTzV7JPt+aZStvf++aAcj+lSLpRw8o+/CBxmvdDZ+u7UISvz1An+/M2lmbrNje6OxvhmlWbFgI2S46EMc3tiqH4EQsRm2J+YLrVP5xCazMfusRq/tFmk1fptXQQFPoKaN0vtt2A3EncI/TJW++mOmBDPRLwletIVwS0rIYxzRs/VfU09boTFo8TU95w+ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJwkfUobgH2NGSbz3h4pYjaEUccKhCgoVVeZ2K3st/Q=;
 b=Q46GuWac6Sh2AzWBWirPDLsTQJW8zW6rtwwIpBoEjNoC/7K2Ywl8M0RMHk8N3jZnH0NaZS8WkE1ZUTOKEvctZhsKjo5jmktGTtD2+JSxOJ2XFnk+FFhavDax8Vwx5Kpadhi2o1GO4HFprq9qZ2nkmTu/RBgqC7ehUlEkQMlZRkA8Fbm4Qwp+0PlKrpfziltto5FAsJo08q8cNJY1RcfiOsF/cs8SoWelirkiuIdM08VjzG+HzQtZ5DoFMdv/z8UlH7Dd5qxhUrpFNK5uZtZViJsfYIeTTsaFsSS4B0RzTgWgO5vUV02XiruKwhil1QWoxxXTQgalQvIZdYYvrOrjtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH0PR11MB5951.namprd11.prod.outlook.com (2603:10b6:510:145::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Wed, 22 May
 2024 11:38:47 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7587.030; Wed, 22 May 2024
 11:38:47 +0000
Date: Wed, 22 May 2024 11:38:18 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3 00/10] tests/intel/xe_svm: Add tests for Shared
 Virtual Memory (SVM)
Message-ID: <Zk3ZKogBOM/YVWq9@DUT025-TGLU.fm.intel.com>
References: <20240517114658.810283-1-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240517114658.810283-1-krishnaiah.bommu@intel.com>
X-ClientProxiedBy: BY3PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:254::9) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH0PR11MB5951:EE_
X-MS-Office365-Filtering-Correlation-Id: fa45c115-2618-424b-69c0-08dc7a53be51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Hh3fxOAiO0PB21yRGWxz0k8kh3j2xBZ4aFebOac3HxmWIZ36jiipyYgSj3aR?=
 =?us-ascii?Q?WtRhCurOBoyDfMxud5uQEJVQiHXM6Hiu1l2D/jOWO66F/0Zd+uqGfEMFFWaS?=
 =?us-ascii?Q?iGQhh0aKnkXPA631lILPj3xI2XnmzzBe18gD1ledPCQeQ9EZHLlymhCCTGPm?=
 =?us-ascii?Q?f1bGj1j9MlOaPoFwv9x8v1Z9qXBQYobFph5x+Ge0t2nzSpZHN1f+X+CUMgU1?=
 =?us-ascii?Q?OFudYD2IlafDdVK1aAfBg87ykHYSeDeR35w0DCuYwsHVFeqN2YZk23nxBgiY?=
 =?us-ascii?Q?6SxwWqhDDCItegupD1A2rgXLKQ4HnN8+zayBT4OgAUL9oARilvwbVQ0JvVsz?=
 =?us-ascii?Q?V3hP6ThOrSizZ8iFr7RJMDI+AedZkr9pLnTiZx7KVBIFsKd5+QjUh656s5Hr?=
 =?us-ascii?Q?xmj/DR0PFn1HdniaLZbWAZkLks4tH5FF5N6lxtllILyiJuwQRF7ZkJLT/D0T?=
 =?us-ascii?Q?ChHzNBji5dYS4Dq8zQWwv3fgCUlho/0ST/2462U5ZE/TB131lmf7F1SImrjo?=
 =?us-ascii?Q?79ZfdUBt1y0G1jUESAntxV9arNBzYInCDRHFaKPMBNFbpTxmo58LoioXQtYo?=
 =?us-ascii?Q?fAAxnvOSHvKTmOaBUcTM5Q0sDwKEHy7GdJBso0o0VSuzSxJrdXT7jx8MjQSJ?=
 =?us-ascii?Q?2jglsRnSVBz3pSCxJnstitxEYoK3o6XKFr8CWQfKKexdIDF3bcZ9Xmr/1C56?=
 =?us-ascii?Q?LgbDBTpII4rNmEVODr69X/2rxOoHfETcphJi2lOLV2THh6/LDDif/YkTWpJY?=
 =?us-ascii?Q?5RyIgiIbL4ww2yT7g9ZX4dEv6wRF62ahV4Wb5A44qzhkKl73m0gtwoMZJlC2?=
 =?us-ascii?Q?q+qpJt6lmmgNsLeA+RkUGXk6TiI3nAxsGTjTfuONX45SFVXHWAwDRdxZ2FqD?=
 =?us-ascii?Q?4V0SPSt8Rb/VxOHFcTCryxBjFqijQItubzJIjGbO292APZIX/wB0fCgyrcht?=
 =?us-ascii?Q?MNdX4BINZFoCgm/dmQi1F5D2olJlWuB/M4ujQ69ZsMPtIcwkLluIIgPDwysp?=
 =?us-ascii?Q?Yr+2LnXOhRx3LOYXH5W1t3jRM3eO39RuYeY1nBxHOY31VY67FW2uf9HfznNn?=
 =?us-ascii?Q?p6dTNGLkdOk+w1oS2k3Ans6VYVM0U+LbXRsOtDoAfrGWWSd26tcQXlrY2s4A?=
 =?us-ascii?Q?pYpyRBhgZM/h6VZR+g+1ODYGm40HuntAvAmk9sk8cRkc/nTNhXabNp7Fx9GY?=
 =?us-ascii?Q?NEAMB9jnvDkMzzL5e2L7+DPu2bihcmMYKxs3xe+yos4Ig/KBFhSVbZ3us9k?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QVBidO7y5UsEJw9PFKpyMno2PLA9nEMWo+ZIb70EmPKXnF+cwt6dflCqbLNj?=
 =?us-ascii?Q?BHQxvwFHhW6mUj9RHFYMnDAXlx8wCgRCToQYJtH0dufay6tO+MZBMdiasGKk?=
 =?us-ascii?Q?IMlH7NSHt6eJ+PXxc5c7kbiUjykBay+XG1Oe9lbLHulBT8IZRvTEopdsYplx?=
 =?us-ascii?Q?U1W1ZMQqCxocGIO5+qFw9ZHLIiG2TYCfxb6kaBGCDbe1cxHR0dqs2coEswD8?=
 =?us-ascii?Q?Zx6mUEPIB3II8vIEQxK1KM71sVawm5M8Am8YJnnI7/F7XehHgQtudsRBNF0l?=
 =?us-ascii?Q?IQjCo2k7uS+E6IAtQBSMD4OxNbrVHzFTcOE8r/sss+HdodQMqO8AKKWmclOz?=
 =?us-ascii?Q?5ecw6x6N/KMiEl7edsdA9x3BPvG7JfdtSoVgjFvJY66UBsr5x+0/e333WzA2?=
 =?us-ascii?Q?XuppouYPP49uMdD/nSfdXoZXIUEEEJWPendiyNHlZVUkXm91Y6BU1fMFnU/J?=
 =?us-ascii?Q?V2k7cbELDdIDUSuFATx8kZXuW4KUXUsrAO5OyezRMT7Yds3Ac6gXVH8+MfqE?=
 =?us-ascii?Q?06rCmknp6juDSGXtXnUvuOwu/CL203vs3pjRt+rROYW187zlu7ULmzXYWrSk?=
 =?us-ascii?Q?ZEp/GyiyRqliAyNztB6IAIdxhHhpWfb4wxUbGw72N7FEZgOg/weGm3ebng94?=
 =?us-ascii?Q?SaZ8VTB/sR8KAWPBvWU6cSkODmnpKHwvfmWYvY/hOdI0GpjqCbxPNIn7Q+sg?=
 =?us-ascii?Q?iZFa4LQ0I3XSrh0kSuFnKajoN7a3BMQMz0sr+RArYhIgRe/8p9H7o3zIEA9Z?=
 =?us-ascii?Q?ztfOG3ePG0slBd9TuvDcg/Eg4Uq2pLVa9t9MjRs6mayTi09qRtI2pzA8mViy?=
 =?us-ascii?Q?dC7KrIju/jddU8kudA47aOovJPGoYL776CzBHvlw4GjgDiJIBis8djpDnBu3?=
 =?us-ascii?Q?7O5rbL9ISKnfQdAwjJNlGljr1UE9aBBMIWiEfTGtN4xmViacSgB0rP/3m5ei?=
 =?us-ascii?Q?HWw7HbL5rkwjCtcz70tPjj9Sve7ZlnzAoyszdycoN5dZK5cGryTPa1DW9i3B?=
 =?us-ascii?Q?0bUHnyAWqiA0L2H+y+IpmhAJfqwEq49k7wPZGOUSM2+39ksUTecpRi/Sdugm?=
 =?us-ascii?Q?5gu1H1Wip7vaoHmNUEa23r2Z4lAmM/2DALDlL6wSNM1tXhXr4EppnV7IJmz9?=
 =?us-ascii?Q?5hSp5eoPaD7uzMKOXSMTmwxZ0iaKwum52482pVW8/hWs/rohwuh1IcgdsP2a?=
 =?us-ascii?Q?Rk6XvSiYT1yt0jrs922OdF5R99wlppXKu+cXqRiuGeCrUVuws2TiQDuNQK77?=
 =?us-ascii?Q?Af5SzZgBwBKK8LwSODbJzIU1VpAgSeLCDeAo6DMw32UZTzyY69Milq9LwEbN?=
 =?us-ascii?Q?yanzDrbMVgo3bYoOECH1foKwJsuYfrtA+VQYHwyAMERsxPgwvfdMVS7hZ/MQ?=
 =?us-ascii?Q?0Pe2ilbHeZ3LSbOZ5W+xo1BuUtjTLJHsbkLa5ZcZCsnzc3Yf00qdqgnulUXv?=
 =?us-ascii?Q?APL1kiNWP9nUZ+PQOtL8cI1QKI6URDrTxpCGEpk7FXfSLf0M5UzhqmAJ5K8Z?=
 =?us-ascii?Q?V5faJdJSDo28s9Gf/JCbqdpRtaDoA+qES334Xi0g7JZLpZoumf4chqrgth10?=
 =?us-ascii?Q?LAfd/18gTQtAzuHmmnWImmuAj/ZcO4b4zWvX5RADQdsyJNyy4OKz5gixy9B7?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa45c115-2618-424b-69c0-08dc7a53be51
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 11:38:47.5408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9guvymQb1yB/8uktEWo01Z2az2nVYRousF048AIbHZdkJMKmc18GR6jYpC9Ot6proeO5ftJoRZCrrk8D9oZlng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5951
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

On Fri, May 17, 2024 at 05:16:48PM +0530, Bommu Krishnaiah wrote:
> Introduce helper functions for object creation, binding, submission,
> and destruction, applicable for SVM and other tests
> 
> xe-basic test is validating the helper function introduced in 'lib/xe/xe_util: helper function'
> 
> svm test cases:
> svm-basic-malloc
> svm-basic-mmap
> svm-random-access
> svm-huge-page
> svm-atomic-access
> svm-atomic-access
> svm_invalid_va
> svm-mprotect
> svm-benchmark
> svm-sparse-access
> 

There's a lot here I dislike. Let me be direct.

Firstly, this isn't an SVM test; it explicitly binds userptrs and BOs. So using
SVM prefixes in the test names doesn't make sense. And having RBs with those
names makes even less sense. With that; This email is directed at EVERYONE
replying to this series.

At a high level, I've expressed my views on generic helpers hindering the
ability to create truly powerful tests that provide the necessary coverage for a
complex driver. See my thoughts here [1] [2]. I don't see anything here that
comes close to addressing my concerns. These tests are so simple they won't find
any bugs in the KMD beyond the implementation being completely broken.

This is what I think an SVM test should look like [3] (for the record, I have
shared an eariler baseline of this code too). While it has some complex coding
patterns, once understood by a developer, it's quite easy to extend for a new
test case. Let me give an example...

Take a look at this diff [4]. It's a few lines of code that add HUGE_TLB
testing. This simple change spawns over 100 tests of various varieties (e.g., a
single exec with HUGE_TLB, two execs, many execs, multi-threaded versions,
multi-process versions, etc...).

Before change:
./build/tests/xe_exec_system_allocator --l | wc
    938     938   32872

After change:
./build/tests/xe_exec_system_allocator --l | wc
   1070    1070   37852

Being extendable like this ultimately reduces maintenance costs over time.

The test I've shared creates true coverage and is just a starting point. It will
need to become more complex over time as the SVM uAPI grows.

I suggest investing the time to learn how the code I've shared works and develop
within that framework. If the same level of coverage/extendability can be
achieved with helpers, great. Anything less, in either area, I don't think is
acceptable.

Matt

I can't find PW links for [1][2] so instead have shared the email thread subject
lines. Everyone on this email was on those chains as well.

[1] [PATCH RFC i-g-t 0/2] helper function
[2] [PATCH] lib/xe/xe_util: Creating the helper functions
[3] https://patchwork.freedesktop.org/patch/594807/?series=133846&rev=1
[4] https://pastebin.com/jUN5BwUy
 
> svm kernel implimentation:
> https://gitlab.freedesktop.org/oak/xe-kernel-driver-svm.git
> branch: origin/drm-xe-next-svm-unify-userptr
> 
> v2 igt patch: https://patchwork.freedesktop.org/series/133096/
> 
> Note: xe-basic test is validated without SVM. Remaining tests are not validated because the SVM driver code is still under development
> 
> Bommu Krishnaiah (10):
>   lib/xe/xe_util: Introduce helper functions for buffer creation and
>     command submission etc
>   tests/intel/xe_svm: basic xe-basic test
>   tests/intel/xe_svm: Add SVM basic tests using malloc and mmap
>   tests/intel/xe_svm: add random access test for SVM
>   tests/intel/xe_svm: add huge page access test for SVM
>   tests/intel/xe_svm: Add support for GPU atomic access test for svm
>   tests/intel/xe_svm: Add svm-invalid-va test to verify SVM
>     functionality with invalid address access
>   tests/intel/xe_svm: Add svm-benchmark test to measure SVM performance
>     with a simple benchmark
>   tests/intel/xe_svm: Add svm-mprotect test to verify SVM functionality
>     with read-only memory access
>   tests/intel/xe_svm: Add svm-sparse-access test to verify sparsely
>     accessing two memory locations with SVM
> 
>  include/drm-uapi/xe_drm.h |   1 +
>  lib/xe/xe_util.c          | 214 +++++++++++++++++
>  lib/xe/xe_util.h          |  40 ++++
>  tests/intel/xe_svm.c      | 476 ++++++++++++++++++++++++++++++++++++++
>  tests/meson.build         |   1 +
>  5 files changed, 732 insertions(+)
>  create mode 100644 tests/intel/xe_svm.c
> 
> -- 
> 2.25.1
> 
