Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C5AC3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 13:07:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DEC10E8CC;
	Thu, 27 Mar 2025 13:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oJ+ppEot";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3217810E8CC
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 13:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743080843; x=1774616843;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wdMvcVLYPCKAheV68gGRTuID0YCgtR+2aDoe6tpPoiU=;
 b=oJ+ppEotiJKVpcMwVzk6pJgK5TVlaECiN/03pm9qOOcteMzJrTDfFV0/
 PyrITJXGyJidtvGr9QxGtotUPOZFdW28faZ8YjD+RixJSCQULoPZ7X8Z1
 rjJt6Y+kqXNV+P7+6D1Lylf2JAhONWcYWM9ntLNYT1lFRNmzTbKbr40AQ
 VHBqLKskdwxWk99fFRxAro34gIgmC4q8+3qVONHNw9TUl2W22O3KsuQEJ
 NkmpHTlRVpJuNUXPF5CxfV9kw2tIRgAtnD0hiCe3+Y8gPBilo12a04C2a
 1q97D4g+qHHSuJXKn7Opd86ltNXNuNCbzwVJ7ILUE/NhwQEVqBK3fSmOK g==;
X-CSE-ConnectionGUID: KoOXHhlJTd259OJMe7lL0w==
X-CSE-MsgGUID: OMgdOL2SQ7im0YqqoBezvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55067391"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="55067391"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 06:07:23 -0700
X-CSE-ConnectionGUID: BqLvoWArRwuRoYzlfdAm+g==
X-CSE-MsgGUID: G9MV1fLzRZyFVGnC9epOPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="125583169"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 06:07:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Mar 2025 06:07:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 06:07:22 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 06:07:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bUBVtChYJ+awX8M1RmuaZO+05Tw1CCx0giThuN0X0rB//sLI6UGj3dfzaM3SL1bFju3kXqvvOvZA33tpZ2FxvCK1NFBS1G3fK0FQj12us72IBfNwBJWkirEtBRZH7069Q+zApdd+OkTGdlS6eUEsJ/XFDKpkI629ozD0ShfLlbYmd3D9AvInvyQlqnqt4YgI94W+Z9QDA9H8uSlVIKrhjn09I0ZgdUjWIPAeXXGrePWCAIBhPGm19x9oRbqK4s2IP0zuVq8v7Imo1hpdNwWryf+Hcv12YvafibIBKjn9KqJZPmR1KaiSAeT5ouC/Wo7MYzmKk+7ppTra7tRrDY5WdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kMRfDhMdJsGZdo5xqMkaPu4D7wZl0EakPX8PA8jcNM=;
 b=SFeZwoTLVxF0jVMey01rzxqc1bo1nu4gImquaEMLpDdyrdks7HVIWVQ1M1Q7FoGOWypm9mMV6wC876L0IxvbHTCA5pFrLCWSvsTe3pGH+5RttoB7B1ZJuvkkPd1mGaLZR28D1kD84rjOBQdgC/GuOB5Y7Btfwem2yzcyEIxYbchLyOkQYSqKhhs+3a+VgqxMKCId9TjduHWBB8RgBqQcBfll6fP3kQcXUL+beFridtY4WQAEDb+28wQLkjEhJKYvrYzPrAHmbkfvG6eOEJa7LW7uNw+5qy65+gJUIXJQDQr++of3A/aAoNI17M38nbkoqvULhFwa5HTS1e4MTqi0cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6696.namprd11.prod.outlook.com (2603:10b6:a03:44f::18)
 by MN2PR11MB4680.namprd11.prod.outlook.com (2603:10b6:208:26d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 13:06:38 +0000
Received: from SJ0PR11MB6696.namprd11.prod.outlook.com
 ([fe80::c25a:5de1:4bf0:4d8d]) by SJ0PR11MB6696.namprd11.prod.outlook.com
 ([fe80::c25a:5de1:4bf0:4d8d%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 13:06:38 +0000
From: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Laguna, Lukasz"
 <lukasz.laguna@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH v2 i-g-t] tests/intel-ci/xe-sriov-vm.blocklist.txt:
 Blocklist for SR-IOV VM runs
Thread-Topic: [PATCH v2 i-g-t] tests/intel-ci/xe-sriov-vm.blocklist.txt:
 Blocklist for SR-IOV VM runs
Thread-Index: AQHbnkyEb4TiykKaT0+wXOQD+200L7OG9AnQ
Date: Thu, 27 Mar 2025 13:06:38 +0000
Message-ID: <SJ0PR11MB6696B13A2468531D1F9F691EACA12@SJ0PR11MB6696.namprd11.prod.outlook.com>
References: <20250326124203.222643-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250326124203.222643-1-marcin.bernatowicz@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6696:EE_|MN2PR11MB4680:EE_
x-ms-office365-filtering-correlation-id: d3239767-fd6b-4fe9-3b87-08dd6d3035ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?T1uCdkSE8NDYvth1wXi9eQj0NAzQUEGsOv4JWhmoS2zpk/bdEx8z+Zt4P4wF?=
 =?us-ascii?Q?23fuRe9mRdAjwQ83VtjlByJhVhDVnLFCaprX4qo61h5DB4YuIrB8GT2FvEbP?=
 =?us-ascii?Q?7tpTlcg2HhUaBBEQ+1RM2M/0P29ZVKIwN6UVxHioRb9gXlQr9/Wr+R41Y10X?=
 =?us-ascii?Q?ZJU1SUo0BiGJUA48s0xxGQZoZHZ0HpWZn6mTrgdwRD866tCxKi9MkPqiyzly?=
 =?us-ascii?Q?KZ6X58/EM0aq2TIojeLitYbqTRxXIiMSzSWfdZQ6Fzj5+zeLMKmaaooc7PPd?=
 =?us-ascii?Q?t37LBVNuKIXr+caXhGaiQwh2yzga4NOcwwHWMp2FiJguvjn2rKQ+S3i8lNky?=
 =?us-ascii?Q?r2jCSK1SRcnYRTRoN76VefjsuwcHUowl9DL+fJ6V53jxzBEPrk6CjStWJ5ds?=
 =?us-ascii?Q?Lbpa/qA7CrrQOg8z00Dh0bHXQI2vLcyn9lqc9sZabnib2/MB7mAPgdOMUHnk?=
 =?us-ascii?Q?5LFTwHVYcxEcXA5+WxYlR25k84resQ8+M89dzD0zsVO9Wzn2x6OabnfN/P5r?=
 =?us-ascii?Q?iFhU2fMznEekWCxh5TYHNB/q1FOmgjp5dz1Q36Mdai5PgZEgYmAyUA+Z9HMC?=
 =?us-ascii?Q?HOoI4lsA2y0VheiRGskAbmiocZUg7etIwD2/7bmgq/4LD1u6VP4G6Ezht45E?=
 =?us-ascii?Q?0BmiC22NQTJM1Elm0voQye6SyaGyCqHFLHN2UYpsyGAx1Mnn/tiL54NSLuX3?=
 =?us-ascii?Q?ymyO4Bn+7jgINwjQ5XbFVtVG6hgxvZpw8ZRnZzp9C6tq/Z3kDQR4VZ5apGw9?=
 =?us-ascii?Q?0kaMsz7Kdq9CqtbpB2XzZH+oFz1/2LhayczWugYTp7T0LI5tmCOR1z+rIIsD?=
 =?us-ascii?Q?w1xXtSpwT7Zg39lMWhdx82IiyozXtPRelu1iGmJoOWuxY3WbzK6QKSFOdegN?=
 =?us-ascii?Q?miv4NfR4ak/F+TcLYDHGCSTPVTGfIMcwrczCLdfhwPn4W0VZi5yZ2LYo9YUR?=
 =?us-ascii?Q?j6PrtK0NH/xCx9MZnXyDdFlkAB5gibDaKc6akAyoWZEuQupMVN3WOvsDhAdc?=
 =?us-ascii?Q?VcDM3MOcEV0EGMD1be1sCpRcmoOIWf5sLSZcYGynm4xFzNRFq2U8kUl/+kdR?=
 =?us-ascii?Q?lWdnE3JGDQ90ILaHwq6SFnczH9+BJemJ6v/3E4Zd4Mx8XBWIAvubfQWipsX5?=
 =?us-ascii?Q?lmL1JCB3dMLV1KUAbDMwYvI7neQsz7hecp3ivcHk0hHYtWxe2jAz+fGD0keV?=
 =?us-ascii?Q?cebwavCOKak+m4Fd3NWEk8ZqNDZEmC4U1S09FGjjIvS7zrmulBlb8uvWXQc7?=
 =?us-ascii?Q?ID8bG60PWsyQj/HW8QEdctgfQX0gOrnx6AZ1PfwQKsNevKZg5FsZyRk7CvCV?=
 =?us-ascii?Q?I70R0Yzn0ggfi4LYyx+cIl65vf4LOeNSwg/WJFrHWo/tSeSmtmxYGiHq14px?=
 =?us-ascii?Q?yy9CobCC8ByMl6wTI7Fr8kw4Yccw2QSdzs6umzt+t3xQkK7vahFHSfk+3E/k?=
 =?us-ascii?Q?GWJ62r5AeUib6JxtvcHdXILqi4IRtxx0?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6696.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Mtd0EDn5iKQWCZ5uWvh0eJIPDMy+WKPoK722D6XwVo6c1XGmSsY5YCFwu9eH?=
 =?us-ascii?Q?ZePcaThnSPs81StCEfGhZNydPiBc+cnaL6qm9PUgNnS9IMRZuFfQmGFMCxPo?=
 =?us-ascii?Q?92eDzRDYtIDidhk1h4H/MU+3r/KCSZXWmZxpNGJXUal6tYKwvC4LJ48Nx2wi?=
 =?us-ascii?Q?Tmsgd4U8lnZ5iKcJB0IgAPd04pnqGpqLuY1KbAiS7ALwETmXUixVl0ShOnfi?=
 =?us-ascii?Q?TvH5uIIryT0j8wU7ZnvcAAdXjyIb7BxUxl8ql8D2Bg/8YRILoguSkxmDC0MX?=
 =?us-ascii?Q?56eYjxEI6RZbSJqJHkNWdkEJUpLwP3eSwA6cuqAl9XnOHJDz9NLAiyLAVrBi?=
 =?us-ascii?Q?r253gMwArFG1evLd+uCHZyg73AS/h/y82KC3lUl2PlavmvPo92F4VBaloBn/?=
 =?us-ascii?Q?4unrsuQ5tH8cXgk7vKFW3UjbYN+TYmfk7KbY1Tr/QW3v8cEvV045axVz9iiK?=
 =?us-ascii?Q?6NO0vGnxJuRWWbQqv4yYDhcdVn3nHc//rzLPhrZctTn0tNBd9rlJpmkFfjUk?=
 =?us-ascii?Q?PRSO14xFRQV/bQvj1qDPgjQPTMtS3ggDrFbw6FuSl64d/bgWMtDzoOORlEHa?=
 =?us-ascii?Q?hX5kfft/Fq9cWDlln7MHDQM4ZIYyKIFDQhrhcNj76hnn06+KEGBqBfwoKTcd?=
 =?us-ascii?Q?LzE0AEy/tH6hA5Vwr2AvKoMsbnrwjk0+yZj+2IimgGlHPFEgtBk5739pgLGI?=
 =?us-ascii?Q?Y8oom1iXCiRgo59XNAtjpO0unk0cckXMMCwqDOYNMGJbRqZdQiDJ/sLyqexf?=
 =?us-ascii?Q?iyJ7iWY5DAU6WMrNvgbJFbTVsVZ9RJhu2Zz8tAoaLJOaMLHOvr+Ob7F68DuW?=
 =?us-ascii?Q?dqKDcKmWEx6P85aHMZaES9OW8ZbDAqHP4lYr21xlJthkAYk3309IVxXm9ClJ?=
 =?us-ascii?Q?uoz2bXxpwZbMPsqNJRqDY07bSGbYGDnJ0BOqzptaZMmhjNZDkaj0o6ZoSiYw?=
 =?us-ascii?Q?PFLNs0lrcFctOTIwMwV6tPeuO0cKCl+knY63DWLiwzb68qm7cyYY9x2ncJCp?=
 =?us-ascii?Q?CIeYbeTiJM9s6LakNYo/f/Ve39YLWe5Xbhs9+yvcfAG2/hTax8muThWWKyta?=
 =?us-ascii?Q?evZSAjcY7aQlkpSZm/9jfSl2L5WOVFiq1kZF8sIfhFj5V2iubaayZdjZsEJH?=
 =?us-ascii?Q?MObx1kE/xDv4Y4bTG9y15vilex7sKNgyH/MN2ppSzDIHub8vB2c3GHRp8CB5?=
 =?us-ascii?Q?sSovfIQu2m4qRQ1IpmGftPuCfbTmx/LBMCKVJyrADBt0RkH+RL2dw7NFgBwy?=
 =?us-ascii?Q?yIQCxGR+IrinaegL0F5aKN1HCbipqOH+txO4YvUqE5UZJzCGQDrRcoXBjDJ7?=
 =?us-ascii?Q?dSx+dx8YGxNaNcLZWKnEuvPE07E10KhyQPpfmIzpPDqHAVJWqASMgHMP4aR1?=
 =?us-ascii?Q?XSclsqFFlo8erutr6SL7oZeSsEkw8ZUbA7cLu25D3EMAT1nQvLYTXiLQCbr4?=
 =?us-ascii?Q?irEByZl+8b3gsUQ1W2+TngyNtximXKUdKwyZNIDhoP4vU4smhW/WVU9l76fu?=
 =?us-ascii?Q?eYogZYiZjxhTyLxKcgUmffI61O8D5zCUx3N7XjJuw9ne+oO6r4KMCXTr1x1y?=
 =?us-ascii?Q?OW5hVdJeEtEQeq8oYDmZdy+Ly5EX6XFxTBVWI36Z?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6696.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3239767-fd6b-4fe9-3b87-08dd6d3035ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 13:06:38.2622 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IIBL2P1IzEVzkKKcxrsDI9wKk8FghQRlGK5q1UgqBJtbr9kushPzxT8IkGEci45lfipI4+g1pg53FyMzfvNTF88BgFqkrAFgdYeuPa+LeRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4680
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

LGTM,
Reviewed-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>

-----Original Message-----
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>=20
Sent: Wednesday, March 26, 2025 1:42 PM
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>; Adam Miszczak =
<adam.miszczak@linux.intel.com>; Kolakowski, Jakub1 <jakub1.kolakowski@inte=
l.com>; Kamil Konieczny <kamil.konieczny@linux.intel.com>; Laguna, Lukasz <=
lukasz.laguna@intel.com>; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; K=
 V P, Satyanarayana <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v2 i-g-t] tests/intel-ci/xe-sriov-vm.blocklist.txt: Blockli=
st for SR-IOV VM runs

This file contains tests that are not applicable for QEMU Virtual Machine
(VM) runs. It extends xe.blocklist.txt and should be kept as minimal as pos=
sible.

v2: Added igt@xe_css@suspend-resume.
    Removed inaccessible reference. (Lukasz)

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel-ci/xe-sriov-vm.blocklist.txt | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 tests/intel-ci/xe-sriov-vm.blocklist.txt

diff --git a/tests/intel-ci/xe-sriov-vm.blocklist.txt b/tests/intel-ci/xe-s=
riov-vm.blocklist.txt
new file mode 100644
index 000000000..06ed60b52
--- /dev/null
+++ b/tests/intel-ci/xe-sriov-vm.blocklist.txt
@@ -0,0 +1,8 @@
+##################################################################
+# Block list for VM runs
+##################################################################
+#
+# rtcwake does not wake the VM from s2idle #
+igt@xe_pm@s2idle.*
+igt@xe_ccs@suspend-resume
--
2.31.1

