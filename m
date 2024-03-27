Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C100C54E67
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 23:47:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB04A112197;
	Wed, 27 Mar 2024 23:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eDUSrtof";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27938112197
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 23:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711583274; x=1743119274;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sdX5utfN36PQm6lXG5jy1jtxmA5DVA7zS1gvZUtJVkU=;
 b=eDUSrtof7QAGAPvGY2mxmujzVI7Jq4cdmoBnEEmI83AJBBxf9oXv4uER
 3nY1ksYJV2EPQnFs6r0AWhBZyq44eU5rgsYi2jNH/xnIwycStfZLuAkMe
 SC/LOKIrNpCUcWHrz2Hv5BTTewcKJcUogCj/PYQaQ9iDq7LTvHcOy9K3w
 shChE0OtPy/JqSfUe5Z2We+OJw/BTF49eZk7b/hPRisPThAS7Nws9Gs3G
 9F+ZquMNMb9osBun0A9IdYfAA1cSqPEnNOlaXQBmmOZsF/Od1WkIOiAx2
 NoCWCkQWZqEZcYoT+1DwKPrA4aEEpTtZGKgdcmWAd51Bag1EzuvMHyDz7 A==;
X-CSE-ConnectionGUID: 7QOpb0IkR5GxGEziEX3JUg==
X-CSE-MsgGUID: 9/bNSnOISuGySqxZ5SiQrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6612084"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="6612084"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 16:47:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; d="scan'208";a="16295331"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2024 16:47:53 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 16:47:53 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 16:47:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 16:47:52 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 16:47:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZG4WTaBuu11FQmtbdbK8osxPnL66VSE9BG1lUO9wi2oezlO3n7j1e7jtSxc71w3IEkLx9OUV2+oCV2oDFJAxp8x40ZpvtIao48pkzWpnK7XFdYZfaRrJDfcwVhRxSfZrvQCGd0ZpD27G3QjiP2bDnX/Z4aNrP1Wv9v9nQGjPbrFVkEBkUHni764xu8p6rMV3NSPUPN1U0CROn+Q7Nyt5gPviQn0d7czbjZ8ZRMsr9IFMDSrIL27A99dCubj3DozaHhTqzsyLfzhE9FPjwBB12IZGPiRDWGKej2KGjooo4YR4CRQdd/U+/JJbnkuqkdSN/SFv70/TEfwmQSu5gMcj6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBpDqk+8tDd6pWLsz8CMwVKTxOrOxlFOoAEOHCiH1MM=;
 b=HGEgysdYXICjqeB6Q9rnOoi9iA1ofbn8UFEbmTFikz6nnrDZqjeew4da6Vxurm/55PzQs9Z6JHUbXE0y9EBuBPMbcev5pxHdCdRjUOhkt8E+nlhiFG/7UuKU53s5iDCIdmTOJIuLCHF9zx1njrNTskLluwJmZB6zCH1qfBxlniFyQASKsblTWkmgIEf8mQo5iZrnVihiLnlIy+8vuKrQxxbm0XIF+MYeqwLbTifURZi9GJzXlkEi3l6VaCijC+W1khtyCtq1nn9i5IsbVY4RfzGPK1H9AIsaRAyCXH6dh8ttUvh5ErGDk7dYzNwJwdTDd9tmFBet4pawHqBBdBN+QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB8164.namprd11.prod.outlook.com (2603:10b6:8:167::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Wed, 27 Mar
 2024 23:47:50 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.028; Wed, 27 Mar 2024
 23:47:49 +0000
Date: Wed, 27 Mar 2024 16:47:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_compute: Don't require ccs_mode on every GT
Message-ID: <20240327234732.GF1332995@mdroper-desk1.amr.corp.intel.com>
References: <20240322221908.857024-1-matthew.d.roper@intel.com>
 <171154886764.4174.2317120354856149525@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <171154886764.4174.2317120354856149525@gjsousa-mobl2>
X-ClientProxiedBy: BYAPR07CA0088.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB8164:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fd8ceb3-2e23-4977-504a-08dc4eb84fae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rfbKdAVCleoVESjsTGIunFYArx+u3MHkn/mPVGMIWS8iOfJglwfBvT6clxkLrbUB9cojdCilKp9+krBGJmb2djyrr3XXhC3k2i6jmQrcTIF75b61CHKY7/XP7TPPr6QVmJ/r0PCfiHfA7XOBgSrLT3qKhSpzxCCxwDfeAzmssAYPWrsm/2Mm5gSCSUsnW9ekARmQ5wD17vWbIXXBvAtug2J2qeQX6BioKYg40RqqlNBCdDCQS7xm5TrYLSDjfn0g/ArrZwIaKelnrtfPnc/gAVxPAPCFT+4oi+b8P+NtrwQ3B30/AtVHZihB7WwUkymCEM1qEpkAWLXjo8kbimQweq0/S/U00l4hQH3tV+Ox1+eBByyr6ysLAAPk0TLgZM4I0z6cSLWEddcq+c2RIFqjmsX4OwEyloUm0nD8A9zJz4UAKdubKvudiKhnRxNAWkhU0ep6gbDbFJeLWMxXL24A1Xh+XSmKnaEdHl9L+L1xKK8KXKRooNXSQ7Sph89ROyeOP3VUlGr5A/G4rUIMwJIpaZjQScI+vou2mUPDbM7JBeBIIiQUY6V7xALttDbuEwHEwXwpQ8zH8V1SeI/YFkGgRITPD+RfDXd7OLCRjJWoCFUo8nn8vPiC/k6u3yTcDhDpR9xbpwRQNUxpgSOHCw7ew3BeXNqR8qoxI4Hf6uDjoJc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S1ToWL/X3bPI+ob0S7u8fzqyNkDPUDEZ3wZx0uXjeeydccQQoZc2c1mELoIW?=
 =?us-ascii?Q?ebQsaNR9Nv+gUatEgoReY5+yGoqUpTeJWWlXGPMIdeTDWLlmpt5nPphLEDS6?=
 =?us-ascii?Q?7o2sC1vG55ysVMqan+qPZ63MfvkNCdhEvtSC60LCwyNyQ+v8QK85iZitSFPv?=
 =?us-ascii?Q?bWp373yHWSg1VcHjQ4rXWTBk53laNWdeeq9QWjSYuNKpt5SFQZ34JML5j2Pw?=
 =?us-ascii?Q?txL1rBf2hQ2KKg5Ks9OkKO1IogF92r2NIXWQIJovXt4veCu+OIao9WSB7G0v?=
 =?us-ascii?Q?sBaW54zn8SPDImnMPMBaPJw1ebnAE/b5keeQekU4HgitOjJvAs4roYgyRem9?=
 =?us-ascii?Q?6+E5p3HAqFEILxeTGgjX7CkdluwWSqQtNB2126z29dtIaleYcaTq2BtDdKL8?=
 =?us-ascii?Q?TugdDPwyKrp6ZT7CqKqIGzU2yZe720bUgtQMtw5b8VbuPRhACFU1o3IEzB3I?=
 =?us-ascii?Q?bBvJ/Bhb85dcNnIP9Q6+cQ1RUwoIY4Xt5d7P6S5Z1tTRiiz7P8yv1ZSIvp73?=
 =?us-ascii?Q?kpc3k2bmmwBOcR+8B2gb00RxPjrUXkaMCinpPjzJgxuuNRO9AYOjSrze7ZtP?=
 =?us-ascii?Q?d/+aXL3/LQDQoeNFGXEGlcb+ynUVUHooH+uNFlKjuertNgJsFidLLfm4O9sL?=
 =?us-ascii?Q?5NKGnQJkV8lOGeF4b33NsbS8KHEcdP3q6YX9uUnPFTQbH5profOtj4IaKP7G?=
 =?us-ascii?Q?3Y6U/IqMcvtT5+5bMqxo398s3x5uUIyrJW3rhp7A1hiNHtt3r7kvY3u8tHrp?=
 =?us-ascii?Q?UvJWXHvbH4JIaemt0Itah0nfrCFMxGzzvoN9wAgAqWa/UihmtvKfH5VKf//N?=
 =?us-ascii?Q?i34auyE0KnXtbo/qql3KsOWZeIzpsfMp6T9/mWALNu77MDYFDIw9QB/Vxv1J?=
 =?us-ascii?Q?M44UHO60AipnL066JhbmEd36AVFDuAJOE7TmSD3SHg5QXdemEnhfbLzozbwl?=
 =?us-ascii?Q?XHR9XAA1F0Y4+F12r9HEfps4fK5bao4lpehA40viuQ1zPgOoeYkkLsX5oHuB?=
 =?us-ascii?Q?tRsqYgDQOfRotgJcrsgJD91hOr92023heOvlYXNfrGvWPSaaOjLZLltuto6p?=
 =?us-ascii?Q?3dBzxAGXtbQhfF6Tz2+sTrXkX1Fhjzx5igD1q5Me1y4c3Xw0MzBfhBCBSMvK?=
 =?us-ascii?Q?HT2iGmYMUg1nB0SBJeV44HjtqINTFlZZ0uUZqTYPDYH8UWBeIYz1KMNRVDRQ?=
 =?us-ascii?Q?WwfZBkd1K2dGPpjaJieOrIrDJAKOU9S+nXqIi/P9C1JN6oFGxUXrGtEDtMpq?=
 =?us-ascii?Q?HZqbrGPfW7w8vMCfbtF7eKY0bqg9oOBEvnuyXWb9ZuITzL/rMXs3wWeQUC96?=
 =?us-ascii?Q?tTOjxV7GdeuZKwBAeWXMP5286jyLAs2GaY4IoA6XPKMcj27RCMVk/SKG9ZVp?=
 =?us-ascii?Q?yglAuMSNnyQBvD/UN2AZhqcA6HpUNIsRb5sBcB073XmJPFYWJooRoykIJixs?=
 =?us-ascii?Q?KS78t5yMMsSkMeskg71DJxQMYyGqbq9Wji7Cz0ZFqq3bnarMrD0evwSd4DDF?=
 =?us-ascii?Q?CQfL5/8FXn+tEP8FRUiMIrF7UmfIAaGdlgYS22U/4l/XcyDeVZh/tV649eTs?=
 =?us-ascii?Q?FWwrA0BEd67dv2Q6g3Nwe94wvnSZxtYO4MbVDhnDwwpHWA+WpjjXvvKiNgq+?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd8ceb3-2e23-4977-504a-08dc4eb84fae
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 23:47:49.8781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rLf+CwCTey6GPDmEKkxOydtfTmyjqiTgakPipOnVGBTC9uyDrPrpt7E4T2oX4zmLPDj/29Di4+E34tKivPuLVi/bLp28jOMwVRFUpl/9VD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8164
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

On Wed, Mar 27, 2024 at 11:14:27AM -0300, Gustavo Sousa wrote:
> Quoting Matt Roper (2024-03-22 19:19:08-03:00)
> >On platforms with standalone media, we expect some GTs to have CCS
> >engines (meaning ccs_mode can be tested if there's more than one CCS),
> >but the media GT will never have any CCS engines and will never expose
> >ccs_mode.  Move the igt_require() out of the loop so that we don't
> >declare the whole test a skip upon encountering the media GT when the
> >test already executed successfully on the primary GT.
> >
> >Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> >Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> >---
> > tests/intel/xe_compute.c | 8 ++++++--
> > 1 file changed, 6 insertions(+), 2 deletions(-)
> >
> >diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
> >index 42f42ca0c..fffcfa08e 100644
> >--- a/tests/intel/xe_compute.c
> >+++ b/tests/intel/xe_compute.c
> >@@ -51,13 +51,15 @@ test_ccs_mode(int num_gt)
> 
> Looks like we also need to fix test_compute_kernel_with_ccs_mode()?
> 
> > {
> >         struct drm_xe_engine_class_instance *hwe;
> >         u32 gt, m, ccs_mode, vm, q, num_slices;
> >-        int fd, gt_fd;
> >+        int fd, gt_fd, num_gt_with_ccs_mode = 0;
> > 
> >         for (gt = 0; gt < num_gt; gt++) {
> >-                igt_require(get_num_cslices(gt, &num_slices));
> >+                if (get_num_cslices(gt, &num_slices) == 0)
> 
> This next comment is not really related to this specific patch, but I
> wonder if `igt_require(get_num_cslices(gt, &num_slices))` should have
> been `igt_require(get_num_cslices(gt, &num_slices) > 0)`, since ccs_mode
> is only exposed in that case.

get_num_cslices() actually returns a boolean success/fail for whether it
was able to read a value at all rather than the number of cslices it
discovered (the number of cslices is instead returned via the num_slices
parameter that gets passed by reference).  So I think the check should
be correct (fail means we couldn't read the sysfs, usually because it
didn't exist on this GT).  In v2 I'll clarify by checking for
!get_num_cslices() rather than "get_num_cslices() == 0" since that's
more appropriate for testing a bool value anyway.

The two sysfs nodes this test uses (num_cslices and ccs_mode) only get
created if the GT has two or more cslices.  Arguably we could improve
the test a bit by adding some assertions that we never read a value of 0
or 1 from the num_cslices sysfs (since the sysfs shouldn't have existed
in that case), but that's getting a bit away from the goal of this
specific patch.


Matt

> 
> If so, then maybe add a follow up patch replacing `get_num_cslices(gt,
> &num_slices) == 0` with `get_num_cslices(gt, &num_slices) <= 1` in the
> condition above?
> 
> --
> Gustavo Sousa
> 
> >+                        continue;
> > 
> >                 gt_fd = gt_sysfs_open(gt);
> >                 igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", 0) < 0);
> >+                num_gt_with_ccs_mode++;
> >                 for (m = 1; m <= num_slices; m++) {
> >                         /* compute slices are to be equally distributed among enabled engines */
> >                         if (num_slices % m) {
> >@@ -105,6 +107,8 @@ test_ccs_mode(int num_gt)
> > 
> >                 close(gt_fd);
> >         }
> >+
> >+        igt_require(num_gt_with_ccs_mode > 0);
> > }
> > 
> > /**
> >-- 
> >2.43.0
> >

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
