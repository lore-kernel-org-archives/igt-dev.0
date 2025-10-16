Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5298CCD183
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 22:05:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F1610E0DE;
	Thu, 16 Oct 2025 22:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DVEXrmjy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A157210E0DE
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 22:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760652357; x=1792188357;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0fpDFLUas1zSE9rMbbv0EhzicqBryy7L6kswwz8IKes=;
 b=DVEXrmjyWF8P0NODFY+yxXD1QTgqgduOFYhDjcKJh3Yj4W0MXL5gMMHN
 HsLQ8LgJ4DjFeRaICJoEko5yYFkWo526ieeY4zWPQY0uRL2bgIATHe0hG
 auycpJ8gQg/GyODfNmJpCsHQwHt0iAtKAx8gKBHSNDlEfOqo9Sd+jdf27
 Xzz+PegnkUhZvjE2f7RvMpFnfZMwO2IrcUMco1wReZFXEBIo62Rh44fwG
 TK1AG7g+9TCAAx+vrB6UFWufz1cQLpyeKdeuIACztrCjZENufy+gXlpWS
 vSU6hNFR4+tzuLLALSJTcbsrpF+jDpdCOUimObxE7cIUxjaq0+ux3QfIF w==;
X-CSE-ConnectionGUID: rSKeiuQJSRuGOyu2QyznYg==
X-CSE-MsgGUID: OyfoCi4eToCbpRt3hBv69w==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="88329759"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="88329759"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 15:05:56 -0700
X-CSE-ConnectionGUID: 5SMbPpN5Rzm0VQ+AHErahg==
X-CSE-MsgGUID: IymnOPj6TpuBW1SFMfYeiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="183368664"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 15:05:56 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 15:05:55 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 15:05:55 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 15:05:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGZzdh64Vk8xMCbSvE5knIf2jM4YKHPyCMnbXh/DFMvvm4n1U3TVgrCISGCyTO3AKnYkwmVcdVOCpD22webzSZZKHj2nR6uss9kt+37I5E9E7skOPGvJkWnQfJ/ELrg+KGveL5IpDLCwJMrfzgk7ezsoTQH02I+2NCfOvKf75ajFAJbUBhHhB1sBTHLYcn595j5eZAtFUojbG9t/A+NJIQbEMWUoBSBguMsMQHokZimV3cTmjjW5C665UIaEDBUb04UXXT/e/8A7aOwkPr5D7eEPFz177Xd0F/64JG3k9d/0RrmL16C+DDWvW6GDARcijKF2U2taBa6ZnGogsMImdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NRYN2jZb41RJ1OPNY/z4SdQxMMsi/ov0PhoaC405yKw=;
 b=H9aT0nEcn3n7S2Z6gEFzDurt3gNZ+lXuqFi/3uURUEL1qLRM+htI3pPU2lLeH55lUPPkbF6x4Nj3nv7ySTj+t0eBDiFGYcIbHd1dY7PmyRtgt/p4esNjEMLxnsE4sxi9sAd/pvYpICHzJqurmlsXU5qtCAcJuIi8sZt4c0M9JLgtMy/ycm/eJFVx8Bii1ZSyjBHfsL17tDekkrovc02yIzP/SD38UDeDNWt8ykODoSfCyhGlTlhVTJ7/aHtyP8LaP5utdh3oZ2ias5KPqQIrWoJhlukjNOD+rVUCt+PxvZwQGdgeCc4ItyZM2sk2/Q3lfVDt7qFNjen1EMMWdl9CCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN2PR11MB4742.namprd11.prod.outlook.com (2603:10b6:208:26b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 22:05:51 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 22:05:51 +0000
Date: Thu, 16 Oct 2025 15:05:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Wang, X" <x.wang@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v7 0/2] lib/intel_device_info: get the xe .graphics_rel
 from GMD_ID
Message-ID: <20251016220548.GN5409@mdroper-desk1.amr.corp.intel.com>
References: <20251015060144.6410-1-x.wang@intel.com>
 <20251015231515.GE5409@mdroper-desk1.amr.corp.intel.com>
 <SA3PR11MB8046EABCCF926C548071337486E9A@SA3PR11MB8046.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA3PR11MB8046EABCCF926C548071337486E9A@SA3PR11MB8046.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY3PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:217::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN2PR11MB4742:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c7d6426-e14d-46a9-c0a0-08de0d002b76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8/J5kf9L2+CogdVkKU89c+8llGWjIzejX80O+tbYV9rotYvT1RPHBKItzukE?=
 =?us-ascii?Q?FR1Qa6ynAmYtTrxqt/q94n4yJyaWxnA6mSanwuQ3QA2iHvL9RberXTB8twV7?=
 =?us-ascii?Q?NoHo6xvvITNJY0l/TrLHga2lC2ScCN8mM7HhSJKogPruO8wh1tDRshNv8Tl9?=
 =?us-ascii?Q?KPC3B8PekWW0bG3ZnAhWTuuaByZzFDknt/uI3Ea/rUKu/UcTrgAAI2wMYR8t?=
 =?us-ascii?Q?3pboucre6NSDm5x3Eu5su0UI3yNPUpF7sttFsM/M08hcGiSiitnxmeyOVuaI?=
 =?us-ascii?Q?zcTb8m8093hrRbQWUFRXGv5c1isizdbsR3XbA+fz8rWOSmnsIEpcl+PLkdIG?=
 =?us-ascii?Q?XOILF4+zh8YOWaS7qnCK0S4zSm7e2p7tUP8A5v3SQnwJ82ri8tgvK4WTT2+B?=
 =?us-ascii?Q?I517gEI5SssdEvHFiR0BsDoitokVoGV1wmb79VDju20AL+wvxPmchwEJ7oLd?=
 =?us-ascii?Q?Urux9wEXAGEqYRj2/q7Zkd9cqsNx7WgSBycgaQFA/sLhgyVozcQwo7O7pkKY?=
 =?us-ascii?Q?dA6UeOV+TEkNTSHuJ2bSPXB1NgMwid7kTh1ESXpkq+sOM4OKmqcelj7rjbki?=
 =?us-ascii?Q?LQvH6x11UXq9uICQhQ/kDSb/Bw3+JbkYhCMVyyncypqkjZZ3ZpFTJF6Xh178?=
 =?us-ascii?Q?DVAtT07GgPx5OpKTSsVJ7jgjugGTauE+0Ixhel4On9YN7SU7n74va3GI1Ugf?=
 =?us-ascii?Q?lk4YcO0jxN9wpVbatGo4URGVMImlHZtpsa7iVt/pI6d9oWuMZWfnf3kdiHFx?=
 =?us-ascii?Q?Q5z5MKIzlq8Fikxa4R1FoEulxrE9FbEJfIKhuRPG5Z67ZU9mmTpZS/OamY+3?=
 =?us-ascii?Q?QCkgp/F4YiHhFhwJjwaXWsGZySCdgjnyGzgelFIBmOd/dxsZVgJ1lK7G6jD7?=
 =?us-ascii?Q?my+bASOxwbvJg/gVcuRcKq4Z3VfQ+nzCmAEHvcgGjV/aIhMjJMm3IOSv8rgD?=
 =?us-ascii?Q?zGcZxGVKzMItOcFDaZ9sa5oF3FU8GSTo95tQdkBB7thoUTb3o8VL5m+q9m+i?=
 =?us-ascii?Q?VVzyL/hLh3vp4rk1FiFFPVzlCZEgGdXJ9CNb2BdMhhjayt3N2cIA0HGdei3V?=
 =?us-ascii?Q?Dr3/NFx5Ysi/YYszW6gvTSZv1Jc0B7EouJIqffytHj+X1IwfU/r01CFwmsQ3?=
 =?us-ascii?Q?KwZ8Qd/0ZIbDwXuh3sZiZIuMi3NiqnMQs7Ti0LQzU06Q5nPmk76gHO7MTWHK?=
 =?us-ascii?Q?kV2rqwWbfu1NpvGLL88tW1k/70ls+kySPKjuf4vCWrBm3riR1oYXqwQjreEL?=
 =?us-ascii?Q?2LICQKckaRyIJc2bIyNrnK0ToB4Tl3lGQOTKt2pIXy/i3GOXf49wPJWIqLFu?=
 =?us-ascii?Q?c1wyQ9loimuRJwfQQLSt4cG99cgrE0sASJ3moyk58YznHI12Vy/utyPf3ofV?=
 =?us-ascii?Q?+i/idHO7IWsMqwAon5im2H2sRGMl/FfcVW+riiOUh3aTIucJiBnHJ5Lodmtq?=
 =?us-ascii?Q?dFzJvR3MW95sAxtEP5yMjP8Mj3rOEI8Z4X/zX2UNbNHps5pE9ait3w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iopCxZXWIieKCwNW+Zi0+XBE+0pvgiJvy+6Ntgb9ltb+cZbR2YNMKLJ7+IkA?=
 =?us-ascii?Q?vts8xud1eibYKw8SweA+dB8jqDcvO7lbKjs4V4k9m8jy5AihMZtPJchlfsSg?=
 =?us-ascii?Q?Oy/UNY7OD/iCqG349XtPpqIUO8GGCcfTGcOyp0kqZGes5dX8AZ4oHp2j8hTL?=
 =?us-ascii?Q?XBiOPSlOUAhOlVBPCpR4CQTfyEzUczEvMQF5Qo2HonNyEMRQaup5GGLBLtvh?=
 =?us-ascii?Q?bSx6U7vY9JB7mgK4P5Olzo9pxeQK5lSb+qvXdV5lvvzUQFKwYS1bHGYtW2Vo?=
 =?us-ascii?Q?FkfjQHszZ0/KLxMWI9k0ywucnPqy8HsXWALfRHfRrfKBo7QBGjvsXDbam+Kz?=
 =?us-ascii?Q?AEjFvtnTg6sOZofGYYMLjZOEM6aIk6lHm0EqmQpvVdnNtagjJF4pCRH1hi0m?=
 =?us-ascii?Q?afoYiU/qzg8x+j6N+TvmMv6sTFURi4/Zu401BOXsETvtLOLPIJahKQ+96BDu?=
 =?us-ascii?Q?56H5o3QUG5ixd0fCJ2kmqegAMWLhU4t0/nTK1Eie2uuTTMFyNvES2uMPWnZw?=
 =?us-ascii?Q?iewGO+hF9TrrRz73ZihKx1efO8Q6VCJHQPfOmlNEHo00taxRD01e3NNf/gyT?=
 =?us-ascii?Q?7kf+IH5KekBYoMZRqZ2i3oqxZpvrvWMcxJbj6LM4EyyDd5Z9RD4hqwdlmwN2?=
 =?us-ascii?Q?XSr9RZVFPSW6bfhm6GbcYONizGXUK0ML7p+n+FC1ZHmprfV3tygEUxpsRJH0?=
 =?us-ascii?Q?BoFIEvQ/QcOA4J/8CXnHEyUZgqWdnVBdGyjFzN+ISsyd7wgGwpHJ0Zi3gwWW?=
 =?us-ascii?Q?S0h0EHOwHfvVQvX/CpbcaRrMdkBJ8H829un48B8OtYPFswLZsPNSFRMEeDOc?=
 =?us-ascii?Q?Ng6va4MC05LzzjD8vXxf2AuDTPl0bObiFoCD5fsmBsF+AFNgNFJqo830/XRU?=
 =?us-ascii?Q?2+bkLUgc9bicfw6++4/PH0JY19rP/UwHxdmqTrc0G/sUzyk26eMkhwgFjNEZ?=
 =?us-ascii?Q?isjXAWbOMYDiABI1z2zgG9WyYwBarzuLjj3WhrD5PqX+GdclIUk2pzwrJfgv?=
 =?us-ascii?Q?j+f+hm5e6z6ZeHtc7viXAvI0LHlE09A6qejGtLvtSRRxpijMpkoZBgC4G7Jk?=
 =?us-ascii?Q?/IQp4Hyj3SpdKFwmOPS/MrbyFSjG1RVo6FR26HMCcrfy8/wJbD24eJgBwYHI?=
 =?us-ascii?Q?UK34sVRU/HI6pAohgDTbZXckGITK+0STOYZT4V/76+B7g+ns+/e5+xJQebR4?=
 =?us-ascii?Q?4wPz2t4bDq0Ed1+OHR8p84ct/eei8eC29+gRDSPwU3iYsTHSuMnBY72+gdjB?=
 =?us-ascii?Q?z4uIrYcmqzsEwL4rOvIJRYQyK30FUkWipJR97sfm+kmXSjIul8Ud8z+x8tvU?=
 =?us-ascii?Q?LfcsF24qpxiMOKChu2hrTz6MbQJWwREWCVPUC5K9k6b97PAG/6Fd+Xgemq2n?=
 =?us-ascii?Q?1BrFOho6D0KbpG/qAa1ygOAoIoDqjmTTJAIILct+uuRZv3NPJPs4QOCs+akZ?=
 =?us-ascii?Q?WdNfOfM25ol9OL7tTHmV2bHmKwelPyZlMrnba/ySVCFBLIJBr9VTdUpnKzOa?=
 =?us-ascii?Q?sjk8LYBsucqYyBseC4vkWlbPAI3yjRkCxdrUQ9G3c/cmiNlQK49w5Q5UJisS?=
 =?us-ascii?Q?NvPwd6XO9Zw2lZ4clCllFT5US8Fh2NhzR93FBGqaNwOn25FTvPuEG0jFOAA4?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c7d6426-e14d-46a9-c0a0-08de0d002b76
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 22:05:51.5506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QkdnF/q6dKro+wxgCmAzln66sAabU9ojwky/lpScAJpWdjcHK1ltWbC5cfN6N7gTmjIO8XT8dqGALR3N3XqE2BIdgntM2PzYeDuDGhSUx84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4742
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

On Thu, Oct 16, 2025 at 05:07:48AM +0000, Wang, X wrote:
> Hi Matt,
> 
> I really appreciate the clarity and the direction you're proposing. I
> agree with the overall approach; transitioning away from relying on
> device IDs in favor of DRM fds definitely makes sense for long-term
> maintainability.  I think it might be practical to go ahead and merge
> my current changes first, as they address some immediate needs. We can
> then take the time to properly refactor the broader codebase and
> implement the full version query strategy you outlined. Does that
> sound reasonable to you?

I'm only an occasional contributor to IGT, so I'll leave that question
up to the main IGT developers and maintainers since their opinion is
what's most important.  If we do go forward with this as a temporary
solution, I think there might still be some potential bugs that need to
be addressed, so I'll send some more review feedback on those shortly.


Matt

> 
> Thanks
> Xin
> 
> > -----Original Message-----
> > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > Sent: Wednesday, October 15, 2025 16:15
> > To: Wang, X <x.wang@intel.com>
> > Cc: igt-dev@lists.freedesktop.org
> > Subject: Re: [PATCH v7 0/2] lib/intel_device_info: get the xe .graphics_rel from
> > GMD_ID
> > 
> > On Wed, Oct 15, 2025 at 06:01:42AM +0000, Xin Wang wrote:
> > > This series enables IGT to retrieve the accurate IP minor version
> > > (graphics_rel) at runtime for xe platforms with GMD_ID support,
> > > instead of relying on hardcoded values in the PCI device table.
> > >
> > > Background:
> > > -----------
> > > Current IGT uses static PCI device tables with hardcoded graphics_rel
> > > values. For Xe2 platforms, Different device instances may have
> > > different graphics_rel (minor version) values
> > >
> > > The kernel's GMD_ID ioctl provides accurate runtime IP version
> > > information (ip_ver_major.ip_ver_minor) which should be used for
> > > platform-specific workarounds and feature detection.
> > >
> > > Solution:
> > > ---------
> > > This series adds support to query xe device info at runtime:
> > >
> > > Patch 1/2: Get runtime xe device graphics version from GMD_ID
> > > - Populate graphics versions in xe_device from GMD_ID ioctl
> > > - Cache device info by devid in global map for efficient lookup
> > 
> > I still feel that doing things fundamentally based on devid really isn't
> > something we want to be doing going forward.  Outside of specific cases
> > (error decode, driver-less tools that use libpciaccess, etc.), the use of device
> > ID rather than DRM fd has always been a minor design flaw that we've just
> > carried forward because it's easy.  Going forward, the hardware/architecture
> > goal is that we should never assume that there's any kind of relationship
> > between PCI device ID and graphics/media IP versions.  While it almost
> > always turns out in practice that specific device IDs do eventually map to
> > specific versions, that's not a mapping that software is supposed to be relying
> > on anymore.  Even if we're not hardcoding versions we should avoid
> > assuming that two devices with the same PCI ID have the same IP versions
> > (even though that usually ends up being true).
> > 
> > My hope was that we'd follow a process like this:
> >  [1] refactor existing code to clearly separate the tools that need to
> >      stay devid-based from the rest of the tests+tools that should
> >      transition to fd-based
> >  [2] update the interface of intel_gen / intel_graphics_ver to take an
> >      fd instead of a devid
> >  [3] update intel_gen / intel_graphics_ver to call the query ioctl and
> >      obtain the true version numbers if running on a driver that
> >      supports it (Xe) and hardware that supports it (GMD_ID); otherwise
> >      fall back to the same device_info lookup we use today if we're on
> >      i915 and/or the query doesn't give us any values because we're on
> >      pre-MTL hardware.
> >  [4] try to cache ioctl results to reduce the number of ioctls issued
> >      when a test re-checks the version multiple times on the same fd
> > 
> > I'm not sure how well I explained that in my previous emails, so I wrote a few
> > patches that cover what I was thinking for [1] and [2] of the steps above:
> > 
> >     https://github.com/mattrope/intel-gpu-
> > tools/commits/forupstream/version_query/
> > 
> > (I haven't tested that yet, so there might be bugs or spots I overlooked, but it
> > should at least give an idea of what I had in mind)
> > 
> > The overall diff is large, but most of it is pretty straightforward (and a lot of it
> > could be probably be re-generated in a mostly automatic manner using tools
> > like coccinelle.  Overall I think it's probably a net simplification because it does
> > eliminate a bunch of indirection through local devid variables that happens all
> > over the codebase.
> > 
> > 
> > Matt
> > 
> > > - Provide xe_device_get_info() API for other components
> > >
> > > Patch 2/2: Query runtime xe device graphics versions
> > > - Use runtime xe device info for Gen20+ platforms
> > > - Use weak symbol linkage to avoid breaking static library builds
> > > - Remove hardcoded graphics_rel from static table for xe platforms
> > >
> > > Benefits:
> > > ---------
> > > - Accurate IP version for platform-specific workarounds
> > > - Proper feature detection for hardware variants
> > > - Unified device info API between i915 and xe drivers
> > > - No changes needed to existing test code
> > >
> > > V2:
> > > - set the graphics version info in xe_device_get() don't copy
> > >   the whole struct of the intel_device_info
> > > - update the graphics_rel when the info is already in the cache
> > > V3:
> > > - Optimize the coding style
> > > V4:
> > > - add braces around the else statement body
> > >
> > > Xin Wang (2):
> > >   lib/xe/xe_query: Get runtime xe device graphics version from GMD_ID
> > >   lib/intel_device_info: Query runtime xe device graphics versions
> > >
> > >  lib/intel_device_info.c | 25 ++++++++++++++++++++++---
> > >  lib/xe/xe_query.c       | 33 ++++++++++++++++++++++++++++++++-
> > >  lib/xe/xe_query.h       |  4 ++++
> > >  3 files changed, 58 insertions(+), 4 deletions(-)
> > >
> > > --
> > > 2.43.0
> > >
> > 
> > --
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
