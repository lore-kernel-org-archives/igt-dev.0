Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2496D31A0E
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 06:36:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BAAD10E1C0;
	Wed, 14 Jan 2026 06:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jweViQhq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE40E10E1C0
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 06:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768372591; x=1799908591;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lND7LSuvT5OzcoR8Uz0PH9VheTuUo0lD+FMUx1npjqM=;
 b=jweViQhq6yT4yR9+NImSfB93QM6dd/5KAlORxiHFgol3Uarnju0A5eBk
 HfxpTBsGE1dGF1X5HhNpmdV/1oms5313GH/SzMLoKUjrm31Mqs4o0W61E
 VHCpocYbVcUheM5Z+UrrqRHmKSExTB0vW2dJyfFRTEwl1w5858j45Fcwt
 HTydZXHcGQRnHYsqWfKB+Rw1QhJRTnKGKnJqKHRjs8996grvHODIIHnyY
 n3PDwM/qDG+SQ5j0xGqxaoGD/Vr3cipVr2DzGuDEPPkgahzvQ8CVmhFxr
 NQkSh2h7N+VTPdh/L5eJvSxM1Y6qHc6Gr/g2J/6tNjtqPhCG3OMLp9CfH g==;
X-CSE-ConnectionGUID: 7gvI2rTzRpG9+dVROop+Eg==
X-CSE-MsgGUID: LkazP2dYQQW0Ao0QYOGozA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69586037"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="69586037"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 22:36:31 -0800
X-CSE-ConnectionGUID: 76T8SCrnSJueirplqX3aiw==
X-CSE-MsgGUID: rGAkVGdSTNWdwzcSdZq98w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="235312745"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 22:36:30 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 22:36:30 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 22:36:30 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.28) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 22:36:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQNVEHM6fk1mak325eCEm5iP2UUFzDn4KnISg04K2yP7IY8BZuiSJKtt1+uVdHv7Ncu/q0rAqSmAR3rzCbjkBVPEwIZDWnymlyUwoncZJDYvIuJnzcCdWWcIEvYjn/WNOw/ji4nb9YO4Qseg1dzT01d2JeLAABjoT2xr0/cJoXkWb2S+p9dqvLJMzK2D3+aUTj43+o7/nebDWqhiRgWtyzlbRQ/dQYlhRuRHg97o/2BOVJCw8v9klBcDIs3cLDK9lT+JRmeerUGQoRBAv1bMWptTvLu1p00gasBm4AhucXsn838Cg4FBadyd2zHddr3Bn3XRlkUJmlaFV22KqsXVTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swBCKpPvWstdHYA53lxNh9OM34B7SKulB5b3RaCP2FE=;
 b=iYPG0cX6UMpwQYvNijtIe0WejGh1Kg6JBrtAPDJC1kfv9BjJKHUyVemuntpgG8VyGFMBDUtUkeFIUI03MEIYxdhHz3KSE2+fkBJkWioQARuHgp0nhjkUocu7ZLesfP0SdI9V5HFbHIcfpI2YNrXx25ALA6rZ8iiyK1SMccLpHdVC+p8gvxiHCRKpsxUQtOqdiUubp2bn4ti5f582GnpGJgiZbk0HzdVAEHQ94v9Ids0c6Am8TayKoY4iGG7zFMjXStdzru5+AgE9hR5mpTDpXsWJtdzpjCaqILybnSPKpys2dil4ozugbznaKWqI3qq5CNLbEfg7jxlP4TdrWphkyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by IA1PR11MB7199.namprd11.prod.outlook.com (2603:10b6:208:418::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 06:36:22 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%4]) with mapi id 15.20.9520.003; Wed, 14 Jan 2026
 06:36:22 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 7/7] tests/intel/xe_exec_threads: Extend multi queue
 testing
Thread-Topic: [PATCH i-g-t 7/7] tests/intel/xe_exec_threads: Extend multi
 queue testing
Thread-Index: AQHccN926DY1gJBSWEWVmXoLyBTLUrU8WN4AgBUFVdA=
Date: Wed, 14 Jan 2026 06:36:22 +0000
Message-ID: <CH3PR11MB8434E2E14E930C2EEC2D443B8D8FA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251219120154.695287-1-priyanka.dandamudi@intel.com>
 <20251219120154.695287-8-priyanka.dandamudi@intel.com>
 <aVWXAMbNVuCdo__V@nvishwa1-desk>
In-Reply-To: <aVWXAMbNVuCdo__V@nvishwa1-desk>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|IA1PR11MB7199:EE_
x-ms-office365-filtering-correlation-id: 04e273c9-81d5-4ef6-648f-08de53373bea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?7xBqkUnWIWhAxe5oOl8uDhXaNtcC6tOUy8fe+2s3lh0MV43kEHXQtBxgf9K9?=
 =?us-ascii?Q?VH+UQu/iIVbNOYaq3Vs0z8ZRtTg+qD1gA47A2CKuhXdJHis3OWZ0OGPuVESd?=
 =?us-ascii?Q?pM0kF474PpmMUV0RR99CivmNc9Rk7BAUY2UOyE/FQ89p2Cpfh+qi+8zTG1BB?=
 =?us-ascii?Q?8QnB56FIzjdeDCQie4jJjlEy1c0vfrVwvhT/9qgBo5/vDdxHQVz9bobHUg51?=
 =?us-ascii?Q?XnOs1LZ0lTQlt9ZAML0LwQHW8K8SSbNNavgU87Nu23M+VZWYAg5YAS/Bxw4m?=
 =?us-ascii?Q?ukmJGFHqKNv0lUxh0VOsFkCHWIzZouejtRp2EBbZLTOnM6WguPdBYhFp0IO4?=
 =?us-ascii?Q?a9yqkcvVOC+7BVkHPVbbiE3rb3Z0lfcu/iVV/pWU8qo0auO8aDFBE3LIIMZ4?=
 =?us-ascii?Q?IBJmPKpKz+PWeiOoyNYxGQHVltXGXOvacD0JVD1LKHzWKqlmWdp6PRMks6Ik?=
 =?us-ascii?Q?WiPUpinRM5aHX0VANBHYk347w5VevT82djOJOyymvk9SU1yX8IOq6Lyr8J6V?=
 =?us-ascii?Q?LypbzE7x4asoOeeocBUYawM/IfU+vr/C5h1pXzDQzbrxk+Sinhxe2i+yu7n2?=
 =?us-ascii?Q?zD397/xp9lsntfORGzqQ7u+uvb30l6qR1VDp7E/VYaG+5Itn7zseDUQtNhUK?=
 =?us-ascii?Q?RbXQ+ZqQNTDgQvTtsb7pH6OI2OiGu6YmB3XKqL/NxLz3jIiLtVfEZkW0RNbI?=
 =?us-ascii?Q?pfe2jPFV6n1nfXo4ylmD1rLUw+pZ3hpO7GqmO89rByv6/S5l7lgJ0997W4q1?=
 =?us-ascii?Q?olOfSHsVkdq3DZDyqnx419Xkfnc0thAwcqC88GyDza2p18BQyGPDY9EmGxRW?=
 =?us-ascii?Q?hleEBC/JYssok19J3nnP1BBj6vMIyp6mLtP2BflZEr4Ej66+NAjY8yA7x54y?=
 =?us-ascii?Q?FjHaCjwE4ddcv+S7TrWcwg9y0Eg77S0gqSVHUrjVbm1XbDc5uN6y9qLTpUST?=
 =?us-ascii?Q?vKtFCTCkgwUEkjJNUux0oXFXftclZPG29P18RmrRQfuBaOp7L9nP4Qw6H5HO?=
 =?us-ascii?Q?Vh5p0c0wHKUXKb/1L7TG/61TPbup80qe/RfB9BDili2rN67YdHgYO9Tp0mQH?=
 =?us-ascii?Q?f92w4rpJRSwbubqaR0yYTSnDLGa3xtEyy84c5ntmkr5oTBa9KtdLhLLarZay?=
 =?us-ascii?Q?3uIiq62CaAtQ2p9/k03c6/iYn51riY7lRiInLEyCkzPZ9xJw72S2QAx7KYWj?=
 =?us-ascii?Q?ywuTu5hIVolSKosjRjGpElyQX+29VXT5lzlzzqr9d9Be6hcVq4wPhYnVkEGI?=
 =?us-ascii?Q?RpGX9w/wb5DdsQtwDKT5Iuwf008zQcuxDXEtgTKERlj6cnh8Ct30AVsD+LCV?=
 =?us-ascii?Q?ydZSvy3XhVGQT7jK5ca7Xf+4aPQQ+qgBuB9MtFbBva/lLB5St/3qklnQLOVG?=
 =?us-ascii?Q?xMgmi7uHNDVRbKf7A9mc3pfiG5lJJ9jfxJ9FiCP7PLOMhwOGEJJ+gizWYmGR?=
 =?us-ascii?Q?o1gRSnb1Qh9zCfn0QMgryF+dZ8DE7LpIMV4zeIoT+zjYsVpxqlSH5npQaW7e?=
 =?us-ascii?Q?aE+07McF4p3c+tkG9D3u70j3n2m2x2MwRlpf?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NPonbfZVPpcK/tRrzRJbfDrvtEptIsh2l54Id3Fjju0imGpHZJ/1bO2meRCZ?=
 =?us-ascii?Q?SVuaGg9XyPzIqMB+9R3/RSY+UFM5U+Yuucj+rxrewKXAg3fF/S6LHWLFlxIu?=
 =?us-ascii?Q?Gmhqla+0rEKMe/tp4cSOdldaotB6xRTl4NnvDxU34VCnV6wjUA9KJxtJ5tUG?=
 =?us-ascii?Q?uaRd0DHYEXVPXr9OIeozKlGHf9HK0+mXknTCdUwW+O3NwJm8I8+sUEccM/I4?=
 =?us-ascii?Q?Evm88euk5WdBGBg2l9IkHhR21sfBOymOVY7j5Q+7AgIIbXiuydDIGI6xcwH0?=
 =?us-ascii?Q?aZw/5XFzIah4UKoalBGywd8Ql8dbuvU2F2H0XQBiCRMifQy2j9aLmnDEoZkR?=
 =?us-ascii?Q?Q6/gICqCSQsLlJDINArW//Q84/nyqRJhun1VzbrdBs2tiDkAZ4z0VEzBkbhX?=
 =?us-ascii?Q?bm/AKLXDppqMyzuM84OuCPkXiq6YvFl0Y4DbwTRecGZoCX1azY/hLGolTlJV?=
 =?us-ascii?Q?XSaTlbqbs2DRW73UFSP4Y/wlPUFjoFW9Vb1651ou6Cqm94C+TVO4yukBwonw?=
 =?us-ascii?Q?GY9/Xs0neYoMs/++Bh5x1EffNzIOuuOPsLgUTIa5X1RTPfiW+uxnrj75EMiP?=
 =?us-ascii?Q?MwAJGUrgJGdsJtxUhdumhVPdoXRFTAu/NsFPAk0ezH/rJq7PCrAZY8GZCbJh?=
 =?us-ascii?Q?G0siI41wDQwohq+cyTzQBC+IbVucEwYJq8xPGtCW3bh2Gp3uHOxKr+f2uVaD?=
 =?us-ascii?Q?0SHquXOmnghSLpzxNZNVLPhb3Qw/bZgAfNh57z9NAVlhgb2MsiBTBg1D2Nbv?=
 =?us-ascii?Q?SgpTXcoJW9X6oqyh1XH96wKvlF+Y8uCOytJufJx20fY96NRzBNqKn4hmJZkR?=
 =?us-ascii?Q?zx6NZq8Ijo3qNKZBRJzY0BYsI1i3CVVSFAcVAUhAXlFCwCsDkTcVROKun09D?=
 =?us-ascii?Q?O4kZX+aoqdLX9lPHAf96NM7sckZgd1XiRGWRq9OHREh940wsHtK2NH3B3bc2?=
 =?us-ascii?Q?U6vhrev8+12K69EJbQRgCRwiBqOYHRhPAQsAyCeJSDsArKpBznQpQM0gHZSt?=
 =?us-ascii?Q?W0hcjkRyKLyKRuFcaL5+IBV11g2N8yvr6SGHMKhk4qoD3gRnoT8/+li6KedI?=
 =?us-ascii?Q?NTLReWhhlIpNxZWEBN6Nk4STvDpfI7Gy8wKKuGVzJdMXEuWO6VkrnkIZ/giD?=
 =?us-ascii?Q?tD03X70Qe6kC4BlUq3vh06pLkf4E62hOt07XtZG+lOQyIQHNf9PHyqaDOGUZ?=
 =?us-ascii?Q?WwdUS5d+C0ghV0Tyizf2KH+suTZwtIRHtTWNtWCR3ruXz6bpyFAw/ZgZzYlc?=
 =?us-ascii?Q?hUB+TaqDZmNaH0zilBVbD7JovVE5aDRX9fyLBwimQNB80MwPEovl2lQK1j36?=
 =?us-ascii?Q?TbohTdxZzro83L27N6wTsOd+wlqHTlz+RubLA9NjvRBpJF/dEb4v4irFSzhw?=
 =?us-ascii?Q?dltRr4olVCWncUhO92Xzs40ZLeJQj5AbBy50lf03L1MIKq1d9bQVoWVk/2kL?=
 =?us-ascii?Q?mFmzM9IsZVyt06LwnNeUODoaFl0HPg0YQ0EabZeTG1ZefdXzxIgBOfaAAkAP?=
 =?us-ascii?Q?Tv8xpwbvMjT9RG4KnBMpESvayXRQufRvECDzPDrWeuMbRTQISuEvQlMUWXiE?=
 =?us-ascii?Q?HfWUc4ZKYEX3c2JsRvZl6A+W5Nqm1JL4lgwkjAnaUwovy59AP9yZYHUZKfB0?=
 =?us-ascii?Q?9OtX8Cz3gy8VEUcmP/5jx77v9tCB+opTJoQK8Ha2g5s+qpHvajIwgKHzgQwm?=
 =?us-ascii?Q?oNJlC6L78g1GoBMFhua1hZ4TH4gcgg5Dil4XbbMtyFxXIf2RPd0qNKkHy6tm?=
 =?us-ascii?Q?JUPd6yyCDm9gY0hxQ2RvSL1m+RIZwrQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e273c9-81d5-4ef6-648f-08de53373bea
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 06:36:22.6227 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: whE4bQXeUanHqgrGCdwQsEG0zoWrSlvdHGH2w8CGk9oe/sQ5GGWOY56+p9Ikxc/kK3y4ZwLo4ZDK9LzMRtO74LCmcHDcZzbaEN+3Ahe1g10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7199
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



> -----Original Message-----
> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Sent: 01 January 2026 03:05 AM
> To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [PATCH i-g-t 7/7] tests/intel/xe_exec_threads: Extend multi
> queue testing
>=20
> On Fri, Dec 19, 2025 at 05:31:54PM +0530, priyanka.dandamudi@intel.com
> wrote:
> >From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> >
> >Extend multi queue testing to different scenarios.
> >
> >Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>=20
> Same here. Remove.
>=20
> >Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> >---
> > tests/intel/xe_exec_threads.c | 163
> +++++++++++++++++++++++++++++++++-
> > 1 file changed, 160 insertions(+), 3 deletions(-)
> >
> >diff --git a/tests/intel/xe_exec_threads.c
> >b/tests/intel/xe_exec_threads.c index 4bf1cd1b1..0545c7ab6 100644
> >--- a/tests/intel/xe_exec_threads.c
> >+++ b/tests/intel/xe_exec_threads.c
> >@@ -312,9 +312,21 @@ test_compute_mode(int fd, uint32_t vm, uint64_t
> addr, uint64_t userptr,
> > 	igt_assert(exec_sync !=3D MAP_FAILED);
> > 	memset(exec_sync, 0, sync_size);
> >
> >-	for (i =3D 0; i < n_exec_queues; i++)
> >-		exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci, 0);
> >+	for (i =3D 0; i < n_exec_queues; i++) {
> >+		if (flags & MULTI_QUEUE) {
> >+			struct drm_xe_ext_set_property multi_queue =3D {
> >+				.base.next_extension =3D 0,
> >+				.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> >+				.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
> >+			};
> >+			uint64_t ext =3D to_user_pointer(&multi_queue);
> >
> >+			multi_queue.value =3D i ? exec_queues[0] :
> DRM_XE_MULTI_GROUP_CREATE;
> >+			exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci,
> ext);
> >+		} else {
> >+			exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci,
> 0);
> >+		}
> >+	}
> > 	pthread_barrier_wait(&barrier);
> >
> > 	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> >@@ -994,8 +1006,95 @@ static void *thread(void *data)
> >  *	balancer mixed fd userptr invalidate
> >  * @bal-mixed-fd-userptr-invalidate-race:
> >  *	balancer mixed fd userptr invalidate race
> >+ */
> >+/**
> >+ * SUBTEST: threads-%s
> >+ * Mega feature: MultiQ
> >+ * Sub-category: MultiQ tests
>=20
> Same comments as in patch#1 applies here also regarding SUBTEST name and
> MultiQ naming.
>=20
> >+ * Description: Run threads %arg[1] test with multi threads
> >+ * arg[1]:
> >+ * @multi-queue-basic:
> >+ *	multi-queue basic
> >+ * @multi-queue-userptr:
> >+ *	multi-queue userptr
> >+ * @multi-queue-rebind:
> >+ *	multi-queue rebind
> >+ * @multi-queue-userptr-rebind:
> >+ *	multi-queue userptr rebind
> >+ * @multi-queue-userptr-invalidate:
> >+ *	multi-queue userptr invalidate
> >+ * @multi-queue-userptr-invalidate-race:
> >+ *	multi-queue userptr invalidate race
> >  * @multi-queue-shared-vm-basic:
> >- *	multi-queue shared vm basic test
> >+ *	multi-queue shared vm basic
>=20
> Ah I see, the rest of tests are added in this patch.
> It is bit confusing though as compute mode variant support is added in th=
is
> patch along with other legacy mode test extensions.
>=20
> It is probably better to move the above changes in test_compute_mode also
> to previous patch with a compute mode test variant added? Or simply merge
> both patches together. It will also remove the above multi-queue-shared-v=
m-
> basic description change here which is unnecessary.
>=20
> Also, I don't see cm* test variants being added.
> Why not?
>=20
> Niranjana
Will merge 2 patches into one and add all cm variants in another patch.
>=20
> >+ * @multi-queue-shared-vm-userptr:
> >+ *	multi-queue shared vm userptr
> >+ * @multi-queue-shared-vm-rebind:
> >+ *	multi-queue shared vm rebind
> >+ * @multi-queue-shared-vm-userptr-rebind:
> >+ *	multi-queue shared vm userptr rebind
> >+ * @multi-queue-rebind-err:
> >+ *	multi-queue rebind err
> >+ * @multi-queue-userptr-rebind-err:
> >+ *	multi-queue userptr rebind err
> >+ * @multi-queue-shared-vm-userptr-invalidate:
> >+ *	multi-queue shared vm userptr invalidate
> >+ * @multi-queue-shared-vm-userptr-invalidate-race:
> >+ *	multi-queue shared vm userptr invalidate race
> >+ * @multi-queue-fd-basic:
> >+ *	multi-queue fd basic
> >+ * @multi-queue-fd-userptr:
> >+ *	multi-queue fd userptr
> >+ * @multi-queue-fd-rebind:
> >+ *	multi-queue fd rebind
> >+ * @multi-queue-fd-userptr-rebind:
> >+ *	multi-queue fd userptr rebind
> >+ * @multi-queue-fd-userptr-invalidate:
> >+ *	multi-queue fd userptr invalidate
> >+ * @multi-queue-fd-userptr-invalidate-race:
> >+ *	multi-queue fd userptr invalidate race
> >+ * @multi-queue-hang-basic:
> >+ *     multi-queue hang basic
> >+ * @multi-queue-hang-fd-userptr-invalidate-race:
> >+ *	multi-queue hang fd userptr invalidate race
> >+ * @multi-queue-cm-fd-userptr-invalidate-race:
> >+ *	multi-queue compute mode fd userptr invalidate race
> >+ * @multi-queue-mixed-basic:
> >+ *	multi-queue mixed basic
> >+ * @multi-queue-mixed-userptr:
> >+ *	multi-queue-mixed userptr
> >+ * @multi-queue-mixed-rebind:
> >+ *	multi-queue-mixed rebind
> >+ * @multi-queue-mixed-userptr-rebind:
> >+ *	multi-queue-mixed userptr rebind
> >+ * @multi-queue-mixed-userptr-invalidate:
> >+ *	multi-queue-mixed userptr invalidate
> >+ * @multi-queue-mixed-userptr-invalidate-race:
> >+ *	multi-queue-mixed userptr invalidate race
> >+ * @multi-queue-mixed-shared-vm-basic:
> >+ *	multi-queue mixed shared vm basic
> >+ * @multi-queue-mixed-shared-vm-userptr:
> >+ *	multi-queue-mixed shared vm userptr
> >+ * @multi-queue-mixed-shared-vm-rebind:
> >+ *	multi-queue-mixed shared vm rebind
> >+ * @multi-queue-mixed-shared-vm-userptr-rebind:
> >+ *	multi-queue-mixed shared vm userptr rebind
> >+ * @multi-queue-mixed-shared-vm-userptr-invalidate:
> >+ *	multi-queue-mixed shared vm userptr invalidate
> >+ * @multi-queue-mixed-shared-vm-userptr-invalidate-race:
> >+ *	multi-queue-mixed shared vm userptr invalidate race
> >+ * @multi-queue-mixed-fd-basic:
> >+ *	multi-queue mixed fd basic
> >+ * @multi-queue-mixed-fd-userptr:
> >+ *	multi-queue-mixed fd userptr
> >+ * @multi-queue-mixed-fd-rebind:
> >+ *	multi-queue-mixed fd rebind
> >+ * @multi-queue-mixed-fd-userptr-rebind:
> >+ *	multi-queue-mixed fd userptr rebind
> >+ * @multi-queue-mixed-fd-userptr-invalidate:
> >+ *	multi-queue-mixed fd userptr invalidate
> >+ * @multi-queue-mixed-fd-userptr-invalidate-race:
> >+ *	multi-queue-mixed fd userptr invalidate race
> >  */
> >
> > static void threads(int fd, int flags) @@ -1299,7 +1398,65 @@ int
> >igt_main()
> > 			FD | USERPTR | INVALIDATE },
> > 		{ "bal-mixed-fd-userptr-invalidate-race", BALANCER |
> > 			MIXED_MODE | FD | USERPTR | INVALIDATE | RACE
> },
> >+		{ "multi-queue-basic", MULTI_QUEUE | 0 },
> >+		{ "multi-queue-userptr", MULTI_QUEUE | USERPTR },
> >+		{ "multi-queue-rebind", MULTI_QUEUE | REBIND },
> >+		{ "multi-queue-userptr-rebind", MULTI_QUEUE | USERPTR |
> REBIND },
> >+		{ "multi-queue-userptr-invalidate", MULTI_QUEUE | USERPTR
> | INVALIDATE },
> >+		{ "multi-queue-userptr-invalidate-race", MULTI_QUEUE |
> USERPTR | INVALIDATE |
> >+			RACE },
> > 		{ "multi-queue-shared-vm-basic", MULTI_QUEUE |
> SHARED_VM },
> >+		{ "multi-queue-shared-vm-userptr", MULTI_QUEUE |
> SHARED_VM | USERPTR },
> >+		{ "multi-queue-shared-vm-rebind", MULTI_QUEUE |
> SHARED_VM | REBIND },
> >+		{ "multi-queue-shared-vm-userptr-rebind", MULTI_QUEUE |
> SHARED_VM | USERPTR |
> >+			REBIND },
> >+		{ "multi-queue-rebind-err", MULTI_QUEUE | REBIND |
> REBIND_ERROR },
> >+		{ "multi-queue-userptr-rebind-err", MULTI_QUEUE |
> USERPTR | REBIND |
> >+			REBIND_ERROR },
> >+		{ "multi-queue-shared-vm-userptr-invalidate", MULTI_QUEUE
> | SHARED_VM |
> >+			USERPTR | INVALIDATE },
> >+		{ "multi-queue-shared-vm-userptr-invalidate-race",
> MULTI_QUEUE | SHARED_VM |
> >+			USERPTR | INVALIDATE | RACE },
> >+		{ "multi-queue-fd-basic", MULTI_QUEUE | FD },
> >+		{ "multi-queue-fd-userptr", MULTI_QUEUE | FD | USERPTR },
> >+		{ "multi-queue-fd-rebind", MULTI_QUEUE | FD | REBIND },
> >+		{ "multi-queue-fd-userptr-rebind", MULTI_QUEUE | FD |
> USERPTR | REBIND },
> >+		{ "multi-queue-fd-userptr-invalidate", MULTI_QUEUE | FD |
> USERPTR |
> >+			INVALIDATE },
> >+		{ "multi-queue-fd-userptr-invalidate-race", MULTI_QUEUE |
> FD | USERPTR |
> >+			INVALIDATE | RACE },
> >+		{ "multi-queue-hang-basic", MULTI_QUEUE | HANG },
> >+		{ "multi-queue-hang-fd-userptr-invalidate-race",
> MULTI_QUEUE | HANG | FD | USERPTR |
> >+			INVALIDATE | RACE },
> >+		{ "multi-queue-cm-fd-userptr-invalidate-race", MULTI_QUEUE
> | COMPUTE_MODE | FD |
> >+			USERPTR | INVALIDATE | RACE },
> >+		{ "multi-queue-mixed-basic", MULTI_QUEUE | MIXED_MODE
> },
> >+		{ "multi-queue-mixed-userptr", MULTI_QUEUE |
> MIXED_MODE | USERPTR },
> >+		{ "multi-queue-mixed-rebind", MULTI_QUEUE |
> MIXED_MODE | REBIND },
> >+		{ "multi-queue-mixed-userptr-rebind", MULTI_QUEUE |
> MIXED_MODE | USERPTR | REBIND },
> >+		{ "multi-queue-mixed-userptr-invalidate", MULTI_QUEUE |
> MIXED_MODE | USERPTR |
> >+			INVALIDATE },
> >+		{ "multi-queue-mixed-userptr-invalidate-race",
> MULTI_QUEUE | MIXED_MODE | USERPTR |
> >+			INVALIDATE | RACE },
> >+		{ "multi-queue-mixed-shared-vm-basic", MULTI_QUEUE |
> MIXED_MODE | SHARED_VM },
> >+		{ "multi-queue-mixed-shared-vm-userptr", MULTI_QUEUE |
> MIXED_MODE | SHARED_VM |
> >+			USERPTR },
> >+		{ "multi-queue-mixed-shared-vm-rebind", MULTI_QUEUE |
> MIXED_MODE | SHARED_VM | REBIND },
> >+		{ "multi-queue-mixed-shared-vm-userptr-rebind",
> MULTI_QUEUE | MIXED_MODE | SHARED_VM |
> >+			USERPTR | REBIND },
> >+		{ "multi-queue-mixed-shared-vm-userptr-invalidate",
> MULTI_QUEUE | MIXED_MODE |
> >+			SHARED_VM | USERPTR | INVALIDATE },
> >+		{ "multi-queue-mixed-shared-vm-userptr-invalidate-race",
> MULTI_QUEUE | MIXED_MODE |
> >+			SHARED_VM | USERPTR | INVALIDATE | RACE },
> >+		{ "multi-queue-mixed-fd-basic", MULTI_QUEUE |
> MIXED_MODE | FD },
> >+		{ "multi-queue-mixed-fd-userptr", MULTI_QUEUE |
> MIXED_MODE | FD | USERPTR },
> >+		{ "multi-queue-mixed-fd-rebind", MULTI_QUEUE |
> MIXED_MODE | FD | REBIND },
> >+		{ "multi-queue-mixed-fd-userptr-rebind", MULTI_QUEUE |
> MIXED_MODE | FD | USERPTR |
> >+			REBIND },
> >+		{ "multi-queue-mixed-fd-userptr-invalidate", MULTI_QUEUE |
> MIXED_MODE | FD |
> >+			USERPTR | INVALIDATE },
> >+		{ "multi-queue-mixed-fd-userptr-invalidate-race",
> MULTI_QUEUE | MIXED_MODE | FD |
> >+			USERPTR | INVALIDATE | RACE },
> > 		{ NULL },
> > 	};
> > 	int fd;
> >--
> >2.43.0
> >
