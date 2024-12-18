Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C926E77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 10:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397C110EB31;
	Wed, 18 Dec 2024 10:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CoeEx6PZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 578B810EB31
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 10:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734518448; x=1766054448;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bQ8dZUVjksXa7v83Mw7hmMLVbQ9w8OZxqe+Jvd6DzPg=;
 b=CoeEx6PZIKGKRDADDAgde1ad4k1W3PceBPg7eqD16eDS6Z6qaE7OGozH
 N1h08KGmeGUlVAE4bOAuKGQHar5/faO9WYVVjzGY/RXT9qGVEYuKw5FYH
 kFil3rFNrLlWunMR+ev7np4XA31vX+xvOUj7G7d5KLyK0l4JIXfD7KoMJ
 fQvb3idB7exTssQ1NkA2giz8tK7UEVnLCx2ewmgt9yQ5CmyL9YQLA5hd6
 uEf6e+/1tx1DDccVEV3yZf3ElL3Q352x27VmfwAEyd0HUGWsMNG2b7e95
 hG4cqxm5ZVFqK9/ZL90lf7MYHpWB2I5iB+es+K2rciXWYLxKjF1Be6Vlz g==;
X-CSE-ConnectionGUID: gIGmOuJWScmFr5gg8I0O6Q==
X-CSE-MsgGUID: HLQFEst7RXCJmXbrKpKBfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="22574526"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="22574526"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 02:40:41 -0800
X-CSE-ConnectionGUID: XY79QVZbQ4KNy+ieZOMfDQ==
X-CSE-MsgGUID: ck3a1xZ5SxutU+K/KWamyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="97666939"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 02:40:41 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 02:40:40 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 02:40:40 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 02:40:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=opSn/5lXpcBNxVwyR3o5n7sgYIATfmZ8ZOKoM5v4f4gi34FSluNy6eXR8NhHJky7e5j06tLXPBeRpg9Tv3j92H6dZIOFAGm2YQ55MoQ3MwRD3LKnWMI1WDDTY1dQ9hYij2NHYD21mbXilZXch3Kw4f3zAVTU4mYQDi+4FsXaF6blEVVtaXgaKxd7Y/UJh6uJw4HDzgDjldlaV66369elCT6PK4vMHI9B35QhruV3Mbt+rtCir0mT9g9OIMcQimk+B4DYfVDWQGqgow+9bU+8L2mklQoz5ofHv4rTjMwo99Ju89rBfg6FKA0bV4XzTl7d4YX2AY0TRk5JZsPYjGj+VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toL8oO/JtLLfzT3jcOU84tKiByGaJyjwFA8BqhldQ9g=;
 b=nTJkWn/ozeRZEDeQ98ZHttDdFZm4xlcTuIm1usAo5jqRWWUaaUOgTsjS4oAJ1rcMs5b4eEm66Wgc+WEoVg/SbxMVdmvxNunQuCaAunQzATL2HeDMzRv5j1wVZS27ciHqhno0JtLp3wZ/XVIKgozZYlWL2sJoAKw+Lci3mxW5tLITQejSf7ff4vnWBNhjLqQ/yjd06ieWX2H53HKiEnpovkg53Z9cfLBvj5VDJesS28ZYAFJWq6HXbM2teb+3JZajAmJXXDzilp/lGiKDcW6h2noVIiiSlVXSYRuBbWv5f+yUCop81WdnGJ1LQCJIwNG9AkvR57iGeKuQoRpynyaZJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 IA1PR11MB7810.namprd11.prod.outlook.com (2603:10b6:208:3f3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 10:40:38 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 10:40:38 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Teres
 Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/gem_pxp: Fix requirements
Thread-Topic: [PATCH i-g-t] tests/intel/gem_pxp: Fix requirements
Thread-Index: AQHbT8+oCg2SV0Zd+kS3ORw/irMEbLLrzqGQ
Date: Wed, 18 Dec 2024 10:40:38 +0000
Message-ID: <DS0PR11MB7264E136B7D6E1C263BC9700D9052@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20241216153129.50964-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20241216153129.50964-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|IA1PR11MB7810:EE_
x-ms-office365-filtering-correlation-id: b774eccb-7385-4ecd-bd5d-08dd1f50697a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?51fWbf6g4YLV0sfLje0mucu23y/hBi+vpdF+h2m/kncyRku3WdKG91ZXlw?=
 =?iso-8859-2?Q?z7iHkgYib8hB/GM0Szj8WCRORKUcvnSrOvRGd5VoAEDeAandeugdSfDfMh?=
 =?iso-8859-2?Q?6KALLejB4WYtywenxkUyetjMVArG+iW2QezeIov0JBvKV8Qkqvwo9v3B8X?=
 =?iso-8859-2?Q?dXwIBYzx7QffoHxpr5uFd7aOPr9SyTUr/QzoL1jF51ilceEsui9AVL4Mss?=
 =?iso-8859-2?Q?Mm13u5fSmxyThBJCGvRGrOKNSis2hLvD+4qRFYDY/E/5nztv4OQfF/3hkW?=
 =?iso-8859-2?Q?NSpbqjCA7GIGJ1lJF+Qz8NN/XBMeMjcUrahQDZ32+jy9QwmqS4mmwIJTpK?=
 =?iso-8859-2?Q?eH3hjsEh6g51UC0mApx+IlX9GNdwXoCoPY0xhM+O6c7ZaZW5wjMyq2XGG3?=
 =?iso-8859-2?Q?iPLzwFT7N9hw9w4AU9w3Crm6NRJ6gGOtU2dRUMWOzisJ6oNmfQM9S401L5?=
 =?iso-8859-2?Q?I0ibG9xctta5WYrsJl/0IvO7X5mvF+JjR/moNzNYUwkezY7vuKBuEz0Llm?=
 =?iso-8859-2?Q?WLqnnZJWhhZXmKZsVq6v+DhO/KhuKa4JsO7ZKG9DE04SZFFnoajapX8Upd?=
 =?iso-8859-2?Q?vxd+4XuOGFsu8s+GGZvwhBOhkvZPjIfQ/afiEq/9FeHexy6UR/YXoR/7ZK?=
 =?iso-8859-2?Q?TnBfuP7OS0sb6fBaQqIVTE2kxAGXsYEswcLtD6udM57UhYvF+nKENdDQX9?=
 =?iso-8859-2?Q?D4s21gBtFfRj5vrwqkZmkmAnf7PW1a6sFCCWCQfYI4kfbLzDrKxND40PIe?=
 =?iso-8859-2?Q?qAU4uvGC0Zh9n6TjOC6of+8tS+rRtyDTAoe/QpT7ILXPtFiqHSCYp/Joeb?=
 =?iso-8859-2?Q?tFYz3tpcoUiljgG5q6/oyvYjP7VXgbNpAWa4nSSO35aFbNNY76ZprwZX4C?=
 =?iso-8859-2?Q?/lgzvc7hRLd0KP6OnPXjLGcDr/29gzEn3fVbjSWBPFMWdaUc3Ci8sUd3zM?=
 =?iso-8859-2?Q?R3ngzvnfjBPJnTkJOc/s5qKP1f7JL8yxNUiEqQka0zmtqK14n6uo130Zl3?=
 =?iso-8859-2?Q?BY+9OZ/RMda08YzUNG5F4DQnp6J7Uc/zObnJSoaCnnKlpSKMmB4k1/OkxA?=
 =?iso-8859-2?Q?ieRia1VkLA7HwwBIPnQ1mOrM1Fn3T3OqQQP31wz1tLVBH0BF+6Cu7puK8W?=
 =?iso-8859-2?Q?uzpyfZxKrKZvYjzqywFC1wzE3AI4Tb2gSZz60W//wjx8BOo1dx3Go7Ge8u?=
 =?iso-8859-2?Q?TvDgJ5BjCH3ddlqWgTWeyVCBewt5z5lVxr49Bqkl+2uJCvu16W2F545ap2?=
 =?iso-8859-2?Q?oNZ4SMvbbfaW2BwlpwqVX26DDUCAYnD6eRjGw+P8Geqj0GdAL7JEy1f5lg?=
 =?iso-8859-2?Q?LEtIV2Qud8sjPNisWEY8RglGBWGphGDCus51w5q0TdZ+YVn9eY1GScZGux?=
 =?iso-8859-2?Q?DaYTAjssG6+moK6NOPK0wHXDTSXBaMPYeoiaR6hWeLoe7Y89Zzk6mdPFBz?=
 =?iso-8859-2?Q?4c/ZG9d147SoP3Yr6LncnAN1+NSQ5XlvuJKfmn61UL/WpDqKnS06y7u8Ga?=
 =?iso-8859-2?Q?mKBsS6qsYYzMre6vS4vbqR?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?2A0lB7ACy6a/Vnrv9ywpdrMCgfQntAM7CqNlktDZ6lZQJEV3f8eOZZA5Dr?=
 =?iso-8859-2?Q?KChLxyG46vQN1z1nGIYyryXhiER1bVQWbRL6rKFV3GsJODXHFfxkaGMCQl?=
 =?iso-8859-2?Q?xXTxO0K+ZhpDoWgtUianAz+jJPOr5lC2bhEMD1G6nYYhFIdU1L6XBnzeh9?=
 =?iso-8859-2?Q?5LWjuRi9ZYdmpZQdUt5qC0+Zl90gbTnv4e96N28PDRY+6TIwZWTzRhDJl8?=
 =?iso-8859-2?Q?2p3ztavhDj8mt38sBhI/6L4xECjwJXvwMRTutO/g8iTUoCw6S4KeZhQOpK?=
 =?iso-8859-2?Q?XO8cR0SlCmCIwSa53RVcOnNY4qXRorxD5ZXk8JD384+85ezRQG5ZvQM5Tz?=
 =?iso-8859-2?Q?SD976vmxlfX0hY7/S9igSGCmK/b/6+bsOeMWQ9+jTYYCacb6mySautpjc7?=
 =?iso-8859-2?Q?DZFvDPjFS5vDQ9qE8ClklkRib2SM6XAX95bhNYJn8sFYKgaf2iEl+Rmv9u?=
 =?iso-8859-2?Q?MLikHN0d7pZvFTjlrbtyyUPFUC95VofMOiQpw6IPJZGTt+L9MDHsAwj09W?=
 =?iso-8859-2?Q?2Ap58zFcs3AhVYPuE/yv8F6aBJ7TQQvjW4dtdLlVBYpUaA8xbG+qIojgu8?=
 =?iso-8859-2?Q?wZBKrWXLXHiwtrY4v5xt5kfuBP/Q5js+sHctYHZqUCExrGTSE7OZvNmJx6?=
 =?iso-8859-2?Q?vKOnJSIae+zc/4J4IZuWE2Fz1hlOMEc2qhtNYJMraswMMtmlScZp/beRZ9?=
 =?iso-8859-2?Q?La4rF5HzKilTa6bjQZE+OQiNaSYvlmdt7diFQCOkMqNmZeXgpziLvojJRr?=
 =?iso-8859-2?Q?gqGJcAZc9PeRBvkEo76Gzkd0+9jceOiC9etK5EuFC+IjZIQOsE+ElADux/?=
 =?iso-8859-2?Q?xlVoylIbKo5zYi4WqOgM9EEPlKeAmgIW039+VS4ad90I0ecrL57SnaxNtw?=
 =?iso-8859-2?Q?QqdyP4PZ+RbEMD7k9BbwVDqkXvzn6k7vpE8LH4EnZBYudEdzhAw96nbmK8?=
 =?iso-8859-2?Q?hrIyhGoc0sijGhpQxwM09ml/VSZzkbOluYOg8Lmt1BmXnM40dxIvnP4RGX?=
 =?iso-8859-2?Q?O1xo7PLllbzCD+m5ac8QM8MEJYAXJytG4s8UcJ8Veq3F/VS+lSlTOu6K71?=
 =?iso-8859-2?Q?ZomEuTLdABa7y15ciWBQuv2B2QFvyGw6zY3pQYqM+DW14T6Xy7SdGW4/4B?=
 =?iso-8859-2?Q?/Rnz5NskU4pBsa3l+ETtiY7/WFckffxawj2fL6XekhUUIzp/uZEWuaRb1R?=
 =?iso-8859-2?Q?L9MvIuMonY0jMqUunZuq0vRyJfNj0vvJrs1wnAA11hV7mzaqDjXKD9uu0f?=
 =?iso-8859-2?Q?dkIAKUigpjMNltEZXboG01sTAgSjTeNNcoroIIoCW8fjtk4hxupv8LvDNa?=
 =?iso-8859-2?Q?TaiXNiEtoLYK2gQRNCfiZEuFH35q/3Cv20WQPb2tf1+fpYsjzl3s71Kw5n?=
 =?iso-8859-2?Q?VHzZbvmwDv50z6TKYzi1q3lzQMw0Kwjlij4+BCzGh5yaW5vM2bDEJp73pi?=
 =?iso-8859-2?Q?3dhY+2gN4tnmYTwbOKNwMPM3tAa4bNC5fIP7nk7UrNmIyqUCjvFdHCatUS?=
 =?iso-8859-2?Q?UnRfjB6+OKyXaSKFbAAyNGEnCZvmKDZCwq9bM3qldpRconStUo5p3MGXqf?=
 =?iso-8859-2?Q?ZSqt3Z60IHmuMXzMQ9MTxMPJhfkwQnd9gLsqGgRRAtbkiy8WYoHwUmoJ6G?=
 =?iso-8859-2?Q?C5jcfPkCdBWbuFJ9j0II9ebBgP/AO03j8faBQRqKpQN9mR9sHvpniwow?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b774eccb-7385-4ecd-bd5d-08dd1f50697a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 10:40:38.3571 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tem6thWKhTT3xIjVL/kE8baS6H2Nkoc3sgMFe/a5lBpcibtktytN2Xnog2dDD8Gc1F2ZkGPi0UPGabtMJKkDn7o62fyb+sN9t9coq1e4bslKR9cg2jg4ODDNByaNmMlx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7810
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

Hi Kamil,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kamil
> Konieczny
> Sent: Monday, December 16, 2024 4:31 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>; Ceraolo Spurio,
> Daniele <daniele.ceraolospurio@intel.com>; Teres Alexis, Alan Previn
> <alan.previn.teres.alexis@intel.com>
> Subject: [PATCH i-g-t] tests/intel/gem_pxp: Fix requirements
>=20
> Requirements should either be global in first igt_fixture or should be pl=
aced in
> each subtests. Placing them in later fixtures results in misleading repor=
ts like:
>=20
> sudo ./gem_pxp --r hw-rejects-pxp-context Subtest hw-rejects-pxp-context:
> SUCCESS (0,001s) Test requirement not met in [...]
> ../tests/intel/gem_pxp.c:1317:
> Test requirement: pxp_supported
>=20
> Created few helpers and used them in each subtest, also fixed closing pow=
er
> debugfs fd.
>=20
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/gem_pxp.c | 157 +++++++++++++++++++++++++++---------------
>  1 file changed, 101 insertions(+), 56 deletions(-)
>=20
> diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c index
> 94544240d..d1562a165 100644
> --- a/tests/intel/gem_pxp.c
> +++ b/tests/intel/gem_pxp.c
> @@ -1282,11 +1282,33 @@ static void test_display_protected_crc(int i915,
> igt_display_t *display)
>  	igt_remove_fb(i915, &protected_fb);
>  }
>=20
> +static void require_nopxp(bool pxp_supported, uint32_t devid) {
> +	igt_require_f(!pxp_supported, "HW supports PXP, devid=3D%x\n",
> devid); }
> +
> +static void require_pxp(bool pxp_supported, uint32_t devid) {
> +	igt_require_f(pxp_supported, "HW do not supports PXP, devid=3D%x\n",

Nit: consider "HW does not support PXP"

Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> +devid); }
> +
> +static void require_pxp_render(bool pxp_supported, uint32_t devid,
> +igt_render_copyfunc_t rendercopy) {
> +	require_pxp(pxp_supported, devid);
> +	igt_require_f(rendercopy, "No rendercopy found for devid=3D%x\n",
> +devid); }
> +
> +static void require_init_powermgt(int i915, struct powermgt_data *pm) {
> +	if (pm->debugfsdir =3D=3D -1)
> +		init_powermgt_resources(i915, pm);
> +}
> +
>  igt_main
>  {
>  	int i915 =3D -1;
>  	bool pxp_supported =3D false;
> -	struct powermgt_data pm =3D {0};
> +	struct powermgt_data pm =3D {-1};
>  	igt_render_copyfunc_t rendercopy =3D NULL;
>  	uint32_t devid =3D 0;
>  	igt_display_t display;
> @@ -1296,110 +1318,133 @@ igt_main
>  		i915 =3D drm_open_driver(DRIVER_INTEL);
>  		igt_require(i915);
>  		igt_require_gem(i915);
> +		devid =3D intel_get_drm_devid(i915);
> +		igt_assert(devid);
>  		pxp_supported =3D is_pxp_hw_supported(i915);
> +		rendercopy =3D igt_get_render_copyfunc(devid);
>  	}
>=20
>  	igt_subtest_group {
> -		igt_fixture {
> -			igt_require((pxp_supported =3D=3D 0));
> -		}
> -
>  		igt_describe("Verify protected buffer on unsupported hw:");
> -		igt_subtest("hw-rejects-pxp-buffer")
> +		igt_subtest("hw-rejects-pxp-buffer") {
> +			require_nopxp(pxp_supported, devid);
>  			test_bo_alloc_pxp_nohw(i915);
> +		}
>  		igt_describe("Verify protected context on unsupported hw:");
> -		igt_subtest("hw-rejects-pxp-context")
> +		igt_subtest("hw-rejects-pxp-context") {
> +			require_nopxp(pxp_supported, devid);
>  			test_ctx_alloc_pxp_nohw(i915);
> +		}
>  	}
>=20
>  	igt_subtest_group {
> -		igt_fixture {
> -			igt_require(pxp_supported);
> -		}
> -
>  		igt_describe("Verify protected buffer on supported hw:");
> -		igt_subtest("create-regular-buffer")
> +		igt_subtest("create-regular-buffer") {
> +			require_pxp(pxp_supported, devid);
>  			test_bo_alloc_pxp_off(i915);
> -		igt_subtest("create-protected-buffer")
> +		}
> +		igt_subtest("create-protected-buffer") {
> +			require_pxp(pxp_supported, devid);
>  			test_bo_alloc_pxp_on(i915);
> +		}
>=20
>  		igt_describe("Verify protected context on supported hw:");
> -		igt_subtest("create-regular-context-1")
> +		igt_subtest("create-regular-context-1") {
> +			require_pxp(pxp_supported, devid);
>  			test_ctx_alloc_recover_off_protect_off(i915);
> -		igt_subtest("create-regular-context-2")
> +		}
> +		igt_subtest("create-regular-context-2") {
> +			require_pxp(pxp_supported, devid);
>  			test_ctx_alloc_recover_on_protect_off(i915);
> -		igt_subtest("fail-invalid-protected-context")
> +		}
> +		igt_subtest("fail-invalid-protected-context") {
> +			require_pxp(pxp_supported, devid);
>  			test_ctx_alloc_recover_on_protect_on(i915);
> -		igt_subtest("create-valid-protected-context")
> +		}
> +		igt_subtest("create-valid-protected-context") {
> +			require_pxp(pxp_supported, devid);
>  			test_ctx_alloc_recover_off_protect_on(i915);
> +		}
>=20
>  		igt_describe("Verify protected context integrity:");
> -		igt_subtest("reject-modify-context-protection-on")
> +		igt_subtest("reject-modify-context-protection-on") {
> +			require_pxp(pxp_supported, devid);
>  			test_ctx_mod_regular_to_all_valid(i915);
> -		igt_subtest("reject-modify-context-protection-off-1")
> +		}
> +		igt_subtest("reject-modify-context-protection-off-1") {
> +			require_pxp(pxp_supported, devid);
>  			test_ctx_mod_recover_off_to_on(i915);
> -		igt_subtest("reject-modify-context-protection-off-2")
> +		}
> +		igt_subtest("reject-modify-context-protection-off-2") {
> +			require_pxp(pxp_supported, devid);
>  			test_ctx_mod_protected_on_to_off(i915);
> -		igt_subtest("reject-modify-context-protection-off-3")
> +		}
> +		igt_subtest("reject-modify-context-protection-off-3") {
> +			require_pxp(pxp_supported, devid);
>  			test_ctx_mod_protected_to_all_invalid(i915);
> +		}
>  	}
>  	igt_subtest_group {
> -		igt_fixture {
> -			igt_require(pxp_supported);
> -			devid =3D intel_get_drm_devid(i915);
> -			igt_assert(devid);
> -			rendercopy =3D igt_get_render_copyfunc(devid);
> -			igt_require(rendercopy);
> -		}
> -
>  		igt_describe("Verify protected render operations:");
> -		igt_subtest("regular-baseline-src-copy-readible")
> +		igt_subtest("regular-baseline-src-copy-readible") {
> +			require_pxp_render(pxp_supported, devid,
> rendercopy);
>  			test_render_baseline(i915);
> -		igt_subtest("protected-raw-src-copy-not-readible")
> +		}
> +		igt_subtest("protected-raw-src-copy-not-readible") {
> +			require_pxp_render(pxp_supported, devid,
> rendercopy);
>  			test_render_pxp_src_to_protdest(i915);
> -		igt_subtest("protected-encrypted-src-copy-not-readible")
> +		}
> +		igt_subtest("protected-encrypted-src-copy-not-readible") {
> +			require_pxp_render(pxp_supported, devid,
> rendercopy);
>  			test_render_pxp_protsrc_to_protdest(i915);
> -		igt_subtest("dmabuf-shared-protected-dst-is-context-
> refcounted")
> +		}
> +		igt_subtest("dmabuf-shared-protected-dst-is-context-
> refcounted") {
> +			require_pxp_render(pxp_supported, devid,
> rendercopy);
>  			test_pxp_dmabuffshare_refcnt(i915);
> +		}
>  	}
>  	igt_subtest_group {
> -		igt_fixture {
> -			igt_require(pxp_supported);
> -			devid =3D intel_get_drm_devid(i915);
> -			igt_assert(devid);
> -			rendercopy =3D igt_get_render_copyfunc(devid);
> -			igt_require(rendercopy);
> -			init_powermgt_resources(i915, &pm);
> -		}
>  		igt_describe("Verify suspend-resume teardown
> management:");
> -		igt_subtest("verify-pxp-key-change-after-suspend-resume")
> +		igt_subtest("verify-pxp-key-change-after-suspend-resume") {
> +			require_pxp_render(pxp_supported, devid,
> rendercopy);
> +			require_init_powermgt(i915, &pm);
>  			test_pxp_pwrcycle_teardown_keychange(i915, &pm);
> -		igt_subtest("verify-pxp-stale-ctx-execution")
> +		}
> +		igt_subtest("verify-pxp-stale-ctx-execution") {
> +			require_pxp_render(pxp_supported, devid,
> rendercopy);
> +			require_init_powermgt(i915, &pm);
>  			test_pxp_stale_ctx_execution(i915);
> -		igt_subtest("verify-pxp-stale-buf-execution")
> +		}
> +		igt_subtest("verify-pxp-stale-buf-execution") {
> +			require_pxp_render(pxp_supported, devid,
> rendercopy);
> +			require_init_powermgt(i915, &pm);
>  			test_pxp_stale_buf_execution(i915);
> -		igt_subtest("verify-pxp-stale-buf-optout-execution")
> +		}
> +		igt_subtest("verify-pxp-stale-buf-optout-execution") {
> +			require_pxp_render(pxp_supported, devid,
> rendercopy);
> +			require_init_powermgt(i915, &pm);
>  			test_pxp_stale_buf_optout_execution(i915);
> -		igt_subtest("verify-pxp-execution-after-suspend-resume")
> +		}
> +		igt_subtest("verify-pxp-execution-after-suspend-resume") {
> +			require_pxp_render(pxp_supported, devid,
> rendercopy);
> +			require_init_powermgt(i915, &pm);
>  			test_pxp_pwrcycle_staleasset_execution(i915, &pm);
> +		}
>  	}
>  	igt_subtest_group {
> -		igt_fixture {
> -			igt_require(pxp_supported);
> -			devid =3D intel_get_drm_devid(i915);
> -			igt_assert(devid);
> -			rendercopy =3D igt_get_render_copyfunc(devid);
> -			igt_require(rendercopy);
> -
> +		igt_describe("Test the display CRC");
> +		igt_subtest("display-protected-crc") {
> +			require_pxp_render(pxp_supported, devid,
> rendercopy);
>  			igt_require_pipe_crc(i915);
>  			igt_display_require(&display, i915);
> -		}
> -		igt_describe("Test the display CRC");
> -		igt_subtest("display-protected-crc")
>  			test_display_protected_crc(i915, &display);
> +		}
>  	}
>=20
>  	igt_fixture {
> +		if (pm.debugfsdir !=3D -1)
> +			close(pm.debugfsdir);
> +
>  		drm_close_driver(i915);
>  	}
>  }
> --
> 2.47.1

