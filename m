Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9A4CF538E
	for <igt-dev@archiver.kernel.org>; Wed, 23 Oct 2024 14:12:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F4D89101;
	Wed, 23 Oct 2024 14:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BxvjrLRu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7089B89101
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 14:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729692735; x=1761228735;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tXjgdI7V8LyTj9giX2HmMvi032z5mNFiA7Qh4Wh5LTc=;
 b=BxvjrLRuny5e+fELFS6CPl6S7fWeM5f1tZRova3ybyDYqUJj/pmICnM1
 N6uCZJkV4ZMZBJsYl+nMT3fpqB3bN13frAMuhFEPKnrYoVj0jlbG8Bzqf
 FNGiQl7Bn4dWfSIPr3SwHqL67lAPm0PDdGmgIhLmF/YqU5wBN+ldwBq68
 I422noGCWjslEYnkywWjS7QxmKy24sHg46O3qZvcDqLmUvI3Bt6TRqBDH
 +tSWnFB3ogt7WaNfSsVSArYgStNZV1J871VXes5hAWNNPnGFVqVVEECqR
 1TCVL58nNhY3J/lu86M6RjbVfhUakB1wgtuLEwiuDfyTt5IOE2ur4Xl2A w==;
X-CSE-ConnectionGUID: jbC3Fu4VT4WGwtccEi15Zw==
X-CSE-MsgGUID: +L7WIp/kRFWJ8myIgymzPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="46764825"
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; d="scan'208";a="46764825"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 07:12:13 -0700
X-CSE-ConnectionGUID: VtVkgfJWQTe5WCBo7xOXkg==
X-CSE-MsgGUID: 6tfQ7iiaRM2dIiKSIVAyfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; d="scan'208";a="81038838"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 07:12:13 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 07:12:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 07:12:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 07:12:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=osqb5YJER4GpqVDmhDQaoPtVTyTFgtF3YlLJosby4PyTL/RZwVtNRDAkF5aO4sDtrMUc1RQK6xljamNLLfnUA2BLFFtk74xeANwQWZu2VqF2CnhqkzYXFS5Pf+EjSzx5XseG2HJlAz8ufD3LkUH5zboI4Eg5pnWhosfIIX8jLJ1BXCW5KDUSytvwvp4IGvII/ysOvfs1c9DWFZcfG6ouc/NI0M8+M8iFM8eymAc4nc1bw1o7CQtPdcxmwECz3L5dkQTcahyleuVoLkHLrWLcvx4DNJXvqNiPiiaz99ju1T6+P85EIBFcreA6LpQD2ha0ueTMtEmdpenhe426kBIgBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdHzYfYRNAStM5Y/PFEPAYCzkq7Efa7gwyn7A3clzEE=;
 b=B6xXW0m8/o9I8Kb+O0fV3StzT3hX5zkYJIvGaR3s9PhyoxCYRPJ6h2qtZji/Zs7tb9GWqCmv4tyaK2gO5x+0wx3vKNFWd6M3jLe1iwjPHhiEtiRipoiRFiCsoPQADLtOxxdatBMnxPgzSXlw63XHJJezHCmVR+tSUfuGafhHIZbeL4rg8dflTgvI9Jd7pUMK85ZUMUX9iDbP4MsZAT7gy0P/DSGnHo04ap3mnFFsewccmoHCCEu/UglNc5CESn28+vrQC0K5vef40Pz6PWEHtgC2yqQyuvb+F8kPvjnBftlfjjiZ7CWgrZkW+6XDHLchCREIJC3bgN8mP/veHFvDHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH0PR11MB5807.namprd11.prod.outlook.com (2603:10b6:510:140::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.26; Wed, 23 Oct
 2024 14:12:02 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8093.018; Wed, 23 Oct 2024
 14:12:02 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Zuo,
 Alex" <alex.zuo@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] [i-g-t] tests/intel/xe_vm:Reduce n_execs for
 bind-array-enobufs
Thread-Topic: [PATCH] [i-g-t] tests/intel/xe_vm:Reduce n_execs for
 bind-array-enobufs
Thread-Index: AQHbJL6ecOM9t71w3UqM3znUW3nBTbKUXnyw
Date: Wed, 23 Oct 2024 14:12:02 +0000
Message-ID: <CH0PR11MB54441E7BEAC825A733D6B600E54D2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241022201130.5724-1-jagmeet.randhawa@intel.com>
In-Reply-To: <20241022201130.5724-1-jagmeet.randhawa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH0PR11MB5807:EE_
x-ms-office365-filtering-correlation-id: eb83962c-a20f-481e-eb1e-08dcf36caa91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Pt9xmYn0+Hb5VhkArN/lYF6/7LKi3gz21593k4nVla96I7ZZ4p3LW4TuDcRR?=
 =?us-ascii?Q?rAUYJhp6tfmngtoU1yzTwSdtXOGV8atLjRQ/R9OFtmHx6JusUbIWYZi7WT/R?=
 =?us-ascii?Q?M0vGTPHvBjwa5FIBYI+M35JZ1MVGIiD9O2hs1mlHfsP4Lts2IL41GydQ/ldi?=
 =?us-ascii?Q?9Dbzm9V7LdnE4VOkX33VG5bh6wlA6pInrd6EPNDQk5kDKzdvNjYEwDrSmyMG?=
 =?us-ascii?Q?yLp2LYTXYVVVQgk3JMeLPtk/s/90Y9lD0QjoysBIYF/dDADQnSAp64UFDS84?=
 =?us-ascii?Q?3oSCHlHo09bJgH99wkOzHBC/3r47WzirKxke3sjCOTosswuok7I5HKTA9bqh?=
 =?us-ascii?Q?ILrjxKfIeGAnHuqkAK2GcWceTyhTgI54tXNpuPQ1BKSKfdGwcFRm9c98Xtld?=
 =?us-ascii?Q?MLj7vJhmSaAheqBl+MtH/0IXxlwEk5bKUNc7/lcEGP0y1EZscH0Bmy4rwoq1?=
 =?us-ascii?Q?cilXniHw5A81x8Z4wnbsbpS8ODTgVOUsYshcDJHtNnw+x+/+fyXrxKVfLmRy?=
 =?us-ascii?Q?H1Dym1A3CBomrDAjdfaRlORWiKRVZb72YLL9FJdQRUJnKo/2/D7dWx848680?=
 =?us-ascii?Q?VRLwtvMtTFywwfnrhRaIcIZr6LeFJXKhMZgUuEJHp+7YCqOcn8pnrPDSLVpu?=
 =?us-ascii?Q?mj4I8s9z5XKhrfO0o0Jd8DUDd5iDcKntBzVwTYZ7n3GlRRyegLNIb/CVIa8P?=
 =?us-ascii?Q?W3iSSZANRAs1gCj9ar6HBbNyJItpr2aGJkpvoL3nL/z/ZOk+6BOlJO0C0nrF?=
 =?us-ascii?Q?ZpwCmrGqsper3CIdnxABGVfHjKP2wHXcQoVxbWn9RFhtvzRAIPJnRMC6gkiW?=
 =?us-ascii?Q?MqY+9rHbPIrFTCO6Z0WpfotRvKrqXFJmHjcEU1nxtpUn3m4PSNTKrLKUNCqR?=
 =?us-ascii?Q?XRJA1YQ1ML8k77TGVROgaavR34IEUctF1cM5cNvtfZbjJiczPo+cb6QYnbvf?=
 =?us-ascii?Q?3+ZVrZN/FGvROHfz+vl5k/KUxFYjThRsdVAnZD5cFw4M2MSmWbxwDZdASN0P?=
 =?us-ascii?Q?SvKwjxGwKb4/vxHN+rPobhZ3E3RCtmgao3LoVNsUySPq3OBriEw9d2OYQUaO?=
 =?us-ascii?Q?8LC2+WbtwShPuyjOowz7ipXh6PXpDiczaAibtyh2VhLid8DEBU/AQaBhEavn?=
 =?us-ascii?Q?UTStFwxQQ2umi5ab93BSay2puE/+9d148qeYeg6TIEgw49xE4u2+uNfVDq1C?=
 =?us-ascii?Q?s4uZ6sSYaAoL3SFORMOncJpIXn111cEQJVd/keEIpMCU+xu5jI3gbSBvwFzW?=
 =?us-ascii?Q?O8VqGWGi0WEbZ6UkzHR4SAeWjg3ZqZ8HOCNR3f/FF3PioUH3rha3USJ26l55?=
 =?us-ascii?Q?1y/D6CZXTPnQJ7G27bDoGZ6J35UbiUgpSZQi+rdYPzAKj1dbZN+NAP+dhUIo?=
 =?us-ascii?Q?uZjmsDc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1hy5dAPs0aWj1K7Eh3NyHvRznk7I66ITxCoj3gJ42mLutOvZ7aZIGzku3DPg?=
 =?us-ascii?Q?1f7BgwCPgUE9HzZq2BMUwxLSXxNJUOAY2Px734/I1vEJ8eG/smDsS4MGq6hH?=
 =?us-ascii?Q?NgE8XrhV2U7/VquPJ/sgRTu7OpupirgFL9n+xcQEzujr535yu8SgzGEt4R21?=
 =?us-ascii?Q?559rHJicU7d4eZtALNNnIQnRU38mRG13gmARqlXBB3B5mLC7Zxx928xgHf6c?=
 =?us-ascii?Q?R71DbWD9BB6QxJ3u1I/Bk0xHHTOmkcsYD9P8TIkB9yaTbHxLD5pxHeF2bk7v?=
 =?us-ascii?Q?dkKI8aQB1eXQKr4xmIvYcsXtHnmpOGgV3jkV1N0a2QvOUBoZIFQ6YGgU6Tao?=
 =?us-ascii?Q?upCBokb7t2eH+IC8n5b5t6V2kcbVKRbQRdIMPrsiEGo08+rE9S3GdvpcE4rI?=
 =?us-ascii?Q?DXPIzqHrB4/WINNsEHxRbyjBgSrCj9//noAjJt369mE23eBiKsjUbQ/wsmCj?=
 =?us-ascii?Q?yLjkKROW17savOfPHRpX7SKCT0b8sHcQeXXuQhM4MOPHdvMaoQw1UPC5faKo?=
 =?us-ascii?Q?5EhChvHsH3qizIqRnU8ngITetLkH0LCPqpItx+gKFdql+iwuMirOoWoQJ5IE?=
 =?us-ascii?Q?jcHPO8HbrifPOermzNg54gLGFuVtz+/8rEg3FADjCFF0hdhcZA+lq+RsYdPX?=
 =?us-ascii?Q?zfq3NI87FHmP9bH8HF8juQ0+2xtCxs7XPFeNwxZ+mtu2GG06+e85O5j9cMDq?=
 =?us-ascii?Q?Y/nWs6i3OObG9ETIzhjWSEYcB6q9CY2Dlhn3/R/gfsQf5UyIAy8Z97ELBf93?=
 =?us-ascii?Q?BGXzgkpyS54i+AWz+b80lj2pOoBCclpzHa0YAah65aqoquMpwbddClKYIO7k?=
 =?us-ascii?Q?rUaCPhD83jG4nDLaTAYyC+qNoA2cO4Iy/zWFrr2OPJwLSnAssxJGf9LQ4pdX?=
 =?us-ascii?Q?8RthcAzni1DYmUfXE/kETIGxOdQUUbRY489o9KryITZ0TpQspi6ChS15ZAlU?=
 =?us-ascii?Q?fDJVnmtPKKiGEn+vTnx02Pl9NZWAGbR0DCNcx2a5Pa1usUnsqzSMZhuWph0T?=
 =?us-ascii?Q?JVl+LVta0xjp10ZTsqf//PEPYGorKbQeOx6bzO5YN9/rbqX5ag3q39ionUOG?=
 =?us-ascii?Q?Szap0vCcRSH0gISqiX1vb3z/+YVR+IXQi9QMhEQooTQnoi1l2iil6kiO0fsN?=
 =?us-ascii?Q?di6/T/HBpuA/CnUwVcZPUQsuPdlaaJM7YHnUaiDy3xqYf517NVyVIGKUHViO?=
 =?us-ascii?Q?HmYsbfbZJEXm/A6fc3y78jZfjal8Mkl/cPXAjE6gidm9zN2gtSL89+/Ibw+9?=
 =?us-ascii?Q?5iNzZ5YGSNESG2S+xd+pEc4Yn8Ior+D6r4MLBmi+3ci5DGZGlfKnQCsMkTo0?=
 =?us-ascii?Q?k8JFCPx7ROIk/7GPdlKU1UwVw6gyf+NmlwNT0pLygUb0WciGQYHOH1Ce/ibM?=
 =?us-ascii?Q?ykiN+VCcNgQY/XnzCkFQnSd3hf0u14x3ahV1vc6F3U/ygzIigj3FHFvxy7Rf?=
 =?us-ascii?Q?BVODgZYPAOAMsZXrV7ZK0zF8kdh42u3zRG54IjhJLiJ2YTfbTYbsgZzR436e?=
 =?us-ascii?Q?rmEPjxWZQYQJ1e6FHNExcGxxNk+U27j6PeQU0Qfu+OPgF470TnSKox98VKrU?=
 =?us-ascii?Q?I95bDnrNYWu8NJEHG+5SaeN6sFKuFc5Gtp1zEuhY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb83962c-a20f-481e-eb1e-08dcf36caa91
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 14:12:02.3254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G5bp1aBaCgMIEhdSgUhqLxzipMB7lO86MmPj5bwdakIKheuwwWPk5aPmFdxaQX9a3k4Y9wgeltAN72HHvwM2QMt26dm4kUcZv9+hjvoLBHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5807
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
From: Randhawa, Jagmeet <jagmeet.randhawa@intel.com>=20
Sent: Tuesday, October 22, 2024 1:12 PM
Cc: igt-dev@lists.freedesktop.org; Cavitt, Jonathan <jonathan.cavitt@intel.=
com>; Zuo, Alex <alex.zuo@intel.com>; Konieczny, Kamil <kamil.konieczny@int=
el.com>; Randhawa, Jagmeet <jagmeet.randhawa@intel.com>
Subject: [PATCH] [i-g-t] tests/intel/xe_vm:Reduce n_execs for bind-array-en=
obufs
>=20
> The bind-array-enobufs test in xe_vm.c is intended to trigger
> an -ENOBUFS error by submitting an oversized bind array.
> After encountering and handling the error, the test reduces
> n_execs by half and retries the operation. On some environments
> with stricter resource limits (e.g. simulator),

Is it "just" simulator this is an issue on?  Because if so, we could probab=
ly
use igt_run_in_simulation() to narrow the scope:

"""
		xe_cork_fini(&cork);
-		n_execs =3D n_execs / 2;
+		n_execs /=3D igt_run_in_simulation() ? 4 : 2;
}
"""

If not, then
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> halving n_execs isn't sufficient to prevent the ENOBUFS error on the retr=
y.
> Reducing n_execs further to n_execs / 4 allows the test to pass
> successfully. This patch modifies the test to reduce n_execs
> to n_execs / 4 after an ENOBUFS error is handled. This ensures
> compatibility with environments that have tighter resource
> constraints while maintaining the test's integrity.
>=20
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> ---
>  tests/intel/xe_vm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 7a8740b69..e78ddd0e5 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -957,7 +957,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_in=
stance *eci, int n_execs,
>  		xe_cork_end(&cork);
>  		xe_cork_wait_done(&cork);
>  		xe_cork_fini(&cork);
> -		n_execs =3D n_execs / 2;
> +		n_execs =3D n_execs / 4;
>  	}
> =20
>  	xe_vm_bind_array(fd, vm, bind_exec_queue, bind_ops, n_execs, sync, 1);
> --=20
> 2.34.1
>=20
>=20
