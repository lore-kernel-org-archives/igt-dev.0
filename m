Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3648CA5FF1
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 09:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD4D10E419;
	Wed,  7 Oct 2026 09:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d/K6LApz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA6D10E419
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 09:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791366433; x=1822902433;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FwcN7WkpsV0/o/FJwlUMKQx6CC+nNUnDfTiVKiNNxak=;
 b=d/K6LApzPEfnnS2dBB9XYItdrrp6MIHIu19Wptl1ArD/zOm+xCzKZPw4
 eWYurnEqdAw50uwGMJBlb4vVRnQRQlTqCq0EQMy3bvDpKrzjB/JmKPQoY
 LaCGTiOaNri5dWKhCLveTG9+2lnigiHQpCgzN2H1AGDwXjhT4768R7aJl
 8bZzXhdsAOIOlzFNIJMsNiudjzULXmENplgcqLWiRxh9KU47YvL6sYTmF
 IRl15okAfpearbs/AP0xjpYwD3geuZPFdGVnulimu23DNnCpSpQqY6FTb
 c1erOXXDQp4EtOZLi1+rypTSvnO6YaxWdGnQUikyA0Pnh2xCoXtlJHRs+ g==;
X-CSE-ConnectionGUID: iFxylVYOQFKsjYni72NT5Q==
X-CSE-MsgGUID: 9GQ/kCh3Tyuj5Zy1JgZQ5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="117478"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="117478"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 02:47:13 -0700
X-CSE-ConnectionGUID: DJwiXuytQ9qaZw6vhxsFWQ==
X-CSE-MsgGUID: C1k+VX09RR2eGl/cqEAtQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="120956"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 02:47:13 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 02:47:12 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 02:47:12 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 02:47:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9XDM/otqrAF3vrKj+1cH7CIgm3o2aD9sS7riy8QvSJkjXzeZ079eGA1iJNiktaATp/pf6aDmQM8rmx+7dCWZgmQwEVw+ZhIcxtoq4mNIc00ULbQrkC4wkc0Qjaz/u4HUvS5TU7V655Iut9hcQTG6XuZxMNEBdWbo1tBS4H9pN/ecEgDCwVmdi9buQhySfJgFniCVpAmrU++XGqLJnVDeyp9jeJcw1MvEutqtqN4LRT65Ex4ktJckzRJO+WBOk7xQ8+eoMH7FsmDApNuIYSenOLZmEvvwsZIJ7xgpY6A7+yHC+zLFp+vns/iCPrR3Rw2lI/cL+uU+R8xSE/5/pIOwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1xViM3PBgbK2k5wX++hEffy+Zy1zYuufNyiITV0UKE=;
 b=PWaY4nEXo/1CEMFt+l3d+1kZelszAz3ZEx4h7Ixo/ktVXXPv+GwKwi8cR9+mJNEn/1ckB7ZWjT5JDXeSYNZ3+E8agdFlE3vhT8mn0VhHh8wrexzeVXc4vOxj1JfdtXdG5kT+GmLKbh8+tgLnEq6Dg7Cq8G14mA7jUaJp3Q401XIaukLHfPg0BR13SYJ/aUR03tpS5OfAuhgmPK6HLJEMc2o41TBlvfcN5+ch8KBy5toOj1orBmFncrxgp1Fwrg1QTkXSZBJfqJemhXaY6t8GVQov6OoiBkoTAnQLenttVbpKQLpuw+WsD7UgQko/RFrCl/k8PfWv7at5MgycXw4Qzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DS0PR11MB7683.namprd11.prod.outlook.com (2603:10b6:8:df::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.22; Wed, 7 Oct
 2026 09:47:10 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%6]) with mapi id 15.21.0472.016; Wed, 7 Oct 2026
 09:47:10 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Patil, Shivtej Eknath" <shivtej.eknath.patil@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Konieczny,
 Kamil" <kamil.konieczny@intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>, "Balasubramanyam, Smitha"
 <smitha.balasubramanyam@intel.com>
CC: "Patil, Shivtej Eknath" <shivtej.eknath.patil@intel.com>
Subject: RE: [PATCH v1 1/2] tests/xe_pxp:add coverage for xe_pxp_debugfs
Thread-Topic: [PATCH v1 1/2] tests/xe_pxp:add coverage for xe_pxp_debugfs
Thread-Index: AQHdVUCjPVrEkDhk4UWL0cOnh616sbbx1jQg
Date: Wed, 7 Oct 2026 09:47:10 +0000
Message-ID: <CH3PR11MB8434644DE7CCC73EC28B51D18D942@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20261006031031.30938-1-shivtej.eknath.patil@intel.com>
 <20261006031031.30938-2-shivtej.eknath.patil@intel.com>
In-Reply-To: <20261006031031.30938-2-shivtej.eknath.patil@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DS0PR11MB7683:EE_
x-ms-office365-filtering-correlation-id: 1d1a313e-dbb2-43fe-eff6-08df2457f513
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|38070700021|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003|6133799003|3023799007;
x-microsoft-antispam-message-info: /PyZVM1EvYTf0tZQwVIRd101LwNIFUQcbp8TuAanMnOYonQQGJkdT2W0kwY3DEW/cIZE4SG/z0uIyao3DyxN2gt5BLPPZuKGBeIED6GSgrF4sTaUb65qBJhG1A+Aty3hRJiUVRvYAylLAyFVquzjc25HmdlefYoWMbaKEcWaCxJiTcDnegca70J4zmXZNx5/qbDl+BBApeHOYKNUDsle0e3sJhVNWrNlSpTKA6cH9tCsnlDvunluXHOZLtegx7EAQsGEQZICK1bKdBtDdnqxRgwuXwj6XNSDjcSipOI/ACwQTSYxqe30YlUa7qnlFiNwbnVqFBwKJrioZ9BHN99D+HYuWhm+0JHrdCMoaD1rg7uyk5u+L5hlENqd+tCQjmhJLZD9opynNo1jinggJ7pK3bl9dIBGjxt85SO0HklDA5YMGw58wgczuh5LMf7OAX11tPs+HJNRDYv+cV+Rr9VIj6eUmbsCWOWybaxvBymJJbbJGW9DJmSDZNHakCsWGwSdhYPMUCFDtaa6lMftYB4BygGhaLYnmK196aVAHyYPRQ2cStIYDhtSUHPDQ8gFWPn3ZkQFqpAXouc1OkGQaHQJzc8PkGFJsVG56nrsMpYX9CvJpVoSmC+KS30BPFzGcG4oGl89qq18CVcinyaF4SZ0S5uQ1aFocnY7qwh996c9iSTRV+CxtvSFvI8ZQX4IPSBs45xKUbEDx618uncx/M23jEp7K67M5MMyBoI9ZkBy3uM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?z0doUI0ojuugh1tDVNC/UBRpltR0rYhQeC01uKO+HkYBoHwrvqLR2KBXBk9c?=
 =?us-ascii?Q?T5QO379RycSs/NdH1EX6p/iSG0HH3jyOxgX+kOA1EUuh+5G1V5paHbYTA5k1?=
 =?us-ascii?Q?pp8lBaR2CJSf7QXCBo7g5+tV4RRbZBMk1mZLeuW7T1Z6SnIYQoD4I9nZP+pN?=
 =?us-ascii?Q?/jxfVpJbVXMFifjMMd+EyVTA2dUbxn9HDtMO29hzbzxLohkUqt/vepTIxFN9?=
 =?us-ascii?Q?0Nr7AMQaHZPBdvMzN247UNqpGib4gyxTO18lHzx7wyJReyI8EZ0/QXlqS/hY?=
 =?us-ascii?Q?U9ssuXPXWyA9mlUUnN6SaJjdqH4a+EusZxvjiGZ+J3Z13RhiUyja91HUIstT?=
 =?us-ascii?Q?fN5PM7+gO/nyhgORBTayKB+rXphrYD20p3EUjl0LUzNAI6FIgPYc+HP11Cat?=
 =?us-ascii?Q?IrB9Ej6q+I/ZWoNDZI2sBHGGwdLMxvXbAtKoSIAKbCIzmxOJ/dg8bJHp1LiR?=
 =?us-ascii?Q?HJXSF4C8YgrxYO+/d+QHHg1cFgKdVPeFhLPItFPUMZqRQgxzxOmbmEz45fbA?=
 =?us-ascii?Q?wu+In3T3Rlg4ZJqRv0pVC2GRuPDOiWrdewdsVT7vbEGTz0bcDHKxZZaqaZBS?=
 =?us-ascii?Q?so7E7YFHssduKJ8P5RFN29q+A2YvQt6/KQ/K2xvK8W4tvkgU9kFy7BlYUPQr?=
 =?us-ascii?Q?byuRZtaFd+YQknhL3rq/T2Ikp6hptxLHch9ByPY6z6b5t7GgbABy7yF1vpRc?=
 =?us-ascii?Q?+e0tCUeSrLaeqep+zgembw72cbcDNUrdlBNHOWwmPmxHu6OJ2HGTavpde4xv?=
 =?us-ascii?Q?SCFEAqlT6p+DtpIqbRIozuQW/6wswPe3KBH8CmT+8ukpUq4WwLnsvR/r1JFv?=
 =?us-ascii?Q?DLZvugwvoMoGD5Vz5ll8aoeGkvyCPXLFXe9qE3waQvZK+gp6L3y2XTNRAjr0?=
 =?us-ascii?Q?LpWJ91I3ghKXYlJikyPMXzDBHoya2SbACYkWSBOQSR+Ig5bG9mO+ej5b00A0?=
 =?us-ascii?Q?/nT+R0qxLszK9QJZEPa0WwwcKbcCXgN5dhbz0b3UBX8sDXj2rsQGkNjDL730?=
 =?us-ascii?Q?qhImH7u9nrJOI6U2ZX9xFjmxMu4Snc/D5USgGmR8y1mW3R+P4GqY1jIzQm++?=
 =?us-ascii?Q?+0WeRPjtFBvNe9/gRFHAi0muIrxWOTCcdnfJXft5NYpiKddZvMmqAtl5bN40?=
 =?us-ascii?Q?rD7HEOPaOzYAem5YYnG0Jq8kxyvRGDpEUpcOpDTd6ZywvdST3letCybGPimu?=
 =?us-ascii?Q?+yEj+/hkBcTZW6so3Vx2sZztjZM4muplJYhhsqxIL47Qg6SzfG7lNmTpyvpL?=
 =?us-ascii?Q?EWlHJX0TfXFAD5AXHYVy04sTAMKo8qlEYWtBebCu+OSFhRBEyUz1HmFhmd+r?=
 =?us-ascii?Q?xcUtiuVZ6VVdSoF16Sg6TxU/WsovEIXKZPFCaaqBXDdQqshnYqN0eq/UsVWk?=
 =?us-ascii?Q?hOHhtThObZrHMOQgicWf3r3nKvX9WPpR53+r4aozN8CYsIT1JJj4oKaVfIAn?=
 =?us-ascii?Q?Cp5AFJTb+irXwAfYDmrXxyjwOCoqtYWHvktnMtDPUfUGClNfyXzmVhUDC50D?=
 =?us-ascii?Q?oZEw9Q1gscxqWRHvqQEfWt/DqglT+X6Qt0sTnBgLxicp20lea9lsbametakE?=
 =?us-ascii?Q?8i+IFH4ml5jB9N97UQfy9RsBiBzqz44PJXi17gTn9kR2smr7t3Rf6Uv4cD5n?=
 =?us-ascii?Q?lZxYqPVrfcdRnfJZOuwmbmT2nHHUdzGzES5FQEnBZF7k+N1JCOupNaVaXRrq?=
 =?us-ascii?Q?eBcxxcVqvA+62FzkC6kzGMk1JdzLu2QEEYck/UeauLtqVWemMrYCJVcPWom5?=
 =?us-ascii?Q?9crnzKaKXA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: zHTKY+amflEbyw2n9hAj++MyGMWsdXtHKkoBfVH/kY3slzNbmNveRCoELrltNZjCNo3em/D/9wP4CaIZMQMg2kfwjB3zZrLHyPiJDAVn2jWw6BMXq5fJjGv7jpxhfO4l15giXwRPjYU7khV4vHLsbg1RRug+qUGZRPhK3MIuF6odC/E2JWVxkeix4IjzgLnVhOb41s07StaNcWT1/McVt5WLBRrXmT+x1ABFUzUvXcq2HyK+9oT1GmXh93M7ISB4laMkq2LGr3bZAJTY78iyI93AbZlphn8VCjbok6nF0TipCrDi0p8qDhWebZ3+dptHlAcF5HQ7rK1aw6n2r3Qlbg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d1a313e-dbb2-43fe-eff6-08df2457f513
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 09:47:10.1697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ix4unb5mSyQvPln7ZD5NFV5Q5gtwkKFd+Zas0MWjAY5lUqnn4iQAC5jEHc1UvsNHrUELevaG81Wrb7SBjzmVr9a3tl3exlpF3fEq3XUnmMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7683
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> shivtej.eknath.patil@intel.com
> Sent: 06 October 2026 08:41
> To: igt-dev@lists.freedesktop.org; Konieczny, Kamil
> <kamil.konieczny@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>;
> Balasubramanyam, Smitha <smitha.balasubramanyam@intel.com>
> Cc: Patil, Shivtej Eknath <shivtej.eknath.patil@intel.com>
> Subject: [PATCH v1 1/2] tests/xe_pxp:add coverage for xe_pxp_debugfs
>=20
> From: Shivtej Patil <shivtej.eknath.patil@intel.com>
>=20
> Add a new test to exercise the following functions in
> xe_pxp_debugfs.c:
>=20
> - pxp_status_to_str()
> - pxp_info()
>=20
> The subtest verifies the expected debugfs output and improves code covera=
ge.
>=20
> Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
> ---
>  tests/intel/xe_pxp.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c index
> 5460bf6db..4c3c9ac97 100644
> --- a/tests/intel/xe_pxp.c
> +++ b/tests/intel/xe_pxp.c
> @@ -506,6 +506,19 @@ static void trigger_pxp_debugfs_forced_teardown(int
> xe_fd)
>  	sleep(1);
>  }
>=20
> +static void read_pxp_debugfs_info(int xe_fd) {
> +	char str[256];
> +	int ret;
> +	int fd;
> +
> +	fd =3D igt_debugfs_dir(xe_fd);
> +	igt_assert(fd >=3D 0);
> +
> +	ret =3D igt_debugfs_simple_read(fd, "pxp/info", str, sizeof(str));
> +	igt_assert_f(ret >=3D 0, "Can't read pxp info debugfs\n"); }
There is a leak here close the fd, close(fd).
Also ret > 0 instead of ret >=3D 0 as ret =3D 0 might contain empty file.
This is fine but instead of just reading it would be good to print the info=
 also here.
> +
>  enum termination_type {
>  	PXP_TERMINATION_IRQ,
>  	PXP_TERMINATION_RPM,
> @@ -762,6 +775,11 @@ static void test_pxp_stale_queue_execution(int fd,
> enum termination_type type)
>   * Description: verify that submssions with stale objects/queues are not=
 blocked
>   *              if the user does not opt-in to the PXP checks.
>   */
> +
> +/**
> + * SUBTEST: pxp-debugfs-info
> + * Description: Verify reading of the PXP debugfs info entry.
> + */
Description should be above read_pxp_debugfs_info(xe_fd); not here.
>  static void test_pxp_optout(int fd)
>  {
>  	__test_pxp_stale_bo_exec(fd, PXP_TERMINATION_IRQ, false); @@ -
> 1157,6 +1175,11 @@ int igt_main()
>  			require_pxp(pxp_supported);
>  			test_pxp_optout(xe_fd);
>  		}
> +
> +		igt_subtest("pxp-debugfs-info") {
> +			require_pxp(pxp_supported);
> +			read_pxp_debugfs_info(xe_fd);
> +		}
>  	}
>=20
>  	igt_subtest_group() {
> --
> 2.43.0

