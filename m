Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC493D6100A
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 11:35:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878E910E324;
	Thu, 29 Jan 2026 11:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G9D1cTVH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5B210E324
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 11:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769686557; x=1801222557;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Fn15q5hQ/2YP0Ucg02N1lgsHbR6WaURSZz+wwfKN8sk=;
 b=G9D1cTVHQOXtACKWo+Y4O+nhtJMRhFopKA+bZ5KIjyXCjxyuNUR32Viu
 Q2XWmCCBQSvua4YKTi4zYKZTECo8mvhA2lVAheIQlO/tjZSnFrmvI5UoB
 TiHgvRcqPk0ubCEZ61hcrY6TIrM6UMCqaYFrpRuKB4qJoyeCasqG6LMGC
 chwdDF5Ng5Uo5+hSiGNLy8rom/zYbiUNREePwS9TeOUe7pjAwYKOdx73J
 ojlCaTzQhfYhYR9eMiZbz07E7ZU1/PhnWgKBAsv6TSxLFQYNdPNgVt4V2
 T0c1NN1yz6+kI1Qnf2mZ4QsnT4futWV+6owMJ9HefjWyibjss1OQK1q0w g==;
X-CSE-ConnectionGUID: 1Av6ETbrTUW7g16j4gmjZg==
X-CSE-MsgGUID: Ajrf37C0T2idtFU7eNQNZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="96386181"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="96386181"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 03:35:57 -0800
X-CSE-ConnectionGUID: o2rCzlcnQ7KmM+ZkiHXmCw==
X-CSE-MsgGUID: hECxbAu7SRqvvp+VexFUBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="213111262"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 03:35:56 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 03:35:55 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 03:35:55 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.0) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 03:35:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AnGMxgrb+aTcevdP1lgHlkulBmLUwrBCWkfyoVaj/akAGs5m5PVmr2hVeOhR51nsFg8x+KPvF8RY7LiHUhE+FkXrMyhJpUJ7cIKwjb9xwXZZV3s1Ud1h/hFnTv8jRtb4Ab4c5Za7m4e024P9NXTMKYHk2o+3cmtTh9P//VQdK+3+Rpg0QmTSIOviI3r8HadQ+kRZXW6IDxB3Gzba76a9zuLiguofEppc1otGV4knPhUJf8QV9WOF09u8lxFPHRwzUr5tHh8n2KtPP67+M5ji5H+bub561m2Ot72t7l4dPOJOF7g+VbdXicd72BK98FSf6/L2qVkzsectTM1p4Zh5Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osTjRU1M2Dc8r0879845CQTdh4t5dCAd635czc63AhE=;
 b=D5FJikiqxMXeXSLrWKdB7UclnEZq6wNEwUfoSD0hj3130OA5yObDM/4D6njnSO1RcgLWQcQGXsALWp3lgRlTcNvTL0YLO8EIk7QbyNK6T/EKQH+Afr08l0ya82hCtXU6tpYFTSRuZoulrwLl16WQORErm41bmGkMFnjFvMMvqd6oUvldKDInkZjEM69giBlm/wcEmSOJwPC8I0YbpoX3zsAhgoUCnNGNWUyyzoSWPw8y1ZRDNpxFg6yPTXMpfJDGnTZcGswze2HjW9xkzIw7V52nQsyyI63q7b0h5GJIjVCMXcz0exBz4cwKIJ2MidCPH+g9i0tDj1RhOfkWhiD+0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DS0PR11MB7650.namprd11.prod.outlook.com (2603:10b6:8:151::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.7; Thu, 29 Jan 2026 11:35:47 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 11:35:47 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_pm_rpm: Fix CRTC conflicts in
 output selection
Thread-Topic: [PATCH i-g-t] tests/intel/kms_pm_rpm: Fix CRTC conflicts in
 output selection
Thread-Index: AQHchVLVZ4eC3zAQmkao/32o0w5T6bVeFE4AgAsHfEA=
Date: Thu, 29 Jan 2026 11:35:47 +0000
Message-ID: <DM4PR11MB631218684B945099EAF83850909EA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260114123426.14804-1-mohammed.thasleem@intel.com>
 <20260122110846.1312-1-mohammed.thasleem@intel.com>
In-Reply-To: <20260122110846.1312-1-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DS0PR11MB7650:EE_
x-ms-office365-filtering-correlation-id: 15813c3d-9904-4725-462d-08de5f2a8c2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?AqiRd8EwAF8cgba7+UGN/EQnj94EJBDztQuQLGXsWVv19eIqShPy0WgKcZvi?=
 =?us-ascii?Q?UqPUYazSIUfuVmXEBrmUmnrBMu+tO93rO5ZcrS1QjKAsykuidNVjDCitLfBf?=
 =?us-ascii?Q?zeOGTUWpMPkCCjQfDBGX9J87P+zB8eAFhR0boeDx3luS0AhNEQWIgFAu+Zjq?=
 =?us-ascii?Q?3xhvwaGTkj3fqpG4uBePJIGrRnQRzyZqY+74ERyt9xRI1fxaG2i8QNiueMkX?=
 =?us-ascii?Q?JWSgFQ+tsX+JVSUyaN5e63ZorhnqALHRRERlkCOUJCs1hRX0eJUwNpYOaZnm?=
 =?us-ascii?Q?qsoqSJCkVPagHtjwVRUvj1x7jrZMR+oF+0GwVAk8820lVKJaK72ARLX9MUdW?=
 =?us-ascii?Q?dWpjI2MNjTe2SNMNf6VXVGA9KCJ4bvjfqbsDZQYOISZF9dI/LQ/wF5JtXUli?=
 =?us-ascii?Q?TJRBUlIVS6cR1cdN+7rVwBUfdZdGEwmoWMQ2n2lWkwrFZ0HidnBmzagy8gV7?=
 =?us-ascii?Q?JAT/BxWNQ8AeZ7h4CA2ZbalKJ5KcWLaph/3rPMmugZ1uSheE9QY+0/jtG0H1?=
 =?us-ascii?Q?EQeBjurK1ij9c2ETX6l5XdDOta9ofs52hGFIxesuFb3FPAVBLXTfXXrnSq4z?=
 =?us-ascii?Q?Q5pII2ko4V/A4rzXsC9v0F+RjSN3GCEw5CgzDAktdLuxeavz7lBurdDJmf9m?=
 =?us-ascii?Q?DTWVsJDgYTxFy6qgcXPeijO2yLCnWX+RBb3F7vd2ZusQ/B7thpUE0S3u0HcK?=
 =?us-ascii?Q?3WZGOni9UvVT5PiA73qEKhKBUy6rmzQBjMVmUxK/rmzlIFPNLfACUs+l03C7?=
 =?us-ascii?Q?akbh7PPHQEq/romsu6h8IzJAmmpvNm+OSqqHuMPWIhsTKelIBj2UJxfj1ojl?=
 =?us-ascii?Q?duD4dKtk/3kLLR6/sGIvVfbfWXYVF0y6a3zF4/ROA7oojNoYIJX9we/P7SKI?=
 =?us-ascii?Q?zDZ0xgE5HHed7k0R2p50Udx3lOVh7ap4Fr7EOorR1knMam+ze0lh7WJd9H64?=
 =?us-ascii?Q?NjTwxOOn3nnuiLDrX9EpZeKp7zH7y2Ow3ynFDOZyk+nUbQiZIu4q2LM8cTcO?=
 =?us-ascii?Q?rlRCr0KbIKDgoRnKgblVu5fFhmiPyHEVR5SHvNLt/ddWzjd2BiP/TewurtMv?=
 =?us-ascii?Q?OiBOE5WKdHBLuEq8k4vQpIpFzHn9dNkS+FkhF73UsjQs3YwLJyjYRcdf+2DC?=
 =?us-ascii?Q?jzT630alMSY35ad6rFp6dyfTJdmYyujU+Aj7eK3y0oxAlo2Dkwbl4saC62Cr?=
 =?us-ascii?Q?uC1H+MZdqg95hgiWPjIn7sT2Netmr4SdAF11cv6o9nAdiTDcrlhmuEAV6moF?=
 =?us-ascii?Q?a5YxGhaIUKKIpIggnEdRD1aRBmMbJyg/n35y7jAA4nCQ39dfpnj1uLWRFFL4?=
 =?us-ascii?Q?hMA1g7WC5Gwrjh8yconWqkt5/q5UMVPn+dwCLDrE59MZguo2Qgjqr4iaSyGc?=
 =?us-ascii?Q?Y/4YCTLhKLuX0d+AErNTJ5CLCK4k/btXP7pDJIwxVIkQLIDgA1K0xOwDO2r4?=
 =?us-ascii?Q?WuuAAB3SlLl+UN98WFcwfTc+VDMlXAOh+EzrbqVspFVRXtn/6VFnZdtcyqvc?=
 =?us-ascii?Q?xMkQaF2CFBKqdU8zs+u0JGoNVeleCN4rFwUaFSski5Q8by0l+qB8fxNHv6gp?=
 =?us-ascii?Q?l+sM+sPimB3YIECmsemJY9Zzzu5dS3tIK+01ufpUx8p2x80NH1PyA90uEVI1?=
 =?us-ascii?Q?Yw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5q9RO5cdWaNcccy2ntCUZysjripB05EGIDdW6CB8JN+XUJnmViqa4n/5TrB/?=
 =?us-ascii?Q?Wiucked7TmPona0CuIW2mV2O9L6i1OTXODGdQEWXauUbIS+DUSYCzAW0BO49?=
 =?us-ascii?Q?cTdFrIMFeqyYJ54eh3oJVU2FkWPW7KkURndxA1XqvJ8d5fCnKGKNCuFpi1yx?=
 =?us-ascii?Q?gR1rYBOfYPDYjfpXFK/hx8OMmFwXOZfTtN3SFn9Bd5oxrhauRAWH6Q+JTiT4?=
 =?us-ascii?Q?kcukyEgqFSFR9a+SSsLSVXnlU1SMr2nmUTpuKUTPY5IGO3F6gW/BLOkue9Cc?=
 =?us-ascii?Q?cL9z91lp1DB1HWKrHujrTjoN8KAant0vJvBceTGKbw/tc+pQ1qSK2Q53XvDK?=
 =?us-ascii?Q?2w6JWrfojiQvvX1OO9yQ1MbRNggYDa3ld26lyBsyyK54CRr+KcIAdIrW+4Q8?=
 =?us-ascii?Q?z4Ms6ozN9Gy9vmj5YgAOM6pq/rhCPV2qu7iNJuVCNKvctN2+IBF34/YP6Wco?=
 =?us-ascii?Q?emwdb8BHbac1wMXZBJ/4c4II0HfANP6B/nxmqA6Y3WZn8dD1GwkcwlLtNMMd?=
 =?us-ascii?Q?EX3a3CSYYtdVDV3GjxHKmBcADY1ozv92kJM4eRWyTPjoKjyIEJvY5x15L0lf?=
 =?us-ascii?Q?5h6vgEMnaGqlze4oXBdwCjc8q5nQI/ym0Q7ZtAndI5gNc/8v4/k5pECDI7Mi?=
 =?us-ascii?Q?vHvY7iJJJvnSEnvtlK1J2u+bI0YHhZPDjDtnsgxv7RW10x2EWG2Z5X8y2Hmz?=
 =?us-ascii?Q?krCTcq3oeVVwaFpXOb8Zsa7h0WWIQCN5PKx5Smf1pKi7pyCeT6CADGQlf2Ym?=
 =?us-ascii?Q?h+5+DJqrd/5iai/6coRIny3yRoTj97JJGxrKo9J8Mq9h5HvtMAzjFyEM9ejd?=
 =?us-ascii?Q?BUDV3VKdZdBak4mjSQrOuqsZv3GUR2HB9DtayYrKI7ttabtZqbmQDN2EQCCs?=
 =?us-ascii?Q?6ksIVQtwLOD8D1YecvU/UWGHl/9bBZyksSEg2steOCaOu+LSgQAFFjDsxOUZ?=
 =?us-ascii?Q?NCn0zk1E9WVWNXnYFtJG9pQmACw4/tMM7hABZK2uo5fnqY5Pi9NiAtaP7ths?=
 =?us-ascii?Q?ek8HGHy/lsPKWohjFBktm2f5rEqVGionFWwlfqlfoiFk+auyOm6BAi38uPvG?=
 =?us-ascii?Q?1kB1RdyBd9Z7XNA+5mibfopf6P4Roj2s0qJJ6j/WI8zSB/oJ8th8/Es7w039?=
 =?us-ascii?Q?cUs1KCJOK4P/BMfRDTgu9/nPPEOis5GCcfPtR0gtOnuhASbktgfCK56NY3lY?=
 =?us-ascii?Q?nFUIv/OPMLmcYoRI//9z6Nyqp6u1UZu4zbnllZ34s6EJt77caAWNmC5/NWeG?=
 =?us-ascii?Q?2QyZ8txtHBLMAdxVssAbRV4qPoZWYWdes6DyJM4o33u7KJ24IiVRXJu7qw+2?=
 =?us-ascii?Q?pBiBCCcrZv7yoyJ4J6qdiW6VFqUbLX1UCvoyHMYqA8QIGvzEmwAQIDhVhkrJ?=
 =?us-ascii?Q?HDfWZRNBsN6AKTtJ6xvQvN/J70niM9Rhk0FZ3/Iyp4+ZPWS8UU6+/NseGbPn?=
 =?us-ascii?Q?4YEHtzPnse5rK+Sb1etAD4lld7Ad87L2DwzGD2jDecXa41//Sv0Pk7xjw8Ye?=
 =?us-ascii?Q?y92hVUIalPX2G1Z4yO9/1XpqcB5PqtdjF4QxlK4JtK4A+6Di3TEbe8co7mJ1?=
 =?us-ascii?Q?BPc7aLy1Ek6HN3zQnAHMWRrLPW40v6u01GVeIml6eg5XqMhvkXDfvDFd1vQp?=
 =?us-ascii?Q?KNw3qtglvfeJ6IqN5SBF9KVZYL7IwCW6q+qHm+hpoIuD15NQljIIGYMxW7nx?=
 =?us-ascii?Q?QgE0v2xbbJB6AKbF+kv5DE9euJD/vCS2+KdPhsZOuiRRzTg4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15813c3d-9904-4725-462d-08de5f2a8c2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 11:35:47.7623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P34no4lqsCIfbqd0rCAN1taXrmt4LoT/WQ50Z/xEOY5VKagWmwIOkaUMbHlcPqzaeIzAjW7P9HCZCidTeh2rpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7650
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

LGTM.

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Mohamm=
ed
> Thasleem
> Sent: Thursday, January 22, 2026 4:39 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_pm_rpm: Fix CRTC conflicts in outp=
ut
> selection
>=20
> Reset CRTC state for unselected outputs to prevent assignment conflicts.
>=20
> v2: Remove extra line. (Jeevan)
>=20
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_pm_rpm.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c index
> d7d0989b9..1dd958e23 100644
> --- a/tests/intel/kms_pm_rpm.c
> +++ b/tests/intel/kms_pm_rpm.c
> @@ -1639,6 +1639,7 @@ static void set_prefered_mode(void)
>  			mode_found =3D true;
>  			break;
>  		}
> +		igt_output_set_crtc(output, NULL);
>  	}
>=20
>  	igt_require_f(mode_found, "Not found any 8K@60Hz or 4k@144hz mode
> on any connected output\n");
> --
> 2.25.1

