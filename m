Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CDB606A31C
	for <igt-dev@archiver.kernel.org>; Tue, 17 Nov 2026 04:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wv/0dtJ1;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=TVrwlws+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8B910E40D;
	Tue, 17 Nov 2026 04:53:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155A110E40D
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2026 04:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794891170; x=1826427170;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=817GNHE7XGCrKEIxUXin0ShLyZ+WLyoeW3SdtjOEDmQ=;
 b=Wv/0dtJ1Aw7I86X/m7pk+6lZm7e2JnRNvZwal/O+cdjtdXk6vBO1r335
 7KJwP+Ys0s6Vj8QItHBp8ukr97hF51gB8TaDpNuIRJw/82Jv4fWIf8l0T
 ppWNTKrASjawYnEQfZ2mkb/e5tZUCtD44C4rGvfqHnnctgWL0RF9lMfaJ
 20Hk8MM4IvHjKIYQHj/1gblcXTGF2UIIzcih3sQ4nuXvKJI6gELGey+Jh
 xZr0GDioyiGM+R98TK84ODaYuKzKJ2W+2bC4OYR/CU1flux4loPuVpesJ
 kk69Suz4Z9kevG5Gqxp1XiC9qCTVZMnkI7rXs6OaeDWFjt2WqoWYSyMVE w==;
X-CSE-ConnectionGUID: pXM/7Di9Qzm5q3UJvOczoQ==
X-CSE-MsgGUID: v2LObLmrTmSrKekpK3gzXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3663084"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3663084"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 20:52:49 -0800
X-CSE-ConnectionGUID: wR1CSM2XSYmEQ9MSJOzfwA==
X-CSE-MsgGUID: Vr/kbyHuSGCxg5S8Z5RWLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; d="scan'208";a="10068309"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 20:52:49 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 20:52:48 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 20:52:48 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.58) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 20:52:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrbVMrKgi6sZoBoTPzSZGg89o+KUuwFKIC1Y3htcZsNVMaXi3btQ2W//v0QdQpOEFd27kwm1EGg/o0wrg8vuzkA3t41LGVU/mj/glaIY64w08RoXJaVrCe3tepfsZAc00H3zmJOTxs9wou+MoZf8siy7tOWwDkHBjtAzu8aYjOAI1PDeHPHrYkj2Hz8NYL3btSwymfKpHEvdAxUVlfwk1Df3WAqm9h5ZeGaKH3rNJKmRAGXlu6kgVdYHNoOPiVKsGWZi/kpdPUT/MmQ2PLPU7B9oxfqwQvMbvAEch6648vy7liL7csCMn4gAdQUcfwXIGjwLuY8IF0G7xnTyioJ8zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mq4VORIjL2MM3eLk1bChQYuJ/0Hw60iqy9NfSRn6Zt0=;
 b=U6AQD6ZzwDzoReCwj9uFVrBKUFQqhQj4d4PucXMOiv2kGw43ToveO9ePg9HNoZrC0e8r+B1RsWCTHSvgNf8M4xDB/4OmM1nWOOZ0JGXhA034Y4RjKIsrt6uR88YTkieRMeJNZ9EW1sUV/dGhkEU/5IAfnnTWoa3Vcb7wqjUPVJhOfO9W3Y7TNYvVXqrU5nxDNI42Pdyy87+Ota6poiotOs2aCs6ks4fo11y9BjxVq9dpCLmo9GZ98Pvnl/GmhI8F1pxP46XRa9SaHqaUN001TRgsFjOTqFE//2kMclVT5y9kFmSkZKHeB0q78BAw1MgShdjBPMA3QxqjvxLD6qMkMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mq4VORIjL2MM3eLk1bChQYuJ/0Hw60iqy9NfSRn6Zt0=;
 b=TVrwlws+IW6q87kETU/GUL7f4SqjDdgytuKSofLUGWnW4OGPTo3ptwHVmNl00H6H6m5weuenoBQ4FQM3uHpnQvKn1pJyVt0v+hPzBTd6Dhz0csKgxy4zexnwVKA+US4nlYx62VifZ213mb/ynCpKiazFW6LyZJjEQI9YymHQw0s=
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by DS4PR11MB973201.namprd11.prod.outlook.com (2603:10b6:8:4f0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 04:52:41 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 04:52:41 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "S R, Avandhica" <avandhica.s.r@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v1 1/1] Extended multiple planes with multiple pixel
 formats
Thread-Topic: [PATCH i-g-t v1 1/1] Extended multiple planes with multiple
 pixel formats
Thread-Index: AQHddX27Fbz/hNhCNUSsUTsJLiOAILcxpJug
Date: Tue, 17 Nov 2026 04:52:41 +0000
Message-ID: <PH7PR11MB6796E97DB377172E13EEC012E57B2@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20261116035131.452844-1-avandhica.s.r@intel.com>
 <20261116035131.452844-2-avandhica.s.r@intel.com>
In-Reply-To: <20261116035131.452844-2-avandhica.s.r@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: avandhica.s.r@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|DS4PR11MB973201:EE_
x-ms-office365-filtering-correlation-id: 50631025-74d0-4bf5-d957-08df44669c7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|366016|23010399003|261021121427099003|261022105027099003|38070700021|4143699003|5023799004|11063799006|10067099003|56012099006|261026121527099003|261026140227099003|261028144727099003|261022075727099003|261102123227099003|261021123027099003|261009223027099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: M+d0DGmkBzC+6W+qxJY+Mp8kjbwlyQ7fd5IETVwRlUEt+JK0+R6UI0qCNhnR/85Oat3mLJFqyex6K2D9pU2Nm0aXbeJWmnglNtfDfPhr0adAyIefanILTOmDSO7Lrtl4uTeMrwOjgN+IlyO2+qlEEQbFbglKgIQ1WxizdDL+Ivp282iLEWgcBizGV25Eo7jm2UAOFBxVz0g89/aLWxOdYxaAeXTmoF0pKY+bIN3Jj/n9r5Uxm21lqWr7+o77g2ip8W95rbc3VuwQ3We0q93VqT9Tb0chaHhSap/5U0zsChg0CViAiXrPu0kqFSpZL6Vq61ghRtzwb1yq2mdP5XAEtx/dLb20Ch73bXZZk24l/bV4a2FW9IQRugF7UMVOO8CrQ00bAxpcVg5VjsdHZ2UPFMKykA/QVueyzskD3/CeSCimU9TGiIFVvYbl8kDuQeU4pzFpOC/31eCuvVbhW78SFpRs/zsTGUP0YiJ0bGClc1o3vZrDLzqXOnt9mcSu/befeKyA1tg+D5BXHAFW8QBm0ZM4sxznARtfX6pQF8kVeheUHjYiOmMMZNbs/agNhQkdcnuZ2RdctI78eZjfcauArUK2g+1SGitYHr2EAgfN+ry+WBHIPKaqR+PrxaJ4mSv9STrno7+ZQLn4mhTqDUZ7f4oYrbieH/jl+b55CB/qN0CGyveRU6P1/v3D59j2uDqLrVdqq8IlhO7Jmi/naVbQ8sr0F0eRyGfRul5NXYBhFyY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(23010399003)(261021121427099003)(261022105027099003)(38070700021)(4143699003)(5023799004)(11063799006)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022075727099003)(261102123227099003)(261021123027099003)(261009223027099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8WGuZh0s22+tWviCcP5z/ZaFyXs1Ig7u8dq45Kqy2BcnfNw1swh5W1H+SqES?=
 =?us-ascii?Q?Oo6s+BjZvOuFCT72gnGJ5gLsVleFtHXTKrwnqJbV1sJTVN9sHJMOmC1c1Gh7?=
 =?us-ascii?Q?hYVvPuwFfEs981dED0GOUPp9C7qfewaRqmYvS8hlU5uxxZRqV0r8gjuoCGnE?=
 =?us-ascii?Q?CoNatGMZqGPXPddCctmiMH/zsz9y920YVN+bSG3hDFWTGCGwJOgcz19Bk4OP?=
 =?us-ascii?Q?TjB2u/qiDXjJ3nLfwktI+ZlrKGC3+8vuVCwoCNTvoMvNF+KHMyl2Ay4esYdg?=
 =?us-ascii?Q?RkyPmo1/MEjIJNzZPd+HgVVrMyhEHV0UKSpr3dquVHQLqCubZMbVrXJxAJnR?=
 =?us-ascii?Q?BCCHNHXVlmVZacjxKVB+DqOTgc7YD7BK+cYfBqG0S4REPSkAfcsZikeakmOE?=
 =?us-ascii?Q?rUtLNgnZlhth4lRzBXmvjKXDgH8Mr869VAW6eBcDmltFO2jRgBmGQ4mAfbPD?=
 =?us-ascii?Q?IymuLDZQ3f7DysFideMf7Owf0hOsJXwjtKa31CLWfbGOBw8gtW1SE9xBOTP3?=
 =?us-ascii?Q?b6QRsSoglxYcoimfUJ29R74LWMmmt6qm2LOPK+vvOGqXjvs7IgP+wxn5zY7z?=
 =?us-ascii?Q?69vq7gXTCaPxEEI5NMakhtHFLTeNpWQbLAskmW1KQ9kpEXV+lNr1c5q2JKBG?=
 =?us-ascii?Q?tglunqQFofABEh2ThA9yw1lMftBqQIgUfx+1kVpxDJuHe+3I7ovrUSDhsYEc?=
 =?us-ascii?Q?ANnDDygpwNeSlY+8RtK5z+kJr2q4kZKmFIW/Hcfea7ml3HmVtXqqc0BdrKaw?=
 =?us-ascii?Q?d1i+pgd9mMvFD72r8nibktXFwrDBZiFYuXzUC9Jg+POtEJvs9BwnK4RqYmP+?=
 =?us-ascii?Q?ch3tYYBBr20a5tU50HlH3xoeLgEbF0E9yJZeUFq15t3rGcChuUmBbQwDiz9k?=
 =?us-ascii?Q?Fgo0BWTeDh9ohyn/LsreTMHg0FejNLhzs1+jXVD838af8l8SVBFf7l4jUIg5?=
 =?us-ascii?Q?gZoiZ3Rv1Oshr85yr+RIVoQYkGQEjQLa3zrb7Hqg84M6r5Ty3ig+cSmT+DF2?=
 =?us-ascii?Q?dLDXHgyZ8Y0PmmhgUn/SRc5zR1QXPA7sZf9olhlDnT6e0xE/1YNZOnCiagbu?=
 =?us-ascii?Q?9RAHs5slQIBIe9keL/ZKP99q7fxiLCpGHsxDlJ6+qst4qLGvgdkhXxJv5Rre?=
 =?us-ascii?Q?7yiA/p58NcjaV/qOas8x6pJakJPiT94wgiwQOVH391TbAhNqJ00sh2/yrbkZ?=
 =?us-ascii?Q?WuCf16z3L2Kpfnzdgu/FsTafia9UsdrbXO4ynCyBbYsKBYtkrLe5F7qfsouo?=
 =?us-ascii?Q?+mmPaqWx/5DZWvcwraKSVgT48FEJZ4r0Wf/yPV3/SXYu2YDtU2Lkiq4Tiues?=
 =?us-ascii?Q?ZP7XhD8iiys21y+dxPE0vbJgJpoGIDGthyFwe6dHWmGpMxWZWcn5jS/qpGSu?=
 =?us-ascii?Q?0GOjC0MTBKKUJLqVG8CB3XNPfNn+cQ9Pt7j0kQtpb7vl7byjYo+sKuNcp9AV?=
 =?us-ascii?Q?+DVAxLclfEs3lJnEQssieapViRMdd9nYtki5r/7hFPeXtoHDVwJ8PcLz9gmc?=
 =?us-ascii?Q?dbYDxuk0DD8d6V8cYEUgO+ySeR91iF+mkDzIhC1AxF1U72czDSekW2/ymGOo?=
 =?us-ascii?Q?U3X508AKvJVXdZdTzLSyUZudsdNt2ZAq9N2RPSfVe6l+8K2g4li+oCNhiXjo?=
 =?us-ascii?Q?n7s0mOSAPjaJea1JfuFEAyU7HTFexgrFi1DEfVaTkDwYsfDSDpYUHmnMwJBz?=
 =?us-ascii?Q?M3mInkyFH2Z8K+nzc7jxSPQ3CyAVAwPwIuPeeIMCq+yfWvHR65HjQR3pWjNn?=
 =?us-ascii?Q?I6CGcxmjCAvhL8c6hMRJ+Pxc+KGUYqGJOoiEUFsjwi1YST0zCW5/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Ts28RrWWenpEbtgHMrwWir9UQU4xA//BVe98XbD4/uAsrB/1uXIjlhh+Pz/TsGuXtO5w69HiFZhICqGbcggapGGNjaODrdB89Hshf37MIuaAPonQS1xX0+hDkLtl2QFkx2BajKHLciHLFuSPEBxST5muD2n0xHg6oQ6Fklm53nDvxVRxyTZMoYYM0Y0JSzPyXnP6jRSW5br858WytnIUrFSGDtFQ2fCJz/bTUK7IXp/VnyFtos6smLTWSaCnVrT/f5BurE0WiWbbe0PkCX1K1QlpgK9X2qGJkGoZbA2cVLYq5NmFQ533dNCeZGXvuY0mNfZL3oFmvvML+ijiOIIJ+Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50631025-74d0-4bf5-d957-08df44669c7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 04:52:41.2729 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 60OJb7GsEpblHrGeEphvnEaeskHKjz7KDKlMh1PReKZ1PB9ymJuvCcJD4LqGm5QsoNErHcdA0KJ4cNLGl/d7zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB973201
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi @S R, Avandhica,

> -----Original Message-----
> From: S R, Avandhica <avandhica.s.r@intel.com>
> Sent: 16 November 2026 09:22
> To: igt-dev@lists.freedesktop.org
> Cc: S, Sowmiya <sowmiya.s@intel.com>; S R, Avandhica
> <avandhica.s.r@intel.com>
> Subject: [PATCH i-g-t v1 1/1] Extended multiple planes with multiple pixe=
l
> formats
>=20
> Extend kms_plane_multiple to additionally exercise a range of pixel forma=
ts
> (DRM_FORMAT_XYUV8888, DRM_FORMAT_XRGB16161616F,
> DRM_FORMAT_YUYV, DRM_FORMAT_XRGB2101010,
> DRM_FORMAT_XRGB8888) on top of the existing modifier-based subtests, for
> both the single-display and 2-display test variants, to improve coverage =
of
> multi-plane atomic commits across different pixel formats.
>=20
> Signed-off-by: Avandhica S R <avandhica.s.r@intel.com>
> ---
>  tests/kms_plane_multiple.c | 329 ++++++++++++++++++++++---------------
>  1 file changed, 194 insertions(+), 135 deletions(-)
>=20

Resolve these checkpatch warnings,
WARNING: quoted string split across lines
#553: FILE: tests/kms_plane_multiple.c:712:
+                       igt_describe("Check that the kernel handles atomic =
updates of "
+                                    "multiple planes correctly by changing=
 their "

WARNING: quoted string split across lines
#554: FILE: tests/kms_plane_multiple.c:713:
+                                    "multiple planes correctly by changing=
 their "
+                                    "geometry and making sure the changes =
are "

WARNING: quoted string split across lines
#555: FILE: tests/kms_plane_multiple.c:714:
+                                    "geometry and making sure the changes =
are "
+                                    "reflected immediately after each comm=
it.");

total: 0 errors, 3 warnings, 568 lines checked

Split the patch into two - fix and feature separately

> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c inde=
x
> 0d338eeb5..6d31c912a 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -39,34 +39,48 @@
>  #include <time.h>
>=20
>  /**
> - * SUBTEST: tiling-none
> - * Description: Check that the kernel handles atomic updates of multiple
> planes
> - *              correctly by changing their geometry and making sure the=
 changes
> - *              are reflected immediately after each commit.
> - *
> - * SUBTEST: tiling-%s
> + * SUBTEST: pixel-format-%s-and-modifier-format-%s
>   * Description: Check that the kernel handles atomic updates of multiple
> planes
>   *              correctly by changing their geometry and making sure the=
 changes
>   *              are reflected immediately after each commit.
>   *
>   * arg[1]:
>   *
> - * @4:           4-tiling
> - * @x:           x-tiling
> - * @y:           y-tiling
> - * @yf:          yf-tiling
> + * @DRM_FORMAT_XYUV8888:       XYUV8888 pixel format
> + * @DRM_FORMAT_XRGB16161616F:  XRGB16161616F pixel format
> + * @DRM_FORMAT_YUYV:           YUYV pixel format
> + * @DRM_FORMAT_XRGB2101010:    XRGB2101010 pixel format
> + * @DRM_FORMAT_XRGB8888:       XRGB8888 pixel format
> + *
> + * arg[2]:
>   *
> - * SUBTEST: 2x-tiling-%s
> + * @tiling-none: no-tiling
> + * @tiling-4:    4-tiling
> + * @tiling-x:    x-tiling
> + * @tiling-y:    y-tiling
> + * @tiling-yf:   yf-tiling
> + */
> +
> +/**
> + * SUBTEST: 2x-%s-and-%s
>   * Description: Check that the kernel handles atomic updates of multiple
> planes
> - *		simultaneously committed on 2 displays.
> + *		simultaneously committed on 2 displays, across pixel formats.
>   *
>   * arg[1]:
>   *
> - * @none:	 no-tiling
> - * @4:           4-tiling
> - * @x:           x-tiling
> - * @y:           y-tiling
> - * @yf:          yf-tiling
> + * @tiling-none: no-tiling
> + * @tiling-4:    4-tiling
> + * @tiling-x:    x-tiling
> + * @tiling-y:    y-tiling
> + * @tiling-yf:   yf-tiling
> + *
> + * arg[2]:
> + *
> + * @DRM_FORMAT_XYUV8888:       XYUV8888 pixel format
> + * @DRM_FORMAT_XRGB16161616F:  XRGB16161616F pixel format
> + * @DRM_FORMAT_YUYV:           YUYV pixel format
> + * @DRM_FORMAT_XRGB2101010:    XRGB2101010 pixel format
> + * @DRM_FORMAT_XRGB8888:       XRGB8888 pixel format
>   */
>=20
>  IGT_TEST_DESCRIPTION("Test atomic mode setting with multiple planes.");
> @@ -110,10 +124,10 @@ static void test_init(data_t *data, igt_crtc_t *crt=
c, int
> n_planes)
>  	data->pipe_crc1 =3D igt_crtc_crc_new(crtc,
>  					   IGT_PIPE_CRC_SOURCE_AUTO);
>=20
> -	data->plane1 =3D calloc(n_planes, sizeof(*data->plane1));
> +	data->plane1 =3D calloc(crtc->n_planes, sizeof(*data->plane1));
>  	igt_assert_f(data->plane1 !=3D NULL, "Failed to allocate memory for
> planes\n");
>=20
> -	data->fb1 =3D calloc(n_planes, sizeof(struct igt_fb));
> +	data->fb1 =3D calloc(crtc->n_planes, sizeof(struct igt_fb));
>  	igt_assert_f(data->fb1 !=3D NULL, "Failed to allocate memory for FBs\n"=
);
> }
>=20
> @@ -137,7 +151,8 @@ static void test_fini(data_t *data, igt_output_t *out=
put,
> int n_planes)  static void  get_reference_crc(data_t *data, igt_output_t
> *output, igt_crtc_t *crtc,
>  		  igt_pipe_crc_t *pipe_crc,
> -		  color_t *color, igt_plane_t **plane, uint64_t modifier,
> +		  color_t *color, igt_plane_t **plane, unsigned int
> pixel_format,
> +		  uint64_t modifier,
>  		  igt_crc_t *ref_crc)
>  {
>  	drmModeModeInfo *mode;
> @@ -153,7 +168,7 @@ get_reference_crc(data_t *data, igt_output_t *output,
> igt_crtc_t *crtc,
>  	mode =3D igt_output_get_mode(output);
>=20
>  	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
> -			    DRM_FORMAT_XRGB8888,
> +			    pixel_format,
>  			    modifier,
>  			    color->red, color->green, color->blue,
>  			    &data->fb1[primary->index]);
> @@ -166,44 +181,9 @@ get_reference_crc(data_t *data, igt_output_t
> *output, igt_crtc_t *crtc,
>  	igt_pipe_crc_collect_crc(pipe_crc, ref_crc);  }
>=20
> -static void
> -create_fb_for_mode_position(data_t *data, igt_output_t *output,
> drmModeModeInfo *mode,
> -			    color_t *color, int *rect_x, int *rect_y,
> -			    int *rect_w, int *rect_h, uint64_t modifier,
> -			    int max_planes, igt_fb_t *fb)
> -{
> -	unsigned int fb_id;
> -	cairo_t *cr;
> -	igt_plane_t *primary;
> -
> -	primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> -
> -	fb_id =3D igt_create_fb(data->drm_fd,
> -			      mode->hdisplay, mode->vdisplay,
> -			      DRM_FORMAT_XRGB8888,
> -			      modifier,
> -			      &fb[primary->index]);
> -	igt_assert(fb_id);
> -
> -	cr =3D igt_get_cairo_ctx(data->drm_fd, &fb[primary->index]);
> -	igt_paint_color(cr, rect_x[0], rect_y[0],
> -			mode->hdisplay, mode->vdisplay,
> -			color->red, color->green, color->blue);
> -
> -	for (int i =3D 0; i < max_planes; i++) {
> -		if (data->plane1[i]->type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> -			continue;
> -		igt_paint_color(cr, rect_x[i], rect_y[i],
> -				rect_w[i], rect_h[i], 0.0, 0.0, 0.0);
> -	}
> -
> -	igt_put_cairo_ctx(cr);
> -}
> -
> -
>  static void
>  prepare_planes(data_t *data, igt_crtc_t *crtc, color_t *color,
> -	       igt_plane_t **plane,
> +	       igt_plane_t **plane, unsigned int pixel_format,
>  	       uint64_t modifier, int max_planes, igt_output_t *output, igt_fb_=
t
> *fb)  {
>  	drmModeModeInfo *mode;
> @@ -212,12 +192,26 @@ prepare_planes(data_t *data, igt_crtc_t *crtc,
> color_t *color,
>  	int *y;
>  	int *size;
>  	int i;
> -	int* suffle;
> +	int *suffle;
> +	cairo_t *cr, *o_cr;
> +	unsigned int fb_id;
> +	int h =3D 0;
>=20
> +	mode =3D igt_output_get_mode(output);
>  	igt_output_set_crtc(output,
>  			    crtc);
>  	primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
>=20
> +	fb_id =3D igt_create_fb(data->drm_fd,
> +			      mode->hdisplay, mode->vdisplay,
> +			      pixel_format,
> +			      modifier,
> +			      &fb[primary->index]);
> +	igt_assert(fb_id);
> +	cr =3D igt_get_cairo_ctx(data->drm_fd, &fb[primary->index]);
> +	igt_paint_color(cr, 0, 0,
> +			mode->hdisplay, mode->vdisplay,
> +			color->red, color->green, color->blue);
>  	x =3D malloc(crtc->n_planes * sizeof(*x));
>  	igt_assert_f(x, "Failed to allocate %ld bytes for variable x\n",
>  		     (long int) (crtc->n_planes * sizeof(*x))); @@ -242,13 +236,13
> @@ prepare_planes(data_t *data, igt_crtc_t *crtc, color_t *color,
>  		int n, m;
>  		int a, b;
>=20
> -		n =3D rand() % (crtc->n_planes-1);
> -		m =3D rand() % (crtc->n_planes-1);
> +		n =3D rand() % (crtc->n_planes);
> +		m =3D rand() % (crtc->n_planes);
>=20
>  		/*
>  		 * keep primary plane at its place for test's sake.
>  		 */
> -		if(n =3D=3D primary->index || m =3D=3D primary->index)
> +		if (n =3D=3D primary->index || m =3D=3D primary->index)
>  			continue;
>=20
>  		a =3D suffle[n];
> @@ -262,7 +256,7 @@ prepare_planes(data_t *data, igt_crtc_t *crtc, color_=
t
> *color,
>  	/* planes with random positions */
>  	x[primary->index] =3D 0;
>  	y[primary->index] =3D 0;
> -	for (i =3D 0; i < max_planes; i++) {
> +	for (i =3D 0; i < crtc->n_planes; i++) {
>  		/*
>  		 * Here is made assumption primary plane will have
>  		 * index zero.
> @@ -281,35 +275,61 @@ prepare_planes(data_t *data, igt_crtc_t *crtc,
> color_t *color,
>=20
>  		x[i] =3D rand() % (mode->hdisplay - size[i]);
>  		y[i] =3D rand() % (mode->vdisplay - size[i]);
> +		/* source and destination frame buffer need to be even for
> YUYV FORMAT */
> +		if (pixel_format =3D=3D DRM_FORMAT_YUYV) {
> +			x[i] &=3D ~1;
> +			size[i] &=3D ~1;
> +		}
>=20
> -		plane_format =3D plane[i]->type =3D=3D DRM_PLANE_TYPE_CURSOR
> ?
> -						 DRM_FORMAT_ARGB8888 :
> DRM_FORMAT_XRGB8888;
> -		plane_modifier =3D plane[i]->type =3D=3D
> DRM_PLANE_TYPE_CURSOR ?
> -
> DRM_FORMAT_MOD_LINEAR : modifier;
> -
> -		igt_skip_on(!igt_plane_has_format_mod(plane[i],
> plane_format,
> -						      plane_modifier));
> -
> -		igt_create_color_fb(data->drm_fd,
> -				    size[i], size[i],
> -				    plane_format,
> -				    plane_modifier,
> -				    color->red, color->green, color->blue,
> -				    &fb[i]);
> +		if (plane[i]->type =3D=3D DRM_PLANE_TYPE_CURSOR) {
> +			if (pixel_format !=3D DRM_FORMAT_XRGB8888) {
> +				continue;
> +			} else {
> +				plane_format =3D DRM_FORMAT_ARGB8888;
> +				plane_modifier =3D
> DRM_FORMAT_MOD_LINEAR;
> +			}
> +		}
>=20
> -		igt_plane_set_position(plane[i], x[i], y[i]);
> +		if (plane[i]->type =3D=3D DRM_PLANE_TYPE_OVERLAY) {
> +			if (!igt_plane_has_format_mod(plane[i], pixel_format,
> modifier))
> +				continue;
> +			/*
> +			 * skipping planes 2 and above due to crc mismatch for
> +			 * DRM_FORMAT_XYUV8888 and
> DRM_FORMAT_YUYV as they take
> +			 * a different hw composition path
> +			 */
> +			if (plane[i]->index >=3D 2 &&
> +			    (pixel_format =3D=3D DRM_FORMAT_XYUV8888 ||
> +			     pixel_format =3D=3D DRM_FORMAT_YUYV)) {
> +				continue;
> +			} else {
> +				plane_format =3D pixel_format;
> +				plane_modifier =3D modifier;
> +			}
> +		}
> +		igt_paint_color(cr, x[i], y[i],
> +				size[i], size[i], 0.0, 0.0, 0.0);
> +
> +		fb_id =3D igt_create_fb(data->drm_fd, size[i], size[i],
> +				      plane_format, plane_modifier, &fb[i]);
> +		igt_assert(fb_id);
> +		o_cr =3D igt_get_cairo_ctx(data->drm_fd, &fb[i]);
> +		igt_paint_color(o_cr, 0, 0, size[i], size[i],
> +				color->red, color->green, color->blue);
> +		igt_put_cairo_ctx(o_cr);
>  		igt_plane_set_fb(plane[i], &fb[i]);
> +		igt_plane_set_position(plane[i], x[i], y[i]);
> +		/* h counts successfully prepared planes */
h =3D=3D max_planes - 1 as the break condition in prepare_planes() is off-b=
y-one for max_planes =3D=3D 1. h is only compared
  after h++, so it can never equal 0. the loop starts with c++ from c=3D0 ,=
 the very
  first call - which is supposed to place zero extra planes (primary only) =
- will instead walk the whole plane list and
  light up every compatible overlay/cursor plane. That breaks the increment=
al-discovery logic this function exists to
  implement. Worth fixing before anything else
> +		h++;
> +		if (h =3D=3D max_planes - 1)
> +			break;
>  	}
> -
> -	/* primary plane */
> -	plane[primary->index] =3D primary;
> -	create_fb_for_mode_position(data, output, mode, color, x, y,
> -				    size, size, modifier, max_planes,
> &fb[primary->index]);
> +	igt_put_cairo_ctx(cr);
>  	igt_plane_set_fb(plane[primary->index], &fb[primary->index]);
> -	free((void*)x);
> -	free((void*)y);
> -	free((void*)size);
> -	free((void*)suffle);
> +	free((void *)x);
> +	free((void *)y);
> +	free((void *)size);
> +	free((void *)suffle);
>  }
>=20
>  /*
> @@ -325,13 +345,13 @@ prepare_planes(data_t *data, igt_crtc_t *crtc,
> color_t *color,
>=20
>  static void
>  test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
> -				igt_output_t *output, int n_planes,
> +				igt_output_t *output, int n_planes, unsigned
> int pixel_format,
>  				uint64_t modifier)
>  {
>  	color_t blue  =3D { 0.0f, 0.0f, 1.0f };
>  	igt_crc_t crc;
>  	igt_plane_t *plane;
> -	int i;
> +	int i, ret;
>  	int err, c =3D 0;
>  	int iterations =3D max(1, opt.iterations);
>  	bool loop_forever;
> @@ -354,13 +374,13 @@ test_plane_position_with_output(data_t *data,
> igt_crtc_t *crtc,
>  	get_reference_crc(data, output,
>  			  crtc,
>  			  data->pipe_crc1, &blue,
> -			  data->plane1, modifier, &data->ref_crc1);
> +			  data->plane1, pixel_format, modifier, &data-
> >ref_crc1);
>=20
>  	/* Find out how many planes are allowed simultaneously */
>  	do {
>  		c++;
>  		prepare_planes(data, crtc, &blue,
> -			       data->plane1, modifier, c, output, data->fb1);
> +			       data->plane1, pixel_format, modifier, c, output,
> data->fb1);
>  		err =3D igt_display_try_commit2(&data->display,
> COMMIT_ATOMIC);
>=20
>  		for_each_plane_on_crtc(crtc,
> @@ -370,7 +390,7 @@ test_plane_position_with_output(data_t *data,
> igt_crtc_t *crtc,
>  		igt_output_set_crtc(output, NULL);
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>=20
FB/GEM resource leak in the main iteration loop - cleanup bound wasn't fixe=
d to match
  In test_plane_position_with_output() there are two fb-cleanup loops. The =
discovery loop's cleanup was correctly widened
  by this patch:
  for (int x =3D 0; x < crtc->n_planes; x++)
      igt_remove_fb(data->drm_fd, &data->fb1[x]);
  but the second loop - the one that runs once per opt.iterations pass - wa=
s left untouched:
  for (int x =3D 0; x < c; x++)
      igt_remove_fb(data->drm_fd, &data->fb1[x]);

> -		for (int x =3D 0; x < c; x++)
> +		for (int x =3D 0; x < crtc->n_planes; x++)
>  			igt_remove_fb(data->drm_fd, &data->fb1[x]);
>  	} while (!err && c < n_planes);
>=20
> @@ -383,15 +403,16 @@ test_plane_position_with_output(data_t *data,
> igt_crtc_t *crtc,
>=20
>  	i =3D 0;
>  	while (i < iterations || loop_forever) {
> -
>  		/* randomize planes and set up the holes */
>  		prepare_planes(data, crtc, &blue,
> -			       data->plane1, modifier, c, output, data->fb1);
> +			       data->plane1, pixel_format, modifier, c, output,
> data->fb1);
>=20
> -		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> -		igt_pipe_crc_start(data->pipe_crc1);
> +		ret =3D igt_display_try_commit2(&data->display,
> COMMIT_ATOMIC);
> +		igt_skip_on(ret !=3D 0);
>=20
> +		igt_pipe_crc_start(data->pipe_crc1);
>  		igt_pipe_crc_get_current(data->display.drm_fd, data-
> >pipe_crc1, &crc);
> +
>  		igt_assert_crc_equal(&data->ref_crc1, &crc);
>  		igt_pipe_crc_stop(data->pipe_crc1);
>=20
> @@ -406,6 +427,7 @@ test_plane_position_with_output(data_t *data,
> igt_crtc_t *crtc,
>  			igt_remove_fb(data->drm_fd, &data->fb1[x]);
>=20
>  		i++;
> +
>  	}
>=20
>  	test_fini(data, output, n_planes);
> @@ -413,7 +435,7 @@ test_plane_position_with_output(data_t *data,
> igt_crtc_t *crtc,
>=20
>  static void
>  test_plane_position(data_t *data, igt_crtc_t *crtc, igt_output_t *output=
,
> -		    uint64_t modifier)
> +		    unsigned int pixel_format, uint64_t modifier)
>  {
>  	int n_planes =3D opt.all_planes ?
>  			crtc->n_planes : DEFAULT_N_PLANES;
> @@ -426,27 +448,27 @@ test_plane_position(data_t *data, igt_crtc_t *crtc,
> igt_output_t *output,
>  	test_plane_position_with_output(data,
>  					crtc,
>  					output,
> -					n_planes, modifier);
> +					n_planes, pixel_format, modifier);
>  }
>=20
>  static void test_init_2_display(data_t *data, igt_crtc_t *crtc1,
> -				igt_crtc_t *crtc2, int n_planes)
> +				igt_crtc_t *crtc2)
>  {
>  	data->pipe_crc1 =3D igt_crtc_crc_new(crtc1,
>  					   IGT_PIPE_CRC_SOURCE_AUTO);
>  	data->pipe_crc2 =3D igt_crtc_crc_new(crtc2,
>  					   IGT_PIPE_CRC_SOURCE_AUTO);
>=20
> -	data->plane1 =3D calloc(n_planes, sizeof(*data->plane1));
> +	data->plane1 =3D calloc(crtc1->n_planes, sizeof(*data->plane1));
>  	igt_assert_f(data->plane1 !=3D NULL, "Failed to allocate memory for
> planes\n");
>=20
> -	data->plane2 =3D calloc(n_planes, sizeof(*data->plane2));
> +	data->plane2 =3D calloc(crtc2->n_planes, sizeof(*data->plane2));
>  	igt_assert_f(data->plane2 !=3D NULL, "Failed to allocate memory for
> planes\n");
>=20
> -	data->fb1 =3D calloc(n_planes, sizeof(struct igt_fb));
> +	data->fb1 =3D calloc(crtc1->n_planes, sizeof(struct igt_fb));
>  	igt_assert_f(data->fb1 !=3D NULL, "Failed to allocate memory for FBs\n"=
);
>=20
> -	data->fb2 =3D calloc(n_planes, sizeof(struct igt_fb));
> +	data->fb2 =3D calloc(crtc2->n_planes, sizeof(struct igt_fb));
>  	igt_assert_f(data->fb2 !=3D NULL, "Failed to allocate memory for FBs\n"=
);
> }
>=20
>
Drop n_planes (wherever using crtc->n_planes instead of that) passing as an=
 argument,

Regards,
Sowmiya S.=20
@@ -476,12 +498,12 @@ static void test_fini_2_display(data_t *data)  static
> void test_plane_position_2_display(data_t *data, igt_crtc_t *crtc1,
>  					  igt_crtc_t *crtc2,
>  					  igt_output_t *output1, igt_output_t
> *output2,
> +					  unsigned int pixel_format,
>  					  uint64_t modifier)
>  {
>  	color_t blue  =3D { 0.0f, 0.0f, 1.0f };
>  	igt_crc_t crc1, crc2;
> -	int n_planes;
> -
> +	int n_planes, ret;
>  	n_planes =3D min(crtc1->n_planes, crtc2->n_planes);
>  	if (!opt.all_planes)
>  		n_planes =3D min(n_planes, DEFAULT_N_PLANES); @@ -494,24
> +516,26 @@ static void test_plane_position_2_display(data_t *data, igt_cr=
tc_t
> *crtc1,
>  	 */
>=20
>  	test_init_2_display(data, crtc1,
> -			    crtc2, n_planes);
> +			    crtc2);
>  	get_reference_crc(data, output1,
>  			  crtc1,
>  			  data->pipe_crc1, &blue,
> -			  data->plane1, DRM_FORMAT_MOD_LINEAR, &data-
> >ref_crc1);
> +			  data->plane1, pixel_format, modifier, &data-
> >ref_crc1);
>  	get_reference_crc(data, output2,
>  			  crtc2,
>  			  data->pipe_crc2, &blue,
> -			  data->plane2, DRM_FORMAT_MOD_LINEAR, &data-
> >ref_crc2);
> +			  data->plane2, pixel_format, modifier, &data-
> >ref_crc2);
>=20
>  	prepare_planes(data, crtc1, &blue,
> -		       data->plane1,
> +		       data->plane1, pixel_format,
>  		       modifier, 2, output1, data->fb1);
>  	prepare_planes(data, crtc2, &blue,
> -		       data->plane2,
> +		       data->plane2, pixel_format,
>  		       modifier, 2, output2, data->fb2);
>=20
> -	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	ret =3D igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +	igt_skip_on_f(ret !=3D 0, "Bandwidth  combination not supported on this
> +pipe pair\n");
> +
>  	igt_pipe_crc_start(data->pipe_crc1);
>  	igt_pipe_crc_start(data->pipe_crc2);
>=20
> @@ -520,16 +544,19 @@ static void test_plane_position_2_display(data_t
> *data, igt_crtc_t *crtc1,
>=20
>  	igt_assert_crc_equal(&data->ref_crc1, &crc1);
>  	igt_assert_crc_equal(&data->ref_crc2, &crc2);
> +
>  }
>=20
> -static void run_2_display_test(data_t *data, uint64_t modifier, const ch=
ar
> *name)
> +static void run_2_display_test(data_t *data, unsigned int pixel_format,
> +			       const char *f_name, uint64_t modifier,
> +			       const char *name)
>  {
>  	igt_crtc_t *crtc1, *crtc2;
>  	igt_output_t *output1, *output2;
>  	igt_display_t *display =3D &data->display;
>=20
> -	igt_skip_on_f(!igt_display_has_format_mod(display,
> DRM_FORMAT_XRGB8888, modifier),
> -		      "%s modifier is not supported\n", name);
> +	igt_skip_on_f(!igt_display_has_format_mod(display, pixel_format,
> modifier),
> +		      "%s modifier and %s format is not supported\n", name,
> f_name);
>=20
>  	igt_display_reset(display);
>=20
> @@ -554,21 +581,22 @@ static void run_2_display_test(data_t *data, uint64=
_t
> modifier, const char *name
>  				      igt_crtc_name(crtc2), output2->name)
>  				test_plane_position_2_display(data,
>  							      crtc1, crtc2,
> -							      output1, output2,
> +							      output1, output2,
> pixel_format,
>  							      modifier);
>  			test_fini_2_display(data);
>  		}
>  	}
>  }
>=20
> -static void run_test(data_t *data, uint64_t modifier, const char *name)
> +static void run_test(data_t *data, unsigned int pixel_format, const char
> *format_name,
> +		     uint64_t modifier, const char *name)
>  {
>  	igt_crtc_t *crtc;
>  	igt_output_t *output;
>  	igt_display_t *display =3D &data->display;
>=20
> -	igt_skip_on_f(!igt_display_has_format_mod(display,
> DRM_FORMAT_XRGB8888, modifier),
> -		      "%s modifier is not supported\n", name);
> +	igt_skip_on_f(!igt_display_has_format_mod(display, pixel_format,
> modifier),
> +		      "%s modifier and %s pixel format is not supported\n",
> name,
> +format_name);
>=20
>  	for_each_crtc_with_valid_output(display, crtc, output) {
>  		igt_display_reset(display);
> @@ -581,7 +609,7 @@ static void run_test(data_t *data, uint64_t modifier,
> const char *name)
>  		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), output-
> >name)
>  			test_plane_position(data,
>  					    crtc,
> -					    output,
> +					    output, pixel_format,
>  					    modifier);
>  	}
>  }
> @@ -607,6 +635,27 @@ static const struct {
>  	},
>  };
>=20
> +static const struct {
> +	const char *name;
> +	unsigned int format;
> +} pixel_format_list[] =3D {
> +	{ .name =3D "DRM_FORMAT_XYUV8888",
> +	  .format =3D DRM_FORMAT_XYUV8888,
> +	},
> +	{ .name =3D "DRM_FORMAT_XRGB16161616F",
> +	  .format =3D DRM_FORMAT_XRGB16161616F,
> +	},
> +	{ .name =3D "DRM_FORMAT_YUYV",
> +	  .format =3D DRM_FORMAT_YUYV,
> +	},
> +	{ .name =3D "DRM_FORMAT_XRGB2101010",
> +	  .format =3D DRM_FORMAT_XRGB2101010,
> +	},
> +	{ .name =3D "DRM_FORMAT_XRGB8888",
> +	  .format =3D DRM_FORMAT_XRGB8888,
> +	},
> +};
> +
>  static data_t data;
>=20
>  static int opt_handler(int option, int option_index, void *input) @@ -65=
7,28
> +706,37 @@ int igt_main_args("", long_options, help_str, opt_handler, NUL=
L)
>  		igt_require(data.display.is_atomic);
>  		igt_display_require_output(&data.display);
>  	}
> -
> -	for (int i =3D 0; i < ARRAY_SIZE(subtests); i++) {
> -		igt_describe("Check that the kernel handles atomic updates of
> "
> -			     "multiple planes correctly by changing their "
> -			     "geometry and making sure the changes are "
> -			     "reflected immediately after each commit.");
> -
> -		igt_subtest_with_dynamic(subtests[i].name)
> -			run_test(&data, subtests[i].modifier, subtests[i].name);
> +	for (int j =3D 0; j < ARRAY_SIZE(pixel_format_list); j++) {
> +		for (int i =3D 0; i < ARRAY_SIZE(subtests); i++) {
> +			igt_describe("Check that the kernel handles atomic
> updates of "
> +				     "multiple planes correctly by changing their
> "
> +				     "geometry and making sure the changes are
> "
> +				     "reflected immediately after each
> commit.");
> +
> +			igt_subtest_with_dynamic_f("pixel-format-%s-and-
> modifier-format-%s",
> +						   pixel_format_list[j].name,
> subtests[i].name)
> +				run_test(&data, pixel_format_list[j].format,
> +					 pixel_format_list[j].name,
> subtests[i].modifier,
> +					 subtests[i].name);
> +		}
>  	}
>=20
> -	for (int i =3D 0; i < ARRAY_SIZE(subtests); i++) {
> -		igt_subtest_with_dynamic_f("2x-%s", subtests[i].name) {
> -			int valid_outputs =3D 0;
> -			igt_output_t *output;
> +	for (int j =3D 0; j < ARRAY_SIZE(pixel_format_list); j++) {
> +		for (int i =3D 0; i < ARRAY_SIZE(subtests); i++) {
> +			igt_subtest_with_dynamic_f("2x-%s-and-%s",
> subtests[i].name,
> +						   pixel_format_list[j].name) {
> +				int valid_outputs =3D 0;
> +				igt_output_t *output;
>=20
> -			for_each_connected_output(&data.display, output)
> -				valid_outputs++;
> +				for_each_connected_output(&data.display,
> output)
> +					valid_outputs++;
>=20
> -			igt_require(valid_outputs > 1);
> +				igt_require(valid_outputs > 1);
>=20
> -			run_2_display_test(&data, subtests[i].modifier,
> subtests[i].name);
> +				run_2_display_test(&data,
> pixel_format_list[j].format,
> +						   pixel_format_list[j].name,
> +						   subtests[i].modifier,
> subtests[i].name);
> +			}
>  		}
>  	}
>=20
> @@ -687,3 +745,4 @@ int igt_main_args("", long_options, help_str,
> opt_handler, NULL)
>  		drm_close_driver(data.drm_fd);
>  	}
>  }
> +
> --
> 2.53.0

