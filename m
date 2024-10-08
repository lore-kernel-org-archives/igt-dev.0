Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912D9CF0428
	for <igt-dev@archiver.kernel.org>; Tue,  8 Oct 2024 21:44:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C1F10E5F4;
	Tue,  8 Oct 2024 21:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ze/JmgbN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB9210E5F6
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Oct 2024 21:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728423852; x=1759959852;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7EVIbA6NmnPmQmefF48tal680HM1fgeE3+rcV/D9HWk=;
 b=Ze/JmgbNs57uBGLfKwtdG5ECf8EeJm9fQS7esauv++lay72ecX+KooJS
 U1DEPPsUSOOH5VKI1gM25CXs8emh8Oju3acTIl0bs8xqIAevwivUjmYH+
 51H5I1uMLIumko9mtPs97CAaOEEugOoyGWzhPHwsinjcZVZPkXO6PM4Pr
 ILtDkhyA10Eh9g3Nj5n0RK2+b57rnrwFx94pet5FfFQ1WmRqJT9OSTcmZ
 2h9wA9UUV6W4glcuI8qFSBx05gHMQiAKupt7NHJmKv2a+qSKHZvsJBnzV
 xItRt17kn7I95BvZTdw718zlLH1NANg6fkOnpuY3PfeRSJk+qFnbvaLLw g==;
X-CSE-ConnectionGUID: /sb7N8vERcqwziA6o3OJdQ==
X-CSE-MsgGUID: roKJ1SmfRuOp0NdcCeWKRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27553947"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="27553947"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 14:44:12 -0700
X-CSE-ConnectionGUID: dqx5aAwvSZKJvU5z7av88Q==
X-CSE-MsgGUID: zZ3cIi2QRaWIv4uQ7tAGHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="75691708"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 14:44:12 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 14:44:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 14:44:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 14:44:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 14:44:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9H3AjvQxhgcQWrF2b7Vxrr8s5ILRDKjZi4jqJNXbj8aDq/C+Hr2mWtnwnW1LlRxSCBGc56ZNRYYjmzCxho/OzpWE3Yppef9hfiAbW0pN+FqqU9Lyl0hCFjX5waKefxYcOV9nctoapeUjJpn1QLnOSm5dfYuTSSoPtKnUKen+qt9gRHq410ujaFYSY6SNXZVmM8CslLzhqJqwOuYQ28xG7hvliQmGn40BVYcwqwldqVcVR++eRNuPdSM0OxRmDDVsvkHmVsm5rdcj3Wolfw+iBqJbhheEpuEMxTcTUxVxwnLtZWZ3fIQyPo8TA0pBOhHfoQ2Ec9i3N+Nr/rsqyAFmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pF4NipNxdEZV6X0OK77D8wfw4RO3g6aFw9/NRMfBo1w=;
 b=jBUMseAh/vzj+i3j9ZbAj23lJr6YxCLUhM0PFO0oDY63xz8uW1oNkzupT9TTNNce3SmqPiUqs5y3SwUnjPw2z/6TBxuhRdDMk//JzN/bF07Y9sLxgceAybNGx4n7CioaDleRDqbGRT/UUNfJKIJ7Ogfxh4ECOB2yaL5LgcmygXcR8Dv5djNAO5deZ+O1CHswch4rDZnkVHT++1sihG1+YMLLAOTNEXYHigOxcGVWLA0qlkO1oFkmM8cwEjTSGjzEFdJYBvNg6LGfBAOysuv2NrvU11zTP1jjBfH9HitH5tYeA1ZkOhl3hM19iLgFFezg6Q8zJOVj7UId6F2TvVADGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW4PR11MB6667.namprd11.prod.outlook.com (2603:10b6:303:1ea::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24; Tue, 8 Oct
 2024 21:44:07 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 21:44:07 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Das, Nirmoy" <nirmoy.das@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "Ch, Sai Gowtham"
 <sai.gowtham.ch@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_tlb: Print tlb inval counts on
 failure
Thread-Topic: [PATCH i-g-t] tests/intel/xe_tlb: Print tlb inval counts on
 failure
Thread-Index: AQHbGcW0khyF8+P8GUSGJoUX149UhLJ9Yp5Q
Date: Tue, 8 Oct 2024 21:44:07 +0000
Message-ID: <CH0PR11MB544403DAD3A6501C70ABACDBE57E2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241008202146.993745-1-nirmoy.das@intel.com>
In-Reply-To: <20241008202146.993745-1-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW4PR11MB6667:EE_
x-ms-office365-filtering-correlation-id: 09fca7fa-bb0e-4a96-6ee0-08dce7e25662
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?+EKAofpcs9v7NrLr5MRGo7JKvt8HVpR46P1g71g8/6ylL62/KAF8Z7IW4lQ3?=
 =?us-ascii?Q?HjyGp2ohFHsuswbrlXNzBYOVSaCxsk43kWuPZVHpregP8gMFC8jMktC/8gs5?=
 =?us-ascii?Q?zHbarUPtilPFlqpPtC06/rqqUhrYWviEElaIsldo7jw+rsEVXUFkuSG1vH47?=
 =?us-ascii?Q?Vn2uPam6UwXn5cyOpec0bLdWxqEsloHA3oAoWO9PiGAo4w06orzBbcoGBPmJ?=
 =?us-ascii?Q?zEABiouvk0iG0w4SgMcNIPP+s62lsDjRhgOnBSzk2F01Ia1LcKUojz69ZcaZ?=
 =?us-ascii?Q?yND4kNwJBKJOWU5ff/5xeFsgJ8jGFXRmeP3U7BKobItpM9W6d/e27/qoK/n1?=
 =?us-ascii?Q?/8y+DCANVa/7gs8nRfZOGOviW1+w26Ha7DST7vEANxuq8rVB0JC3eGarvxIp?=
 =?us-ascii?Q?cAQH4ajRAarBF/kVxPmkNFzFQ7snMqqhKmMLvue4kZ+sG4/5MYBK6xRnj7HL?=
 =?us-ascii?Q?L2qweQ4Wq9z0FFMDirM8hR69e8q8QgQDJk0SbS79QIMQldkZEpd4KZ8AwvXc?=
 =?us-ascii?Q?K/Hhk0rOeTfXFrwcjgywhYzf8kEylPLhFO9BqfZB9+jNzlBFRrJKcN7/k0HY?=
 =?us-ascii?Q?vDWpYkveeKpfwLIDvMUbIcEb6PjUabZGPwrs2/ATzAv5DmXPAa6eijTMm+w5?=
 =?us-ascii?Q?ljZrdCZL+o9RBrSChbJExoRtqw4UYtaV5KpwkQc7lxzV4fx9zpF0XpKbs1gf?=
 =?us-ascii?Q?egVHKPUDKpXuPY4zYc+WxlsX32unH5xJlogtj/yHG4ZdtHGVy4l43bVDCCmt?=
 =?us-ascii?Q?Gn5RAdPS5fy+xcYHQo4VKtWZvW6abGyrLzLWlSYWfHa4LiqH4GXmOYKM5roF?=
 =?us-ascii?Q?X1Vs1HDMJNoipdXrGZRTGMh/H+1t0TisMY3Nbdb353HGXW2/miw2wuzQitrw?=
 =?us-ascii?Q?FmSC/2iuFYu9h83h8nW5q0Yrxdo3y4AoViQlxXgqfHDcM7eAh81zwF7bI5Hv?=
 =?us-ascii?Q?mdxNnAju0g8Ac+bUelF/SeiGxgV6/aO7snOEOTahsmUTQcU11V+KvVrdwOlm?=
 =?us-ascii?Q?bZZ8K85aWvxj/iH5M8CUJU/iL7QYHYqD95U1/HPvc+gEjQo3Qnuv0D5hDqvQ?=
 =?us-ascii?Q?XC/HZXSRMdbZUvgtXFi0UJkjDRdnIk9R2Ng6qdZuiQ1wwtJzXDAVO0jDC1Kc?=
 =?us-ascii?Q?nfltNU19mHdufdj+cWku1AMvrrrNiQu7c7TxKViE1tivkUguKg5KIUkAuKPg?=
 =?us-ascii?Q?LRcabmoVQW6z+gFqfVP29qW78O9efSIYMyet/VCw7KtrcUdYqXptD4mKiylo?=
 =?us-ascii?Q?ZS7oCxA4lbTqWM64slK3BiSDBUASU5SrpnePP3KZlH7QSZMEwh7TlzDSV7fh?=
 =?us-ascii?Q?FtTsbl38LuLEm9KohWzqPiBBu0PzW6NWlLjwnOD9qEMDYg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3qDStncAkuecGwj8Zo9ZRIsdBzCOTUR7TI45cJhOYBP9cHW8fYkNkdJt9tJp?=
 =?us-ascii?Q?zdZgJOyahKysyrhwxHWP0O757LmSPM2RWpfdh52qJ1f/zdxiLF9gypABBhNp?=
 =?us-ascii?Q?4i4aWtnAVbqchEcplPaPFdnYflZ9xYVZ2Yt7cTbzM2gvT3CZvUToMU2rPbgi?=
 =?us-ascii?Q?7/Typfq29ZlDBJzZlzImE3vKYe8HcwTmdPzIrE4CPbnYVKO3HRdXKbFHAeb0?=
 =?us-ascii?Q?YTNWquUNyJULY9fSMbprR+KYv6KeZv+yC8ekp1E/qga8YiszODO06w+Hag7m?=
 =?us-ascii?Q?XzOyjD3DUh/iDhr7C0xHTH9R3pn2o+854svvzquwZnrwY3g7n6mADKzTda0w?=
 =?us-ascii?Q?RzCbhf4EMzvF1VVNX25Vbf1U0V/j4w1DHc/5aR5O286uFVgFiyUylIEZvORs?=
 =?us-ascii?Q?hA84ukTdZ1hypVvFOKxzMwQfx5JRFnxKCdSF70j+E46VfnK6F9De955h7vFa?=
 =?us-ascii?Q?ke8B9JF9bNHoMrGzbQ1sBe3FGsISfGcVziTt7O8yFHZAwQTd19dyPbWYb3je?=
 =?us-ascii?Q?BqE3l7GfQJIIo7POP1ug++zkS2KcYtq+bgAi8P3oGwtOaGOn77bSskH1VbMM?=
 =?us-ascii?Q?Maymrat16EZcNGZaInrdySOhGLEWydh5rCD9JuCl3rCOSmyan8Wt5kGwuhkY?=
 =?us-ascii?Q?Fs+54qk0n+l0A7ygMT/sFs6usJpPduO/b5OToo2qC8TYWeuUSvDEpd0hoYO8?=
 =?us-ascii?Q?NUKyv123s8Pp42n7IAtrm35OI44CmPZ4UAUQn08c0UBvwXoX4FsCDHw63ZU7?=
 =?us-ascii?Q?QbHPZRufDyEaOb8Qm7wLX6goIVSjwKazHi4saBL31i36M5NRVNuxAIOKLF0e?=
 =?us-ascii?Q?Js748Rp8kYEjTZaklxnYmx83cx1ewWaUqXfKuyq/eYsZxjx2wsXpKbh6W9oj?=
 =?us-ascii?Q?ENQTOislabQH9FfHOpOfhvfagWrTTsdxsCh9oeAvtZTP6x4VmePFFLdE9rhg?=
 =?us-ascii?Q?ZMmViG47WAaSNgu4Njbfs/LApo+W9NEC/t52voMhzZvrdpCnC2207jcjnLNb?=
 =?us-ascii?Q?O2pilNwTUvGR0Mkcv8w7Qp3rlqyYc2b44qB63haiOE3klouRVmZ265WdPQWn?=
 =?us-ascii?Q?HrMQrs7uv5Xf9PG/QCQ+c+E8VMHYRlwlNjp2u0JHHR6/6s5uvqMItszI4kzk?=
 =?us-ascii?Q?9esJVYuJRTCUWaYC9jDTk2u7YnGHbXKP++SLwQP+xN8qQfB/ERmfRe/v9zn2?=
 =?us-ascii?Q?rwCPMILc1t9xO0T7qUiXhisW+jr+GcZSReMLQha68DIJ3A/b3xxS7AiTa4Am?=
 =?us-ascii?Q?O7f4kIgiPsQjY6uJiSxPoXoNIZV1z5MItjnVCBeBv7wfWoPmf+Pl3p+7MJjY?=
 =?us-ascii?Q?wjOlJrB5dJg9l5x5OXExctkO/kWwa+r/MlQiyznhc7BmnAtfQaegn834OQ7h?=
 =?us-ascii?Q?26AAl5Qm83j47s40GPW29gR1XdFf+qavfz6b5DL4fKX8+kRh4U/tJTqUv18x?=
 =?us-ascii?Q?kEGxRaSMRLb6nmJiB3LfSo7tYfw1hDE/QK8mS96kckY2dWuu9XTf1tMGwr7u?=
 =?us-ascii?Q?s6JpAuFjCOB2V8wIBZUuz+4vm5IVdvgW5WJOIIDFGFHb9PsJW/7neXxqk1LT?=
 =?us-ascii?Q?ZYh6MAsjaIAhRvH5dvZ0bgwNkZH21z8aKMeQXGqIfI5xwRgaplfLUAfz6X76?=
 =?us-ascii?Q?VA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09fca7fa-bb0e-4a96-6ee0-08dce7e25662
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 21:44:07.7134 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l1Aps+1cpROUnjcg8wr/8Xxbqzv4mGObDp0pfVHIKK98J13cDoukIoPastTRijIHZSP3uKAllRjIHwrQv5Qr1920dkHHGpiHXxySl7dJlAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6667
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

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Nirmoy D=
as
Sent: Tuesday, October 8, 2024 1:22 PM
To: igt-dev@lists.freedesktop.org
Cc: Das, Nirmoy <nirmoy.das@intel.com>; kamil.konieczny@linux.intel.com; Ch=
, Sai Gowtham <sai.gowtham.ch@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_tlb: Print tlb inval counts on failur=
e
>=20
> Print tlb inval counts on failure with igt_assert_lt_u64()
>=20
> Cc: kamil.konieczny@linux.intel.com
> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Sounds good to me!

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  tests/intel/xe_tlb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_tlb.c b/tests/intel/xe_tlb.c
> index 8104e45d8..15d89931c 100644
> --- a/tests/intel/xe_tlb.c
> +++ b/tests/intel/xe_tlb.c
> @@ -116,7 +116,7 @@ static void tlb_invalidation(int fd, struct drm_xe_en=
gine_class_instance *eci)
>  	tlb_pos =3D xe_gt_stats_get_count(fd, eci->gt_id, stat);
>  	igt_assert_eq(data1->data, value1);
>  	igt_assert_eq(data2->data, value2);
> -	igt_assert(tlb_pos > tlb_pre);
> +	igt_assert_lt_u64(tlb_pre, tlb_pos);
> =20
>  	syncobj_destroy(fd, sync[0].handle);
>  	syncobj_destroy(fd, syncobj);
> --=20
> 2.46.0
>=20
>=20
