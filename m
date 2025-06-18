Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CD1C7115A
	for <igt-dev@archiver.kernel.org>; Wed, 18 Jun 2025 15:54:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E266310E069;
	Wed, 18 Jun 2025 15:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VD264MCJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7E210E069
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jun 2025 15:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750262041; x=1781798041;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Nl/ankPX2g6E2qYH73hWtJ67WQIQfisxrpz/LMGjeTg=;
 b=VD264MCJMMgXVFmKK0HH91i+OWXNQNP29esVJ99x6DsybZqDOZL6WPX6
 L82t9gZQ8ZfweVxAqk1HSp3TuO1DDE5hsQqIG0P2n3Fgc8P2jdkhM3+Xn
 BhyylRNhIxAv2J77sqEtMAG7b6jaOb1dyxTI7NHrmVKvZmuE50g4EmPd/
 65ODtzTbOLNd9Sz5zKEWxA2f+83C2IpgitlLxSzpvvo2OpUfWSfue1g42
 6cSQ2sLIF/ebmbl9pGndWLjpQn3wsACNG1VXcKN+qY/ejzui07LXM/eRD
 lSfDDpMu7KTqoIw8zb9Pq57WQZnIg2erJEHTx+q91p7FAcEAIUbqxe4qE A==;
X-CSE-ConnectionGUID: Qtop7eE3TMGAdKwRB2Gvdg==
X-CSE-MsgGUID: 16sUTQcjT+mOxe0eubhgGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52464422"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="52464422"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 08:54:01 -0700
X-CSE-ConnectionGUID: bmzjkoQlTNiN/Vjwg3TyPw==
X-CSE-MsgGUID: Jqih2T7QQLKPBW0EROUWWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="150521905"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 08:54:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 08:54:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 08:54:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.67)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 08:53:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e0LWhPXqoqIwfuF+sEh8i7ARF6Nk6+WWm1A8kqNrbttNiVk7sd3f4+GViSH0WVTwTqbAwpNdSZQrLHqc3tW93mdzx/9tkxR4VZTW58ZTeR1g6Tk6XOvPNm54zVe7u4Gp7cIo7DLhyke24S8a+8hG9virkAobpqloL/DpMpgFRyme4KQANnp0MG5o/7t31f0nnAYk3hvUqvUDJyX0e1FSXX8EQK7g+3J8hJxoIxwh3Mai2gQPwJlwlRx4UBPYb04DGOHE3ojuqGri/YTw6li0gqryrri2t1wm20BOpt7bIO/YofbIPPN7gx2WWKvEXZWzwxh6FzsTOItCdyQBu07w1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oktMg6uUi3keqsBIognlfAAtlvg3UetE2zBpLzGA+kQ=;
 b=r6teVPhNK1nMp1E6ci4peW0j26Xh2OV0Tr/602uT7d/O7Na96CzmZqWrBWX3MV3pHjImIC9mwVeEda2lD6N/fZYP8XBbZnN0UW59Yy057r2eut6Y/R+JAzlmfw1kja3C8FWGp7zDwAdDIxvez7zRgJMjFC3nehblGsOF54K/CfvQ+kNl1YgDoru+pvnZfDXN1k4MQkmnpDmvh/2LLLVvZx2ipcE9cirWCUcACVU/syniOgGk6F6wOVkUQvcsoY57h4EiRNOqHOSHZPVblPCCwrv163FcloeCbRHuJ+IkQMyuAHub19QoClfnl0Ni15F8p0UYGIfKiK9XHue1zAYyoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF7468F7991.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f2d) by IA1PR11MB7295.namprd11.prod.outlook.com
 (2603:10b6:208:428::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Wed, 18 Jun
 2025 15:53:29 +0000
Received: from DM3PPF7468F7991.namprd11.prod.outlook.com
 ([fe80::d4b7:144:c660:cd32]) by DM3PPF7468F7991.namprd11.prod.outlook.com
 ([fe80::d4b7:144:c660:cd32%6]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 15:53:29 +0000
From: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
To: "Chegondi, Harish" <harish.chegondi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Laguna, Lukasz" <lukasz.laguna@intel.com>, Adam Miszczak
 <adam.miszczak@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>
Subject: RE: [PATCH i-g-t v2 3/3] tests/intel/xe_eu_stall: Use query IOCTL to
 check for EU stall support
Thread-Topic: [PATCH i-g-t v2 3/3] tests/intel/xe_eu_stall: Use query IOCTL to
 check for EU stall support
Thread-Index: AQHb3xpogl95xl0LK0iSARxo/aRut7QJE2tw
Date: Wed, 18 Jun 2025 15:53:28 +0000
Message-ID: <DM3PPF7468F79911B12227F032C5F774071AC72A@DM3PPF7468F7991.namprd11.prod.outlook.com>
References: <3cb3df73daf1b29c309f9fe4331af27b49e0d9c2.1750117903.git.harish.chegondi@intel.com>
 <d2bbfcc1855bd6dca1af6d22484bd17df26b8025.1750117903.git.harish.chegondi@intel.com>
In-Reply-To: <d2bbfcc1855bd6dca1af6d22484bd17df26b8025.1750117903.git.harish.chegondi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF7468F7991:EE_|IA1PR11MB7295:EE_
x-ms-office365-filtering-correlation-id: 6c629f72-34c0-4a16-f98f-08ddae8044c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?AOXGXGCfuyqm8oIgriAkqqJajCDFjOKN+eziaaa/CEXDpY+bV3LerOoDEfSF?=
 =?us-ascii?Q?N10+pcwH4jTrugqEuS3IcLeDN/WSZMbU1QX4p9f0tRT1w6VO/+Ybk5p/Z3JA?=
 =?us-ascii?Q?OjpJfTeCQQPbwoT0ldVZ0AjhcVuGKAIj2UZ0b00nW9kqKQ/7qnrgV+rDzp91?=
 =?us-ascii?Q?tNgW3ihuWXxtLyyrniCUKzRxEhvO4kTXuyMRDnUqjoJan1xwqCOnIxkC29iW?=
 =?us-ascii?Q?I0ghyoc67EhImkwnJDhUWpKX5u46k9QoROZRkyK2U2DooJ8adSIBZ6h4Lg3q?=
 =?us-ascii?Q?X4usi/6/U2ZtfkVMOPbTSVsFijMk7QkwNGpmNMPrOFMAqAis6BfyKR+gUOyt?=
 =?us-ascii?Q?kkgW22DNf/q19Qqm3MUd7K5ZXMpvqYMZNkWs4ScAFdxQw46tepTl7whbnLd/?=
 =?us-ascii?Q?qzGqFqhc6Ppog1/CivSaLZ0pWyx/KVOfiBik0Sd4F/MUEWYNy4xHcP6IQsJf?=
 =?us-ascii?Q?owa8bV1YxvG/AkKlK491xniLRFuEwsTJtMCotyxVZnMS9bpV12ISRGxmA88C?=
 =?us-ascii?Q?+Lt3Z8gimLDhGnGVdo6AlRCSmb+vPkVU+r9+oMSJcWxEF2B4MGl3rsVlwfUS?=
 =?us-ascii?Q?fuTUc0yCXAQLCko5+Yz+KEJf0XytNOk0UU4OA5pJ1KttsFwwZGCdUXjXVQnW?=
 =?us-ascii?Q?bWOz6VvJAV3q6YrBaNvZLX1P/oH9jgenz9JGvb9JLmPajfcvI8DdXCLgJasG?=
 =?us-ascii?Q?jcjCNfu8o0CoUgeX9mWXKdthe1Pd9pRmY+XTLJ8IewFcpQ14pg3NohtmJymq?=
 =?us-ascii?Q?eGLtTSu69wsFflgUTd3gf88xrRLaPR8AWSfIM9jGSyC1cG7zoObJIqH45rdS?=
 =?us-ascii?Q?DekKRzLQe9CVXT1fGkcHs3kpTkbrb3SKGbgbesTRhYKIw2L3InUBPuGpAzEg?=
 =?us-ascii?Q?YG/9M9x+vvHjNzlXZ8dUqiRqkqPuwA+wkoE3PVEsaLUxQFoxe4OGCrj9FIK6?=
 =?us-ascii?Q?KfsUjVeTKsG7D/e2pF9IwyDc2s1tBoqIfEeryGkSLtAetqe3VE97Maa/k4yX?=
 =?us-ascii?Q?F6L5KDryvtKTgs6HqTZ455G/Ek8zFSFgZhNe3hnwQbBvQi7Uwv+I+InELHRY?=
 =?us-ascii?Q?SFA38SH0b53YYtDSiwZvJs4e5ffsGcFP2v4plya1FvxihltTPSRUdfuW4Lsk?=
 =?us-ascii?Q?y5rRwsnXfwGffDk6dWikWjuAQH5aBbnlEyJFNfR/MfQ0J2IuSZo2Oj9ZPFZQ?=
 =?us-ascii?Q?plr4VWY9n5oqfj9U9mk9oMaF0zuYKf4ANoBc8cUUrW2Cvy3/NkvIFPeLGAHL?=
 =?us-ascii?Q?zMBuyKEfB9PAsfmKdQBQ00OArLjuMrowSnRTptRrntv23oOU7QBVn01iD89L?=
 =?us-ascii?Q?y9LhnrDAW+EJly/iyiXTs1EMrirEeAv49zSh4FzCbGAt4b/c8Oyfzn6VULvc?=
 =?us-ascii?Q?B0MC9EdfJKC5uNNFYlu3anD/o6v8+ikdrQUKmsk2CJviCQ7BwpTFryCVnymS?=
 =?us-ascii?Q?HT2H1vTYXAo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF7468F7991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Fq7bfkYt6DGjaTIH15di+1/BWs0i+TpP7qLAw82Nz1S50Iypin2mCWKWCH7V?=
 =?us-ascii?Q?KqUWVvokUlTNfZVQT/X2QlxjvkQRRZYWsdwQwaK0+K+cQ+2tcnXpfCL02Z90?=
 =?us-ascii?Q?kweteeraayBvpNHENUhfB9876GLmZNXwJTUnHb14kmBsMM0ge+ejcoDXq6cT?=
 =?us-ascii?Q?zw579MghzHm+Gv450lBPkO4NsHeVJbt126Yw6+Q0zfMglMP7lJpUdD7zOthg?=
 =?us-ascii?Q?QEja8BaxsLxxVBkVPTvGEAnBpVVwh1KE3n9EkEEs59LRWR7/oQ/rfI5+R9ip?=
 =?us-ascii?Q?9jL6XLXhH+IiO1/wQMMEMZJP7iqP08WDao0IwnR0CgrgCRhcKa2DrutIZ10q?=
 =?us-ascii?Q?diu9YK5Gn5XeyTBIzeePBTA+3uE0ZoSgNT7axqiatOVZNDbrvukWzX03UmhS?=
 =?us-ascii?Q?rfwuNbwZ0rMbnX0PRjRobxCUe2F3llhr+cqLrRNDrbSphaYSP3tSk7W8PdU6?=
 =?us-ascii?Q?hY5Zup4Vvj7t7t2Hjw8axYxmGMFEd5CrpHiznWFyuBlRUzWgcoxO1h7chAO6?=
 =?us-ascii?Q?D6BAVale7uo/KbeztQBqwEFt1Z047BRTxhrFeJHB3T2TVx8myDb2j3bagwe8?=
 =?us-ascii?Q?0MPgoXoJCVPI9WrMwm07jbhuvOoMpO6OmjPXpTXqCk12DzSZZpDhabtUtYSi?=
 =?us-ascii?Q?2H5WlvARmVmV0xB07uOllZK55vYkb64rjEat4Mis2nHAPULZ0UqMyN6Oock+?=
 =?us-ascii?Q?xNlLKLXHpQLfLkYMkuqYIa+hRaomvfnQw80veTT9OYbjdVyvRoKTLd6AWMsI?=
 =?us-ascii?Q?NuQJ3y0N+9GMrVevqsKr4zYHpucrE+KBHRCzwZe5Cu92gpiBCog3ad2/J+pM?=
 =?us-ascii?Q?A9Uenn6zpK2rx4Xw5awSdnVOKQBLJN3nhzBf2a9gpCL5ez+N9I1Lf8CXm2Jx?=
 =?us-ascii?Q?yoavwWGKZbn8qfTDCfn8S53DGNDYvyzi0EQky605hRLiMRciXr1vwfXgkvaL?=
 =?us-ascii?Q?vOeml4YCxFbaRiDvWuFCrhRWlGpbeB0dJdhJ1t6c8MdtP5K+FGNoTsuilI/I?=
 =?us-ascii?Q?nPoMjcH8IQ01zE5qgA7hl8J99c2XwTynAHDOplyb/oa3vECm4nz8ElOSQOWr?=
 =?us-ascii?Q?fjU0LW8r0EjO6GicZvWEjK1aXTWNa69qGPSOnqkEedkkf3yo6BmvA44QmCvD?=
 =?us-ascii?Q?gfT91cuSMB+tO/oldwvDKln/lq7eBEN4kUSjfx+nlAqUJb1+21JXQWjs8hfH?=
 =?us-ascii?Q?nieab6iLPX9+m3t0TT57gJBaY1dJlp3/7X0wK60ermU0PfAsUJ36tJ7+xL44?=
 =?us-ascii?Q?MOA3FsGpR+bdH4f3AP81G2kMl6k2Yc7nozMyKYEDVTbhk33cTL8ndd/HMMhY?=
 =?us-ascii?Q?JlQhRYDSg5nDHGJ7EVkoORyksUQQjpZN8JotS3kaWo+3OVxvOihACXz7T9Sq?=
 =?us-ascii?Q?B9AMS4Vb1n/j9Myg1JnaJz0EPNVM6tuCgL1StyZKyXHTo/DzibsMn4GKNg6a?=
 =?us-ascii?Q?k5fGNasGvymOVMc9f9BuhQEPXIhkeIYuQy8ANbxXALrMcvPNZziXoefDIcXi?=
 =?us-ascii?Q?FUZ3DRTCG6j0EZicohhcYXtKp6p0GdtIcwo2Sya6ZfB6xupYq4LL/lWUJ7zP?=
 =?us-ascii?Q?xGrQnSoVhGoNpZHqkLbdXDl1mfJvEsz7x5Wwhr8Y?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF7468F7991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c629f72-34c0-4a16-f98f-08ddae8044c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 15:53:28.8718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ccOJp/Wkw7uWyIlieGN+KefjbcPQPWfM0IC62deaQKy+Gv5p3EtWU171gTgpse5Kzut3ITkWmcuCmpzWahWKBHd0V8a2AjB69WJ55EFCs4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7295
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

Reviewed-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>

-----Original Message-----
From: Chegondi, Harish <harish.chegondi@intel.com>=20
Sent: Tuesday, June 17, 2025 1:57 AM
To: igt-dev@lists.freedesktop.org
Cc: Chegondi, Harish <harish.chegondi@intel.com>; Laguna, Lukasz <lukasz.la=
guna@intel.com>; Adam Miszczak <adam.miszczak@linux.intel.com>; Kolakowski,=
 Jakub1 <jakub1.kolakowski@intel.com>; Kamil Konieczny <kamil.konieczny@lin=
ux.intel.com>; Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>; Dix=
it, Ashutosh <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 3/3] tests/intel/xe_eu_stall: Use query IOCTL to c=
heck for EU stall support

Use EU stall query IOCTL to check if EU stall monitoring feature is availab=
le on the platform and if it is supported in the driver.
This would replace the checks in the test with those in the driver.

v2: Rebase and resolve merge conflicts
    Remove unnecessary brackets

Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
Resolves: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5131
---
 tests/intel/xe_eu_stall.c | 54 ++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c index 36=
a4471e5..c496e654b 100644
--- a/tests/intel/xe_eu_stall.c
+++ b/tests/intel/xe_eu_stall.c
@@ -74,6 +74,8 @@ static int stream_fd =3D -1;
=20
 static volatile bool child_is_running =3D true;
=20
+static struct drm_xe_query_eu_stall *query_eu_stall_data;
+
 /*
  * EU stall data format for PVC
  */
@@ -510,33 +512,13 @@ static void test_eustall(int drm_fd, uint32_t devid, =
bool blocking_read, int ite
 		.properties_ptr =3D to_user_pointer(properties),
 	};
=20
-	struct drm_xe_query_eu_stall *query_eu_stall_data;
-	struct drm_xe_device_query query =3D {
-		.extensions =3D 0,
-		.query =3D DRM_XE_DEVICE_QUERY_EU_STALL,
-		.size =3D 0,
-		.data =3D 0,
-	};
-
 	igt_info("User buffer size: %u\n", p_user);
 	if (p_args[0])
 		igt_info("Workload: %s\n", p_args[0]);
 	else
 		igt_info("Workload: GPGPU fill\n");
=20
-	igt_assert_eq(igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-	igt_assert_neq(query.size, 0);
-
-	query_eu_stall_data =3D malloc(query.size);
-	igt_assert(query_eu_stall_data);
-
-	query.data =3D to_user_pointer(query_eu_stall_data);
-	igt_assert_eq(igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-
-	igt_assert(query_eu_stall_data->num_sampling_rates > 0);
-	if (p_rate =3D=3D 0)
-		properties[3] =3D query_eu_stall_data->sampling_rates[0];
-	igt_info("Sampling Rate: %" PRIu64 "\n", properties[3]);
+	igt_info("Sampling Rate: %u\n", p_rate);
=20
 	stream_fd =3D eu_stall_open(drm_fd, &props);
=20
@@ -664,18 +646,42 @@ static struct option long_options[] =3D {
=20
 igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)  =
{
-	int drm_fd;
+	bool blocking_read =3D true;
+	int drm_fd, ret;
 	uint32_t devid;
 	struct stat sb;
-	bool blocking_read =3D true;
+	struct drm_xe_device_query query =3D {
+		.extensions =3D 0,
+		.query =3D DRM_XE_DEVICE_QUERY_EU_STALL,
+		.size =3D 0,
+		.data =3D 0,
+	};
=20
 	igt_fixture {
 		drm_fd =3D drm_open_driver(DRIVER_XE);
 		igt_require_fd(drm_fd);
 		devid =3D intel_get_drm_devid(drm_fd);
-		igt_require(IS_PONTEVECCHIO(devid) || intel_graphics_ver(devid) >=3D IP_=
VER(20, 0));
+
 		igt_require_f(igt_get_gpgpu_fillfunc(devid), "no gpgpu-fill function\n")=
;
 		igt_require_f(!stat(OBSERVATION_PARANOID, &sb), "no observation_paranoid=
 file\n");
+
+		ret =3D igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
+		igt_skip_on_f(ret =3D=3D -1 && errno =3D=3D ENODEV,
+			      "EU stall monitoring is not available on this platform\n");
+		igt_skip_on_f(ret =3D=3D -1 && errno =3D=3D EINVAL,
+			      "EU stall monitoring is not supported in the driver\n");
+		igt_assert_neq(query.size, 0);
+
+		query_eu_stall_data =3D malloc(query.size);
+		igt_assert(query_eu_stall_data);
+
+		query.data =3D to_user_pointer(query_eu_stall_data);
+		igt_assert_eq(igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query),=20
+0);
+
+		igt_assert(query_eu_stall_data->num_sampling_rates > 0);
+		if (p_rate =3D=3D 0)
+			p_rate =3D query_eu_stall_data->sampling_rates[0];
+
 		if (output_file) {
 			output =3D fopen(output_file, "w");
 			igt_require(output);
--
2.48.1

