Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D74AEF4ED4
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 12:15:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD3710E1DB;
	Mon,  6 Apr 2026 12:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MGW35znU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4C810E1B1
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 12:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775477732; x=1807013732;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/+lq3uZVuFcWk5smul4PdF9PHmvH0p+XWXbde3N+DVM=;
 b=MGW35znU5UydlOGn/KaKJ/cfsZHuoB+rd5KNyVm6DmYaAp20n8naIPwF
 e6ab3QWpFRwVA2WFcKfa8YgVIPqc/4fJuC6LYwHskXVYtisnW8oUkYmTa
 02VKuomRnTt/Ikk7K0bzdNHu6dNBbwhynf04MFkZmv8KD0vCaiUIde95i
 /XI7whVkPp7bZKoYHeYeElnkgUKNz6RARg3xf8Ua1WJ2j3JBeDWHi2Z8b
 B2+xuay6C+MHRCGY6L2H6GCUwJIhvx9oSD5fyOYjNZWPAMMWiSHiWvBHJ
 rzT7n3I89eRGmCcG7tDr78e+r615PbXsYL1xGHS3mwEazwlwesGLYvyBH w==;
X-CSE-ConnectionGUID: I9Abk4M5QtCSnz/Ka+Azrw==
X-CSE-MsgGUID: nZ6vkLJVQeefaE/f0KBO3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="76306319"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="76306319"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 05:15:31 -0700
X-CSE-ConnectionGUID: QlN/H8JgREeHuGwrAOCHzg==
X-CSE-MsgGUID: 6ryJ22ZoRNOWpUbkGyiCeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="258313409"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 05:15:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 05:15:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 05:15:30 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 05:15:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZTan0Yt2INrio43psFplArbWEC6NEE2mPye5bSTRY+SomcuFzG0yY/FUrPdJWuVWSn0RPhZIO/g1Gs/o4aB27MhMhFe7C+9FQOgUwJL0X2SmR7Qrd1VNpXtGfxueYGVAUZU/QfwCLG3jf75NKK2IuZNDUBc4SVL9pIdy7sPM5VDQaTHjbdol611uTl6pgqCnCr7Xn91sOSDmkLNiigqJvUKlEQswGjkfpnWpp7Wiy7F6brhOLm7MKXuDYZOjHiTXIU+NdOpA1o8P1tZg7m8FZ2hX5ZDjQNBiC8TDS8FVxf7aArrOmxJOSZfTA3puBZjb5zh60NYEiTvDOQEC3GHuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1OviYAxeFT8xlG/J0JataGah9kFpj9KohU5WrDxEuoo=;
 b=Ia+NpchuSkr9domWRPL94THPBJV0iwGoeJ87BWFA/s2eLioB8nvy6SVjUkSh3rKD3AdXhWW6BKszpkp9RWR2llLTZ0B1MzTMnp9KcqVD0p97Ifbec2iHz2TLLOAehbkTBK+ESKdGjbtpUYN1S3s5OqYz8L3tcJ7kbLu8HHn0x4fMRgEVoSzcS38yh1GojG6ZQ4NBqYlmSrvs0ycn0SOxVPauJb6UFbZ7GKnJvBXTpaNSfqtmtVmZj/8jZscNMloh9ByfSonXgKugPeEEhazuzNEJj+gBIw/atFXPI4jDIPU/Lm2p87doSIeCIpH7+KA+CTOkuYcgVdsXGicT1+H2Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5564.namprd11.prod.outlook.com (2603:10b6:610:d7::18)
 by LV3PR11MB8742.namprd11.prod.outlook.com (2603:10b6:408:212::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Mon, 6 Apr
 2026 12:15:27 +0000
Received: from CH0PR11MB5564.namprd11.prod.outlook.com
 ([fe80::bdb2:f221:b705:aaeb]) by CH0PR11MB5564.namprd11.prod.outlook.com
 ([fe80::bdb2:f221:b705:aaeb%2]) with mapi id 15.20.9769.018; Mon, 6 Apr 2026
 12:15:27 +0000
From: "Girotra, Himanshu" <himanshu.girotra@intel.com>
To: "Girotra, Himanshu" <himanshu.girotra@intel.com>, "Gandi, Ramadevi"
 <ramadevi.gandi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel: Adjust test documentation
Thread-Topic: [PATCH i-g-t] tests/intel: Adjust test documentation
Thread-Index: AQHcxb5ni76ymB+xe0SbKKuUvcESJLXR8n8w
Date: Mon, 6 Apr 2026 12:15:27 +0000
Message-ID: <CH0PR11MB5564F3A5F8927BA2B13DD521985DA@CH0PR11MB5564.namprd11.prod.outlook.com>
References: <20260406121018.19963-1-himanshu.girotra@intel.com>
In-Reply-To: <20260406121018.19963-1-himanshu.girotra@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5564:EE_|LV3PR11MB8742:EE_
x-ms-office365-filtering-correlation-id: aa6bb9c4-ae81-4e51-31f3-08de93d63052
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: BsRkyz+0rTOOkupSJ1sDekXmD6Sv+5tibn8/IScCH8U07FNt7uhvdMF6JLntdf7k5K0TzI7jAeF+YWidBOXI0DgusLevkj7UgZ6+6+HA0GNB6Nl8a/kitXg1mEjNZhAWTwCEliEez7SG9UG/Ib3KWQEM3eQLFmO25Yus0g303ZlLK8sbFaE82yq1kBOpqzqxYXErgYmPfbedXLgdfDg2IpZZH9hArNyGce6TkT3Xp0BBsdXqkCnKm9v234R7kP6iIk58nJIX1oeHJFivfNpFfUwP4unhSQqdxhnLLZyCXPq2Z74Qg4v5r4Zz+6geSTkUkBwGUMFNOymQCK6dEq6S1b0rvfJT3F3NwLBTdHsICzFrZiDb5t+AuwV6GU6hrnEA/dYt6VmPKxEBhZ/U8ZSEIImTk7O+XvfpoGL/8lsOrx4yeucRkOjHezRg8mxxJW5O/V1UHEf6ljWVGjyb99wJMswlmx0725p2KvqgGGMOcNQiej+UvyTi1nOHYTnVZmms6epbHc+2UcJoJ2WCP84xYJ+p6/iWQHoODgXHYavgk/Mae4KzA/1QBfie0IDkdFcr1XWILNLpZTjFs1VEEIoMfUtm+B0iVZx6YxOBQxU51cklgI/bgQ/x6Bk24RIKm84DazU0Bf3fU/vyzF3ES7ww4ZVKLUWWt17SbJAQuh60NInjlERCApjwW4HE4wmD/x5EV8p6JOEmjBXC1yiVCQtmBbR8qFi6HvQCqk+ece0+wqxEpkYM2Dj4LsmXo0Q6BzlUtGMkV1CXPG9/Fsi2XZaFFd/+lXiqHqIb2byMoZzvNoc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5564.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(38070700021)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8+zlJ4XxAKD0A0YnRvQQYTUV9xXR+/0LPfZF4T2v0hEAKvZzA2epz2AB86g7?=
 =?us-ascii?Q?ErBXUsCWvUrp8Wr3PnjfQyUosQoXfTKFhdsrEAMEeRwFx+Sb33+NSevjWaVM?=
 =?us-ascii?Q?SyAbGcNgIJt70rcr2vCPl+XdGtbc6yU0Zf4Ndqto8miE+YNikS0vk456+3LY?=
 =?us-ascii?Q?9GVy3BQFILllqGyQrgbub80ovncrHFV7zShY7DFacywmbKKCyoYiCt8LP1y3?=
 =?us-ascii?Q?bmyXLOupomTK203ERiKaqzoG/siGsCUhdslHUc+oH+4BsSGlrkkOcdjYNfQZ?=
 =?us-ascii?Q?8E81xvQO6hNtVcBu5SB1meB3bASUyQpSL6wEfuDjErmuP0q7eXz7/T2vaZ9d?=
 =?us-ascii?Q?0mkL19nYQPrWbtBEn8KGp9S6aA/GdzB8UNB1labKUCOQAafLbX+dT8n9cEMq?=
 =?us-ascii?Q?pMsmjIZnh9WxbryqY9aBcJLN6/bWFKl2pxsrZqrEB7d2zpEi7depr3RUSVXI?=
 =?us-ascii?Q?nsXTISKy9Al9c9If0zZJVOHrZQOBjD5EYwpQx9OIE4l9zdrWCUpW2/HM0wT0?=
 =?us-ascii?Q?9I2MLjT85ohT6xOiGl6MMXjqfreF2yQpbtTAGgD5GU4G+urLir41LfC2wN7Q?=
 =?us-ascii?Q?RJYl+lHOrVnG4KILzaIXK41ClmA6fsCp9w4oZS0VosHPEcF/mb0R6XHzSFdY?=
 =?us-ascii?Q?rykrX1csg+OtXvu3rZOTE0BY6GgtvqZ2W9iYnAUf96At+9yBZMyORJZ5I5tU?=
 =?us-ascii?Q?4XAaTKMgL0xKbDRPsRf1XsdRTprh+faqpn87Rs9AuVeaDjK0snZnd+/mwVm3?=
 =?us-ascii?Q?zXfy4tDyjM6ArweUDNG/TkSgewJYXvsDzMUWnYfoQn1hlf3bDkdtWuDK74ZW?=
 =?us-ascii?Q?nhwliIbeJ05p+F//G4cgKyrmf1W8DIG1RPsPJzR+0J/rBWvtLCE4X+qDdUU5?=
 =?us-ascii?Q?/61qc22UKafhFewZJkz/y+4NpB+HnuEkQqw4EpIgiQQsAhKEpRmoPkUuuHKB?=
 =?us-ascii?Q?+fGc+R/VgFzYLkh3K6Ij5ermK/JXEPJfoO4EqtUsAvXpx7ylAWP5Zq1aIp0t?=
 =?us-ascii?Q?HiZPoSq2wWSBUpXragjQx3oEtKTc5W67+/73fanktbgTBPTu94LPOCWbEM7C?=
 =?us-ascii?Q?fcWgguYeAlJgBZTwR1sJ1M8IvuKPLRrV3KDYXlCN6KOdaAQjb/jaOCwb79Bt?=
 =?us-ascii?Q?ScnVnFXbYD/d+E05ogv9BJV+z5f2TIOOvoitPBALxaK0ydmKaNOaLSAJtZ/p?=
 =?us-ascii?Q?ev65Lw4E7iW27sOXN6ynYBS2U7g3wCNmwvn6i1JbUtXW9NZ1x319m22tptzs?=
 =?us-ascii?Q?iubNJ7HPlU+m30uW0cnTYXo1ozo3Dxv+30W3g7xZPbxDuaqGyqetgSPCjAVL?=
 =?us-ascii?Q?n3KNxQb2vf9nrBFuHBftf7dfja86ye+uTFDvXxfC3DA+KFTwdSzg8kK4H2NP?=
 =?us-ascii?Q?DSKzH+d2IyF8oJKle51Nzs2q6cNYb1uSMpUXAmyGPE8wYNuy7HpDgPYaeacc?=
 =?us-ascii?Q?AyEIfTLzkd95i3KI2FG/tMQJzJmIaQ5DO7rYUFVOfmvMQhkuCVq7HMXlHU8O?=
 =?us-ascii?Q?g3RWE0lS52lDS/XXqeJxzS5vqlLYqWF6yuNvXlYO6iCrnmtJi0kwvRn/eJ4Z?=
 =?us-ascii?Q?DupQi+oBn/3qg9aC9jkg0jkuA/xajRaxjrB7pydihN8GSardy8JBjPbnPl0h?=
 =?us-ascii?Q?9usMg85NPIMSAdLH8zyXzvYeQ243tCRCBx2i5Pd+SOO/kJZ3uVJ3WNDyFK47?=
 =?us-ascii?Q?ye9GFkUbtr82bKj2TnAcBYc7KVAQnPD0LdHixCDCIEEtcJGfam8NbcumVSXp?=
 =?us-ascii?Q?RrS/7gHNXUuT/RMYjes8EDEv+wWWsSRoo26SZQAQNme4LeUh1b578LNDaA3I?=
x-ms-exchange-antispam-messagedata-1: kYG9UUc7+VNrLQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QOcgARBacHK1TP/ztwPw8yGQ7u1gyNgtO4n7RDO0wlFL/ZKQPh/aZLsEJRKnYGaJATSNPUfzEAiIm1Vu8Emu6ws3W+EiVnxw5Mtq40mNIHYi0+RzzR7EO6ShBYp5k1faZIJIfd4dHSwLu1/QfCEaMAKT8VZCWcORGf4xe4jY4CGr1VRrqGR3ddWT9MlhpOZY5Q9qA9mDD0nTFqHMAbNhWQrzt4qZ1rOGp/CbvEp74cTrJsXsdIix0wCv86NQJ+O37aGufnh3iUD8kahukjuTvWypAWIY8SyMstbTUBZWp5ShXPnej8zmMl1Q76bVz+64aW19YuXPKE3vFMkoSo9tSA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa6bb9c4-ae81-4e51-31f3-08de93d63052
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2026 12:15:27.5732 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ciOlYVM+uqCZMpJeNEgAffB+3n5ak0fuPX5X9d1uAKBdiLRsk+jBxrk/vy2wGZq3jxfUDgXwttmwoV27Q6HaqQBXh6sYwi45ZaOvrYwaXc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8742
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

Please ignore this a newer series will be send

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> himanshu.girotra@intel.com
> Sent: 06 April 2026 17:40
> To: Gandi, Ramadevi <ramadevi.gandi@intel.com>; igt-
> dev@lists.freedesktop.org
> Subject: [PATCH i-g-t] tests/intel: Adjust test documentation
>=20
> From: Himanshu Girotra <himanshu.girotra@intel.com>
>=20
> Fix multiple-parent warnings in test list generation by correcting Catego=
ry and
> Mega feature metadata fields across test files
>=20
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>  tests/intel/xe_multigpu_svm.c             | 2 +-
>  tests/intel/xe_sysfs_preempt_timeout.c    | 2 +-
>  tests/intel/xe_sysfs_timeslice_duration.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/intel/xe_multigpu_svm.c b/tests/intel/xe_multigpu_svm.=
c
> index 2ae0b950f..e04e9692e 100644
> --- a/tests/intel/xe_multigpu_svm.c
> +++ b/tests/intel/xe_multigpu_svm.c
> @@ -27,7 +27,7 @@
>   * Description: Validate multi-GPU Shared Virtual Memory (SVM) features,
>   *		including cross-GPU access, atomic operations, coherency
>   *
> - * Category: Multi-GPU
> + * Category: Core
>   * Mega feature: MultiGPU
>   * Sub-category: SVM, memory management, performance
>   * Functionality: Multi-GPU SVM, migration, coherency, atomic ops diff -=
-git
> a/tests/intel/xe_sysfs_preempt_timeout.c
> b/tests/intel/xe_sysfs_preempt_timeout.c
> index 725707bf6..9ddedf98f 100644
> --- a/tests/intel/xe_sysfs_preempt_timeout.c
> +++ b/tests/intel/xe_sysfs_preempt_timeout.c
> @@ -6,7 +6,7 @@
>  /**
>   * TEST: sysfs preempt timeout
>   * Category: Core
> - * Mega feature: SysMan
> + * Mega feature: General Core features
>   * Sub-category: SysMan tests
>   * Functionality: sysfs preempt timeout
>   * Feature: SMI, context
> diff --git a/tests/intel/xe_sysfs_timeslice_duration.c
> b/tests/intel/xe_sysfs_timeslice_duration.c
> index 93b97f805..6aad2902b 100644
> --- a/tests/intel/xe_sysfs_timeslice_duration.c
> +++ b/tests/intel/xe_sysfs_timeslice_duration.c
> @@ -9,7 +9,7 @@
>  /**
>   * TEST: sysfs timeslice duration
>   * Category: Core
> - * Mega feature: SysMan
> + * Mega feature: General Core features
>   * Sub-category: SysMan tests
>   * Functionality: sysfs timslice duration
>   * Feature: SMI, context
> --
> 2.50.1

