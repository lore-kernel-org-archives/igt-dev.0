Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE7DD149E7
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 19:05:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41D310E055;
	Fri, 25 Oct 2024 19:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aiX11nPb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E76E10E055
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 19:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729883127; x=1761419127;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=C5rdowjU8FwUEXz/o0r8YtwBt31N/PPWDDM+H+SVuTk=;
 b=aiX11nPbaq5PW07+kGD1geJFlSzsfOO0pxsUiQSvi5ll2j+cYsXE/TtI
 5VoeRP+srApyOWcgGON/4cT6/uwUOYHctbsdvXy9UdyggYVjP36DzQfPy
 eZyAPqIwHBI1KIF/MQ6uSTM8Yxl7h1cYZkeLfiw3WvLD1blDNyVRKrBvr
 /EmlgCQ5rLKeGKcKs4xGnmsEYoRozXbecEB/1i4Dtb4SZiOuNfFNrH43Q
 0YiDiVadR3AbcLFY8r8S12qeklhhxWU9FdUvELR2ms/E5hFrxdJbJDQZ4
 +PkxWVnLB9I40yMBfOObgbH6vyWy+MxSAYzTeFnvqnpMxjzlZwXjELv4K Q==;
X-CSE-ConnectionGUID: hk+AtlJ+SpG3NzkREuuEpg==
X-CSE-MsgGUID: auj30yWGTamafGq3vf3eHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29019260"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="29019260"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 12:05:27 -0700
X-CSE-ConnectionGUID: XK0RpcfFSYq0V5hvyqLqKg==
X-CSE-MsgGUID: 83Tf3ESnQL2XPkYk2nCygQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="85602710"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 12:05:27 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 12:05:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 12:05:26 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 12:05:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJ1v362KroYeKF4FtU5RwjFg3mWvTNT9ckBYoR0ljUC1a+wlBd9U54G+Tkrm7D1batnF91NXMKhzfs9A78G5yukJqQjNQOzygDE6nSqxP2iXn8mF7a1KOMr65zDNH5uJOZ1kG40BPcu8Y91vsE+yBBQgtKWahdGjMlAxFei3vFxv3dTotdKIk11Iu73GJpT4w7m53GjUMQwjs7vwDWrllQX2r9n6A6oEY5k0H8z9TD6mFnSYbdhRvT4l8ggSkfXbRN5g60wvvWYGBpx7Z1hu0mkByBcyxzAXI97Rnrwvw2Pqg1EWS6ccFi7VDqH1fh75WlADtfYCqtKthinmz/1eZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p47/Asb1O1CLG+B+u0s/TQLd5RV9dSeBmMCLTyRJ5Ls=;
 b=LEvivgC6MTHaraf0dfWJTZkuvyH4WMEa9/PYv+0I4wT/OKZCS5q2vOjtWZwTiMxgD7JUbhYEMQHy8fRGrhb/RQBbMJznGWRaWk91EHJjtFARM4eC3akXxoSHF08MMX3LhkFhQLvbHfOQKnISKU5uxf8mchIE0p6c+q9oF116ClnUJKr2vUQ41fDfnLBZ3XqrCbRYKNSRGiUTzQUzbK+eOOeJPNJF2YJYSBw49/i5C0Lr+I7BEYMjBtHQ2AbDZlOohHbE1/mgUsW8yVVcxgXPuVURTwdpOP1uDx06AagzH7/IhLHEJtJotLJ6ftTKzmR6yBScusnz06k7dbZBhn2U+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7119.namprd11.prod.outlook.com (2603:10b6:510:215::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Fri, 25 Oct
 2024 19:05:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 19:05:23 +0000
Date: Fri, 25 Oct 2024 19:04:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Yang, Fei" <fei.yang@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Dixit,
 Ashutosh" <ashutosh.dixit@intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>,
 "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Singh, Apoorva"
 <apoorva.singh@intel.com>
Subject: Re: [i-g-t 1/1] tests/intel/xe_exec_fault_mode: wait for the
 completion
Message-ID: <Zxvr2S4XqQYTX17e@DUT025-TGLU.fm.intel.com>
References: <20241025002322.1422552-1-fei.yang@intel.com>
 <20241025002322.1422552-2-fei.yang@intel.com>
 <ZxrpVF3N88rDpyvv@DUT025-TGLU.fm.intel.com>
 <BL3PR11MB6362AF44F412F6B33E948CFB9A4F2@BL3PR11MB6362.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BL3PR11MB6362AF44F412F6B33E948CFB9A4F2@BL3PR11MB6362.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY3PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: 725d0a29-9c03-489b-1642-08dcf527fa38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NlVxQZ0LZV9ULbCe6EERKek0tE6Vf1dUwQ+7hq6v+KQvpQy7CqOYSUcz0sUY?=
 =?us-ascii?Q?GaUVuGHVtcJUL3ywbp+VxS0XdOKUWAo14aG8DgbY87U7bHBUDA9e8OHNL0QR?=
 =?us-ascii?Q?CH8A6RP9osbRjnHMkv8fXKTBQuSwcVyv5pDBPJzdNcTJB7Jwf8lx2n1hZz51?=
 =?us-ascii?Q?V6riJvWEKDZpQfV3j8N31sUkPU9ULGWnjxxXTGwYQwcBf37Mhsy8m/kKvezC?=
 =?us-ascii?Q?mYle4AqYeLnHCJaXEG6lh9pCKmHWANQ7QklZVoGXo7n7fUnTKu0j3ejdZplL?=
 =?us-ascii?Q?cn2M+gqOhL1huFweznbKqEyORcpR/YRq9j781B4/aNinOvfAtCMdw0q/qF/M?=
 =?us-ascii?Q?Np2qNxHfJncsrDn1q24l8LucS050fV5M+fRHq0+tCgPCwZDkJV7Mq9LmfMhk?=
 =?us-ascii?Q?S/ET2wvj97mhJcuW0hUguQrIbuo1zQdSfb6mWQhcjGuFy4HSbU1NNiR+r1HI?=
 =?us-ascii?Q?WivOSO6VJ+1cpx54Y081pDqA/zcwYIk+0BSn22b8k2UnOh0XPWnffoWdE2P+?=
 =?us-ascii?Q?96g021lyWrFr3ZEYRbOhX4BTVnVfkzsw29PZfDAjFfUYUAfZY5wCS/BsmkUL?=
 =?us-ascii?Q?VMzVcD8FPs/V4FTywNYo4LcWNIzDd60NXbSqsT93BZssmxSyyACABG8umCK4?=
 =?us-ascii?Q?kvKIcH9DThxeHlob5KclVZi0+3ZR0fI7NjIGN0L+on3FmvPvKL5p1o6RSpzI?=
 =?us-ascii?Q?3oxtNJZ3IFbaAONKgrufQzZWcxnNL4HuxIJmRKcnickRnypcm87pSrYmblvU?=
 =?us-ascii?Q?HhSb/Mgs+h655Bb9qGF5QkS45R546KyfuvrQ7d3nzyYT24PfzyGl1UsoZECm?=
 =?us-ascii?Q?xFJoVch2/SAiqyjtLC8wFPQszPb1HBuJwPtWnoVt2+pN3CfLse9YPOUkPAde?=
 =?us-ascii?Q?goCut8b9UhOOmYgKEDPJMW/gG4uucYtzl25xLf9VPWJXLfYTSsgYlIpYZQyI?=
 =?us-ascii?Q?94zgAC6nmCLnXSTiDw8ylk4F4+4NTrZFHVksL3diYzZEgMpTIsqOx4DM+Sup?=
 =?us-ascii?Q?81kNbhhi8N3knC4YZCAUAo6grQc8DOnqv3XOybUybZGbSWF0zdv4/ueT1YV8?=
 =?us-ascii?Q?uBiN1/q3rBR5AYLPUQ1n9rajvZkejy66lpbqdT1vDXcs3SMiyou1cdF6T8pU?=
 =?us-ascii?Q?IdxIwH0MkfsmQwZQPTLf1es/Y35QariA74o892/KE6v4cX1FrXsGVtY5Gtv9?=
 =?us-ascii?Q?LiekxlgNg2d57NeiSkjzoGavuDZLo4VvQdNEGabqxZ1AXexSqr1v97YllP1h?=
 =?us-ascii?Q?o4we2w3CFRwYZmUMqrHIIiatS4ZEGYqj4erojoRs3/dp0u7dAiqkkjx+Jgt7?=
 =?us-ascii?Q?w16azMEu+lDqegfnkzJG1yIa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xhfLAD0pJ2erXSWABkUouEEE+UCbkSEFY65jfuQ3Bv4RP/8tnx4PdVbn0V0q?=
 =?us-ascii?Q?hXDY7fKSvf9uMK/qML/BQJq8kViOCLI2IRD2eDrk5TVyf9j0pfLNmMjlQF2C?=
 =?us-ascii?Q?7yfEeeftIooTtO+JyC3d0WoIBHu+bG/CURG5G4JofxaoO8ZbQm9AYqxCT+bR?=
 =?us-ascii?Q?NyVqvPXEP5yptr4Ua6FpfvHqgl3X7Szx8YbR+vrSBHLPuPEiPHEtOg8/SQ3D?=
 =?us-ascii?Q?AGjyVsBXd1gNp5GC3d+lvuT01mmWlcQI0H/OcTH3EDqfIh7m0vGV83ByKb0i?=
 =?us-ascii?Q?MVzhTUDdomi3dKm+w9UlCQmr3Mf830a6djgk5Kc3iwOQVBVykkj7OPZ/JN3C?=
 =?us-ascii?Q?5DpyS8yBIONTkcuBXCh//864kwu/aiM7UdJoWjADznCYn11WwiJ+RSRNojJy?=
 =?us-ascii?Q?2slZwNfn3LEqRrhzpHQqe4nixom4/2sw514U2VoHDPXeI+w9uQ4J0857aFoX?=
 =?us-ascii?Q?yrpMF+2yQGeQ5az5fFnVCT/6ZSsNt+4ysS9yn7NGvn36z5PP2NZC/v+39OCI?=
 =?us-ascii?Q?Z+TqZl1YNICFr2N0I+Lxfz+xIh9JBRHxY4OPN8kLnqLgmHL2zIkPALaJ7ziI?=
 =?us-ascii?Q?HUiaTXHII/qJuE8dQgja1u+D4sZsjqf1GHkafPwwXTLZs5gUNLwykXE+DJtg?=
 =?us-ascii?Q?dqkvBxOYGyR4b1Rt43fmD2MUXIMLlzEHhlLuGNPHfGzzBMqBIAaiK3nA8sjY?=
 =?us-ascii?Q?qyVvD7jzKcpkOwF3MRUwnNjbcMqhoWl2EXrw5QmnlaVH0YkFrtmkOtKSxx0D?=
 =?us-ascii?Q?GyDy4mWXqXzadnHAJoA5XT4Ecbye4pxEWThFiKaaBeaT6t3mbD7r9wwJSFgE?=
 =?us-ascii?Q?IolKpU2WEk6TVy+ICWJj+QiCAugrhrSxAczcARxHIHQ0LCH+3WvrmT1N090E?=
 =?us-ascii?Q?4/NN7xnlbF5LradKbXOPtdSvcsVUidF9OwLbHzvWh+k+zs4IeZ/Mg9sjxpef?=
 =?us-ascii?Q?CQ4+aCydoXQZ++XroXrOpOtRQFyHBWH2+5MVX3PE8Sx0XVxJo0zPp7t48mGP?=
 =?us-ascii?Q?9RNSuGd1BeKPiB7K2dJ4S60DBh2qkTnXR7tB6sbCaYB+51qzE+sY2sMsyNQy?=
 =?us-ascii?Q?YuiXjMEjWqQEaZ41tDzVN9Ri9DB++ESIAgCLWw8rfNfIarvDm5LtiLBkfpqC?=
 =?us-ascii?Q?la4yZnB1cYP6VQ0YxBKptWMgz13TFrvPtTDpqn8XZR7r5b90QVJf80WRMDwi?=
 =?us-ascii?Q?uPjr1kEiELzctuomrwssHmTjJJYg6FLbPUAPExI/jV5VxGB+q0vqwziZmwqh?=
 =?us-ascii?Q?xd5YBGoRa42G/6hWc+WOiRo98G4IntJwbbWUvH4VupetyVW7gRaVicdBNag1?=
 =?us-ascii?Q?E2m5UqKxtzd6+3+eXcTTc2YPLPpZjCt8gpPsnkpD60OO2rZv0S0szAzQH6KW?=
 =?us-ascii?Q?dy99/pJDq4I7sdYyQAtqGz+ttf7SWtm8WaVkWVSqTq619I+O1OHr6bBeXp1y?=
 =?us-ascii?Q?03iti4ocY7RCNlXrkCMMYZeMSqb9Z3n/fvek/KUz3Z/zr7pKXmN1ZuD5bI5b?=
 =?us-ascii?Q?1Whpt7cxUp/rLpL8qicUE5inLjC3aP0WgfUUexv6MplJ4Thh3YK+CnhZcVjk?=
 =?us-ascii?Q?sw0Zduwn1A+qiaKgJCdpTPlADeuW0Fk+WEUfQ0dF/wWJJSIqhI5/tPkfTrg/?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 725d0a29-9c03-489b-1642-08dcf527fa38
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 19:05:23.1955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cRCkPK0G+E37Ulaj7IXJVDe8A2LC6Q5JgVVNPC6Vj+130mOk+3M1XdhBYGuVVTs3acxPHSO/Jha4Sju1eZU/Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7119
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

On Thu, Oct 24, 2024 at 11:15:08PM -0600, Yang, Fei wrote:
> > On Thu, Oct 24, 2024 at 05:23:22PM -0700, fei.yang@intel.com wrote:
> >> From: Fei Yang <fei.yang@intel.com>
> >>
> >> The execution on GPU is out of order, the completion of the last
> >> submission doesn't mean all the jobs are completed. We need to make
> >> sure all the jobs are completed before moving on to unbinding the
> >> buffer, otherwise the test would run into CAT errors.
> >>
> >> Signed-off-by: Fei Yang <fei.yang@intel.com>
> >> ---
> >>  tests/intel/xe_exec_fault_mode.c | 10 +++++++++-
> >>  1 file changed, 9 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/tests/intel/xe_exec_fault_mode.c
> >> b/tests/intel/xe_exec_fault_mode.c
> >> index 9cc51b7d3..d416c773b 100644
> >> --- a/tests/intel/xe_exec_fault_mode.c
> >> +++ b/tests/intel/xe_exec_fault_mode.c
> >> @@ -305,7 +305,15 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> >>              }
> >>      }
> >>      if (!(flags & INVALID_FAULT)) {
> >> -            j = flags & INVALIDATE ? n_execs - 1 : 0;
> >> +            /*
> >> +             * For !RACE cases xe_wait_ufence has already been called in above
> >> +             * for-loop, we should only wait for the completion of the last
> >> +             * submission here. For RACE cases we need to wait for all submissions
> >> +             * to complete because the GuC scheduling can be out of order, the
> >> +             * completion of the last submission doesn't mean all submission are
> >> +             * completed.
> >> +             */
> >> +            j = (flags & INVALIDATE && !(flags & RACE)) ? n_execs - 1 : 0;
> >
> > This makes sense and xe_exec_threads has similar code to this in function test_compute_mode() and given that is threaded test much more likely to hit this race.
> >
> > I checked xe_exec_compute_mode and I believe we need a similar patch for that test too. While you are here can you fixup that test too?
> 
> Sure, I will give it a shot. The code looks a bit different, and there is
> a 1 second sleep after the submissions, I guess that's probably why we are
> not seeing a problem yet, escpecially on real hardware where 1 second is
> sufficient for all submissions to complete.

Probably that is a bit hacky - a lot of these tests have hacks from
early Xe development that never got bother to review. I guess if it is
working, low priority but removing the sleep and replacing with code
like this would be good I think, 

> 
> > This patch LGTM though, with that:
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
> Could you help merge this patch too? I don't have merge right.
> 

Pushed.

Matt

> >>
> >>              for (i = j; i < n_execs; i++) {
> >>                      int64_t timeout = NSEC_PER_SEC;
> >> --
> >> 2.25.1
> >>
