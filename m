Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8F5E77199
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jan 2025 22:58:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494E410EA3A;
	Mon,  6 Jan 2025 22:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OlhG/BWN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B524C10E0E8
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jan 2025 22:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736204324; x=1767740324;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0ieTwopwqFAhNOu/TLmTuR0Z1vyYd5zGStTADxBOzK0=;
 b=OlhG/BWNevRSGBNfSwYeL47kZAFLHqIStvNxVAvgHXj036PxCxLn3Qkl
 qykzqzAO5t6annYJ49VrqAb/iARODhQYZlGX3jvkTl+vjOmcWKI1F6TRh
 3UHvgGwl6zVDVmJVVnma6LOHDP0dvBtmshXemkpdJ8aeL4dhRT8INil4X
 meBbLTXxf1JdFQ16TxgSjSmhSacijY7YxqrRDAza6bspVbnyumcCI9VKP
 7cvs3DuXpouc8L3j5sYwkTzY4Q/mwlKcb3iTlNkStUDDDKkSqcDUwJcRH
 CkKlso/NP7rIwsFpazm1vzCB5nWfNTVul+xhTZcMN7c0BzGpYtmB+9PNk A==;
X-CSE-ConnectionGUID: AbRCBBBbTp2ag8Ie2rnmrg==
X-CSE-MsgGUID: bX50JbQhT8eoGAQQkPtHNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36479813"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="36479813"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 14:58:44 -0800
X-CSE-ConnectionGUID: arV2wtGsQruIPtI84iw44A==
X-CSE-MsgGUID: VVUE2dNHTPG4GgycS/OosA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102440232"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jan 2025 14:58:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 6 Jan 2025 14:58:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 6 Jan 2025 14:58:43 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 6 Jan 2025 14:58:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQMmfQgwA+qIoJhNVsKU1bQpc3udYK6E0xaV56GWXgIz+/zX0n4r4HpvM6oFapJD7V0gO5Yz5WdPtAklp9TLG4jiQElVr23ULgFM23s/1T/fSluJaBZw8kOWjIesbE3ne5YPs5FNSI0cce/446Ujgd+dPP/K1q4ly00T2qSehsLVnLBdBTRVUAF8yBfuaZHAUH4oFT6yZeLnN/iagcY7/VK9v266y29JzprshhNI9MIImPndNxqWe/c/vX3XQydnxQr8BFYkEazQC/UlxtVFpFhJOgYV19s68Z1U7xH534ret0rW7YmL7yg08kwwOQ1jkZarF4prVAGvUD/jdMKLiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajMyTrF9edI0ZvxpqCEWNa1FQfFuuJov9fXARx5/r/k=;
 b=jOTVWM/TbNvTPWS4+xb/Op0dWz9vx7O1Dnb3Lo9K/3TOy3pHBRrT86sgTB96+9mKrZeLLWqBazTVSkyKM9SG95CqezbBVNK2NI9sNwVpoi91b6B3bNUsTZwBBFKe7ssq3WRYjDACPlVb8T0iT+HYwYgimGy81pYmxJjn1OS1cE9nhhkE8INloVBv/jjx+8/8DjDy19luKb7RN5sDP4Co+qE/0egGXV2bUccbuYmsDaz+kK+gNxksKHXgI1lIq/MKW4ggUkMdktTsmNSzPHsjDR71M5jXlkt46+vxYBfmw2niCXa4veXozZ9VjQEw/u8a50LdCWdPmDVzfMApvJkTmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA0PR11MB4622.namprd11.prod.outlook.com (2603:10b6:806:9c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 22:58:31 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8314.018; Mon, 6 Jan 2025
 22:58:31 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 7/8] treewide: s/ctx/cork/ when referring to xe_cork
Thread-Topic: [PATCH i-g-t 7/8] treewide: s/ctx/cork/ when referring to xe_cork
Thread-Index: AQHbXniPN4EvvRaXu0uq3yBpXL1e5bMKVjWQ
Date: Mon, 6 Jan 2025 22:58:30 +0000
Message-ID: <CH0PR11MB5444BA289824CB7856268D2EE5102@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250104071548.737612-1-lucas.demarchi@intel.com>
 <20250104071548.737612-7-lucas.demarchi@intel.com>
In-Reply-To: <20250104071548.737612-7-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA0PR11MB4622:EE_
x-ms-office365-filtering-correlation-id: d1a18e67-233d-4810-274b-08dd2ea5a3d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?pWtEE5WRt/vDDgaqtcSZrcayqL83F2jTwyBD5qrNRrOEYSTz/DU7wSQdZWVJ?=
 =?us-ascii?Q?sEZDLW2fHRqGG8EbUvNA960f4loCX+2/g8t4DWMJrha/5WvJF9UmSy7nvbcx?=
 =?us-ascii?Q?aCRLrxNmA0CqrmaFDGJItOjJUvGcsCetC3TQv9V0f4p8jLBtSRnIB+AcDi8v?=
 =?us-ascii?Q?7ZcTxLHXgyGkpFw+zShY+Dl2WqJ5r33mnE/8WD8UVP08Yzxz/ljVWpuxhrKv?=
 =?us-ascii?Q?i7Ns1EOYABOfojUBq7UMwHLOnhg49ZfY/J0WzXLFGSSI1VtwYTK93t4EqNlg?=
 =?us-ascii?Q?HTeYlvWjMB7l2kmTJRbdVgko86R1eXYEni2CAdQNxbYWzSy5dyrTNYtNjFxH?=
 =?us-ascii?Q?tmN+1xM/phQR3SFL19BxJaH9DEP6hKkRr4oFgjmtw4K83sk10uKMUWVLjnW3?=
 =?us-ascii?Q?99tBmrJJ9LfLphpzGQNIvYIQeDyMEb0Yr6sLkCJ4FDl9TsOZrNesjOujGUXl?=
 =?us-ascii?Q?ZT4xCYYYNgbYvRDCTrd0sfnR33Xs1R3nsvA7WS98Dg4/nrW7Huy0GR6g/XmB?=
 =?us-ascii?Q?8Uj8FIgjV3sJhWhceOjzyzhpxhQkebLeS1CCYJYBpXGZTQMYaPepef7OjUKw?=
 =?us-ascii?Q?u3fdc1lQmjXyjQ4vCvIk+5Zb5YeQvaz4VGJsyljAiHKclVKFeaR9eyiJ+f2f?=
 =?us-ascii?Q?RBwDNm2I0aM6vlRts64ii308GZfLhcLZMEg9/+Y8YGOBeyFvWTMbWdx/+gUf?=
 =?us-ascii?Q?WyRgrFYUpPYQTYHZjI25Aun884mjXq3SD5/yXqdthOaVFj9intafkXPWt6Zm?=
 =?us-ascii?Q?BVF+ccDkMfjNM5JrCP6E2HYbCdHC/wOYQQ76m5Zqkc6qoarrFoGhCIdvjHft?=
 =?us-ascii?Q?ZZbF73Wc6cz1MH5Oz09Il248L/gbpxWFVnVi2bExgmLfKwQh5mQmiDoA4KAB?=
 =?us-ascii?Q?FrUx9Echc9dPxEDVl42XWY1PufFrjJa+EXO5bviVahmO0v9FgU8Q32yY4LcC?=
 =?us-ascii?Q?pDA5cFtbEav/RU1Wd4oaLgb3o76WsbTfghDn1CWnupzREryIjKdyxlI9V8eV?=
 =?us-ascii?Q?M97Elr6OGsJ4+f4V1FvyRwuhZ6FnswJ/g5JjmhlsopzRJSygXsRLiKSsxeZz?=
 =?us-ascii?Q?Wvf7v7t4pgoIZCUXN9ZSQSHekpqyO3Gd6+9mLqAwze69C10Non7GU5xPzpZi?=
 =?us-ascii?Q?b9AsZw9AzzUYtaPHNwhXgm57H4uAxwkEhvVHUdboaabfBP3AYl5gFeeB7ILb?=
 =?us-ascii?Q?rNiCCKi6euh47XDyoNye3akaEqSqv/t+yRFppTNpci6+SoM7NrmOg6ZAE/gD?=
 =?us-ascii?Q?qNQnrcdtZqh/j1bL7oSPrFacwOrwRWfeEsWzC6BBF1kKuiC7e/tOyPpZT8n7?=
 =?us-ascii?Q?lKfrouiP3KmdWHKLPSE39TfCft3KIwKS4Fvl8+1RT4DK0bkNM69wGjQDUfuz?=
 =?us-ascii?Q?rZEyuoI8nzjdOQ2Ydqf7v2rXvONz+J22dkxA9yBGcmPVPkPPIIw+Y3/dnmbZ?=
 =?us-ascii?Q?KKKTxQ2KjtJZ83GwVAGSbhL+K7v+pYOU?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?czojwt8beZJFSgSJFNW5ox7ZzC0R3c/E4kVY+bDXrl57fmJaH20xME/OV1H9?=
 =?us-ascii?Q?w2DIBY8HN7N3+aj6dUGum2BIyN+G7WeMFUHp0WjZObg0aZh3cSj/9L0tRCs5?=
 =?us-ascii?Q?H0kPz9/AoeX6zogpbH1cesABGkBwKvRLDzMtheg6S0Gyjz7GAU7/Z/U6XNzZ?=
 =?us-ascii?Q?HxT3zpNu8no+ejEIItNDH15IIr0HFPl65otm+7drz2A/ap2In0CCmBk29pLv?=
 =?us-ascii?Q?rxlxOWW09IWzfLLoF3XwKESvqXcAsdt5qqLBC88WnWlF6/ZULI3bguWzXW40?=
 =?us-ascii?Q?f39KArhKvseGBj/pIhPxMDfcUcP4iQmizxTgBzxEH27lvcfhV70pJWdz6gBZ?=
 =?us-ascii?Q?qJiTl8JxWP2pYUPTjE2REUM1ubAGWpZD1uae80gJZW2Q9uR/CPJ3PfY1QaZw?=
 =?us-ascii?Q?wsWWL2sEoDArW5PxDovlC5Gh6Sk4Vy9i/WlDOhhvK/l66/X2qKbPL9FTICDH?=
 =?us-ascii?Q?Y240evVdZ8w3eQJaRRwtTYaj6xd8FS82d86cEujDjWDVbx/HSJ+hOxDAnJTD?=
 =?us-ascii?Q?s12eBTEpvWX7J63kmJop3ykChJojWeYaaq6+I6ei7pP8xxqpd6cXof2dS9O4?=
 =?us-ascii?Q?1yX55EuGTi84w/cB8HVIjn2V1sosetEtHOZhUcOz/kY2q23QT1vT+wtthDFP?=
 =?us-ascii?Q?N5ioebUUHaeoAyVLkRDhQ/xripkzxXv63Kai8YuoGEURRgQdJ24ATJ7QWv1j?=
 =?us-ascii?Q?n13ByFMq9ApEL+8aJ+GPlBT/eMMd/6QwOoJilbKlWbeVBCJRnKegF20NVNHf?=
 =?us-ascii?Q?MKXthVPMzCasG3HqN/ilu04zQWIQX5SXw16pEy6ZlIHiv4UcgfIopc2q+ywP?=
 =?us-ascii?Q?DU36RfkYpe0PblrDuMoeU9xefjG9uSzUhWEN5o1q+gc8RjFsSQrexbl1rsyb?=
 =?us-ascii?Q?ZLXL4l8yssO3anoLehD57Msfxgcimb/44rcmwHHsvL9tVzNadcgjcbBS/XCN?=
 =?us-ascii?Q?+B5DY1592KVT4mEigMOxjVavs3MFY4MZHHC1WLfn/Sfygh33P0hyVPShZNuH?=
 =?us-ascii?Q?Vo6uxc7rtpdBWv58YAz9vcINFA8jU5c09+iHuHSkNZ4kn1wdyAcLh9SjhB79?=
 =?us-ascii?Q?ugnOzX4E32EsctW13fenu7Jsevj4Yqz+EcycUX3uXKrIz/xCM74yMo1am+aH?=
 =?us-ascii?Q?strSbGI2v+7s4oRP2+e0e7GvyCDYyisDzmU5z/FhZNsCInmXW/3D+fUb2J4y?=
 =?us-ascii?Q?chRZcZxAk7b7Kg6zFx3vdbSctNfaSFQwMTeiDHuBG1zOz8qX4We9GBnEeN51?=
 =?us-ascii?Q?HQ+/z6gWonyhndynvmqdUIWYFkAyxkAmcGVxYnNfVmfSIHocdLvcGQhjFdi5?=
 =?us-ascii?Q?yd4xuOgYTM6LBv7k+L4eBo4s7Sy8Y7OU/QcsZkYpERF2CaGPsxqd84bRKTF3?=
 =?us-ascii?Q?FQrIO1c2TMHyYmDzInzWexbrxyUTmJNizmAxuhty8qY4597DxWfCl/I5+6IU?=
 =?us-ascii?Q?u6xfxtNU230a1zs6vYsShvGhwu6xSezPbS4dKEK/WshmjDVtBda8/PyeA3bS?=
 =?us-ascii?Q?6GgdS5+Fl4IANEOsWIxxKnm5iue9GuDPjgye8kX//kaRRe8dXbOJ6gEtkvQ9?=
 =?us-ascii?Q?YSVxGsQ6/lwDiq7dKZsULl3mjdxKVaNak77MwwDe?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a18e67-233d-4810-274b-08dd2ea5a3d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 22:58:30.9516 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +6mZmgQjIVCK49SWGwaR3VC3xSt0rB/Pm/r6eRv4PwECUq/i8sB84qtZH7zK9LY0w2+8RxFBC7nfwj7nXsxsMUoTrBAH8a7CcVzN/huWnS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4622
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Lucas De=
 Marchi
Sent: Friday, January 3, 2025 11:16 PM
To: igt-dev@lists.freedesktop.org
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 7/8] treewide: s/ctx/cork/ when referring to xe_cork
>=20
> Commit 2feb1d6718a1 ("lib/xe/xe_spin: move the spinner related functions
> to lib") extracted the spin_ctx abstraction from xe_drm_fdinfo to be
> re-used in other places as part of the xe_cork. Complement it by also
> renaming the variable s/ctx/cork/ when referring to struct xe_cork.
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

By the way, this RB also applies to the inevitable rebase that this will
require after commit c982ba23a3 ("tests/intel/xe_drm_fdinfo: Do not end NUL=
L xe_cork")
landed.

-Jonathan Cavitt

> ---
>  lib/xe/xe_spin.c            | 158 ++++++++++++++++++------------------
>  tests/intel/xe_drm_fdinfo.c |  74 ++++++++---------
>  tests/intel/xe_spin_batch.c |  14 ++--
>  tests/intel/xe_vm.c         |  12 +--
>  4 files changed, 129 insertions(+), 129 deletions(-)
>=20
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index bb6318cef..0de0b1f2e 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -291,148 +291,148 @@ xe_cork_create(int fd, struct drm_xe_engine_class=
_instance *hwe,
>  		uint32_t vm, uint16_t width, uint16_t num_placements,
>  		struct xe_cork_opts *opts)
>  {
> -	struct xe_cork *ctx =3D calloc(1, sizeof(*ctx));
> +	struct xe_cork *cork =3D calloc(1, sizeof(*cork));
> =20
> -	igt_assert(ctx);
> +	igt_assert(cork);
>  	igt_assert(width && num_placements &&
>  		   (width =3D=3D 1 || num_placements =3D=3D 1));
>  	igt_assert_lt(width, XE_MAX_ENGINE_INSTANCE);
> =20
> -	ctx->class =3D hwe->engine_class;
> -	ctx->width =3D width;
> -	ctx->num_placements =3D num_placements;
> -	ctx->vm =3D vm;
> -	ctx->cork_opts =3D *opts;
> -
> -	ctx->exec.num_batch_buffer =3D width;
> -	ctx->exec.num_syncs =3D 2;
> -	ctx->exec.syncs =3D to_user_pointer(ctx->sync);
> -
> -	ctx->sync[0].type =3D DRM_XE_SYNC_TYPE_SYNCOBJ;
> -	ctx->sync[0].flags =3D DRM_XE_SYNC_FLAG_SIGNAL;
> -	ctx->sync[0].handle =3D syncobj_create(fd, 0);
> -
> -	ctx->sync[1].type =3D DRM_XE_SYNC_TYPE_SYNCOBJ;
> -	ctx->sync[1].flags =3D DRM_XE_SYNC_FLAG_SIGNAL;
> -	ctx->sync[1].handle =3D syncobj_create(fd, 0);
> -
> -	ctx->bo_size =3D sizeof(struct xe_spin);
> -	ctx->bo_size =3D xe_bb_size(fd, ctx->bo_size);
> -	ctx->bo =3D xe_bo_create(fd, ctx->vm, ctx->bo_size,
> -			       vram_if_possible(fd, hwe->gt_id),
> -			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -	if (ctx->cork_opts.ahnd) {
> +	cork->class =3D hwe->engine_class;
> +	cork->width =3D width;
> +	cork->num_placements =3D num_placements;
> +	cork->vm =3D vm;
> +	cork->cork_opts =3D *opts;
> +
> +	cork->exec.num_batch_buffer =3D width;
> +	cork->exec.num_syncs =3D 2;
> +	cork->exec.syncs =3D to_user_pointer(cork->sync);
> +
> +	cork->sync[0].type =3D DRM_XE_SYNC_TYPE_SYNCOBJ;
> +	cork->sync[0].flags =3D DRM_XE_SYNC_FLAG_SIGNAL;
> +	cork->sync[0].handle =3D syncobj_create(fd, 0);
> +
> +	cork->sync[1].type =3D DRM_XE_SYNC_TYPE_SYNCOBJ;
> +	cork->sync[1].flags =3D DRM_XE_SYNC_FLAG_SIGNAL;
> +	cork->sync[1].handle =3D syncobj_create(fd, 0);
> +
> +	cork->bo_size =3D sizeof(struct xe_spin);
> +	cork->bo_size =3D xe_bb_size(fd, cork->bo_size);
> +	cork->bo =3D xe_bo_create(fd, cork->vm, cork->bo_size,
> +				vram_if_possible(fd, hwe->gt_id),
> +				DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	if (cork->cork_opts.ahnd) {
>  		for (unsigned int i =3D 0; i < width; i++)
> -			ctx->addr[i] =3D intel_allocator_alloc_with_strategy(ctx->cork_opts.a=
hnd,
> -					ctx->bo, ctx->bo_size, 0,
> +			cork->addr[i] =3D intel_allocator_alloc_with_strategy(cork->cork_opts=
.ahnd,
> +					cork->bo, cork->bo_size, 0,
>  					ALLOC_STRATEGY_LOW_TO_HIGH);
>  	} else {
>  		for (unsigned int i =3D 0; i < width; i++)
> -			ctx->addr[i] =3D 0x100000 + 0x100000 * hwe->engine_class;
> +			cork->addr[i] =3D 0x100000 + 0x100000 * hwe->engine_class;
>  	}
> =20
> -	ctx->spin =3D xe_bo_map(fd, ctx->bo, ctx->bo_size);
> +	cork->spin =3D xe_bo_map(fd, cork->bo, cork->bo_size);
> =20
> -	igt_assert_eq(__xe_exec_queue_create(fd, ctx->vm, width, num_placements=
,
> -					     hwe, 0, &ctx->exec_queue), 0);
> +	igt_assert_eq(__xe_exec_queue_create(fd, cork->vm, width, num_placement=
s,
> +					     hwe, 0, &cork->exec_queue), 0);
> =20
> -	xe_vm_bind_async(fd, ctx->vm, 0, ctx->bo, 0, ctx->addr[0], ctx->bo_size=
,
> -			 ctx->sync, 1);
> +	xe_vm_bind_async(fd, cork->vm, 0, cork->bo, 0, cork->addr[0], cork->bo_=
size,
> +			 cork->sync, 1);
> =20
> -	return ctx;
> +	return cork;
>  }
> =20
>  /**
>   * xe_cork_sync_start:
>   *
>   * @fd: xe device fd
> - * @ctx: pointer to xe_cork structure
> + * @cork: pointer to xe_cork structure
>   *
>   * run the spinner using xe_spin_init submit batch using xe_exec
>   * and wait for fence using syncobj_wait
>   */
> -void xe_cork_sync_start(int fd, struct xe_cork *ctx)
> +void xe_cork_sync_start(int fd, struct xe_cork *cork)
>  {
> -	igt_assert(ctx);
> +	igt_assert(cork);
> =20
> -	ctx->spin_opts.addr =3D ctx->addr[0];
> -	ctx->spin_opts.write_timestamp =3D true;
> -	ctx->spin_opts.preempt =3D true;
> -	xe_spin_init(ctx->spin, &ctx->spin_opts);
> +	cork->spin_opts.addr =3D cork->addr[0];
> +	cork->spin_opts.write_timestamp =3D true;
> +	cork->spin_opts.preempt =3D true;
> +	xe_spin_init(cork->spin, &cork->spin_opts);
> =20
>  	/* reuse sync[0] as in-fence for exec */
> -	ctx->sync[0].flags &=3D ~DRM_XE_SYNC_FLAG_SIGNAL;
> +	cork->sync[0].flags &=3D ~DRM_XE_SYNC_FLAG_SIGNAL;
> =20
> -	ctx->exec.exec_queue_id =3D ctx->exec_queue;
> +	cork->exec.exec_queue_id =3D cork->exec_queue;
> =20
> -	if (ctx->width > 1)
> -		ctx->exec.address =3D to_user_pointer(ctx->addr);
> +	if (cork->width > 1)
> +		cork->exec.address =3D to_user_pointer(cork->addr);
>  	else
> -		ctx->exec.address =3D ctx->addr[0];
> +		cork->exec.address =3D cork->addr[0];
> =20
> -	xe_exec(fd, &ctx->exec);
> +	xe_exec(fd, &cork->exec);
> =20
> -	xe_spin_wait_started(ctx->spin);
> -	igt_assert(!syncobj_wait(fd, &ctx->sync[1].handle, 1, 1, 0, NULL));
> +	xe_spin_wait_started(cork->spin);
> +	igt_assert(!syncobj_wait(fd, &cork->sync[1].handle, 1, 1, 0, NULL));
> =20
> -	if (ctx->cork_opts.debug)
> -		igt_info("%d: spinner started\n", ctx->class);
> +	if (cork->cork_opts.debug)
> +		igt_info("%d: spinner started\n", cork->class);
>  }
> =20
>  /*
>   * xe_cork_sync_end
>   *
>   * @fd: xe device fd
> - * @ctx: pointer to xe_cork structure
> + * @cork: pointer to xe_cork structure
>   *
>   * Wrapper to end spinner created by xe_cork_create. It will
>   * unbind the vm which was binded to the exec_queue and bo.
>   */
> -void xe_cork_sync_end(int fd, struct xe_cork *ctx)
> +void xe_cork_sync_end(int fd, struct xe_cork *cork)
>  {
> -	igt_assert(ctx);
> +	igt_assert(cork);
> =20
> -	if (ctx->ended)
> -		igt_warn("Don't attempt call end twice %d\n", ctx->ended);
> +	if (cork->ended)
> +		igt_warn("Don't attempt call end twice %d\n", cork->ended);
> =20
> -	xe_spin_end(ctx->spin);
> +	xe_spin_end(cork->spin);
> =20
> -	igt_assert(syncobj_wait(fd, &ctx->sync[1].handle, 1, INT64_MAX, 0, NULL=
));
> +	igt_assert(syncobj_wait(fd, &cork->sync[1].handle, 1, INT64_MAX, 0, NUL=
L));
> =20
> -	ctx->sync[0].flags |=3D DRM_XE_SYNC_FLAG_SIGNAL;
> -	syncobj_reset(fd, &ctx->sync[0].handle, 1);
> +	cork->sync[0].flags |=3D DRM_XE_SYNC_FLAG_SIGNAL;
> +	syncobj_reset(fd, &cork->sync[0].handle, 1);
> =20
> -	xe_vm_unbind_async(fd, ctx->vm, 0, 0, ctx->addr[0], ctx->bo_size, ctx->=
sync, 1);
> -	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL=
));
> +	xe_vm_unbind_async(fd, cork->vm, 0, 0, cork->addr[0], cork->bo_size, co=
rk->sync, 1);
> +	igt_assert(syncobj_wait(fd, &cork->sync[0].handle, 1, INT64_MAX, 0, NUL=
L));
> =20
> -	ctx->ended =3D true;
> +	cork->ended =3D true;
> =20
> -	if (ctx->cork_opts.debug)
> -		igt_info("%d: spinner ended (timestamp=3D%u)\n", ctx->class,
> -			ctx->spin->timestamp);
> +	if (cork->cork_opts.debug)
> +		igt_info("%d: spinner ended (timestamp=3D%u)\n", cork->class,
> +			cork->spin->timestamp);
>  }
> =20
>  /*
>   * xe_cork_destroy
>   *
>   * @fd: xe device fd
> - * @ctx: pointer to xe_cork structure
> + * @cork: pointer to xe_cork structure
>   *
> - * It will destroy vm, exec_queue and free the ctx.
> + * It will destroy vm, exec_queue and free the cork.
>   */
> -void xe_cork_destroy(int fd, struct xe_cork *ctx)
> +void xe_cork_destroy(int fd, struct xe_cork *cork)
>  {
> -	igt_assert(ctx);
> +	igt_assert(cork);
> =20
> -	syncobj_destroy(fd, ctx->sync[0].handle);
> -	syncobj_destroy(fd, ctx->sync[1].handle);
> -	xe_exec_queue_destroy(fd, ctx->exec_queue);
> +	syncobj_destroy(fd, cork->sync[0].handle);
> +	syncobj_destroy(fd, cork->sync[1].handle);
> +	xe_exec_queue_destroy(fd, cork->exec_queue);
> =20
> -	if (ctx->cork_opts.ahnd)
> -		intel_allocator_free(ctx->cork_opts.ahnd, ctx->bo);
> +	if (cork->cork_opts.ahnd)
> +		intel_allocator_free(cork->cork_opts.ahnd, cork->bo);
> =20
> -	munmap(ctx->spin, ctx->bo_size);
> -	gem_close(fd, ctx->bo);
> +	munmap(cork->spin, cork->bo_size);
> +	gem_close(fd, cork->bo);
> =20
> -	free(ctx);
> +	free(cork);
>  }
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index f4264aadb..1089e5119 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -410,7 +410,7 @@ utilization_single(int fd, struct drm_xe_engine_class=
_instance *hwe, unsigned in
>  {
>  	struct pceu_cycles pceu1[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>  	struct pceu_cycles pceu2[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
> -	struct xe_cork *ctx =3D NULL;
> +	struct xe_cork *cork =3D NULL;
>  	enum expected_load expected_load;
>  	uint32_t vm;
>  	int new_fd;
> @@ -420,8 +420,8 @@ utilization_single(int fd, struct drm_xe_engine_class=
_instance *hwe, unsigned in
> =20
>  	vm =3D xe_vm_create(fd, 0, 0);
>  	if (flags & TEST_BUSY) {
> -		ctx =3D xe_cork_create_opts(fd, hwe, vm, 1, 1);
> -		xe_cork_sync_start(fd, ctx);
> +		cork =3D xe_cork_create_opts(fd, hwe, vm, 1, 1);
> +		xe_cork_sync_start(fd, cork);
>  	}
> =20
>  	read_engine_cycles(fd, pceu1[0]);
> @@ -430,7 +430,7 @@ utilization_single(int fd, struct drm_xe_engine_class=
_instance *hwe, unsigned in
> =20
>  	usleep(batch_duration_usec);
>  	if (flags & TEST_TRAILING_IDLE)
> -		xe_cork_sync_end(fd, ctx);
> +		xe_cork_sync_end(fd, cork);
> =20
>  	read_engine_cycles(fd, pceu2[0]);
>  	if (flags & TEST_ISOLATION)
> @@ -449,8 +449,8 @@ utilization_single(int fd, struct drm_xe_engine_class=
_instance *hwe, unsigned in
>  		close(new_fd);
>  	}
> =20
> -	if (flags & TEST_BUSY)
> -		xe_cork_destroy(fd, ctx);
> +	if (cork)
> +		xe_cork_destroy(fd, cork);
> =20
>  	xe_vm_destroy(fd, vm);
>  }
> @@ -460,19 +460,19 @@ utilization_single_destroy_queue(int fd, struct drm=
_xe_engine_class_instance *hw
>  {
>  	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>  	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
> -	struct xe_cork *ctx =3D NULL;
> +	struct xe_cork *cork;
>  	uint32_t vm;
> =20
>  	vm =3D xe_vm_create(fd, 0, 0);
> -	ctx =3D xe_cork_create_opts(fd, hwe, vm, 1, 1);
> -	xe_cork_sync_start(fd, ctx);
> +	cork =3D xe_cork_create_opts(fd, hwe, vm, 1, 1);
> +	xe_cork_sync_start(fd, cork);
> =20
>  	read_engine_cycles(fd, pceu1);
>  	usleep(batch_duration_usec);
> =20
>  	/* destroy queue before sampling again */
> -	xe_cork_sync_end(fd, ctx);
> -	xe_cork_destroy(fd, ctx);
> +	xe_cork_sync_end(fd, cork);
> +	xe_cork_destroy(fd, cork);
> =20
>  	read_engine_cycles(fd, pceu2);
> =20
> @@ -486,17 +486,17 @@ utilization_others_idle(int fd, struct drm_xe_engin=
e_class_instance *hwe)
>  {
>  	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>  	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
> -	struct xe_cork *ctx =3D NULL;
> +	struct xe_cork *cork;
>  	uint32_t vm;
>  	int class;
> =20
>  	vm =3D xe_vm_create(fd, 0, 0);
> -	ctx =3D xe_cork_create_opts(fd, hwe, vm, 1, 1);
> -	xe_cork_sync_start(fd, ctx);
> +	cork =3D xe_cork_create_opts(fd, hwe, vm, 1, 1);
> +	xe_cork_sync_start(fd, cork);
> =20
>  	read_engine_cycles(fd, pceu1);
>  	usleep(batch_duration_usec);
> -	xe_cork_sync_end(fd, ctx);
> +	xe_cork_sync_end(fd, cork);
>  	read_engine_cycles(fd, pceu2);
> =20
>  	xe_for_each_engine_class(class) {
> @@ -506,7 +506,7 @@ utilization_others_idle(int fd, struct drm_xe_engine_=
class_instance *hwe)
>  		check_results(pceu1, pceu2, class, 1, expected_load);
>  	}
> =20
> -	xe_cork_destroy(fd, ctx);
> +	xe_cork_destroy(fd, cork);
>  	xe_vm_destroy(fd, vm);
>  }
> =20
> @@ -515,7 +515,7 @@ utilization_others_full_load(int fd, struct drm_xe_en=
gine_class_instance *hwe)
>  {
>  	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>  	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
> -	struct xe_cork *ctx[DRM_XE_ENGINE_CLASS_COMPUTE + 1] =3D {};
> +	struct xe_cork *cork[DRM_XE_ENGINE_CLASS_COMPUTE + 1] =3D {};
>  	struct drm_xe_engine_class_instance *_hwe;
>  	uint32_t vm;
>  	int class;
> @@ -526,17 +526,17 @@ utilization_others_full_load(int fd, struct drm_xe_=
engine_class_instance *hwe)
>  	xe_for_each_engine(fd, _hwe) {
>  		int _class =3D _hwe->engine_class;
> =20
> -		if (_class =3D=3D hwe->engine_class || ctx[_class])
> +		if (_class =3D=3D hwe->engine_class || cork[_class])
>  			continue;
> -		ctx[_class] =3D xe_cork_create_opts(fd, _hwe, vm, 1, 1);
> -		xe_cork_sync_start(fd, ctx[_class]);
> +		cork[_class] =3D xe_cork_create_opts(fd, _hwe, vm, 1, 1);
> +		xe_cork_sync_start(fd, cork[_class]);
>  	}
> =20
>  	read_engine_cycles(fd, pceu1);
>  	usleep(batch_duration_usec);
>  	xe_for_each_engine_class(class)
> -		if (ctx[class])
> -			xe_cork_sync_end(fd, ctx[class]);
> +		if (cork[class])
> +			xe_cork_sync_end(fd, cork[class]);
> =20
>  	read_engine_cycles(fd, pceu2);
> =20
> @@ -544,11 +544,11 @@ utilization_others_full_load(int fd, struct drm_xe_=
engine_class_instance *hwe)
>  		enum expected_load expected_load =3D hwe->engine_class =3D=3D class ?
>  			EXPECTED_LOAD_IDLE : EXPECTED_LOAD_FULL;
> =20
> -		if (!ctx[class])
> +		if (!cork[class])
>  			continue;
> =20
>  		check_results(pceu1, pceu2, class, 1, expected_load);
> -		xe_cork_destroy(fd, ctx[class]);
> +		xe_cork_destroy(fd, cork[class]);
>  	}
> =20
>  	xe_vm_destroy(fd, vm);
> @@ -559,7 +559,7 @@ utilization_all_full_load(int fd)
>  {
>  	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>  	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
> -	struct xe_cork *ctx[DRM_XE_ENGINE_CLASS_COMPUTE + 1] =3D {};
> +	struct xe_cork *cork[DRM_XE_ENGINE_CLASS_COMPUTE + 1] =3D {};
>  	struct drm_xe_engine_class_instance *hwe;
>  	uint32_t vm;
>  	int class;
> @@ -569,24 +569,24 @@ utilization_all_full_load(int fd)
>  	/* spin on one hwe per class */
>  	xe_for_each_engine(fd, hwe) {
>  		class =3D hwe->engine_class;
> -		if (ctx[class])
> +		if (cork[class])
>  			continue;
> -		ctx[class] =3D xe_cork_create_opts(fd, hwe, vm, 1, 1);
> -		xe_cork_sync_start(fd, ctx[class]);
> +		cork[class] =3D xe_cork_create_opts(fd, hwe, vm, 1, 1);
> +		xe_cork_sync_start(fd, cork[class]);
>  	}
> =20
>  	read_engine_cycles(fd, pceu1);
>  	usleep(batch_duration_usec);
>  	xe_for_each_engine_class(class)
> -		xe_cork_sync_end(fd, ctx[class]);
> +		xe_cork_sync_end(fd, cork[class]);
>  	read_engine_cycles(fd, pceu2);
> =20
>  	xe_for_each_engine_class(class) {
> -		if (!ctx[class])
> +		if (!cork[class])
>  			continue;
> =20
>  		check_results(pceu1, pceu2, class, 1, EXPECTED_LOAD_FULL);
> -		xe_cork_destroy(fd, ctx[class]);
> +		xe_cork_destroy(fd, cork[class]);
>  	}
> =20
>  	xe_vm_destroy(fd, vm);
> @@ -613,7 +613,7 @@ utilization_multi(int fd, int gt, int class, unsigned=
 int flags)
>  	struct pceu_cycles pceu[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>  	struct pceu_cycles pceu_spill[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>  	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
> -	struct xe_cork *ctx =3D NULL;
> +	struct xe_cork *cork =3D NULL;
>  	enum expected_load expected_load;
>  	int fd_spill, num_placements;
>  	uint32_t vm;
> @@ -639,8 +639,8 @@ utilization_multi(int fd, int gt, int class, unsigned=
 int flags)
> =20
>  	vm =3D xe_vm_create(fd, 0, 0);
>  	if (flags & TEST_BUSY) {
> -		ctx =3D xe_cork_create_opts(fd, eci, vm, width, num_placements);
> -		xe_cork_sync_start(fd, ctx);
> +		cork =3D xe_cork_create_opts(fd, eci, vm, width, num_placements);
> +		xe_cork_sync_start(fd, cork);
>  	}
> =20
>  	read_engine_cycles(fd, pceu[0]);
> @@ -649,7 +649,7 @@ utilization_multi(int fd, int gt, int class, unsigned=
 int flags)
> =20
>  	usleep(batch_duration_usec);
>  	if (flags & TEST_TRAILING_IDLE)
> -		xe_cork_sync_end(fd, ctx);
> +		xe_cork_sync_end(fd, cork);
> =20
>  	read_engine_cycles(fd, pceu[1]);
>  	if (flags & TEST_ISOLATION)
> @@ -669,8 +669,8 @@ utilization_multi(int fd, int gt, int class, unsigned=
 int flags)
>  		close(fd_spill);
>  	}
> =20
> -	if (flags & TEST_BUSY)
> -		xe_cork_destroy(fd, ctx);
> +	if (cork)
> +		xe_cork_destroy(fd, cork);
> =20
>  	xe_vm_destroy(fd, vm);
>  }
> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
> index 5d9afaf3d..e4000f50e 100644
> --- a/tests/intel/xe_spin_batch.c
> +++ b/tests/intel/xe_spin_batch.c
> @@ -384,25 +384,25 @@ static void exec_store(int fd, struct drm_xe_engine=
_class_instance *eci,
> =20
>  static void run_spinner(int fd, struct drm_xe_engine_class_instance *eci=
)
>  {
> -	struct xe_cork *ctx =3D NULL;
> +	struct xe_cork *cork;
>  	uint32_t vm;
>  	uint32_t ts_1, ts_2;
>  	uint64_t ahnd;
> =20
>  	vm =3D xe_vm_create(fd, 0, 0);
>  	ahnd =3D intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> -	ctx =3D xe_cork_create_opts(fd, eci, vm, 1, 1, .ahnd =3D ahnd);
> -	xe_cork_sync_start(fd, ctx);
> +	cork =3D xe_cork_create_opts(fd, eci, vm, 1, 1, .ahnd =3D ahnd);
> +	xe_cork_sync_start(fd, cork);
> =20
>  	/* Collect and check timestamps before stopping the spinner */
>  	usleep(50000);
> -	ts_1 =3D READ_ONCE(ctx->spin->timestamp);
> +	ts_1 =3D READ_ONCE(cork->spin->timestamp);
>  	usleep(50000);
> -	ts_2 =3D READ_ONCE(ctx->spin->timestamp);
> +	ts_2 =3D READ_ONCE(cork->spin->timestamp);
>  	igt_assert_neq_u32(ts_1, ts_2);
> =20
> -	xe_cork_sync_end(fd, ctx);
> -	xe_cork_destroy(fd, ctx);
> +	xe_cork_sync_end(fd, cork);
> +	xe_cork_destroy(fd, cork);
> =20
>  	xe_vm_destroy(fd, vm);
>  	put_ahnd(ahnd);
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index b10269191..9e524578a 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -945,21 +945,21 @@ test_bind_array(int fd, struct drm_xe_engine_class_=
instance *eci, int n_execs,
> =20
>  	sync[0].handle =3D syncobj_create(fd, 0);
>  	if (flags & BIND_ARRAY_ENOBUFS_FLAG) {
> -		struct xe_cork *ctx =3D NULL;
> +		struct xe_cork *cork;
>  		uint32_t vm_cork;
> =20
>  		vm_cork =3D xe_vm_create(fd, 0, 0);
> -		ctx =3D xe_cork_create_opts(fd, eci, vm_cork, 1, 1);
> -		xe_cork_sync_start(fd, ctx);
> +		cork =3D xe_cork_create_opts(fd, eci, vm_cork, 1, 1);
> +		xe_cork_sync_start(fd, cork);
> =20
> -		sync[1].handle =3D ctx->sync[1].handle;
> +		sync[1].handle =3D cork->sync[1].handle;
>  		sync[1].flags &=3D ~DRM_XE_SYNC_FLAG_SIGNAL;
> =20
>  		xe_vm_bind_array_err(fd, vm, bind_exec_queue, bind_ops,
>  				     n_execs, sync, 2, ENOBUFS);
>  		/* destroy queue before sampling again */
> -		xe_cork_sync_end(fd, ctx);
> -		xe_cork_destroy(fd, ctx);
> +		xe_cork_sync_end(fd, cork);
> +		xe_cork_destroy(fd, cork);
>  		xe_vm_destroy(fd, vm_cork);
> =20
>  		n_execs =3D n_execs / 4;
> --=20
> 2.47.0
>=20
>=20
