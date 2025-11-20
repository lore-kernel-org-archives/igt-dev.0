Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97B1CFA441
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 22:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F84B10E08A;
	Thu, 20 Nov 2025 22:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bvta0kJG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010A910E08A
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 22:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763676623; x=1795212623;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=K0c5PT5/pBmjBqegc5s0QTmB5Heici49CfOD5b9Ukgg=;
 b=Bvta0kJGCRp0J62aNqrCodbrjJDO1aX/ldgvEkjgJ0zSVrhWt3RdO3Sg
 AcxIPqQTolJ3f7X4Pdv0ZFoyc0Tovg8+QIRNDuI5J5E2ACIxNNmCWp7AZ
 1N6srtJh4VnJaktYzW1auy7iAKGDx+vbuBUNLKp5VFG2a4CNXAbFmepAE
 DzFxYW2A9npuAyokQxB03ekiRezWzVqILDZoDu1qpW7Bg0cj3p0i75NbP
 KQAwaSTIQ4IG3NAh6bjemQTV8kIcrPyHMOSj+SCuRzZE7ex3o6+eWxHHu
 DBcQLxZJ4kqxHowMv4QDV8tvVOv9S4Nnd81Mx24kUub4Nrwb9PkdTH0sr A==;
X-CSE-ConnectionGUID: ZRzQ7hiTSFOKPhlcsw5SeQ==
X-CSE-MsgGUID: Wnb0zuLSSsaIjvYFhdjN1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="53335566"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="53335566"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 14:10:23 -0800
X-CSE-ConnectionGUID: +3YKkGROSPW0QzBBs8NxYQ==
X-CSE-MsgGUID: 7zGJH6SgQSmWEtnKvlZ9dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="195792771"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 14:10:23 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 14:10:21 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 14:10:21 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 14:10:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v4nMA66l1NCFHCxoGj+c5BFA6+ipPq3yVFXh9nY2EUfRxCLvHlWYrk+7kEP30eIEEnUivTjp/BUA8Ipizy5PuAbPqOK06J1a31PP7mJRfOWMTg1In248IjplFnAVlhclt3ox0c/9vyUtNIXhpxyvwfdT+Z4Ufso5lyZDcp+hNvvPRL/vLlRfIqrTYmUQ7Dy8bQGUMEV1DGQTcE8yzeU1Nyg9XmZTYgEdBDtth2oq33F8YCL0T0/27cqoHjvajZ+wPYjed76z2UPbnM5zgq0tIXRXEyblnw3N2Wn2VEYBwZ7x07OklnQiQiFHsnkzHUg953BPwiO/wZUytA8WKEi4xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0c5PT5/pBmjBqegc5s0QTmB5Heici49CfOD5b9Ukgg=;
 b=ugR2udsT4FIqoWUi1FcnesJv0zy+cwLjhKCFiFXsTOsB8PgLsZA8nKn20YKpurffCyavm0ouIWrNs8XAdzCV+Pdgz7eAzr8AnqbcTZw4aRjFBgFvQm5zz3i/1uMj0Rq9fFQ607VP3IDzbyWKpOlxq4w/FuFKGIhVsFuTQRoSuYh4IqThdGGERdvtB/m5sQnxGZEFSN4Cd+gB9SRDn6wUDLFuW+nK6MYGf09gOyYasrj0v6k99Dq/Q3JbzcSn8Fs904XnjqZ778R+GB7vi4SmDkpcv5ZgZ3hErRGlVuWztUd7T2nkB1vZCF6k4iM107gNZmqg0JbrzjKReptpsI4NfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6425.namprd11.prod.outlook.com (2603:10b6:510:1f7::20)
 by DM3PPF5AD378C3B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 22:10:16 +0000
Received: from PH7PR11MB6425.namprd11.prod.outlook.com
 ([fe80::4c6a:e73b:a344:f302]) by PH7PR11MB6425.namprd11.prod.outlook.com
 ([fe80::4c6a:e73b:a344:f302%5]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 22:10:16 +0000
Date: Thu, 20 Nov 2025 14:10:14 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 07/18] tests/xe_exec_multi_queue: Add multiple placement
 test
Message-ID: <aR-RxnYdKt3w1a0u@nvishwa1-desk>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
 <20251031183555.1882721-8-niranjana.vishwanathapura@intel.com>
 <20251112175408.5v5262kluhmnxbue@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251112175408.5v5262kluhmnxbue@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: SJ0PR05CA0041.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::16) To PH7PR11MB6425.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6425:EE_|DM3PPF5AD378C3B:EE_
X-MS-Office365-Filtering-Correlation-Id: d34e7188-cedc-4c46-bf3e-08de288195f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KHEEftt+09ULIcMVhV4a/trOobyes/qlUn19SezSUpNMnqJBxhceMLc/Dzlm?=
 =?us-ascii?Q?zFQmCD6fwFzuXienNjD4h8tU5xo+Twe0SAPoVUH867/2nD70hq3301385BDt?=
 =?us-ascii?Q?WgS7xTA4kicDgZhebAhRQJLo4I68Ffk9+C1d6H2ck6HxL67BvpYYR0SXW7Lm?=
 =?us-ascii?Q?vT1EvRI1sqPEHt+hXjnUa1vRm4h04JAs4Ywg0hquwoUWiF7AYl2W86Ootr1Q?=
 =?us-ascii?Q?NjTlPFVL1XoGl7vhgEgunRSopW8tDKYT1OMH2blB6A3GALNJOnUj4BH+RBby?=
 =?us-ascii?Q?nAuhKAak1LbYFqTfEXmPOfGASjphybBZK2uXjIVu6v41IJTVaGsEkNxxGJze?=
 =?us-ascii?Q?WvoYhP+xXPLPq7e5gwAtxJdtQ+8ugeFqYWGDVMCZ54F8C57wr5kU9KIOVfH7?=
 =?us-ascii?Q?T3IZLqH37Tye0Tno1c54I6WcDRD0szCGF7qVlLd/UmDjHKoar+PWR4FOqfxH?=
 =?us-ascii?Q?7GQRTxSusir1ePGj3jpQ011Sy/6Efe11swrwuMCpzgkyO31BHnsS8eaOD6HE?=
 =?us-ascii?Q?xoXiI4PZxWhY8fX6J1u53hHRc2/wSdDDXwcJaBaxnlZKYGOP2oWWTXcVeYgK?=
 =?us-ascii?Q?RrZaZNo3Ee2WiSulCy4EfAqtDvok7PgfrHepM+mOGm4/MgxiUjAl9IRjbcl1?=
 =?us-ascii?Q?UGGWMq6gpjKCNbwyCwArr/rDsBV6LiTdQGfeJpDIEGpviNSuhq+MdthH1KrQ?=
 =?us-ascii?Q?sOyZH0hpR7sQ9I32F1EtiYQBUbVXckAwG/W6wtRjtQFfUPlJeUzk3iCeDRCz?=
 =?us-ascii?Q?2QWRm07zDu//v5FCUY9FbzTc1WZymxMYgasDMSONmTdY2x3KLZk7pchuAafu?=
 =?us-ascii?Q?AP2z8y2EVBI5bhzI1NedUjYPuj28o6fbHbE4WiPjh4Q+OmIh6h9ewhSwRgq6?=
 =?us-ascii?Q?D6rQ9YATMz4NLhtfO3cqhdux+V2O6lJt2MWS9fLMIIgAz5R3/4lipImPxdx9?=
 =?us-ascii?Q?+cC7GnQ96zXuJAL2omXz+R3qPYOsm6IEZt3isSkjGedL3YusAC6sl39M+gAG?=
 =?us-ascii?Q?ScHkfYpFbfUqHmo1PDSPw8SCdcvzFTXxbBjON6nv9umdSAnI4BMI4Ly/RHi0?=
 =?us-ascii?Q?0gzLfzg9seMGFUxz4X86rs1NcSJpinJnWgaBjytQdCcmzCsYJtokIciZ1Vt+?=
 =?us-ascii?Q?ILwnUJfRskd9n07o1XfosH54YaWR9TDCdTQae3fFelukD/vBFmaIjz8XabfW?=
 =?us-ascii?Q?/aLO+W7JpniCo30Iut8Z78udurZegbAfvzDC4WkqARbmbqlhSq7cJFt2VrOZ?=
 =?us-ascii?Q?vULHcQIoREGrJBsDgdke6ISJqV8P35uk9NpDv1rgPvkb4vcfFBtlmSF6Oxco?=
 =?us-ascii?Q?biIIBvcar+yUkOmx5/3ZCmyVB01o/sPqoML6YZ/evBKVMlAxWKa4izxIsA+n?=
 =?us-ascii?Q?fxPPPQCeSmEkZXhvGzk7kYzXNFxb9QwFDRffrcjp0op8RxLevmDpL74bYkyj?=
 =?us-ascii?Q?7IOu3autyTaazZi/9kIbiqTH6mJYj0SB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6425.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JX7bpYTN7jTJskwti9Rew+UdhqWOVAfNkg+HmjaZrEy2X+uprBHanVGYFycr?=
 =?us-ascii?Q?P7mX1NmLZn9UAOIUbAC3OejWh4w7Sk2NJek+tIMpsHrSdA8pIsGWed7tkM0q?=
 =?us-ascii?Q?rnCDJY+HbgIVoRaXWAGb66W9dxJuO3vzw/h1f+izzAIjM0p922u5NOUxRFA0?=
 =?us-ascii?Q?38c7dAzJI+I1CMwdlxZ46NUy6XzDYionjHwixxHs3LchtTpUcw7peCi/E1KZ?=
 =?us-ascii?Q?If6ifpL2YA0OYXPQkPKOeYQ6iBV3UGkDGYGZxI6ieWWeSSINK2mP4qSIBFhJ?=
 =?us-ascii?Q?wOUEXYiCUxFKGKcDdLUYki5oZ78QIbVVe94wXvZ31S7m/1GLXWssdSqKVboM?=
 =?us-ascii?Q?uB73CEAvXXof4YJQF7LVucJe6H8uCi8Zq2f9wKTqIWMyANf8+GITJmuP2ykG?=
 =?us-ascii?Q?B64H7r7gkv4RN+sLPM/7d2JZAZw/o22WBXrQD1JtRa75GGTLuexRCr+Zns+a?=
 =?us-ascii?Q?nzABvmlsxF9GAaC1tBtlm1PoxZxxsLvrrdm44MotJLSA8bK82fUKlsMJPCWG?=
 =?us-ascii?Q?TCsBcivv/g637wHX+e0BNFUM0Zo6kzEBWQqHaw+qXtdo8QrD4F7HmJhkDMjj?=
 =?us-ascii?Q?8Mt+JuCwVpILsXbQPCdF2YPn9GQADtZTmrJ6W0675pI6fra9ZATLGeuDWcGy?=
 =?us-ascii?Q?EXe56CViFF/IAH/XrobF+lGyks2jpdZRW/dGezoyGZZQXSCbw+p2oFin/WJS?=
 =?us-ascii?Q?cn/vDLfZDzljNqFnYh/UrlrUDadSa8BzQwa3afNa0VuJENkGD8EW9uT3Ahrm?=
 =?us-ascii?Q?2C4UNS80J1zLk0HXEaWRmIA/wo+A3zCUwxxAC4mcr0IBRlDvZVHzgJDDNzXq?=
 =?us-ascii?Q?MZTsnUnkgtJK9J1OdIQQqyMdyQmwqGXnyVwqiX40VTlfTDY5z3vUCZeHVyTq?=
 =?us-ascii?Q?Po585iKWzJ9rRyvrBMYJS0XRf0KzcfGTJ2kRoz6Zc+1pvxqn+BEPIz1nfF2O?=
 =?us-ascii?Q?Bygrf0ExOkZKCy+4RAo+n/LjbkFofNF/MKPRuzoyL00FtRDFuGgt0s9rb6Y4?=
 =?us-ascii?Q?qQU2NY2xk3N+31Ht9MRmkAHrdBnxbjQlqAnqscZW/X+Hb9mG/5NP8JWIKC6x?=
 =?us-ascii?Q?ti5za/9AbrT3qS+l2AGgQOdx00UHxfa5xNAQfEso6XrlMDtmGJjZJh5IIfcG?=
 =?us-ascii?Q?vmzCfv1LYxlnRIsOflTYqePAH3AJNMPuVWBOpA8wkcwatKSou2wUnbPiCDC4?=
 =?us-ascii?Q?gXb6VBnXMtMIpCOTIwThAT8rdZHjiNWGcloO6ZYNaH0fWOFjT77qfGWYDksp?=
 =?us-ascii?Q?FYBxUk85Y+hIr1QyfXGFhn1YPLodh3ajPX6bSc8eJ7Cx2j7SWqcqH8O75kAI?=
 =?us-ascii?Q?6wAQvcz81ZuQiRYLPiKksYGvWV616j46ylb8CZhKz00KxgUAM1LBAIWyLZgw?=
 =?us-ascii?Q?HX/C84zzcB4++kYKiTOtvK9M8xTi/b2rIrCzyNScg5J8zYuoVF4F2fSgc4ZF?=
 =?us-ascii?Q?napdRXoE+yxA0IB2hzSJIahbcwekPFOWm32uG3999urfIpAUyjtga35z56Xa?=
 =?us-ascii?Q?8L/cdG8HZR2qComycdFGbcOflefcEevmh8p3tgb2iexP6i/QxtcmDPSnpf7s?=
 =?us-ascii?Q?T0kX9AmEmfnyYckf4mUKNUm1+juOdorrdyPz04oc5lAe2Nq8pY4+HwKlzdhw?=
 =?us-ascii?Q?eXsrjghFWLwo0M9AeY/uPEk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d34e7188-cedc-4c46-bf3e-08de288195f8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6425.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 22:10:16.7553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nGbdF2+/9vEnt8tkzoba1I2fIzGSymDWmv48mAoHF5VIzVJHUWoTxSme4Tjsx7Nc93CmMOGC+wXivtTPFDp1W4rQ/8dkheVVjTD9lGY4Ya/Rr1rlurJC6zXBu8Y+cjWL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF5AD378C3B
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

On Wed, Nov 12, 2025 at 06:54:08PM +0100, Kamil Konieczny wrote:
>Hi Niranjana,
>On 2025-10-31 at 11:35:44 -0700, Niranjana Vishwanathapura wrote:
>> Validate using virtual exec queues with multiple placements.
>
>Please add 'intel/' prefix after 'tests/', so subject will be:
>
>[PATCH 07/18] tests/intel/xe_exec_multi_queue: Add multiple placement test
>
>Also do it in all other 'tests/xe_...' patches.
>

Ok, will do.

Niranjana

>Regards,
>Kamil
>
