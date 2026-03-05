Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329C0F47CD4
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 20:52:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B3F10EC80;
	Thu,  5 Mar 2026 20:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ILweoao+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A237D10EC80
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 20:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772743924; x=1804279924;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=wB3ADz6dnyehFW+KAO2tRvR/DddE0CwBLb9lKBIiMOs=;
 b=ILweoao+1gRClBtWdDsqi1RLEaam+ntOtm57KEE4310DgIiZzAOWH/Ny
 bI2PvHlCCUgaaB0YY7ZP3ISmXA10FIWFtc/fxr1ATctNDqoLByicikNL+
 3PRRDbm1z04NynXELd5ZTMsNvONKuCzQJKZKCOOVfQCMACV/2LerNroFg
 fqS+SV3IvAg9j7KopVGRU2XnwOqXjKtF+We0qR0ef4rw59lGxfzxJNmTt
 sarwrVRoBUbS/VtynNojGe1rdrPp8iO9/VzjF98jzI/rv9wdNvymrxKYL
 vxp0FJ6wEVKaHAUCNEqyEPt43O3mgGf/mZq7Na4HxOIy5ediMRrfIUjAQ Q==;
X-CSE-ConnectionGUID: EeM/L4u3SGq6MF5xqMPsmg==
X-CSE-MsgGUID: K5sZ6s68QZWkAxJ9Z3lbxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73760450"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="73760450"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 12:52:03 -0800
X-CSE-ConnectionGUID: 9YUcGWG3TDm0PayAwremEA==
X-CSE-MsgGUID: ECg05neHQhGfi7HZ6F+B3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="215555060"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 12:52:03 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 12:52:02 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 12:52:02 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 12:52:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtI/9W6nG+/kuJ36yhbXeUXthmgSavykJFNz50Qn1UPW0V2d9xNqlRdSsfBP477PqiXlk9YYHEML/lZuoObD9cCZzuFtlzMM/ZB0s0McinF72NvfMiFxURu7nQdOUxXwaa4Mnb+7KsOkQmBXxuPDklnN/ETGYdP82h+4o+VoixRkrG9LKzFB12VN70bVd4G9jbogmSylaekg1Jfm641+xjdqsQRaVmuYgeVAJGTbp/Zq48IK6ljknF6EREodMIqXsfuLNy9W/KX0bxoZu0/dQuJ195oZC9jcAgHwUuiTmponne9x688KwUBP3tAMmZkX82mP4N4T3/f+iQ0r4cB0YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkWkA8A6kw+/GQT1IF1hb2lbr8yXstdRVMHE5vs+PEA=;
 b=ghXQrToIKjqemOyOhlzso0ASvUG2FBK5caSk7fcBzoNS9e8MFXngILjHYrS5ugZR57U1EtIU6FIEzTt12yS2LzSdae/VCFdWmEJvvFSY+3waz+MIPJPJWVU5GiSpZkJSBO//xbAWcm4vWIDNBamW5P85mSZX91QU2Qt2SY88h4x9E+wUsjMPx4LOrc/kDIM4hvA80wTtEp6huQgASKwWMpYdm8mg5XNogKi1JceEZodxPsvO+yV22nfntesKq0v21bhzre3zX4O+4vR5l1RL+tVDHAr1CtV9nAkydlTdWRFZ0cdYyv9Hp8anXyiYUq+oTqBSPjTvJY4oPw+W/UXO6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ5PPF5DFCDEDFC.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::82e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 20:52:00 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 20:52:00 +0000
Date: Thu, 5 Mar 2026 12:51:57 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>, "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Girotra,
 Himanshu" <himanshu.girotra@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>, Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Subject: Re: [PATCH i-g-t] Revert "lib/intel_pat: use kernel debugfs as
 authoritative PAT source for Xe"
Message-ID: <20260305205157.GN4694@mdroper-desk1.amr.corp.intel.com>
References: <20260305003047.2290389-1-ashutosh.dixit@intel.com>
 <MW4PR11MB71513EA99A9655ED36977DD5E47DA@MW4PR11MB7151.namprd11.prod.outlook.com>
 <20260305040517.GM4694@mdroper-desk1.amr.corp.intel.com>
 <20260305201527.73rsjtgrmurqcbqj@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260305201527.73rsjtgrmurqcbqj@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: SJ0PR03CA0128.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ5PPF5DFCDEDFC:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dfb57e3-d43d-4658-31c9-08de7af90be6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info: u53wbIJacK0e9dkKTl9pTeyp7eW5jro57x7M02FcZ6zf9j5HIUlIxpdYGJOYuUmhb6LJWc3P/OqZb9pdrZZN/Us50LCyqvxpM2Hwi9RbD1uxYPy7so8r76o8bM+Pibwfs3+7CHWe0Xc7HesFqqSoqIauPHhMbwlokBP8bq5PT2a0lxVr1Qmn05dPlD5KU6hTpJRx3mzC3kjnesttu3mGYzvToB2CgPROv3Oi3rtFkAOhceQ3gX2XWJTrm9zaLXPXY+HARiV4pmFr8DyfI/+Wfsy9oL6xsu3Vph2yR6TEs3TZj0ztQhBcJr95BfaIaXYgeBBID243c1z264Gsl5NzYcTv6MjVWJINSyTpqsZJsvm4jbk7MvEdL12zl4TFPF5MZQUxsafvFQU1dXhfxcf6vruuCPsQ9HPu2C2YpUJNYpqlL8m84gngUXpVn8yLxo95v8/WqE+CEW8q5RguQevM0jMEhcMcADuYCxgktKqFyRH/wS1KIwQ/D2GONLaKdbYEFeLWhxprUnMzIwG3AoLXrYC7IyaqkwLr2FMtnyn11ELu/XE21zgkontLR7tH2kTLPrEpUNRJ/qOyqQDI/g/uhuMuGKzGOIp2y7CZ5J+FPCfWwDl1sKs0M+JgZABjYpMUBbCDLbLesfTohZOo/Zsb++Vot6DzVkrAhLGp+9Aj3OaOqBmlxur3sHEUobkbhp6y4p9jliMPF80V/tU96ixigdaLEwV8poO3mtFelSgzWJc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(921020); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oF1YmtKuh6K7AUajj3FlERpRM6YwVX74xuZjFz17RygtTWuUt9Q9ibj9xaqb?=
 =?us-ascii?Q?1sQ+III+S6qlHWbMs9aIm1+uOa14X2Z8WsuGL+ps0Q1zULgAlkWNqw2Ms6i/?=
 =?us-ascii?Q?N/Q6FjE7CSnaGvmtex3R9+De+UsQny5Y6owuSwrydK+jmV2W7lhMJDzxyyYX?=
 =?us-ascii?Q?mhoMbmZpDRHcBjowlFIippoGrDs/7bZQv8ryPpkaNv4kwwgiak3iZ/RT6G9C?=
 =?us-ascii?Q?f0+UgJzLTB/cFD1JnG5lKI1Hf+B30hUtt5aSrmNcGpHaMpfx11Ldnf6445yF?=
 =?us-ascii?Q?6MJ65wm/m7QKgugbT1MRgB9c9s2zG/mnU6HayB8G9lvJMeVqsiO3VRSssWqE?=
 =?us-ascii?Q?7k6MIJU0Ak13LhcmPJh7sAjIaJKyNcXS+9Y1ImnFf0exirySfjhnTz8QvlYk?=
 =?us-ascii?Q?37sLFAkhfFr7JxppmHh8GRmcslQ61D+nZU60vIQO30nREo+UTAul3JyrJtsq?=
 =?us-ascii?Q?tW4yEBePZCrIZxdBDlq5+m4pfeblPMYFRUYg/KWPyBAnMOEEnONJfMOOfnh3?=
 =?us-ascii?Q?L+B0l6zVP+cc30LcPz+z3DHrmJxPOXGOVN1EphrgCsQJgX0oZTLSJSf1H+VU?=
 =?us-ascii?Q?eHPxcu50b44ForJ67e8k2pDji9UQHunqDz3+qUuPniYBqXDDcYkdbB1JIAHW?=
 =?us-ascii?Q?cx48vZmnGM/Vo/ozJxVGS3xLEbm5ThR1lIfIMJP4JR/jyQ2AdtgqJQkOOIk6?=
 =?us-ascii?Q?laIQNPZGBb1DE9cJZzB5nDFyephJzuWn4BsMGEohdzif26L9vAOkWIMNww9R?=
 =?us-ascii?Q?PJutdH+ID7f0Nmz0Y778/N8S7B7IottFlsU3UKUYRlazIIjqTAiXbf+cs6+3?=
 =?us-ascii?Q?t8w1gV5CFhneDZdEIUe9GvTGVhDU34BOhT7LmRQLBBIbj1ibiz6PLBqVxb8I?=
 =?us-ascii?Q?ASaq7b+KqSQtsXoLIA+2QAfv7gVZb/iGsNwq/LI0ZdMySNgy/Z2JgRbytS0/?=
 =?us-ascii?Q?2WnUPbbSq8qNfeIRoP3CYeel1g2/+mAQPkU0vPaIyrgnloVr6nhEPYa40MsQ?=
 =?us-ascii?Q?S0teXL/QgH4mVSGDNtpTGPtw1WttG/sgoSCprazVwuV/+8aMmNidkRc/iV2U?=
 =?us-ascii?Q?sfFb0IbLpJAqWNz5ou/wDBoMeWd/6iGG4Io6H+7jcwb7CgF2v9QWsAP5c0vA?=
 =?us-ascii?Q?FsZKrl82YuKRfNOtDjZS8YcDjQ7CxSMgU0468YhUbb60eAOdb9SK0qyrf5KU?=
 =?us-ascii?Q?Nizg3BiWgPxWQrtyP2lG/NrebPMhLWOWbQ5W/B2GfGkHBTyu/1Jr4lL5CfeY?=
 =?us-ascii?Q?DihPjWrGcOi68gW5wTmzOlk2J4t56YbGfh0TV0aIYeftwbB7pOhBMHFCrbZR?=
 =?us-ascii?Q?sELh1CiHcGSFgeFdhuov3WWwzpQeTSta1cyuy16sXrXsmHob3w+neclmA1wI?=
 =?us-ascii?Q?S6yOM7DGO1XkYTMIf707tP52ZJBr/rA2tIHttzZLwooL6aQRHzxwI/p7hMtF?=
 =?us-ascii?Q?hZnPsit8wxKwKVVRSPCO27iHP13+sa6b1wO+n+wNhxuMel3aplMbqeXowaJq?=
 =?us-ascii?Q?8qd0CTKBypFHdM2YwkM0NvThBVm0xJHqqedwgg89SKT1fl+i9hw5/BLCRFpD?=
 =?us-ascii?Q?bJrgxN6OhjnfZbJ3rdT+mLmknwrJcb/YTWZFMWU6DwXD6EFb9CuopGSNdEwT?=
 =?us-ascii?Q?bcyl6VMf8kdrINMuS1+dXj9Tb+MMuc4fXQSjfKoofex7XvCrureoPIanGxVy?=
 =?us-ascii?Q?N8wex+y7CZT+ymoLkIM7UdY06Dj8z4Q4rrV1zXRM8GFfJtEayfyimiGJlpGo?=
 =?us-ascii?Q?ETpLpJXXsWtJX4GTsi/6kWdgDQNxqfU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dfb57e3-d43d-4658-31c9-08de7af90be6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 20:51:59.9617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2TvxZztSRVlFFAVxn6tWtCqtiJAG3Bx8tfyidAxOQiKgcFUkH2jB7NRWzE3zwbhTLgAqP9BHKVinAhXpD3FYaVIL9RTAfH4uc43kx25i/28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF5DFCDEDFC
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

On Thu, Mar 05, 2026 at 09:15:27PM +0100, Kamil Konieczny wrote:
> Hi Matt,
> On 2026-03-04 at 20:05:17 -0800, Matt Roper wrote:
> > On one hand, we shouldn't let buggy tests dictate IGT library behavior
> > and prevent us from developing the libraries that we need across the
> > entire codebase.  But on the other hand, we also don't want to leave
> > individual tests that we have in CI in a failing state with no
> > documented plans on how to fix things.
> > 
> > If a fix of xe_oa is easy, then we should develop that immediately (and
> > if we'd done that early we probably could even have submitted it in the
> > same series as the library changes so that they'd go in together). But
> > in this case the issues with the xe_oa test are a bit deeper and
> > probably non-trivial to fix:
> > 
> >  * Some of the tests are just plain wrong.  E.g., rather than checking
> >    for the behavior expected by userspace (e.g., "can I access this
> >    register for read/write as expected?") they're checking internal
> >    implementation details that userspace has no business being aware of
> >    in the first place ("is this register specifically programmed in the
> >    FORCE_TO_NONPRIV registers?") and what they're trying to confirm is
> >    itself incorrect (and will fail once we make some fixes on the KMD
> >    side).
> > 
> >  * Other tests are logically correct at the high-level, but rather than
> >    being written as a proper Xe test that uses the Xe interfaces that
> >    real userspace would, they're using an IGT library that's mostly
> >    intended for display tests that need to run on both i915 and Xe.
> >    Since important uapi details like PAT index don't exist on i915,
> >    they're not part of this library's interface and thus the test can't
> >    pick the values it wants and pass them in; instead the library
> >    handles them implicitly internally.  That's fine for tests that are
> >    running as root, but once we stopped hardcoding magic numbers into
> >    the library, there was an implicit requirement that the test calling
> >    the library have root privilege to access debugfs --- since the xe_oa
> >    test drops privileges, this doesn't work.
> 
> Reverted commit was:
> "lib/intel_pat: use kernel debugfs as authoritative PAT source for Xe"
> 
> If userspace needs to read PAT values dynamically then why is it debugfs?
> Debugfs should never be used for 'autoritative' source of information,
> it should not become userspace API. Here it should be either ioctl (xe
> query) or sysfs.
> 
> It could be used for temporal solution until there will be agreement
> how to do it but then userspace should expect that temporal solution
> in debugfs will disappear. But still there is a risk that if it will
> stay for too long it will become uAPI.

Real userspace would not use debugfs; they'd read the spec and figure
out a handful of indices that they plan to use on a given IP version
for various purposes (while also taking into account hardware
workarounds that place additional restrictions on the acceptable
indices).

But in IGT we do a lot of stuff that real userspace would never do, such
as try to exercise every possible PAT index to see if they all work. And
when workarounds show up on the kernel side that disqualify certain
indices, IGT flags this as an failure because it doesn't understand
what's just happened.  For tests where we're really just trying to
exercise the underlying hardware rather than the KMD/uapi, it makes
sense to treat the lean on the KMD's sense of what is/isn't valid as
authoritative since that's always going to be up-to-date with the latest
spec and workarounds.  It's not a usage model that regular userspace
follows, so putting it in debugfs to facilitate IGT-only
hardware-focused testing in IGT is the cleanest way to make sure IGT is
actually performing that hardware testing accurately.  The alternative
would be to ensure that every workaround and every spec update is
directly handled in IGT to keep it in sync, but we don't really have the
same level of scrutiny on workarounds in the IGT codebase that we do in
the kernel, so IGT often lags behind until something breaks.  IGT also
has some limitations (being addressed in other series) that prevent us
from accurately being able to apply workarounds properly because we
conflate platforms and IP versions today (although Xin's work will
hopefully fix this gap soon).

Another benefit to letting IGT use the debugfs information is that it
lets the tests do some simple non-uapi sanity checks of the KMD's
internal decisions.  E.g., "is the index that the KMD is using for UC
access truly associated with a UC table entry?"  Granted, maybe that
kind of sanity check should transition from IGT to kunit at some point
since it isn't really related to userspace at all.

> 
> > 
> >  * Even the tests that are 100% functionally correct are still hard to
> >    follow because the i915-compatibility libraries are trying to cobble
> >    together something that works across a couple decades worth of i915
> >    uapi evolution, followed by a switch to an entirely different driver.
> >    For pure-Xe tests we really need to cut out all the unnecessary
> >    compatibility layers so that it's clear what a test is doing and so
> >    that it can be accurately debugged if/when it reports failures.
> > 
> > So maybe in the short term we need to blacklist the test to prevent CI
> > from trying to run it, and then as the test gets rewritten to fix its
> > issues the various subtests can be removed from the blacklist to let
> > them start running again?
> 
> There was another attempt around PAT, I do not know if it is valid
> in this context:
> 
> https://patchwork.freedesktop.org/series/161756/
> lib/intel_pat: Handle platforms without compressed PAT index

Yeah, that patch is definitely valid.  But it's just one of the many
possible situations that leads to "this subset of testing isn't relevant
to the current platform and should be skipped."  Letting IGT grab the
table from debugfs and quickly figure such things out for itself helps
simplify the IGT testing while making that kind of decision implicit.


Matt

> 
> +cc Zbigniew, Matthew Auld and Sanjay Yadav
> 
> Regards,
> Kamil
> 
> > 
> > Another option which might be quicker in the short term would be to add
> > a new library function like "intel_bb_prepare_to_drop_priv()" which
> > could be called at the beginning of any test using intel_bb that plans
> > to drop privileges so that the library can grab all the necessary
> > details from debugfs while it still has root powers and cache them
> > internally.  Then it could use that internal cache later once it has
> > dropped privilege and can no longer get values directly from debugfs.
> > But I don't know if we really want to add a new interface to the
> > intel_bb library's house of cards if we really want to re-write the test
> > anyway.
> > 
> > 
> > Matt
> > 
> > On Wed, Mar 04, 2026 at 06:27:43PM -0800, Sharma, Nishit wrote:
> > > Hi Ashutosh,
> > > 
> > > I understand the concern but the xe_pat patch was reviewed and +1 given by MattR and with reasoning regarding xe_oa https://patchwork.freedesktop.org/patch/706754/?series=161927&rev=2
> > > Hence, we went ahead with the merge. In case if you feel it's major regression a partial revert of lib changes can be done.
> > > 
> > > Regards
> > > Nishit
> > > 
> > > -----Original Message-----
> > > From: Dixit, Ashutosh <ashutosh.dixit@intel.com> 
> > > Sent: Thursday, March 5, 2026 6:01 AM
> > > To: igt-dev@lists.freedesktop.org
> > > Cc: Girotra, Himanshu <himanshu.girotra@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
> > > Subject: [PATCH i-g-t] Revert "lib/intel_pat: use kernel debugfs as authoritative PAT source for Xe"
> > > 
> > > This reverts commit 4e59b8e7779b04ba982cd5b17c023511ee2f0ed7.
> > > 
> > > This patch caused a major regression in xe_oa tests and should not have been merged. Revert for now and re-merge after the regression is fixed.
> > > 
> > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > ---
> > >  lib/intel_pat.c      | 37 ++++++++++----------
> > >  tests/intel/xe_pat.c | 80 ++++----------------------------------------
> > >  2 files changed, 24 insertions(+), 93 deletions(-)
> [cut]

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
