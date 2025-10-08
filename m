Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18ACBCCA470
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 22:01:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACDEC10E13A;
	Wed,  8 Oct 2025 22:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pm24yPDX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BFF10E13A
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 22:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759960914; x=1791496914;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zjAimLmPQGxHQezj8RA/9xlev+wh2mhiVGNWOV3Ml9U=;
 b=Pm24yPDXRxOiKJizP0Fvf6YtZtTtYInkzsvQGrcNRls3dkzRlvxiM38/
 CfvGz71fMBcnQlG5m9t8OF8NhIUEv49KOgPex7saia9YivKrv8IZSh58G
 j3H9AyafSzTI5CDRifL1cq6B0MTY+usFeXGaPraHFOBJ/8zWEovICF6Hk
 G7N7ONqszljLwjIL7n1yC1AVcgqrwQ4EKIb9w5K+4wo/7rfgJvncyQCYj
 qwkoVqgMNg+G7evYLnDpkSBJSMEnDsiLakLf4tAMFGK4nHYeBR17Licok
 pHaoOUjvhXvgICxJZb8XAfSV/ZyskkgY6CYgMmuR4GvxizIMD97X9cdcg A==;
X-CSE-ConnectionGUID: Piid7v7NR5aL4LAsFQQDcw==
X-CSE-MsgGUID: xy0Hr1ZDRQ+OhKPlecnnqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="84786011"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="84786011"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 15:01:54 -0700
X-CSE-ConnectionGUID: QCIg7EZ6TmqmKD/NWd7FFQ==
X-CSE-MsgGUID: eFCUtmRGT7esAXZKZLKdAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="180140107"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 15:01:54 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 15:01:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 15:01:52 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.46) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 15:01:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mk1/uWdHGMmkxbCi7OcFkHpfenSx11KDKYtPfGAcCpN/sh+DBGR0DlHGFLP4JKqMe5Dxo1D47RbfLpZv6OUjducvwtNEA1gcRkdQVxkg+ZOM+EJ88uJjtSdY3k+ebm9MCmJyAwuAGHoAO4f4+LkuFMnrUCbD6po9yZDMY745JE+02oUub+ndl6HXqto/E0FX1mJhIy4s8GZPtqu8o6oys9kkBdNcaxwvotF1aFh12x08L1MfVv57eeAnDf2YMNLV+z98eqH16R1FKO7Tpjm8nTbD431sg9Gb0n+kck2sx/E5dcAf245KWijgjhxosXryosOFqSFos1Y2Rvk9GlA48A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LPIJ5rjb/1+MHENZs+JpULNDVLZg3ns2p35bzUDxOhs=;
 b=Op2bBoj9AlHTzWbzvwC9idw6sLm5Q1rvz7WN6ckRcxqUxdIGVlwwhwaOTAayjCEDSzOblWb+oeZcgvXj97V/tFc9y6FGk0tJav5c8KtnJUy6w8Ri86uB5kwnsQj6V07iUTzTW3EcRNO21k8QYa/yoXPcOJc+aEv0z04nET9HBhOfUwuCV+5r4CLR2XnZ7CpMJMZphceY+e9K1loTuUQxVC9ki4aBqcTHRKifc3cc2kDY1g2V9HqHrA3eKo2Zjn1TBcdZ3UkpzjA+FpE7a7plfBqK8ACq6FRs7QrD0a0lxTwzZSpSk0nE2v3MsnsXPPHhQC4vs3bOK4798oSYgVFGhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB7758.namprd11.prod.outlook.com (2603:10b6:8:101::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Wed, 8 Oct
 2025 22:01:39 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 22:01:39 +0000
Date: Wed, 8 Oct 2025 15:01:36 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <shuicheng.lin@intel.com>, <brian3.nguyen@intel.com>, <alex.zuo@intel.com>,
 <nakshtra.goyal@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <gustavo.sousa@intel.com>
Subject: Re: [PATCH v3 1/6] lib: Add runtime device info query APIs for xe
 devices
Message-ID: <20251008220136.GC1207432@mdroper-desk1.amr.corp.intel.com>
References: <20251007050554.340485-1-x.wang@intel.com>
 <20251008210236.396859-1-x.wang@intel.com>
 <20251008210236.396859-2-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251008210236.396859-2-x.wang@intel.com>
X-ClientProxiedBy: BYAPR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::49) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB7758:EE_
X-MS-Office365-Filtering-Correlation-Id: e4459d89-77e8-4fe7-c90b-08de06b641da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Solbret3yTouoqQFviuhDUPZ37YyZ6tss32iOPL4NTOw87Qyvql2eYhYwUg+?=
 =?us-ascii?Q?X0Cyo7c3DcOMv4swGYofbCYyZiYW7sQsnxBLHhD9OxjnKlF2BCruU8zoLqEO?=
 =?us-ascii?Q?8KTISnQT+IWbA0QsPUl13+0Kro/DgEeTQhoYsZMduH0kKzpDexfUUPkijw7+?=
 =?us-ascii?Q?IY72LRsJLyvq1T/dcWQCcV/FrxAk6j+pliYByHWWPZ2GA3vNgV7obuliK+FF?=
 =?us-ascii?Q?LAGyne65wllqXed9t4O9TpaoN/KCa+MJy4DEXdcBTm0SZeAuG4XIdQjUIzbZ?=
 =?us-ascii?Q?bQfMnZ9IeJqhDFJshF1xNP9THbVTEnflaSAnC+aBf3rhHwls5oSL4unlUnxx?=
 =?us-ascii?Q?lD7SVXuVqRE+Cag5+g+SGelUF+06HepBnqJ1YvqvF1ex4zzNNF6Aopmey968?=
 =?us-ascii?Q?zPJ/MZ4njzU32WJ8EpyFXc/LJP8rMIoqlY7Jk3Z+Q6aRVqNkSoADNM/jHToG?=
 =?us-ascii?Q?YJnQKyROqAo62YW6cQz6vhhnJffRSxzYPMds5LyzAeq34tBvjFQ8u7RHVCr7?=
 =?us-ascii?Q?7HZOL3Czf7eaiHjbcwISs9J+8sff/CJXZ682ScxfAIPhmfO+hVgnNCdETFwC?=
 =?us-ascii?Q?UgSGQ965JX3pgJNls7ctLjMw9hAxj9LU+jjPl9uZ9CGK6kKdwUL7GR8j4UGk?=
 =?us-ascii?Q?+K28lRPEBiUKEUoFX9xWU22Js7W1AgdBJJcexAXTfYAhs8qf9BzSJEuL0Q07?=
 =?us-ascii?Q?x9uJaDXkGPaqX6r3YcZPmvqHnjuOxasYYPVtJldcv4wcpTgHN8gztngu+wrP?=
 =?us-ascii?Q?0QIzRhwegty/S+8Cwvfj5Xk1qARkYd0pU+jzridyIs69a9buJ0oWjxZ2M1qw?=
 =?us-ascii?Q?vToD1xJa2q1zF4UBKi6qTitAGPmT1AEWlOjdbF8UL5+tCYZFfGFFkjcWAlHu?=
 =?us-ascii?Q?a9iCh5lvMSRpaTkg0yXi1jCz5/NZA5lFUxzC1cQuwEIsFI0Tme+I2oYme1g0?=
 =?us-ascii?Q?DXrabjbWjgCQfKMbFGOmYmYApycBupaT8POfnFSkGNl1mMYWrGrlMJN3Hqka?=
 =?us-ascii?Q?4dMZ19ompMK8Hd4ibADA6qSKeXDKueLHAfX3VVlL7gO6ueyrJ79eMoTzUHBY?=
 =?us-ascii?Q?ur06QljTNVcfVNm/qnGmA90LYLQr/e8At9APjxi60wLwyd6R/6Tiv96p8RyK?=
 =?us-ascii?Q?8fZKou640WAoQR30MTdMGq848ZSLPOOGlt9dAUHArIO8rVSLql7Wy3l2Rn2x?=
 =?us-ascii?Q?lJ0X95ZEyQDgHY/dedUgw8mYKCuv3co7Kw4CpqPi+L3khX8DHp1lTKRAL/W/?=
 =?us-ascii?Q?uJCoZ8Q1cMu2Qf9BaqL9u2P+G1WOLV5RI7pV5KCtFQJXM5aMDk3HyJPeok1i?=
 =?us-ascii?Q?oF9czxWVgknmVWV+nLYOsuExpV0RaXHfJM+Zc+drqu9j9VTAl0TX2DKrI7dt?=
 =?us-ascii?Q?hi1bt4Dtu5G3DKd2RicDjVcB+Z/cSzQeOXXl+u3i+IhdUkhnQR3Hjdtd53wS?=
 =?us-ascii?Q?AtFCiW0wGRNS6LibWhlPdzpBgYtedIci?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mvy303gBZvl49R9ktR7+LRqD9xTjmXiW5tLve+wx4Bssn2zyoNjRd6c/PVYX?=
 =?us-ascii?Q?9V7XtGdyHQABAxZONL0bBWg5udTWGKP4pUdmsrphG709QZQzyYAG8k0fgqjq?=
 =?us-ascii?Q?R3pbM8gc7dUO7cX8q1El6X5GqMl1j66jvtIN2RRPHvqLf25WTbiPUWnoFc1p?=
 =?us-ascii?Q?CB8hNPr21ByX/SF4W6dLYngc/CFRDRuOlclakFxU/LMbFzx3zJgMnyknQJrw?=
 =?us-ascii?Q?kwlNwSGuvcREd8Q6n4+7VBaTxuskP6TW7pZL8coMV8H3MT2sRJ6XS7nynu7l?=
 =?us-ascii?Q?05PJu3Jn8aDOuwluoreuCdNBDPsuWWl324Oeg5Kr3BNriJyjI4bL0P+Nic4D?=
 =?us-ascii?Q?1UzPwg2sw24KWaAaYI/vC7289DC+7G/ORDjOJ8ffr1eT4AYxZhcCMzy3FOk2?=
 =?us-ascii?Q?5SmkKhzRR3ub93/uvH4ivuSZIxFb3A1zaiR+vDk4Je8mMeea/ncOz9kv07jn?=
 =?us-ascii?Q?iuVSaWHppiPRbK154RlXBF2upNfru6gLAWtKZ6lxmNhw0LFKb5f054f9Fdyr?=
 =?us-ascii?Q?jApGgAhSUekeQQwJAnznm87M8hQ+g5Skywap7t7osFeQ64PNGJmG1AsLrfTh?=
 =?us-ascii?Q?XIstvO1uIAiAw/VpsE4mDmd+k1wQYFM+VdbfjbAAn7P1GZgIN5FbRcE58nzI?=
 =?us-ascii?Q?OV3OHHbrPLrY3fhLQvdHK5gIW92Yx/gxRybPJPsen0RtmfTuiU2qqlfQp9HC?=
 =?us-ascii?Q?t8EK+6yHMwytAN5Bw2EgbfwpDOvj/OZZ0TKzhGrhutAHHCHGhaohQcQ87eMT?=
 =?us-ascii?Q?po3VjZr14Bqn6c8spW655NepOGm01fXdH0b7MQuxhPdl4jR5RzmRwSg84IP+?=
 =?us-ascii?Q?utseKMjjfpey0HeH1IWt/BjmPBAuFGb7dViYXiJVlfFzm3XS+3WreW1s6wKX?=
 =?us-ascii?Q?Ck0m5cb7tV+5lJvnf1gtZ1+Khmx5C0cafsmOIg74ZVNlmz+UozfQnxrPjRl0?=
 =?us-ascii?Q?urq4HoYMmU+fliEDGPhWPzsYAVFoOPFblnf0i0m6jEZOgnVd0dvLGkQlsIGR?=
 =?us-ascii?Q?H14bbZOivb/X93ZBbqVWQ806SBgU5lW5Ca5GkG6W06kSbQWjQL7+BuYys9dA?=
 =?us-ascii?Q?IGIyieVJBO7s7q0JSePHvTWPZ5Dki3nb5O77LIvxQ60ARLMW2BzTq2Y/qqqc?=
 =?us-ascii?Q?OVTxeGS6nUn0w0A/bqOBb/wZp3mr1pCzf4DLI92PaQ2dSlLGUKiX0Fb1x4x+?=
 =?us-ascii?Q?9qYWkB7n7FGV1soZHF3tfRQ8/q/6BZAgVVjzWgz2BsutFnpqF9ZLyngoGVHO?=
 =?us-ascii?Q?eRfyUvq+d87x8PvhUmQYIUgIBH87OzF285h4XULsVrjFEnraHWQTe6vA8YAJ?=
 =?us-ascii?Q?UVdoEfdBmtMSh4BUnXBheQXAGdFGLYw14iKx/w6lGqd9J7n9tbaySJIovxy0?=
 =?us-ascii?Q?r/pNWGXL9m+FqQXTZ45C0eLV70Et7Uyo6FK3JUQzY8nLUNp7GdEBeIVMdJIW?=
 =?us-ascii?Q?NjiBki+Y9/ug+LgqslMSr5L9VmZeRYJbIvC8Gtx5oY3IpJ1shrSoE7629Qmc?=
 =?us-ascii?Q?wec+GxNaSZo3b1sL230xS+4IqWnkUgwJjphScyG+g2HAlJfAj2vSditEOePx?=
 =?us-ascii?Q?Xh0Sy9dGDa3vtrQmntmasfSY8P9HJYNnQmLBnfUHJ5F3XK3RSfwt1kDHe6v8?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4459d89-77e8-4fe7-c90b-08de06b641da
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 22:01:39.3653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yxzR7akbQiXBZviktQ/YnzHaZet3S2MQkCcSvdeWxJWAqSp2MjDWskaDlQadvFNYu4IB3Eu4OCSt9Wft8ol4gXrkC9URv5Eiv+UE5iJJlUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7758
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

On Wed, Oct 08, 2025 at 09:02:31PM +0000, Xin Wang wrote:
> Introduce new APIs to query device information at runtime for xe devices:
> - intel_query_gen(int fd): Get graphics generation
> - intel_query_graphics_ver(int fd): Get combined graphics version
> - intel_query_device_info(int fd): Get device info structure

High-level question:  across our existing IGT codebase, how many places
in the code truly need to lookup IP versions based solely on the PCI ID
and don't have any access to an actual device (in the form of an fd)?
From a quick skim, it seems like the vast majority of our code has some
pattern along the lines of

        int fd = ...;
        uint16_t devid = intel_get_drm_devid(fd);

        if (intel_graphics_ver(devid) >= ...)
                ...

Aside from a few exceptions[*] it seems like the path of least
resistance would be to adjust the signature of our existing intel_gen()
and intel_graphics_ver() functions to just take an fd instead of a
devid.  Initially those functions could call intel_get_drm_devid()
internally to get a device ID and do a device info lookup, and then
subsequent patches could add additional logic to do a proper ioctl query
first, and then only fall back to the device info in cases where the
query isn't possible (i.e., i915 driver and/or pre-GMD_ID platform).

[*] From a quick skim of the code, the main exceptions that jumped out
at me as truly needing a devid rather than an fd were:

 - The printing/dumping functions in lib/instdone.c that get called by
   tools/intel_error_decode.c.  These wind up being a bit different
   because they're specifically used by a tool that analyzes error
   dumps; the device ID used during error dump processing either comes
   from the error dump file on disk or from the tool's command line.
   The device itself isn't opened and may not even be available since
   the error decoding can be executed on a different platform than the
   dump itself originally came from.

 - Tools like intel_reg, intel_gtt, etc. that scan the list of PCI
   devices and use libpciaccess to map+access BARs without ever
   opening the DRM file handle.  In fact, these tools can potentially
   run without the driver loaded at all since all they care about is PCI
   device enumeration and raw access to the BARs.

Since the exceptions noted above are all tools (and mostly old tools
that nobody actively updates anymore), I'd be inclined to let the tests
and other parts of the codebase that are actively developed continue
using the existing function names (intel_gen, intel_graphics_ver, etc.),
just with a signature change to take an fd instead of devid.  Then We
can create a separate set of dedicated functions (e.g.,
"i915_graphics_ver_from_devid()") for the special cases where lookups by
device ID are unavoidable.  Since lookups by device ID simply aren't
possible going forward, this will also help us figure out if there are
cases where our current tools are simply going to stop working and need


Matt

> 
> For xe devices, graphics versions (both major and minor) can be
> accurately determined by retrieving GMD_ID via IOCTL, rather than
> relying on static intel_device_match table. Different device instances
> of the same type may have different graphics_rel (minor version) values.
> 
> Implementation details:
> - xe_device struct now includes intel_device_info for compatibility
> - graphics_rel is populated from GMD_ID's ip_ver_minor at runtime
> - For non-GMD_ID platforms (ip_ver_major == 0), hardcoded values are preserved
> - New APIs fall back to traditional devid-based lookup for i915 devices
> 
> This infrastructure enables accurate device capability detection and
> avoids issues when adding new device IDs with varying graphics_rel values.
> 
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  lib/intel_chipset.c | 63 +++++++++++++++++++++++++++++++++++++++++++++
>  lib/intel_chipset.h |  3 +++
>  lib/xe/xe_query.c   | 19 ++++++++++++++
>  lib/xe/xe_query.h   |  3 +++
>  4 files changed, 88 insertions(+)
> 
> diff --git a/lib/intel_chipset.c b/lib/intel_chipset.c
> index 760faede2..890b1e3fa 100644
> --- a/lib/intel_chipset.c
> +++ b/lib/intel_chipset.c
> @@ -189,3 +189,66 @@ intel_check_pch(void)
>  		return;
>  	}
>  }
> +
> +/**
> + * intel_query_device_info:
> + * @fd: open i915/xe drm file descriptor
> + *
> + * Returns device information structure for device @fd. For i915 devices,
> + * falls back to i915 device info lookup. This function caches the result
> + * per file descriptor for performance.
> + */
> +const struct intel_device_info *intel_query_device_info(int fd)
> +{
> +	static __thread int cached_fd = -1;
> +	static __thread const struct intel_device_info *cached_info;
> +	struct xe_device *xe_dev;
> +
> +	if (cached_fd == fd)
> +		goto out;
> +
> +	if (is_i915_device(fd)) {
> +		cached_info = intel_get_device_info(intel_get_drm_devid(fd));
> +	} else {
> +		xe_dev = xe_device_get(fd);
> +		if (!xe_dev)
> +			return NULL;
> +		cached_info = &xe_dev->info;
> +	}
> +
> +	cached_fd = fd;
> +
> +out:
> +	return cached_info;
> +}
> +
> +/**
> + * intel_query_gen:
> + * @fd: open i915/xe drm file descriptor
> + *
> + * Returns gen IP version for device @fd. For i915 devices,
> + * falls back to i915 graphics version lookup.
> + */
> +unsigned intel_query_gen(int fd)
> +{
> +	const struct intel_device_info *info = intel_query_device_info(fd);
> +
> +	return info ? info->graphics_ver : 0;
> +}
> +
> +/**
> + * intel_query_graphics_ver:
> + * @fd: open i915/xe drm file descriptor
> + *
> + * Returns graphics IP version for device @fd. For i915 devices,
> + * falls back to i915 graphics version lookup.
> + */
> +unsigned intel_query_graphics_ver(int fd)
> +{
> +	const struct intel_device_info *info = intel_query_device_info(fd);
> +
> +	if (!info)
> +		return 0;
> +
> +	return IP_VER(info->graphics_ver, info->graphics_rel);
> +}
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index 2f6bf788a..8f3ea0ce5 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -104,6 +104,9 @@ const struct intel_cmds_info *intel_get_cmds_info(uint16_t devid) __attribute__(
>  unsigned intel_gen(uint16_t devid) __attribute__((pure));
>  unsigned intel_graphics_ver(uint16_t devid) __attribute__((pure));
>  unsigned intel_display_ver(uint16_t devid) __attribute__((pure));
> +const struct intel_device_info *intel_query_device_info(int fd);
> +unsigned intel_query_gen(int fd);
> +unsigned intel_query_graphics_ver(int fd);
>  
>  extern enum pch_type intel_pch;
>  
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index a89e0b980..3caeecf20 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -20,6 +20,7 @@
>  
>  #include "drmtest.h"
>  #include "ioctl_wrappers.h"
> +#include "igt_core.h"
>  #include "igt_map.h"
>  
>  #include "xe_query.h"
> @@ -375,10 +376,28 @@ struct xe_device *xe_device_get(int fd)
>  	xe_dev->dev_id = xe_dev->config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
>  	xe_dev->gt_list = xe_query_gt_list_new(fd);
>  
> +	memcpy(&xe_dev->info, intel_get_device_info(xe_dev->dev_id), sizeof(xe_dev->info));
> +
>  	/* GT IDs may be non-consecutive; keep a mask of valid IDs */
>  	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
>  		xe_dev->gt_mask |= (1ull << xe_dev->gt_list->gt_list[gt].gt_id);
>  
> +	/*
> +	* Set graphics_rel based on the main GT's ip_ver_minor. We should
> +	* use the hardcoded value for the none GMD_ID (ip_ver_major == 0)
> +	* platforms (e.g. DG2,ADL,ATSM)
> +	*/
> +	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
> +		if (xe_dev->gt_list->gt_list[gt].type == DRM_XE_QUERY_GT_TYPE_MAIN &&
> +		    xe_dev->gt_list->gt_list[gt].ip_ver_major) {
> +			igt_debug("Setting graphics_ver to %u and graphics_rel to %u\n",
> +				  xe_dev->gt_list->gt_list[gt].ip_ver_major,
> +				  xe_dev->gt_list->gt_list[gt].ip_ver_minor);
> +			igt_assert(xe_dev->info.graphics_ver == xe_dev->gt_list->gt_list[gt].ip_ver_major);
> +			xe_dev->info.graphics_rel = xe_dev->gt_list->gt_list[gt].ip_ver_minor;
> +			break;
> +		}
> +
>  	/* Tile IDs may be non-consecutive; keep a mask of valid IDs */
>  	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
>  		xe_dev->tile_mask |= (1ull << xe_dev->gt_list->gt_list[gt].tile_id);
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index 715b64e2f..eefeb47dc 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -74,6 +74,9 @@ struct xe_device {
>  
>  	/** @dev_id: Device id of xe device */
>  	uint16_t dev_id;
> +
> +	/** @info: Device information for compatibility with i915 */
> +	struct intel_device_info info;
>  };
>  
>  #define xe_for_each_engine(__fd, __hwe) \
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
