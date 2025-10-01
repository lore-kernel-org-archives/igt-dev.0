Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4897CAC5B8
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 02:18:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8197010E653;
	Wed,  1 Oct 2025 02:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GSXuvhgW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC1610E653
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 02:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759285121; x=1790821121;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Meh/Gd4Aa3dT/+QVrBVRXS6uYx7jjFg6naDid0dpV6k=;
 b=GSXuvhgWiAENinLSYb947y8zlu/sZOJ6IdWZiSIFIhlEdqNOieb0VW1I
 07V0YntN+Bgs/R2HtU14BhovvyeUWU6uqDkqdhoE3L00HT9xP2+IfMlD/
 KChWo1HJeeYrpPfgzqWtWEgSlpvSivmLsFj7F7qO4y0l9vyHhfxUOmrDH
 /xMBzlsp/eZ8FANDon1ySvOWadARhn/tJqKJY5N57sGJVaUu6aHqNrlFd
 4SZ486zun65jXaWvwnVyCnTYWXfLqoTqizXJdurxsgUevwoPoEOdtlFqp
 FAL389tQIlHEKLxZ5zoEqYJX/n8kU9hjkjm4liE9cb+EhgVPrSQe0b70B w==;
X-CSE-ConnectionGUID: TZfzFQswSAuc3b7lHB6jFQ==
X-CSE-MsgGUID: 8UpHho3dSymv63tuYdeBqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72978493"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="72978493"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 19:18:40 -0700
X-CSE-ConnectionGUID: LN1TbWs2TjqOSI6zMKa9nA==
X-CSE-MsgGUID: oqDk1LicTlG74b1cc+wtpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="183863418"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 19:18:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 19:18:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 19:18:39 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 19:18:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BSwMtVTbFftCg6ATYK1i2mqy3nQVOsHPcZe+feOPImY5Ctuv4zngIAfsN7RHQvlNfy6GwPif3nxbDW72xUNuEveSODAtX5upzu1joUr7OFhcpHi8rXpR/0b+riUfbkmr5nmCd4+RLB5duZNow0NTaAtyG11SiLzOvJ1etguY1ri6ioFYHL/rpHTrFqF+ry+v4ZeIbuMGVoj6CXtFtRQlEfuGMkNHW8hS6ZXbPlYxeawV7bEkln5XrdaV0F0IdhWjBuN2SzNCKyBwCaaGaVfjR4vVA0AlJBjXJLTnTrmiOHhF0M4aWHYhxLflb2eObMiVT61PqbfBsKnSqIFBqnHS6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8DlfQ3QErS4rZn4fDWj4fDSiBy31iuHhe2BLDebIjw=;
 b=nrGjpN9sF6DmCRDLEkdFJKFLRVF3M6NmBrPXrPR4f0iddFf9oMEcFzveqNeZ/CKATAikhOXDX25Qb43gGVf3fhqo2EIz+C7PNAx7H9MKZ8dLwVKfZ0GvTnwDy9Tsuq23O8mH8HhEApKUJ1ml2ysAHodX7GZAAZFM3OjeXK6NkE1u5doEdO3j3R2pdn3LyO98x1XQvwgn/AfJfKcGEWQ745AprD8+5B6KH0kgPKEGTyIvMIjN/KMFY/Mz6Wo0aZ4CtVlpdNcsAK648x235NsV9v8ufnEsIeYMq2uC2Mto8Xvd2j0vbW+ovst7efzmun40HJvWqHgF0lkp8c9nfepL4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPFACFC9C99E.namprd11.prod.outlook.com (2603:10b6:f:fc02::47)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Wed, 1 Oct
 2025 02:18:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 02:18:37 +0000
Date: Tue, 30 Sep 2025 19:18:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>
Subject: Re: [PATCH v3 5/5] tests/intel/xe_exec_reset: Add
 long-spin-comp-reuse-many-preempt-threads
Message-ID: <aNyPezbV8CJoz2Nk@lstrano-desk.jf.intel.com>
References: <20250923211333.766147-1-matthew.brost@intel.com>
 <20250923211333.766147-6-matthew.brost@intel.com>
 <20250930173536.ixuthzbjqxjsboxf@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250930173536.ixuthzbjqxjsboxf@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: MW4PR04CA0253.namprd04.prod.outlook.com
 (2603:10b6:303:88::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPFACFC9C99E:EE_
X-MS-Office365-Filtering-Correlation-Id: 30586647-bcc9-4633-dfa6-08de0090d4a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3HrOh0DCa/itdqBaBw2Fp/TCJo5TF8akKIDlq7UfIT/PKZ11KEAaZABnIHVR?=
 =?us-ascii?Q?c/SXJxooboOWn7mwdXTT1qUFJeO05QcIPpDleRTxIyeyArKDKjc+38nzJ4I2?=
 =?us-ascii?Q?inNPOQ6YTNgr/zWZJhNoPnd3ptNcLOtBJEEr2Uw2hf5uDnqXWKHqx1LC3vbS?=
 =?us-ascii?Q?R2D12EddGWxXBUgfQ6bnQEAaQCQt46q/6GSDBu5QtfYoawfnpHnstFWHMIVx?=
 =?us-ascii?Q?1PVCJuEnOhgx1TGTLEt5I4dSI34uW18weaCbbNxodLcsDGkpV1YTdOGEdemi?=
 =?us-ascii?Q?uAe5BY4Ed1yDKlWKpDIUcsceJ4gNn0Af38bcjwYUt2XKhcIbCbTKuD5HO/OP?=
 =?us-ascii?Q?CNSqjENQSRZYdZBDKcz1WfatTppkHDiqXkahWZksmj5XU18IbUaZZnOTdeg0?=
 =?us-ascii?Q?9zH64kwHnVx+tj4DAo7+DvQPivrxEuZ/bGSMODT1lyXI/dBv//q5si54UdCL?=
 =?us-ascii?Q?lBsaM/sowAjigI+6aalA59qzhLndAYVnq1bMMOAtYB6a/7VNQNYSySMgQmFD?=
 =?us-ascii?Q?0JbJk8mqB9MJqE0WfS36PQ6scfjTksrW0gCYfLTAPufY2iIdPjewGXkVp+GT?=
 =?us-ascii?Q?6Z5E667Sy9E6Qr4WXma0B+SH9BHO5oKZOsSdAzsygMJc/6VQLR+6GEXYLZpx?=
 =?us-ascii?Q?A8TrPrfBhwsEk2+eeB9XkOR80rR6nyhS+81dLWd7ktKTA1aN+55iKLmd3e40?=
 =?us-ascii?Q?jZPmgpbU0jtnOthpwm/mEL7rbqbw1TlzLLSWqn5ANLgtODsPf6VA/ndTRAJi?=
 =?us-ascii?Q?uv3pljaePKLyhw6e1+p69ImkGHd0YIeXsJhi8zD13caJ0OWGKuFlP0TAqETl?=
 =?us-ascii?Q?WJlMVucjQ1zfYCHzh69eDDh91u2IXD4JKh0m6lO7pSzVP1zoUpx4CmnfRh2K?=
 =?us-ascii?Q?IJJfESluqaiGKx4Rt02eo2USSCqad/fPI5I6fPbtLBo9HRpyEA0600znPfP9?=
 =?us-ascii?Q?9Dc6plXpc2PiipJO1T+2g3yFN6/TlZKhOkX6XkLBY/GFXxRnMUngz5Vn4O+u?=
 =?us-ascii?Q?2QcXbvIumnQrtI00VB3GyTlkLuA0eG6FGGrsAQXtl6vy7QQDa7pJwixQ0Er0?=
 =?us-ascii?Q?b9zgGw0ABAQn87K5xTI/my1YEiJEdUeVK7dJih6scpk0QE0eX0mU/TGPO4QT?=
 =?us-ascii?Q?lp3kk75ieWohftFPNKjgSnQKfM9UqkmGdXTtn5ZWCDqzL+8WuO8HL20BT+EH?=
 =?us-ascii?Q?SUynnvqTw+Up6d34gxu0qQBjIcRnwmF/jLw0d7WK6MQAwVQzU6XICwPMcaFC?=
 =?us-ascii?Q?kykgOqiVKmIK+FTaRyV1iebQXq75GRmEJbug2dUDckTCVpB/F6wtr7UnQCkL?=
 =?us-ascii?Q?0yvR6VoMEZ5f5/hahJgMANIATehLvvU9iP1oS77E3BH+5YBEQLXew02q2sFg?=
 =?us-ascii?Q?F9EFEL+KMCo6iga1eoXCpj+UHbt8M2mWUfEwm0xbOXyLsejQmfKRd/D3UnYW?=
 =?us-ascii?Q?zlJKC1wymqejkEEnMik5eiE5OOHaU2bo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xQQfcAiizQvAG1bynnRxsdZal3K5JE7XtlPswpo/Cvocp+Ijk3LPPc78h+Ju?=
 =?us-ascii?Q?J8ORGrRRucH7SLKfK0wgWmRQh8bJfd5v5LT7b+JAKSyOeH7ImArDPY0PVxl7?=
 =?us-ascii?Q?Wp0W7YdNvDIMkgKqOKS6tE9VtcZ/wyVO0RN0nGYHYE3v8debqrKQdkCcl3S4?=
 =?us-ascii?Q?lE2TdoG6JKWl7rlegG8G4G9Lq8UrnK58HcplpdDRlk0JK/0TezaAIcPcKGgL?=
 =?us-ascii?Q?/3gIqgDEEM5QmF6tFVs7UjdOssUi+35zlTLvAWTZTR5FmlQrPgDuxxgNvjsl?=
 =?us-ascii?Q?83iezYpWcFFUgAHHSlwnLAOXBQlCArd+SWYm+mPnmEKa40umyNJhOU0PUwcq?=
 =?us-ascii?Q?ko+6VH7IggN8pGZfHr18edrTl2oKqbKaaRhDV3agYotlAPSY7BF9oRezTL9x?=
 =?us-ascii?Q?6wh6Nd2HAl5uAQmrMkj3a4QpbRlI44b2EBEX+W3WWvuu/vf0OKxap0IdPdgk?=
 =?us-ascii?Q?8CZmv/kN3vRWDgPLGlRgBQRp/gqfKlVKq8Pv8s0OE8FEF05HkKcsxd2w6qVx?=
 =?us-ascii?Q?xcuQx9CIWXMgyMDFAjIZrftj1pAwZbeJpAPDmTC+Ug85FUquU1v6AoYLPsG9?=
 =?us-ascii?Q?k9hLbxVN5aVQ0Hp2sMqIwOHrVHugU7+6nWjahHKi1rwBCHbsVUHHciMvjBpc?=
 =?us-ascii?Q?X/wHawhjv1aLDfhMIUGVakdTS6cjNjFqwja5BjJRwxa5mX8i1rh5dQSIYNIx?=
 =?us-ascii?Q?HVTRSbQFnAHW8tzmDkdhEfRvi7VQCxgq4YFeCV/tQoSEmnp852Tp+Lnkxkg9?=
 =?us-ascii?Q?xI897XLPEKdPYJuf7+FA2ZNme32Xt82Kf6btvnxl+92ETkCs2GnC5UdMewyA?=
 =?us-ascii?Q?KqkYB9z7pn8n1qp1TiiQknlfqoVSlxvEgj/bTcZwBTq4usde5DCd/h7yPd2c?=
 =?us-ascii?Q?vrhDqVruCG1ZBep/tLECSemidSXpkJJ2wxerUD8RzJBErD/F0NkByplp4ZqX?=
 =?us-ascii?Q?3EX2wqfgbK1uoGeMlhd0m8Vn+fuMPlBRU1JIBoqaIQEXvp+DNq6a05eV3Hn3?=
 =?us-ascii?Q?4258ck7wAxOb0f0wPTJXaGJxrLJ0SPt7gM9+oFl1SrhVTwop6lr6AnhFF/VQ?=
 =?us-ascii?Q?6Icad4qzvHKrLis65TKXhqFM7fHL6rLLqdzJQoaOZZcySJrmXXBX9LaNtOWk?=
 =?us-ascii?Q?w1jTs3JZ8H865bkxiOH/YMnAGUTaHKvsEFDq3ZBV1SQa9fLhLkLJnsNoCsKY?=
 =?us-ascii?Q?GEowVSETtJD7IUDnxSnaebYWCvy++jKpnOV+/wDkfAg8TiR+8H6vGlsVJnyi?=
 =?us-ascii?Q?Zp9GYVVv7wPDR9AHniDcBYBL7fbKSxYTwHqsvgePKmE0nbVr322cSx3x4QQC?=
 =?us-ascii?Q?X+zbopKnIlHHMQweslaJxWoBHc6psv31ZXj1JyK712Xl2Tylux2jED2bm8Xa?=
 =?us-ascii?Q?8+GidwcEtgxBOF98SSoCjgQdF6n6EOGvwCkj08ED0Ry5Jr4XdMQVc5zq0JRX?=
 =?us-ascii?Q?xjcTJtYm525mPGeSd24/KHwL8EzwSFxx5ncgwD7tfnGTUquBFCFZvMKPAzW8?=
 =?us-ascii?Q?+GZFkKadinSpBh5SNJ4P+HPNeiAGWU5P/bjC9AWjQgJfFfQCNlJk7qmOKWkf?=
 =?us-ascii?Q?xSL5hB64vmMSQOtKi6uxMAPv1JvjfQFJY0ZmGsTy5p+8dHw9rjjcaP6FhMyW?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30586647-bcc9-4633-dfa6-08de0090d4a5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 02:18:37.8185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ydSCCiOSuo6ypv7m84g3dQx3skhriNsU8FzLDQglBrVhyobtL1ugtvUyQtyYBO8GjVkmL9W7RNO5Qw/97xEDyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFACFC9C99E
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

On Tue, Sep 30, 2025 at 07:35:36PM +0200, Kamil Konieczny wrote:
> Hi Matthew,
> On 2025-09-23 at 14:13:33 -0700, Matthew Brost wrote:
> > Add long-spin-comp-reuse-many-preempt-threads which verifies compressed
> > memory can be used during this test. Useful to test VF migration.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> +cc Zbigniew and Marcin
> 
> > ---
> >  lib/xe/xe_legacy.c          | 38 +++++++++++++++++++++++++++++--------
> >  tests/intel/xe_exec_reset.c |  8 ++++++++
> >  2 files changed, 38 insertions(+), 8 deletions(-)
> > 
> > diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
> > index cb53a8cfc8..74432a4b3a 100644
> > --- a/lib/xe/xe_legacy.c
> > +++ b/lib/xe/xe_legacy.c
> > @@ -9,9 +9,11 @@
> >  #include "xe/xe_ioctl.h"
> >  #include "xe/xe_legacy.h"
> >  #include "xe/xe_spin.h"
> > +#include "intel_pat.h"
> 
> Please move it up so igt headers will be sorted alphabetically.
> 

Will do? Can I just fixup when merging?

Matt

> Regards,
> Kamil
> 
> >  
> >  /* Batch buffer element count, in number of dwords(u32) */
> >  #define BATCH_DW_COUNT			16
> > +#define COMPRESSION			(0x1 << 13)
> >  #define SYSTEM				(0x1 << 12)
> >  #define LONG_SPIN_REUSE_QUEUE		(0x1 << 11)
> >  #define LONG_SPIN			(0x1 << 8)
> > @@ -72,6 +74,9 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> >  
> >  	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
> >  
> > +	if (flags & COMPRESSION)
> > +		igt_require(intel_gen(intel_get_drm_devid(fd)) >= 20);
> > +
> >  	if (flags & CLOSE_FD)
> >  		fd = drm_open_driver(DRIVER_XE);
> >  
> > @@ -79,11 +84,20 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> >  	bo_size = sizeof(*data) * (n_execs + extra_execs);
> >  	bo_size = xe_bb_size(fd, bo_size);
> >  
> > -	bo = xe_bo_create(fd, vm, bo_size,
> > -			  flags & SYSTEM ?
> > -			  system_memory(fd) :
> > -			  vram_if_possible(fd, eci->gt_id),
> > -			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +	if (flags & COMPRESSION) {
> > +		bo = xe_bo_create_caching(fd, vm, bo_size,
> > +					  flags & SYSTEM ?
> > +					  system_memory(fd) :
> > +					  vram_if_possible(fd, eci->gt_id),
> > +					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> > +					  DRM_XE_GEM_CPU_CACHING_WC);
> > +	} else {
> > +		bo = xe_bo_create(fd, vm, bo_size,
> > +				  flags & SYSTEM ?
> > +				  system_memory(fd) :
> > +				  vram_if_possible(fd, eci->gt_id),
> > +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +	}
> >  	data = xe_bo_map(fd, bo, bo_size);
> >  
> >  	for (i = 0; i < n_exec_queues; i++) {
> > @@ -94,7 +108,14 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> >  	sync[0].handle = syncobj_create(fd, 0);
> >  
> >  	/* Binding mechanism based on use_capture_mode */
> > -	if (use_capture_mode) {
> > +	if (flags & COMPRESSION) {
> > +		int ret;
> > +
> > +		ret = __xe_vm_bind(fd, vm, 0, bo, 0, addr, bo_size,
> > +				   DRM_XE_VM_BIND_OP_MAP, 0, sync, 1, 0,
> > +				   intel_get_pat_idx_uc_comp(fd), 0);
> > +		igt_assert(!ret);
> > +	} else if (use_capture_mode) {
> >  		__xe_vm_bind_assert(fd, vm, 0, bo, 0, addr, bo_size,
> >  				    DRM_XE_VM_BIND_OP_MAP, flags, sync, 1, 0, 0);
> >  	} else {
> > @@ -141,7 +162,8 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> >  
> >  		xe_exec(fd, &exec);
> >  
> > -		if (!i && !(flags & CAT_ERROR) && !use_capture_mode)
> > +		if (!i && !(flags & CAT_ERROR) && !use_capture_mode &&
> > +		    !(flags & COMPRESSION))
> >  			xe_spin_wait_started(&data[i].spin);
> >  	}
> >  
> > @@ -202,7 +224,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> >  	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> >  	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> >  
> > -	if (!use_capture_mode && !(flags & (GT_RESET | CANCEL))) {
> > +	if (!use_capture_mode && !(flags & (GT_RESET | CANCEL | COMPRESSION))) {
> >  		for (i = flags & LONG_SPIN ? n_exec_queues : 1;
> >  		     i < n_execs + extra_execs; i++)
> >  			igt_assert_eq(data[i].data, 0xc0ffee);
> > diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> > index 113ceb2178..f5db1ff8ba 100644
> > --- a/tests/intel/xe_exec_reset.c
> > +++ b/tests/intel/xe_exec_reset.c
> > @@ -123,6 +123,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
> >  #define GT1				(0x1 << 10)
> >  #define LONG_SPIN_REUSE_QUEUE		(0x1 << 11)
> >  #define SYSTEM				(0x1 << 12)
> > +#define COMPRESSION			(0x1 << 13)
> >  
> >  /**
> >   * SUBTEST: %s-cat-error
> > @@ -702,6 +703,9 @@ static void *thread(void *data)
> >   * SUBTEST: long-spin-sys-reuse-many-preempt-threads
> >   * Description: Test long spinners with many preemptable jobs on each engine instance with a thread, use queues again spinners complete, both GTs, use system memory
> >   *
> > + * SUBTEST: long-spin-comp-reuse-many-preempt-threads
> > + * Description: Test long spinners with many preemptable jobs on each engine instance with a thread, use queues again spinners complete, both GTs, use compressed memory
> > + *
> >   * SUBTEST: long-spin-reuse-many-preempt-gt0-threads
> >   * Description: Test long spinners with many preemptable jobs on each engine instance with a thread, use queues again spinners complete, primary GT
> >   *
> > @@ -878,6 +882,10 @@ igt_main
> >  		threads(fd, 2, 16, SYSTEM | LONG_SPIN | PREEMPT |
> >  			LONG_SPIN_REUSE_QUEUE);
> >  
> > +	igt_subtest("long-spin-comp-reuse-many-preempt-threads")
> > +		threads(fd, 2, 16, COMPRESSION | LONG_SPIN | PREEMPT |
> > +			LONG_SPIN_REUSE_QUEUE);
> > +
> >  	igt_subtest("long-spin-reuse-many-preempt-gt0-threads")
> >  		threads(fd, 2, 16, LONG_SPIN | PREEMPT | GT0 |
> >  			LONG_SPIN_REUSE_QUEUE);
> > -- 
> > 2.34.1
> > 
