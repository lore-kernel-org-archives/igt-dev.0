Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C473CCAC587
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 07:07:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6951A10E2FF;
	Thu, 11 Sep 2025 07:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aLseLLRb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4899B10E2FF
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Sep 2025 07:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757574426; x=1789110426;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=sjc7GMAxqSf0cXufzHjFKPiSp4vycIZKdkeMQa+VPAQ=;
 b=aLseLLRbMJII65QFZDiPf7oUx0T4mk5oG0gfdn8wRtCeLmHPKs8PQ5N2
 nAiPAaNG9hRMel57uPwXg20HyRMHJfrdxjI5zl8aQIVgZNNdqTOsbyvBC
 O1ztIyRWD9OhnjH657McRfuR0e+fH74EevNvGZShie7CcJJhHgSu+Jr1p
 xPNg8Hrl1AAx1Wz5JXr46YGKuh0KoA9pib+SDeJQlQaXbW7WNi2JPt3Ar
 Ehlk+wS7DfHt+moF8UvQ3EC+11fa6oW1vJz/bguqC5dMB4pmUrv3Cx42H
 D/Z2cdOVCqiqtMVvfyt3EUnNdj98zzujDALzHoCpT6sfEuDP4lixqw2eA A==;
X-CSE-ConnectionGUID: +8Sdgv1+Te2Gs8dNXTj75g==
X-CSE-MsgGUID: WjyERA7tR4WGf4e23bp4Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="77506941"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="77506941"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 00:07:05 -0700
X-CSE-ConnectionGUID: aKh61R6oTb6sZDh0k4H/2w==
X-CSE-MsgGUID: 4phfx/DoSAm08xvbikrqng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="173188295"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 00:07:03 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 00:07:02 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 00:07:02 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.87)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 00:07:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CyoNYRkxj5L8Yx4l07dSuTGtz8c9qBZVtvs1XeFOM1l/oOppbzw30X19nEi8dL7/MLqB/w4dSDW8jw2vNr7CE/RG5+iUeL5/g625uk44SiSb7vlLKUNIg74VVDr5H23vpW3/jHVvz4GqJzc+rmg8FZ5xq3VmCOJdeNJMJRdmDh+Ekbxt4KFkriG8sqjisn+/F90cPrub02GEHB94rdnfa9ZjPLM5inGyQKrE4WxeJfURHbNeD3iX1dHbG4Y6bx97uU10mJ9l3hChOfMOMy3crrPD0+NPZqww8zcoYzMJwb3z6xDNs4Pvc8yinPblZqOrlJEUnp5FhuB3nnrXx0a+fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frG/HmcSFk95djYQzf87Cz0bamR8Y/+fFwkrAR4YiLw=;
 b=eWRxjIkndF2ERnnQQ3w+hkbEfBJhJnCy1Mt8gM4IUYH8T8ASSC+eanUlYuf4K8vSfbY2/Ym0b60H5dhFlu/FSBvru/fBeT62B5lurpu4ttnJlaZbfTkvptOhhby9pyJaURWhCDkS6pcmyeEvJOErRtgubQ//FJYC7Vp/KvtFBji8A+xNwi+EDKVVwSqtEgKcu2VI+y1pwiOocUlW08RsOGO5Q//ECdlZ5RAUhnlllyUU2VtaUfKY4gWCSGKL1ne+iQXZNbL/8Olz81c0/BuU8SxapcroMNawBELuWm/tDg/GPueWch8V7Z5xuXxblBM5cWACTkbMy6QvxCC/GLiBpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5529.namprd11.prod.outlook.com (2603:10b6:408:102::16)
 by DS0PR11MB7458.namprd11.prod.outlook.com (2603:10b6:8:145::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 07:06:59 +0000
Received: from BN9PR11MB5529.namprd11.prod.outlook.com
 ([fe80::477f:f3d4:aecd:5d0c]) by BN9PR11MB5529.namprd11.prod.outlook.com
 ([fe80::477f:f3d4:aecd:5d0c%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 07:06:58 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH v12 5/5] tests/intel/xe_exec_system_allocator: Add
 atomic_batch test in IGT
Thread-Topic: [PATCH v12 5/5] tests/intel/xe_exec_system_allocator: Add
 atomic_batch test in IGT
Thread-Index: AQHcHXXCJYKP0hwnYUioTJ0hcBdB67SNmkbg
Date: Thu, 11 Sep 2025 07:06:58 +0000
Message-ID: <BN9PR11MB5529B2DA6A50C3714D7966BB8409A@BN9PR11MB5529.namprd11.prod.outlook.com>
References: <20250904082701.2154029-1-nishit.sharma@intel.com>
 <20250904082701.2154029-6-nishit.sharma@intel.com>
In-Reply-To: <20250904082701.2154029-6-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5529:EE_|DS0PR11MB7458:EE_
x-ms-office365-filtering-correlation-id: c9ec4cef-702a-408d-feb8-08ddf101cca6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?tuJeN5GYaGqoHOebllq8wf234wVO2UH5I5qyFtqCFZZrtR+z1Vnj5Ks1gCvW?=
 =?us-ascii?Q?YdejU4gEqaGEu5T/B0oKi78bD56lj1zOMTgLiVjDXUocC7uu8wWrwqj5nI4c?=
 =?us-ascii?Q?jR5rw8NV0+sfMqNpIonmBpermK490uugWGuaPLovSzyogiB9gnY3DBG3wl/a?=
 =?us-ascii?Q?ChlbWDGmoGl9TIgDiziFcoiUhJMab2JZElgbWvyY3+daskrMWLsAvBO+Yafh?=
 =?us-ascii?Q?IGBXjsbfiPgaHdXRqiGAwSeHsyCJHlpaSe0vjbn4ptAROfsPSNOd+JDjeghK?=
 =?us-ascii?Q?VOsfEb9vQkpKGeNhSOw5y1hQSix4pyP9KHKAKHz+21Ho3JdIxhY25gwTxAL7?=
 =?us-ascii?Q?1KxuhL7SIauII6+7YDSX63HmeFm9U/06o4AuqGKJOjhE9bxrTpXDGd9DuKEm?=
 =?us-ascii?Q?SHIY569kEOZeN77+EfFlAzBLT2VA064KAAtGaPoW0S4wyhALz5mDKlq2Pev9?=
 =?us-ascii?Q?jWAQ5NMPGb8qVdBPl7BNY2gtjY8W4l91CAZqIec6greQXk1WXSrQQt5IXjrc?=
 =?us-ascii?Q?7TaP2KOCh66TTFqN8NJaJfA/IhnhuBOlUvkQI7YeeH5ynuRAni2nqqp63AQ8?=
 =?us-ascii?Q?JAAQSL+W6Uqv1BpQeHBcH7TMe/kWIZgADQ9Bt4rwuJNq8RQqLlpaRb9RPP0x?=
 =?us-ascii?Q?1cx0Z8SEVw+d9TrMzK48Jk5eFxVW6BBselDga4n9LGIzmdGj04yggu8lLR6N?=
 =?us-ascii?Q?SOnmO2NBPm4uTSU8DsexauoTKmzahnALjjk99s1t4g8OyKAVaVPbpmZzfzUX?=
 =?us-ascii?Q?Db63k+DC433iimNd0b4Wqb6ca+xu6kcYtgpB+h264bH7lBp71ongb2lVQ7Ww?=
 =?us-ascii?Q?Z97lfZdxLgeGPxKds7TF5fQbFYq174GVrlY6Tw4AizKKX53ExthAmmQHeRCc?=
 =?us-ascii?Q?fO++7THUeGS2Ujb9rAGLGseYwp4MZLWqQrhL5Zg4HjlmcMT5wzXU/IAwUxzC?=
 =?us-ascii?Q?7wpT7ScDy7AfRNGgszj8Sefxm1sYBHFbcDwlbHA4VDphwfYjUwCGlfZ6xpNz?=
 =?us-ascii?Q?enMDr7o3JUimOIffrZf/lbZpNUlHITULZDG5X0dLs/Noj6SiV6lcvC9AubkH?=
 =?us-ascii?Q?PVooGzye9dqpngzFKXHUjfk2xzk2jKhnHBno35f19tI1tMYfvGXe4tUS6HHE?=
 =?us-ascii?Q?1y8OokRbpOX01nIfoM3s9Tsl45CVzeQUOI5cUY4mFMGQOzY44nQ1EAMqsYgo?=
 =?us-ascii?Q?m29xROtqEVD0Nl53OakcYWvUIXoqXRBYt5+CVOBf4BRKmkW7+T0SjK7DHIC5?=
 =?us-ascii?Q?IjZ8B8RDF5Aynv+vxeT1OW61//RyyAYPsmwf3CugelWXAgnSc4MY7Ofl5yia?=
 =?us-ascii?Q?gptyDsONsR1gk0ztzU7uN9DpDh00RYX4V89/7LxO9zu1lO7suGkUESef5Mxt?=
 =?us-ascii?Q?9BEcjKKMBGOLluZiaiJRB2yEaUrlXVxjbEgUkm2F5ZmkeRw2yNX8A/9g7KOr?=
 =?us-ascii?Q?c0orXC8KOngENwMogM3YbnG62irb+D27Kgw0xbUhz7lcqhtyKava7psPseR2?=
 =?us-ascii?Q?+YpKUyfNWyBYADU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q96aNZT8v8B+OzitcDySCABiTLk4JB1bXWIb3KrM1vS71JxSb5wug9TJ3NYU?=
 =?us-ascii?Q?TcOZZbjNfNu280Cp4IqAKLsgRslWAuL6ZMHG1kgLKmwe5+VkhwsbkxKf08Yu?=
 =?us-ascii?Q?BThp/heEDPCzEww/jw+ac0Id3Iyn8HdkCKzjlaT8c2cB3oJbpNXc5aHxAAN6?=
 =?us-ascii?Q?IhgK0Sj9cpHrpoI5CgoZYC7gxMYulR9V5wk4LtO+2zZ4ex0HNIyOoAEapF/X?=
 =?us-ascii?Q?zSh/dPuYxyxnvYra4tuym9dcmDy1euWp0nW51Fnjvp8g9l+SQSQANh1Mw4tR?=
 =?us-ascii?Q?31y9CLj5hnG4OypQzLfd3znIS8hnYOea9GV67UEZ87vSAYR87uoJEOGbQ51o?=
 =?us-ascii?Q?IpyZb2DfxsbgytXWDt9t4GAjD/HxHlSERDigzTy7K9bhUC0BEsknf/rmlUbD?=
 =?us-ascii?Q?LW/ynkACznbdYcjbKskGm2mlyYaEtDPx6JtuTfnKUjZo+ihUSCxX1vQoD26n?=
 =?us-ascii?Q?XRKyymaMw4wEYPTA4gZz27/jvHuxkhdCIKGBK1op5EQ+W7F/XMIBCw8OSHOE?=
 =?us-ascii?Q?nv4pJBzNDeuek7TTl09XHEMqcR6+XKgcmGYstfkMzU9mwiRMjAxgyPRUYdwc?=
 =?us-ascii?Q?s1QnAMrNgyk6xojdMMEj3Ok9BHqoYX4B6ygzMselM18OwITE6elH3oRzb67r?=
 =?us-ascii?Q?4tdVthA6F8pZw7/fGS7GKQZ6YnPN0WPmjLhZ9WuHbOzYJoU6A1OOe74tKYiY?=
 =?us-ascii?Q?qoN0udwbP48bPKakNoX4jQiA74NPoW4+XADXymiLw0xuP3GzmBWxz7tCxDHx?=
 =?us-ascii?Q?HuHgGRVe38ukF5ECm0fgDCgNQNMW3fvQzEdFUcsiut/+OBC1tERVOcjepfip?=
 =?us-ascii?Q?WnGK9rhOAtJcKVOgH6VrVtWB6mTrAJQmvmU0XLesDQahpcuRqz2udYS6OKkx?=
 =?us-ascii?Q?kS8JNLB+9fhtcfyerFwTen8L9d8ULdp97Qj+HLAsKua6oc1tHBLK8NvP5qTR?=
 =?us-ascii?Q?z8WmKuaYTwdhh/C4IEfcZyFoeWTDw9mH/RuLvIOrYpGylgPMovE9oWhJr4yd?=
 =?us-ascii?Q?X/EU/9YKL+tqQQ+ZMrR8ExYkOBl4bDSDsU9L1/bEbaEYMOJnijO2NoaYgFLO?=
 =?us-ascii?Q?RgtOLgCrFCIPhnVqYdGnlEtmVW2WwlvytSdfEfa87SRcPK7A3/I8HoXmtnkP?=
 =?us-ascii?Q?x1b/NGH3zeJhS22g0ASK2TGNjGreZd3ZAYYaXqrGDGPLnG7LDBAaDGRgwd7J?=
 =?us-ascii?Q?Ef+y+/+gHXfkSf5gAdZU5hSiaM540RNVui+JNJpqwoX48hcjpyy6aCbmQrUH?=
 =?us-ascii?Q?+p6OMvZ9b3pIaLa9gH3qpI04ym9GiUJ3okmoje/X3SSU5n7IFdMn0V/xxwp3?=
 =?us-ascii?Q?IXZc7B+4E96zCk2foljWaYe2sgN0JQ2Fkxc+DWE+sM1pKSJFmH4g7vzopjRX?=
 =?us-ascii?Q?5vieN83xroRsTPvIE9QKB6Q3Q3jws6RbXhFfIG+YW+QFkF4rUxJz4bJmm1Du?=
 =?us-ascii?Q?lixHjBMTjsY2X2eFG+oUjuMYeFOoJ/4LiBtDDXmO4c/msh9a2FnG4YzljPBu?=
 =?us-ascii?Q?PSFG9jtGwW+zOqiQ1J8RuYTAMTUA3u1pFxGxbkEZMOcHpfIptqLB1M950fbw?=
 =?us-ascii?Q?eM05F9cUY+JNjjIfm0wWnvArxFea59rk8Ps2yisLuM/EBIkP8UlC3h/lUh8w?=
 =?us-ascii?Q?Tw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ec4cef-702a-408d-feb8-08ddf101cca6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 07:06:58.6801 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eHRfFR7gN/fiOWmdbxfXY7sPf5zyG0Zy4ZUDfH77CH29C7Hv45z9lFOM2fC0kN2VML0w32YcYMMutK+9ZJg1p5fK/aJd/bGR7cR32yCKgZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7458
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
> From: Sharma, Nishit <nishit.sharma@intel.com>
> Sent: Thursday, September 4, 2025 1:57 PM
> To: igt-dev@lists.freedesktop.org; Gurram, Pravalika
> <pravalika.gurram@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
> Subject: [PATCH v12 5/5] tests/intel/xe_exec_system_allocator: Add
> atomic_batch test in IGT
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> ATOMIC_BATCH flag is introduced when true MI_ATOMIC | MI_ATOMIC_INC
> operation will be called. This will avoid writing another function which =
performs
> atomic increment operations. ATOMIC_BATCH flag is passed as argument in
> write_dword() if true then value will be written on passed address and
> incremented by ATOMIC_INC operation. For all memory operations this flag =
will
> be used to verify if ATOMIC operation is working or not.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 403 ++++++++++++++++++++++---
>  1 file changed, 366 insertions(+), 37 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_system_allocator.c
> b/tests/intel/xe_exec_system_allocator.c
> index 8d9696a33..67f22dbff 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -17,6 +17,7 @@
>  #include <time.h>
>=20
>  #include "igt.h"
> +#include "intel_pat.h"
>  #include "lib/igt_syncobj.h"
>  #include "lib/intel_compute.h"
>  #include "lib/intel_reg.h"
> @@ -31,6 +32,15 @@
>  #define QUARTER_SEC		(NSEC_PER_SEC / 4)
>  #define FIVE_SEC		(5LL * NSEC_PER_SEC)
>=20
> +struct test_exec_data {
> +	uint32_t batch[32];
> +	uint64_t pad;
> +	uint64_t vm_sync;
> +	uint64_t exec_sync;
> +	uint32_t data;
> +	uint32_t expected_data;
> +};
> +
>  struct batch_data {
>  	uint32_t batch[16];
>  	uint64_t pad;
> @@ -38,6 +48,7 @@ struct batch_data {
>  	uint32_t expected_data;
>  };
>=20
> +#define VAL_ATOMIC_EXPECTED  56
>  #define WRITE_VALUE(data__, i__)	({			\
>  	if (!(data__)->expected_data)				\
>  		(data__)->expected_data =3D rand() << 12 | (i__);	\
> @@ -54,10 +65,19 @@ static void __write_dword(uint32_t *batch, uint64_t
> sdi_addr, uint32_t wdata,
>  	batch[(*idx)++] =3D wdata;
>  }
>=20
> -static void write_dword(uint32_t *batch, uint64_t sdi_addr, uint32_t wda=
ta,
> -			int *idx)
> +static void write_dword(struct test_exec_data *data, uint64_t sdi_addr,
> uint32_t wdata,
> +			int *idx, bool atomic)
>  {
> -	__write_dword(batch, sdi_addr, wdata, idx);
> +	uint32_t *batch =3D data->batch;
> +
> +	if (atomic) {
> +		data->data =3D 55;
> +		batch[(*idx)++] =3D MI_ATOMIC | MI_ATOMIC_INC;
> +		batch[(*idx)++] =3D sdi_addr;
> +		batch[(*idx)++] =3D sdi_addr >> 32;
> +	} else
> +		__write_dword(batch, sdi_addr, wdata, idx);
> +
>  	batch[(*idx)++] =3D MI_BATCH_BUFFER_END;  }
>=20
> @@ -304,7 +324,7 @@ static void touch_all_pages(int fd, uint32_t exec_que=
ue,
> void *ptr,
>  		uint64_t sdi_addr =3D addr + sdi_offset;
>  		int b =3D 0;
>=20
> -		write_dword(data->batch, sdi_addr, WRITE_VALUE(data, i),
> &b);
> +		write_dword((struct test_exec_data *)data, sdi_addr,
> +WRITE_VALUE(data, i), &b, false);
>  		igt_assert(b <=3D ARRAY_SIZE(data->batch));
>  	}
>=20
> @@ -447,6 +467,54 @@ static void __aligned_partial_free(struct
> aligned_alloc_type  *aligned_alloc_typ
>   * SUBTEST: processes-evict-malloc-mix-bo
>   * Description: multi-process trigger eviction of VRAM allocated via mal=
loc and
> BO create
>   * Test category: stress test
> + *
> + * SUBTEST: madvise-multi-vma
> + * Description: performs multiple madvise operations on multiple
> + virtual memory area using atomic device attributes
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-split-vma
> + * Description: perform madvise operations on multiple type VMAs (BO
> + and CPU VMAs)
> + * Test category: perform madvise operations on multiple type VMAs (BO
> + and CPU VMAs)
> + *
> + * SUBTEST: madvise-atomic-vma
> + * Description: perform madvise atomic operations on BO in VRAM/SMEM if
> + atomic ATTR global/device
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-split-vma-with-mapping
> + * Description: performs prefetch and page migration
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-preffered-loc-atomic-vram
> + * Description: performs both atomic and preferred loc madvise
> + operations atomic device attributes set
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-preffered-loc-atomic-gl
> + * Description: performs both atomic and preferred loc madvise
> + operations with atomic global attributes set
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-preffered-loc-atomic-cpu
> + * Description: performs both atomic and preferred loc madvise
> + operations with atomic cpu attributes set
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-preffered-loc-sram-migrate-pages
> + * Description: performs preferred loc madvise operations and migrating
> + all pages in smem
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-no-range-invalidate-same-attr
> + * Description: performs atomic global madvise operation, prefetch and
> + again madvise operation with same atomic attribute
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-range-invalidate-change-attr
> + * Description: performs atomic global madvise operation, prefetch and
> + again madvise operation with different atomic attribute
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-preffered-loc-atomic-und
> + * Description: Tests madvise with preferred location set for atomic
> + operations, but with an undefined
> + * Test category: functionality test
> + *
> + * SUBTEST: madvise-atomic-inc
> + * Description: Tests madvise atomic operations
> + * Test category: functionality test
>   */
>=20
>  static void
> @@ -701,7 +769,8 @@ partial(int fd, struct drm_xe_engine_class_instance *=
eci,
> unsigned int flags)
>  		uint64_t sdi_addr =3D addr + sdi_offset;
>  		int b =3D 0;
>=20
> -		write_dword(data[i].batch, sdi_addr, WRITE_VALUE(&data[i],
> i), &b);
> +		write_dword((struct test_exec_data *)&data[i], sdi_addr,
> WRITE_VALUE(&data[i], i),
> +			     &b, false);
>  		igt_assert(b <=3D ARRAY_SIZE(data[i].batch));
>=20
>  		if (!i)
> @@ -778,6 +847,20 @@ partial(int fd, struct drm_xe_engine_class_instance
> *eci, unsigned int flags)
>  #define PREFETCH_BENCHMARK	(0x1 << 25)
>  #define PREFETCH_SYS_BENCHMARK	(0x1 << 26)
>  #define MADVISE_SWIZZLE			(0x1 << 27)
> +#define MADVISE_OP			(0x1 << 28)
> +#define ATOMIC_BATCH			(0x1 << 29)
> +#define MIGRATE_ALL_PAGES		(0x1 << 30)
> +#define PREFERRED_LOC_ATOMIC_DEVICE	(0x1ull << 31)
> +#define PREFERRED_LOC_ATOMIC_GL		(0x1ull << 32)
> +#define PREFERRED_LOC_ATOMIC_CPU	(0x1ull << 33)
> +#define MADVISE_MULTI_VMA		(0x1ull << 34)
> +#define MADVISE_SPLIT_VMA		(0x1ull << 35)
> +#define MADVISE_ATOMIC_VMA		(0x1ull << 36)
> +#define PREFETCH_SPLIT_VMA		(0x1ull << 37)
> +#define PREFETCH_CHANGE_ATTR		(0x1ull << 38)
> +#define PREFETCH_SAME_ATTR		(0x1ull << 39)
> +#define PREFERRED_LOC_ATOMIC_UND	(0x1ull << 40)
> +#define MADVISE_ATOMIC_DEVICE		(0x1ull << 41)
>=20
>  #define N_MULTI_FAULT		4
>=20
> @@ -886,7 +969,7 @@ partial(int fd, struct drm_xe_engine_class_instance *=
eci,
> unsigned int flags)
>   * arg[1]:
>   *
>   * @malloc:				malloc single buffer for all execs, issue
> a command which will trigger multiple faults
> - * @malloc-madvise:			malloc single buffer for all execs, issue
> a command which will trigger multiple faults, perfoems madvise operation
> + * @malloc-madvise:			malloc single buffer for all execs, issue
> a command which will trigger multiple faults, performs madvise operation
>   * @malloc-prefetch:			malloc single buffer for all execs,
> prefetch buffer before each exec
>   * @malloc-prefetch-madvise:		malloc single buffer for all execs,
> prefetch buffer before each exec, performs madvise operation
>   * @malloc-multi-fault:			malloc single buffer for all execs
> @@ -989,16 +1072,6 @@ partial(int fd, struct drm_xe_engine_class_instance
> *eci, unsigned int flags)
>   * Description: Create multiple threads with a faults on different hardw=
are
> engines to same addresses, racing between CPU and GPU access
>   * Test category: stress test
>   */
> -
> -struct test_exec_data {
> -	uint32_t batch[32];
> -	uint64_t pad;
> -	uint64_t vm_sync;
> -	uint64_t exec_sync;
> -	uint32_t data;
> -	uint32_t expected_data;
> -};
> -
>  static void igt_require_hugepages(void)  {
>  	igt_skip_on_f(!igt_get_meminfo("HugePages_Total"),
> @@ -1024,11 +1097,184 @@ madvise_swizzle_op_exec(int fd, uint32_t vm,
> struct test_exec_data *data,
>  			0);
>  }
>=20
> +static void
> +xe_vm_madvixe_pat_attr(int fd, uint32_t vm, uint64_t addr, uint64_t rang=
e,
> +		int pat_index)
> +{
> +	xe_vm_madvise(fd, vm, addr, range, 0,
> +			DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0); }
> +
> +static void
> +xe_vm_madvise_atomic_attr(int fd, uint32_t vm, uint64_t addr, uint64_t
> range,
> +		int mem_attr)
> +{
> +	xe_vm_madvise(fd, vm, addr, range, 0,
> +			DRM_XE_MEM_RANGE_ATTR_ATOMIC,
> +			mem_attr, 0);
> +}
> +
> +static void
> +xe_vm_madvise_migrate_pages(int fd, uint32_t vm, uint64_t addr,
> +uint64_t range) {
> +	xe_vm_madvise(fd, vm, addr, range, 0,
> +			DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +			DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM,
> +			DRM_XE_MIGRATE_ALL_PAGES);
> +}
> +
> +static void
> +xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data
> *data,
> +		size_t bo_size, struct drm_xe_engine_class_instance *eci,
> +		uint64_t addr, unsigned long long flags,
> +		struct drm_xe_sync *sync)
> +{
> +	uint32_t bo_flags, bo =3D 0;
> +
> +
> +	if (flags & MADVISE_ATOMIC_DEVICE)
> +		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data),
> bo_size,
> +				DRM_XE_ATOMIC_DEVICE);
> +
> +	if (flags & PREFERRED_LOC_ATOMIC_UND) {
> +		xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data),
> bo_size);
> +
> +		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data),
> bo_size,
> +				DRM_XE_ATOMIC_UNDEFINED);
> +	}
> +
> +	if (flags & PREFERRED_LOC_ATOMIC_DEVICE) {
> +		xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data),
> bo_size);
> +
> +		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data),
> bo_size,
> +				DRM_XE_ATOMIC_DEVICE);
> +	}
> +
> +	if (flags & PREFERRED_LOC_ATOMIC_GL) {
> +		xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data),
> bo_size);
> +
> +		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data),
> bo_size,
> +				DRM_XE_ATOMIC_GLOBAL);
> +	}
> +
> +	if (flags & PREFERRED_LOC_ATOMIC_CPU) {
> +		xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data),
> bo_size);
> +
> +		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data),
> bo_size,
> +				DRM_XE_ATOMIC_CPU);
> +	}
> +
> +	if (flags & MADVISE_MULTI_VMA) {
> +		if (bo_size)
> +			bo_size =3D ALIGN(bo_size, SZ_4K);
> +		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data) +
> bo_size/2,
> +				bo_size/2, DRM_XE_ATOMIC_DEVICE);
> +
> +		xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data) +
> bo_size/2, bo_size/2,
> +				intel_get_pat_idx_wb(fd));
> +
> +		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data) +
> bo_size,
> +				bo_size, DRM_XE_ATOMIC_DEVICE);
> +
> +		xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data),
> bo_size,
> +				intel_get_pat_idx_wb(fd));
> +	}
> +
> +	if (flags & MADVISE_SPLIT_VMA) {
> +		if (bo_size)
> +			bo_size =3D ALIGN(bo_size, SZ_4K);
> +
> +		bo_flags =3D
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> +		bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci-
> >gt_id),
> +				bo_flags);
> +		xe_vm_bind_async(fd, vm, 0, bo, 0, to_user_pointer(data) +
> bo_size/2,
> +				bo_size/2, 0, 0);
> +
> +		__xe_vm_bind_assert(fd, vm, 0, 0, 0, to_user_pointer(data) +
> bo_size/2,
> +				bo_size/2, DRM_XE_VM_BIND_OP_MAP,
> +
> 	DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR, sync,
> +				1, 0, 0);
> +		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0,
> FIVE_SEC);
> +		data[0].vm_sync =3D 0;
> +		gem_close(fd, bo);
> +		bo =3D 0;
> +
> +
> +		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data),
> bo_size/2,
> +				DRM_XE_ATOMIC_GLOBAL);
> +	}
> +}
> +
> +static void
> +madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
> +		unsigned long long flags, struct test_exec_data *data) {
> +	uint32_t val;
> +
> +	if (flags & PREFETCH_SPLIT_VMA) {
> +		bo_size =3D ALIGN(bo_size, SZ_4K);
> +
> +		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0, 0);
> +
> +		val =3D xe_vm_print_mem_attr_values_in_range(fd, vm, addr,
> bo_size);
> +
> +		igt_debug("num_vmas before madvise =3D %d\n", val);
> +
> +		xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data),
> +bo_size/2);
> +
> +		val =3D xe_vm_print_mem_attr_values_in_range(fd, vm, addr,
> bo_size);
> +
> +		igt_debug("num_vmas after madvise=3D %d\n", val);
> +	} else if (flags & PREFETCH_SAME_ATTR) {
> +		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data),
> bo_size,
> +				DRM_XE_ATOMIC_GLOBAL);
> +		val =3D xe_vm_print_mem_attr_values_in_range(fd, vm, addr,
> bo_size);
> +
> +		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0,
> +				DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
> +
> +		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data),
> bo_size/2,
> +				DRM_XE_ATOMIC_GLOBAL);
> +	} else if (flags & PREFETCH_CHANGE_ATTR) {
> +		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data),
> bo_size,
> +				DRM_XE_ATOMIC_GLOBAL);
> +
> +		val =3D xe_vm_print_mem_attr_values_in_range(fd, vm, addr,
> bo_size);
> +
> +		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0,
> +				DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
> +
> +		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data),
> bo_size,
> +				DRM_XE_ATOMIC_DEVICE);
> +
> +		val =3D xe_vm_print_mem_attr_values_in_range(fd, vm, addr,
> bo_size);
> +	}
> +}
> +
> +static void
> +madvise_vma_addr_map(uint64_t addr, int i, int idx, size_t bo_size,
> +		     struct test_exec_data *data,
> +		     uint64_t *batch_offset,
> +		     uint64_t *batch_addr, uint64_t *sdi_offset,
> +		     uint64_t *sdi_addr,
> +		     unsigned long long flags,
> +		     uint64_t *split_vma_offset)
> +{
> +	if (flags & MADVISE_MULTI_VMA) {
> +		addr =3D addr + i * bo_size;
> +		data =3D from_user_pointer(addr);
> +		*batch_offset =3D (size_t)((char *)&(data[idx].batch) - (char
> *)data);
> +		*batch_addr =3D addr + *batch_offset;
> +		*sdi_offset =3D (size_t)((char *)&(data[idx].data) - (char *)data);
> +		*sdi_addr =3D addr + *sdi_offset;
> +	}
> +}
> +
>  static void
>  test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	  int n_exec_queues, int n_execs, size_t bo_size,
>  	  size_t stride, uint32_t vm, void *alloc, pthread_barrier_t *barrier,
> -	  unsigned int flags)
> +	  unsigned long long flags)
>  {
>  	uint64_t addr;
>  	struct drm_xe_sync sync[1] =3D {
> @@ -1041,7 +1287,7 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  		.syncs =3D to_user_pointer(sync),
>  	};
>  	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
> -	struct test_exec_data *data, *next_data =3D NULL;
> +	struct test_exec_data *data, *next_data =3D NULL, *original_data =3D
> NULL;
>  	uint32_t bo_flags;
>  	uint32_t bo =3D 0, bind_sync =3D 0;
>  	void **pending_free;
> @@ -1159,6 +1405,9 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>=20
>  	addr =3D to_user_pointer(data);
>=20
> +	if (flags & MADVISE_OP)
> +		xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr,
> flags,
> +sync);
> +
>  	if (flags & BO_UNMAP) {
>  		bo_flags =3D
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>  		bo =3D xe_bo_create(fd, vm, bo_size,
> @@ -1232,42 +1481,61 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  		bool fault_inject =3D (FAULT & flags) && i =3D=3D n_execs / 2;
>  		bool fault_injected =3D (FAULT & flags) && i > n_execs;
>=20
> +		uint64_t split_vma_offset;
> +
>  		if (barrier)
>  			pthread_barrier_wait(barrier);
>=20
>  		if (flags & MADVISE_SWIZZLE)
>  			madvise_swizzle_op_exec(fd, vm, data, bo_size, addr,
> i);
>=20
> +		if (flags & MADVISE_OP) {
> +			if (flags & MADVISE_MULTI_VMA)
> +				original_data =3D data;
> +
> +			madvise_vma_addr_map(addr, i, idx, bo_size, data,
> &batch_offset,
> +					      &batch_addr, &sdi_offset,
> &sdi_addr, flags,
> +					      &split_vma_offset);
> +		}
> +
>  		if (flags & MULTI_FAULT) {
>  			b =3D 0;
>  			for (j =3D 0; j < N_MULTI_FAULT - 1; ++j)
>  				__write_dword(data[idx].batch,
>  					      sdi_addr + j * orig_size,
>  					      WRITE_VALUE(&data[idx], idx),
> &b);
> -			write_dword(data[idx].batch, sdi_addr + j * orig_size,
> -				    WRITE_VALUE(&data[idx], idx), &b);
> +			write_dword(&data[idx], sdi_addr + j * orig_size,
> +				    WRITE_VALUE(&data[idx], idx), &b,
> +				    flags & ATOMIC_BATCH ? true : false);
>  			igt_assert(b <=3D ARRAY_SIZE(data[idx].batch));
>  		} else if (!(flags & EVERY_OTHER_CHECK)) {
>  			b =3D 0;
> -			write_dword(data[idx].batch, sdi_addr,
> -				    WRITE_VALUE(&data[idx], idx), &b);
> +			write_dword(&data[idx], sdi_addr,
> +					WRITE_VALUE(&data[idx], idx), &b,
> +					flags & ATOMIC_BATCH ? true : false);
>  			igt_assert(b <=3D ARRAY_SIZE(data[idx].batch));
> +			if (flags & PREFETCH)
> +				madvise_prefetch_op(fd, vm, addr, bo_size,
> flags, data);
>  		} else if (flags & EVERY_OTHER_CHECK && !odd(i)) {
>  			b =3D 0;
> -			write_dword(data[idx].batch, sdi_addr,
> -				    WRITE_VALUE(&data[idx], idx), &b);
> +			write_dword(&data[idx], sdi_addr,
> +				    WRITE_VALUE(&data[idx], idx), &b,
> +				    flags & ATOMIC_BATCH ? true : false);
>  			igt_assert(b <=3D ARRAY_SIZE(data[idx].batch));
>=20
>  			aligned_alloc_type =3D __aligned_alloc(aligned_size,
> bo_size);
>  			next_data =3D aligned_alloc_type.ptr;
>  			igt_assert(next_data);
> +
> +			xe_vm_parse_execute_madvise(fd, vm, data, bo_size,
> eci, addr, flags,
> +sync);
>  			__aligned_partial_free(&aligned_alloc_type);
>=20
>  			b =3D 0;
> -			write_dword(data[next_idx].batch,
> +			write_dword(&data[next_idx],
>  				    to_user_pointer(next_data) +
>  				    (char *)&data[next_idx].data - (char *)data,
> -				    WRITE_VALUE(&data[next_idx], next_idx),
> &b);
> +				    WRITE_VALUE(&data[next_idx], next_idx),
> &b,
> +				    flags & ATOMIC_BATCH ? true : false);
>  			igt_assert(b <=3D ARRAY_SIZE(data[next_idx].batch));
>  		}
>=20
> @@ -1301,7 +1569,6 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  			exec.address =3D batch_addr * 2;
>  		else
>  			exec.address =3D batch_addr;
> -
>  		if (fault_injected) {
>  			err =3D __xe_exec(fd, &exec);
>  			igt_assert(err =3D=3D -ENOENT);
> @@ -1321,9 +1588,19 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  					       exec_queues[e], &timeout);
>  			igt_assert(err =3D=3D -ETIME || err =3D=3D -EIO);
>  		} else {
> -			xe_wait_ufence(fd, exec_ufence ? exec_ufence :
> -				       &data[idx].exec_sync,
> USER_FENCE_VALUE,
> -				       exec_queues[e], FIVE_SEC);
> +			if (flags & PREFERRED_LOC_ATOMIC_CPU || flags &
> PREFERRED_LOC_ATOMIC_UND) {
> +				int64_t timeout =3D QUARTER_SEC;
> +
> +				err =3D __xe_wait_ufence(fd, exec_ufence ?
> exec_ufence :
> +						       &data[idx].exec_sync,
> +						       USER_FENCE_VALUE,
> +						       exec_queues[e],
> &timeout);
> +				if (err)
> +					goto cleanup;
> +			} else
> +				xe_wait_ufence(fd, exec_ufence ? exec_ufence
> :
> +					       &data[idx].exec_sync,
> USER_FENCE_VALUE,
> +					       exec_queues[e], FIVE_SEC);
>  			if (flags & LOCK && !i)
>  				munlock(data, bo_size);
>=20
> @@ -1373,17 +1650,25 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  				if (flags & FORK_READ) {
>  					igt_fork(child, 1)
>  						igt_assert_eq(data[idx].data,
> -
> READ_VALUE(&data[idx]));
> +							      flags &
> ATOMIC_BATCH
> +							      ?
> VAL_ATOMIC_EXPECTED
> +							      :
> READ_VALUE(&data[idx]));
>  					if (!(flags & FORK_READ_AFTER))
>  						igt_assert_eq(data[idx].data,
> -
> READ_VALUE(&data[idx]));
> +							      flags &
> ATOMIC_BATCH
> +							      ?
> VAL_ATOMIC_EXPECTED
> +							      :
> READ_VALUE(&data[idx]));
>  					igt_waitchildren();
>  					if (flags & FORK_READ_AFTER)
>  						igt_assert_eq(data[idx].data,
> -
> READ_VALUE(&data[idx]));
> +							      flags &
> ATOMIC_BATCH
> +							      ?
> VAL_ATOMIC_EXPECTED
> +							      :
> READ_VALUE(&data[idx]));
>  				} else {
>  					igt_assert_eq(data[idx].data,
> -						      READ_VALUE(&data[idx]));
> +						      flags & ATOMIC_BATCH
> +						      ? VAL_ATOMIC_EXPECTED
> +						      :
> READ_VALUE(&data[idx]));
>  					if (flags &
> PREFETCH_SYS_BENCHMARK) {
>  						struct timespec tv =3D {};
>  						u64 start, end;
> @@ -1410,13 +1695,17 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  								((void *)data)
> + j * orig_size;
>=20
>=20
> 	igt_assert_eq(__data[idx].data,
> -
> READ_VALUE(&data[idx]));
> +								      flags &
> ATOMIC_BATCH
> +								      ?
> VAL_ATOMIC_EXPECTED
> +								      :
> READ_VALUE(&data[idx]));
>  						}
>  					}
>  				}
>  				if (flags & EVERY_OTHER_CHECK)
>  					igt_assert_eq(data[prev_idx].data,
> -
> READ_VALUE(&data[prev_idx]));
> +						      flags & ATOMIC_BATCH
> +						      ? VAL_ATOMIC_EXPECTED
> +						      :
> READ_VALUE(&data[prev_idx]));
>  			}
>  		}
>=20
> @@ -1437,6 +1726,11 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  			gem_close(fd, bo);
>  		}
>=20
> +		if (flags & MADVISE_MULTI_VMA) {
> +			data =3D original_data;
> +			original_data =3D NULL;
> +		}
> +
>  		if (flags & NEW) {
>  			if (flags & MMAP) {
>  				if (flags & FREE)
> @@ -1515,6 +1809,7 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  				 pf_count, pf_count_after);
>  	}
>=20
> +cleanup:
>  	if (bo) {
>  		sync[0].addr =3D to_user_pointer(bind_ufence);
>  		__xe_vm_bind_assert(fd, vm, 0,
> @@ -1810,7 +2105,7 @@ test_compute(int fd, struct
> drm_xe_engine_class_instance *eci, size_t size)
>=20
>  struct section {
>  	const char *name;
> -	unsigned int flags;
> +	unsigned long long flags;
>  };
>=20
>  igt_main
> @@ -1917,6 +2212,32 @@ igt_main
>  		{ "malloc-mix-bo", MIX_BO_ALLOC },
>  		{ NULL },
>  	};
> +	const struct section msections[] =3D {
> +		{ "atomic-inc", MADVISE_OP | MADVISE_ATOMIC_DEVICE |
> ATOMIC_BATCH },
> +		{ "preffered-loc-sram-migrate-pages",
> +		  MADVISE_OP | MADVISE_SWIZZLE | MIGRATE_ALL_PAGES |
> ATOMIC_BATCH },
> +		{ "preffered-loc-atomic-vram",
> +		  MADVISE_OP | PREFERRED_LOC_ATOMIC_DEVICE |
> ATOMIC_BATCH },
> +		{ "preffered-loc-atomic-gl",
> +		  MADVISE_OP | PREFERRED_LOC_ATOMIC_GL |
> ATOMIC_BATCH },
> +		{ "preffered-loc-atomic-cpu",
> +		  MADVISE_OP | PREFERRED_LOC_ATOMIC_CPU |
> ATOMIC_BATCH },
> +		{ "preffered-loc-atomic-und",
> +		  MADVISE_OP | PREFERRED_LOC_ATOMIC_UND |
> ATOMIC_BATCH },
> +		{ "multi-vma",
> +		  MADVISE_OP | MADVISE_MULTI_VMA | ATOMIC_BATCH },
> +		{ "split-vma",
> +		  MADVISE_OP | MADVISE_SPLIT_VMA | ATOMIC_BATCH },
> +		{ "atomic-vma",
> +		  MADVISE_OP | MADVISE_ATOMIC_VMA | ATOMIC_BATCH },
> +		{ "split-vma-with-mapping",
> +		  MADVISE_OP | PREFETCH | PREFETCH_SPLIT_VMA |
> ATOMIC_BATCH },
> +		{ "range-invalidate-change-attr",
> +		  MADVISE_OP | PREFETCH | PREFETCH_CHANGE_ATTR |
> ATOMIC_BATCH },
> +		{ "no-range-invalidate-same-attr",
> +		  MADVISE_OP | PREFETCH | PREFETCH_SAME_ATTR |
> ATOMIC_BATCH },
> +		{ NULL },
> +	};
>  	int fd;
>=20
>  	igt_fixture {
> @@ -2113,6 +2434,14 @@ igt_main
>  			processes_evict(fd, SZ_8M, SZ_1M, s->flags);
>  	}
>=20
> +	for (const struct section *s =3D msections; s->name; s++) {
> +		igt_subtest_f("madvise-%s", s->name) {
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 1, 1, SZ_64K, 0, 0, NULL,
> +					  NULL, s->flags);
> +		}
> +	}
> +
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
>  	igt_subtest("compute")
>  		xe_for_each_engine(fd, hwe)
>  			test_compute(fd, hwe, SZ_2M);
> --
> 2.43.0

