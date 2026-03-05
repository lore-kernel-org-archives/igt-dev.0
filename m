Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4137EFCE5A
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 04:05:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B1A10EAED;
	Thu,  5 Mar 2026 04:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ekaMuW2e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05CE010EAED
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 04:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772683524; x=1804219524;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bhxYVv2ZR/9mbhClRuz/e0Vh/vlnC//F2YFEkp5+tOQ=;
 b=ekaMuW2e9thkJzL11QVUA2N3NOeFfr6fx0HcsgCHK6DsCs8CqVCwix9A
 fwt4VgCX7FEy0Z53fToc1KT8jPTGAfkRDsaVyPz6zyGPx1Q4bYr7oNVPk
 o4bCYPSbJVAGcO2yAES05TwUMK8hb3ZjBFk/Rln+ode2s5VkFNxQtwORf
 2MdBkbtC7RDR+/QuVMOAuGBMZ9EsAlsrZ3fOfh182e1+EjqfBHJHBJU88
 5g59SlpoeI6ALzDW44NeVaXZupuN0laqvSM1/GUkWCThjuE2H3aVr+ieW
 0OC+MtY5M75M7qXHjaG1S3KRPvFUaDM9ZWXsm56dIDxywcX4zMp0okHxp g==;
X-CSE-ConnectionGUID: DwOySa2sRLuEzOdy9SqLWg==
X-CSE-MsgGUID: BpLknYYwSRa1QFGGMoDGGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73631629"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="73631629"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 20:05:23 -0800
X-CSE-ConnectionGUID: aFE0hhSnT9qU8qZslO92Ng==
X-CSE-MsgGUID: y3WfpC8dSkCh9HsxEc3hdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="241562970"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 20:05:22 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 20:05:22 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 20:05:22 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.14) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 20:05:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+FuwjNIEy2MJ16fUQLAA189OrManHUfvT7/Da7f6yX1os5UtHuDh2STPEC2OPKfVajKwNF37USd/sdbM+9D4OmXugvNRnf0VNpxTbsRPS9amlyFXi6E7VU14znsZaNIzMeIceWiGkZqmx2wUap0DmHEk2P4C22mvTtHDbax8E5B7r6jQB9x7XcInGjUOSzIWyqKt89dQF/w3mL7TpM/r4JMph7IQNvr926IQ1DKQX9oUVA9t4QIk8Y3aScNhNR5JNC6gxMZ54aF3QP8KsPss0wF+yLSTcAW7pd3Kv7fhuSN8T9b4LgoeCC90ywHzP5N299ifSa2iWJ1TPPkNRQm/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAt5FxZ5+XcEHhIFxdPxt8bfoAn4Wce+Pl1bcOskBHs=;
 b=o/keCqf8C+1X1XYwYcaPZn9mQmHiLbQSVLIm3b8fcpw8AEBIvfsjpyUZh+oGklI7HCBvVRUXDo30OxWNFY7WRF1JfL1hwJr7RAbMFyQuW1474/wzryeBpKD0doJnMefopAJwP/e/kup2fwJrJastuIBQO11c1pFsxhQVZSxdHTNgrwBrWQ6vFr/zJgc2o6eyH99K5GlLSp2egDQRsTYf9RQgpER9PVvZ48bVRXVbzv/g2Cgj6yM6hhXs902Xt6X73WDMa13JL3NizUddj+wQGnWwf74uxdO869Ha5OuwYmGnMtrO/VCOD3IX3xeNOl++IqJEK+lpDmbq1wZT2HMS0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB6669.namprd11.prod.outlook.com (2603:10b6:a03:449::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 04:05:20 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 04:05:19 +0000
Date: Wed, 4 Mar 2026 20:05:17 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>
CC: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Girotra,
 Himanshu" <himanshu.girotra@intel.com>
Subject: Re: [PATCH i-g-t] Revert "lib/intel_pat: use kernel debugfs as
 authoritative PAT source for Xe"
Message-ID: <20260305040517.GM4694@mdroper-desk1.amr.corp.intel.com>
References: <20260305003047.2290389-1-ashutosh.dixit@intel.com>
 <MW4PR11MB71513EA99A9655ED36977DD5E47DA@MW4PR11MB7151.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <MW4PR11MB71513EA99A9655ED36977DD5E47DA@MW4PR11MB7151.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY1P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB6669:EE_
X-MS-Office365-Filtering-Correlation-Id: 50c3f377-dc2c-4f7e-3d60-08de7a6c6a9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: EiBh/mzlUrARa0fDwBm8CWDNvE+mMzjclXLIuTUe1OTSPaMDhhbxIliKkfZuJ+5zNEbMoPrQAcTPeaYwbx3Sw3iWmf8je4p0B2UQg6locbGfPeUffZa+on5doJMColx0kkl3ClsSv9cipySQh4ayQk/U1CXVMYe9+2c5yBFzr2QUyGBp5crtD5nO7QSvdarL6yVkMc4j2/dkkwEwx5v1rtWSj51rarYl+ebed1QKRwLFAc2vZA2HkDCnogl4ygJRMZE9shDgT66eSIaCpGgNXHq/+Ki12vGSxjtLwiKBebgD8yBsZ/IbIiO00gA4QFG2WRRO1XbnAy1HSEqSphOQWmQ1/8TSwoZzZeVzeIKfPfTGFwFoYHrJtWnZsUO2fS2SKGNDGlg/5SkOvUpgDS7nBAM1mkVgQ2d4LIu/ERPvjw0Xe72eHxRDK8EG4v3FHRDqlcqH3RSMXTsLnODK/w0imwfwXbDWAMqvHkCowEguRo8dQ6+QnBCKmDRvU8vXbQ9b16BnU1IHhMoop06NWg3kJqd7Oca/A5S8/kQfgioWGSyZFXyGNRjRR/I4gs/IjAfewm4X6gnsVVT0wJwXLGupDi4vu2tqCk19Eh800bbaZTSDopR1hSsF0qPuPRDApcbNruCbF7PAJygK6zQLKbdB0PR5pJpnsmChMSP+0W479jR58aoUuZxD55lsS+TJoLBR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tp0VAi28sIa7kaWPUCiMu0zUwO34tn61+LS9aLAlj/QkgnMIOtRdGDnV75gx?=
 =?us-ascii?Q?kZE3MXB1nqEN1tsXPDSAxEopE9j/ba8UwxznuitDTVcE3tvhaKHMQC/cfYZC?=
 =?us-ascii?Q?BAq5vPjE+CfbcBxoEaBKMBdN1nLHtqbCyxPd4Sd15IqL5sL9dltsUhTaze4K?=
 =?us-ascii?Q?Z/sT83kbg650NyVpJcJgmuxEvtGh0CfhKMlv4ZqmY1MFrGfT82bmCbT57bm8?=
 =?us-ascii?Q?Yw5XeuEMyjL64GVd4J6+LnKUV3/7oGRfnXBCXJGBzu5uIBt1Bv1dlsGpOOTd?=
 =?us-ascii?Q?94KPQK/LYrJk0R2GQ20F3BJRLhTk259kjaVMHFyUYFuqGaD8YMngF7CJ3xxv?=
 =?us-ascii?Q?1tMeAb5JK7HFMDIr0YclhJTNTdMc12/8Ftx/TPpfTDiFYYBQuCvSPvsE1T6R?=
 =?us-ascii?Q?SeJODtEuedvOYN1s72VXesPPvqtedXO545PMVifXEkWIK8l/3fw1XYqQvOUR?=
 =?us-ascii?Q?+6jDdAO3mXfbrrtBkN2abO1r3dXoaXtxyaPMxra2FWvvWUZ1xjdWM3nKKJ7Z?=
 =?us-ascii?Q?9TceMov80BKu2P3hLKkPXpUUyI7nVXPVepwhHnb/AJS7AXxUKX4uRCyKSo+H?=
 =?us-ascii?Q?+305pMGZ8dT3Q6mEFHK8UiiVZuF6pRzVeRmMu5Mg2NLFbj5ifv9hjIFSWA8u?=
 =?us-ascii?Q?ZBA0Qx5UEOsN8h7iEolgOpl2hDjCaALP9Fi/zYa+Bqy+P8Z/3TzSFvCvAF9I?=
 =?us-ascii?Q?OyyKnYOqK1gIQNS1UI+U0tX3+Y7rWyObgLAnH9p/Y7osP5C61yfilu9y9ggq?=
 =?us-ascii?Q?uIyjfs0as+OfICiiSWS5YIFo1fPTBllYgYFACkw9Kn2jZoG7l8R9FZ97LMEI?=
 =?us-ascii?Q?r4+JTJk5jCXQ1PPDpJBz6jpxGV7/fmrKN5McR6Q8P6H269xOjmrJJlQxuUQL?=
 =?us-ascii?Q?sT7D399S7Bio87PaoNXVgfPJISWxOU5x7G+mPrUEOW1t2EWKK7Cho0z1TRtI?=
 =?us-ascii?Q?u1V2A8cP3ERzbVtYvfDFtgoiQZakCqmZNne5HwUnSCuO+39KI1RWs31q7Hz4?=
 =?us-ascii?Q?lZPPHyhY2oCl/of7EpxrU/TuS+jEM3Q8RaXzzvVREmCRCgR8lYvvbmqXX5om?=
 =?us-ascii?Q?PH9fqnaelpbKDhktlj9XlPZRurmAgfzZDqvKHZ70ewWQSyAk6HgmE3xrM9ln?=
 =?us-ascii?Q?2RtwZMRA5Vwyndazc9dnzLd9qjoXnNmi0xq3P2rnNBOqNX7QJdXk6NRgmH6l?=
 =?us-ascii?Q?mGkJoAU8kYwWrIqtAYDMWeRML70dwDDWFA34tetRL8X2PM7gnIl7/yit8ZxI?=
 =?us-ascii?Q?rH+Y8AVCkR3VNmyqK3AcfPJJeil7wVDZ/21zyCDP30mOXpSAGYV9kbLmBtvy?=
 =?us-ascii?Q?ZB1BL7arKznbfvpc26bbLWtEUHKxPf4AwuqKPTWk+3FueJ83FyNzX7n3XuLV?=
 =?us-ascii?Q?reAsFT4GAjXoWabWbly3F11HJt+U15UC/5KazlNz9u/bNA6+xvJkDktRM/sr?=
 =?us-ascii?Q?2orQd9009BRcwqO4ui6UGum1Vk8ma/VnA5nJFUkPSzBa2YpOia0uyvqKR77u?=
 =?us-ascii?Q?H7SdQSNHVYuZEZr20WLHw+dgsipHBQuNKlAkx1nBJZw+0ab3g0NvE1yhuZYr?=
 =?us-ascii?Q?5omeW5WuKBHi1Z1EHKYVd+0JlGyOPlQGc0mnbWLCU8fvoaM5zTIItUsFadES?=
 =?us-ascii?Q?7jkl6umrbU+/OSA4Kqgh8Qyu3VfF3gAJ1yfmG6iBONIueCigc7swnsTYxJf5?=
 =?us-ascii?Q?3jfJjA/Xqx5Yl21MwIVtSgKplEqcSpXO2pusYptfZUPZ4na0kqbWWyXtauQv?=
 =?us-ascii?Q?PRsFZEblctsmivnEO3VUsh1fIPY1Cmk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c3f377-dc2c-4f7e-3d60-08de7a6c6a9a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 04:05:19.8166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOLt+jVNfnReP1BHO9/xjzzTEKOWXSgmaHpSDhAOCph7rj61KDhX8mJhwWJ36KDm0I4VJfbbBCv93BYE4PPRrZp8dJxtA7eDiFZwAtmRMhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6669
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

On one hand, we shouldn't let buggy tests dictate IGT library behavior
and prevent us from developing the libraries that we need across the
entire codebase.  But on the other hand, we also don't want to leave
individual tests that we have in CI in a failing state with no
documented plans on how to fix things.

If a fix of xe_oa is easy, then we should develop that immediately (and
if we'd done that early we probably could even have submitted it in the
same series as the library changes so that they'd go in together). But
in this case the issues with the xe_oa test are a bit deeper and
probably non-trivial to fix:

 * Some of the tests are just plain wrong.  E.g., rather than checking
   for the behavior expected by userspace (e.g., "can I access this
   register for read/write as expected?") they're checking internal
   implementation details that userspace has no business being aware of
   in the first place ("is this register specifically programmed in the
   FORCE_TO_NONPRIV registers?") and what they're trying to confirm is
   itself incorrect (and will fail once we make some fixes on the KMD
   side).

 * Other tests are logically correct at the high-level, but rather than
   being written as a proper Xe test that uses the Xe interfaces that
   real userspace would, they're using an IGT library that's mostly
   intended for display tests that need to run on both i915 and Xe.
   Since important uapi details like PAT index don't exist on i915,
   they're not part of this library's interface and thus the test can't
   pick the values it wants and pass them in; instead the library
   handles them implicitly internally.  That's fine for tests that are
   running as root, but once we stopped hardcoding magic numbers into
   the library, there was an implicit requirement that the test calling
   the library have root privilege to access debugfs --- since the xe_oa
   test drops privileges, this doesn't work.

 * Even the tests that are 100% functionally correct are still hard to
   follow because the i915-compatibility libraries are trying to cobble
   together something that works across a couple decades worth of i915
   uapi evolution, followed by a switch to an entirely different driver.
   For pure-Xe tests we really need to cut out all the unnecessary
   compatibility layers so that it's clear what a test is doing and so
   that it can be accurately debugged if/when it reports failures.

So maybe in the short term we need to blacklist the test to prevent CI
from trying to run it, and then as the test gets rewritten to fix its
issues the various subtests can be removed from the blacklist to let
them start running again?

Another option which might be quicker in the short term would be to add
a new library function like "intel_bb_prepare_to_drop_priv()" which
could be called at the beginning of any test using intel_bb that plans
to drop privileges so that the library can grab all the necessary
details from debugfs while it still has root powers and cache them
internally.  Then it could use that internal cache later once it has
dropped privilege and can no longer get values directly from debugfs.
But I don't know if we really want to add a new interface to the
intel_bb library's house of cards if we really want to re-write the test
anyway.


Matt

On Wed, Mar 04, 2026 at 06:27:43PM -0800, Sharma, Nishit wrote:
> Hi Ashutosh,
> 
> I understand the concern but the xe_pat patch was reviewed and +1 given by MattR and with reasoning regarding xe_oa https://patchwork.freedesktop.org/patch/706754/?series=161927&rev=2
> Hence, we went ahead with the merge. In case if you feel it's major regression a partial revert of lib changes can be done.
> 
> Regards
> Nishit
> 
> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com> 
> Sent: Thursday, March 5, 2026 6:01 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Girotra, Himanshu <himanshu.girotra@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
> Subject: [PATCH i-g-t] Revert "lib/intel_pat: use kernel debugfs as authoritative PAT source for Xe"
> 
> This reverts commit 4e59b8e7779b04ba982cd5b17c023511ee2f0ed7.
> 
> This patch caused a major regression in xe_oa tests and should not have been merged. Revert for now and re-merge after the regression is fixed.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  lib/intel_pat.c      | 37 ++++++++++----------
>  tests/intel/xe_pat.c | 80 ++++----------------------------------------
>  2 files changed, 24 insertions(+), 93 deletions(-)
> 
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c index 8660a25153..9815efc187 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -96,27 +96,24 @@ int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache)
>  
>  static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)  {
> -	uint16_t dev_id;
> -
> -	/*
> -	 * For Xe driver, query the kernel's PAT software configuration
> -	 * via debugfs. The kernel is the authoritative source for PAT
> -	 * indices, accounting for platform-specific workarounds
> -	 * (e.g. Wa_16023588340) at runtime.
> -	 */
> -	if (is_xe_device(fd)) {
> -		int32_t parsed = xe_get_pat_sw_config(fd, pat);
> -
> -		igt_assert_f(parsed > 0,
> -			     "Failed to get PAT sw_config from debugfs (parsed=%d)\n",
> -			     parsed);
> -		return;
> -	}
> -
> -	/* i915 fallback: hardcoded PAT indices */
> -	dev_id = intel_get_drm_devid(fd);
> +	uint16_t dev_id = intel_get_drm_devid(fd);
>  
> -	if (IS_METEORLAKE(dev_id)) {
> +	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
> +		pat->uc = 3;
> +		pat->wb = 2;
> +		pat->max_index = 31;
> +	} else if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
> +		   intel_get_device_info(dev_id)->graphics_ver == 20) {
> +		pat->uc = 3;
> +		pat->wt = 15; /* Compressed + WB-transient */
> +		pat->wb = 2;
> +		pat->uc_comp = 12; /* Compressed + UC, XE2 and later */
> +		pat->max_index = 31;
> +
> +		/* Wa_16023588340: CLOS3 entries at end of table are unusable */
> +		if (intel_graphics_ver(dev_id) == IP_VER(20, 1))
> +			pat->max_index -= 4;
> +	} else if (IS_METEORLAKE(dev_id)) {
>  		pat->uc = 2;
>  		pat->wt = 1;
>  		pat->wb = 3;
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c index ab519aab0f..21547c84e7 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -103,55 +103,6 @@ static void userptr_coh_none(int fd)
>  #define COH_MODE_1WAY		2
>  #define COH_MODE_2WAY		3
>  
> -/* Pre-Xe2 PAT bit fields (from kernel xe_pat.c) */
> -#define XELP_MEM_TYPE_MASK	GENMASK(1, 0)
> -
> -static bool pat_entry_is_uc(unsigned int gfx_ver, uint32_t pat) -{
> -	if (gfx_ver >= IP_VER(20, 0))
> -		return REG_FIELD_GET(XE2_L3_POLICY, pat) == L3_CACHE_POLICY_UC &&
> -		       REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_UC;
> -
> -	if (gfx_ver >= IP_VER(12, 70))
> -		return REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_UC;
> -
> -	return REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat) == 0;
> -}
> -
> -static bool pat_entry_is_wb(unsigned int gfx_ver, uint32_t pat) -{
> -	if (gfx_ver >= IP_VER(20, 0)) {
> -		uint32_t l3 = REG_FIELD_GET(XE2_L3_POLICY, pat);
> -
> -		return l3 == L3_CACHE_POLICY_WB || l3 == L3_CACHE_POLICY_XD;
> -	}
> -
> -	if (gfx_ver >= IP_VER(12, 70))
> -		return REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_WB;
> -
> -	return REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat) == 3;
> -}
> -
> -static bool pat_entry_is_wt(unsigned int gfx_ver, uint32_t pat) -{
> -	if (gfx_ver >= IP_VER(20, 0))
> -		return REG_FIELD_GET(XE2_L3_POLICY, pat) == L3_CACHE_POLICY_XD &&
> -		       REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_WT;
> -
> -	if (gfx_ver >= IP_VER(12, 70))
> -		return REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_WT;
> -
> -	return REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat) == 2;
> -}
> -
> -static bool pat_entry_is_compressed(unsigned int gfx_ver, uint32_t pat) -{
> -	if (gfx_ver < IP_VER(20, 0))
> -		return false;
> -
> -	return !!(pat & XE2_COMP_EN);
> -}
> -
>  static int xe_fetch_pat_sw_config(int fd, struct intel_pat_cache *pat_sw_config)  {
>  	int32_t parsed = xe_get_pat_sw_config(fd, pat_sw_config); @@ -169,14 +120,13 @@ static int xe_fetch_pat_sw_config(int fd, struct intel_pat_cache *pat_sw_config)  static void pat_sanity(int fd)  {
>  	uint16_t dev_id = intel_get_drm_devid(fd);
> -	unsigned int gfx_ver = intel_graphics_ver(dev_id);
>  	struct intel_pat_cache pat_sw_config = {};
>  	int32_t parsed;
>  	bool has_uc_comp = false, has_wt = false;
>  
>  	parsed = xe_fetch_pat_sw_config(fd, &pat_sw_config);
>  
> -	if (gfx_ver >= IP_VER(20, 0)) {
> +	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0)) {
>  		for (int i = 0; i < parsed; i++) {
>  			uint32_t pat = pat_sw_config.entries[i].pat;
>  			if (pat_sw_config.entries[i].rsvd)
> @@ -194,29 +144,13 @@ static void pat_sanity(int fd)
>  	} else {
>  		has_wt = true;
>  	}
> -
> -	/*
> -	 * Validate that the selected PAT indices actually have the expected
> -	 * cache types rather than comparing against hardcoded values.
> -	 */
> -	igt_assert_f(pat_entry_is_uc(gfx_ver, pat_sw_config.entries[pat_sw_config.uc].pat),
> -		     "UC index %d does not point to an uncached entry (pat=%#x)\n",
> -		     pat_sw_config.uc, pat_sw_config.entries[pat_sw_config.uc].pat);
> -	igt_assert_f(pat_entry_is_wb(gfx_ver, pat_sw_config.entries[pat_sw_config.wb].pat),
> -		     "WB index %d does not point to a WB/XA/XD entry (pat=%#x)\n",
> -		     pat_sw_config.wb, pat_sw_config.entries[pat_sw_config.wb].pat);
> +	igt_assert_eq(pat_sw_config.max_index, intel_get_max_pat_index(fd));
> +	igt_assert_eq(pat_sw_config.uc, intel_get_pat_idx_uc(fd));
> +	igt_assert_eq(pat_sw_config.wb, intel_get_pat_idx_wb(fd));
>  	if (has_wt)
> -		igt_assert_f(pat_entry_is_wt(gfx_ver, pat_sw_config.entries[pat_sw_config.wt].pat),
> -			     "WT index %d does not point to a WT entry (pat=%#x)\n",
> -			     pat_sw_config.wt, pat_sw_config.entries[pat_sw_config.wt].pat);
> -	if (has_uc_comp) {
> -		uint32_t uc_comp_pat = pat_sw_config.entries[pat_sw_config.uc_comp].pat;
> -
> -		igt_assert_f(pat_entry_is_compressed(gfx_ver, uc_comp_pat) &&
> -			     pat_entry_is_uc(gfx_ver, uc_comp_pat),
> -			     "UC_COMP index %d does not point to a compressed UC entry (pat=%#x)\n",
> -			     pat_sw_config.uc_comp, uc_comp_pat);
> -	}
> +		igt_assert_eq(pat_sw_config.wt, intel_get_pat_idx_wt(fd));
> +	if (has_uc_comp)
> +		igt_assert_eq(pat_sw_config.uc_comp, intel_get_pat_idx_uc_comp(fd));
>  }
>  
>  /**
> --
> 2.48.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
