Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF91DCD8CA8
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 06:02:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F75F10F25C;
	Fri, 12 Jun 2026 06:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AoL2seRm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E4310F25C
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 06:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781244143; x=1812780143;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LkJEi3LtRuaav3+jOhRqbA2qQiNb54YjB6P+dl6pvLA=;
 b=AoL2seRm1gr6Wjm4wj2v9RND1v3fQZqrLKkhJUHhfYMh0/IuXE3wX9on
 LJJvyyFM0lPqIUme1gjvJaXvSjtr+ENkXaCop5TMAhetYcbLMvvnryOjy
 HCB+dckteN7f0ZJVqw6VutFI6w6qZY47pmySiH+2dVjQciO7P0jGxAZVt
 +kzHbl+UmZGD1IRvmQmZ1EFEYIL1KVOi8ZFixnHw7CK7WbSriiUi5E8jM
 NM1GpTj7ujuaKLWdalA6s2k4jlUc86u9i9bFkP6VOodu88iKPJubPQTGa
 bt8Zq8Vbl/kCcPqS6Z5KxAPXXdaFznLdYjnvZZ+M1LyBNh3c7c2WfQjaI g==;
X-CSE-ConnectionGUID: uH0OOgCyQu2aiX6jH2TJ6w==
X-CSE-MsgGUID: 50F2GTM2TZKvYWffYHMQ8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="107504287"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="107504287"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 23:02:23 -0700
X-CSE-ConnectionGUID: R1UlqzxfRf+W8fy9o3FnEA==
X-CSE-MsgGUID: eD/Ble13Sb++6m+ykcNFMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="251819685"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 23:02:23 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 23:02:22 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 23:02:22 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 23:02:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qp09AeN8cK8i3maLVrxkLC+Rh55fCrY3dzdL51nSiGQUcGlRwD3qQMNvt8NoVgX9iWBldo4W4J4+Yr9o9hro4u7C8sPxP+W67htBUujLovPm7v1PMU6Ed44Wot6KGcu/4Wf+bRIuhWJ/EBZ5Z1PpgX9OlTF1Jr4zARglkqcj9sKGtzJ9v6p+81kf48azHHHlO0V6lAWyXZNKbsexKpdc5hCg7oaprB1sb+Mm+XtEweujtKVP2aq2B4t+w4jh3c2nF99VSdJVLhG4Dzee7g1MFoynwecpfgt0fMHjsNU1Akyi3c7htd926n6Y1fj1323855YJ+lP4GJkvyxb9n72hYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=siZFYBY7HdbE7IsA1w2nxUJIfCvDM8aUfVcLcAruTp8=;
 b=Tb4we30c8wWyJ4XUcnZPcIgnJUgbyWklVxBYoVUIWdphJ4wGXQTE941RI+fotQP3HrmTWYOmdbEuZ+wjBwj283yLFc5wZJyhMvrWH6jXru/yRUUOLF4iwtf/oJev/adFYx4Wxz7PwsSPd6J8jNgLVZxVKcBUWbGKLivBtEwGjV+Zngx4WkACn2TAfyUupC1t4oZeDS05GC0F9ptg4a9cn9Z+HNo0JpVFuREk/FT6dTq4MMY/LRL7dEEZAwqj+uGdR0dRgeVPQlDK7hXehugv4ZlQYh1cRg1RCmt8K/IHmvysUUadZTvONmXaUflKQQvJUp5nL6HUjtNn51nn7V34gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SN7PR11MB6897.namprd11.prod.outlook.com (2603:10b6:806:2a5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 06:02:18 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%7]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 06:02:18 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel: Skip multi-queue tests when no engine
 supports it
Thread-Topic: [PATCH i-g-t] tests/intel: Skip multi-queue tests when no engine
 supports it
Thread-Index: AQHc+eLwpS54eyf4IkWYTZr3SKmUHrY6bbyA
Date: Fri, 12 Jun 2026 06:02:18 +0000
Message-ID: <CH3PR11MB843495FBA81453F87689C03E8D182@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260611204154.2000148-1-shuicheng.lin@intel.com>
In-Reply-To: <20260611204154.2000148-1-shuicheng.lin@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SN7PR11MB6897:EE_
x-ms-office365-filtering-correlation-id: 8cb2f954-fe79-4c18-a9b4-08dec848291a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|56012099006|11063799006|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info: F1x/0TlZC+QQ1tT2LbMcXCJ52jwEYYKHJEBDig27fNHc2/udsu+/oaUP+uxXaZnifvY12wDeo+k9bnspHG797CWcpwRV0yhiLcsRFBooUJtRvQMr1qNap+T1xvh+ziFK7W9obOkPisqXdSwoY8BuxxcWe72brFvU0sShJncI2y0/INMXsXynixT7WYgs/nQtHp2hD5SIkOHAhVOJcBmjGt2fe4dC0mPoebU1dSOporkpXg1pplMuWU5cwloPiWSrX6b9Vu9wp+8s2N5vHI3eAaiQMxCjTKlOYr2ESLHbZSC85icK0AP5SDrG7SpPGiBoT4fH46syaJ/kfEuEHY89likC+3s7Vbl8DU2dTFF+yWOqQV2qiMqGFCb44FzQWTwsXs2exRqG0VZd7xK50OOXn1cV/KiYywsxzTagv9TvNT/as4lTR+SPEkV3J4BIUsU6CvtdGN2PLODLuyh2dYsooCsmweTELF+veU7Uyq/npEQxitLf4gIQXH/G+rSTtCSEGWST72MGJNqpbANN7p1j8sopQWmCHpO8DQanQy9M9nHEK9ZwVAlFFlbwjMGMNSuWv7S4gKWfRCcDY96lXXx6PcWM0c1XMk3+tY7qmDAKjQLiKyWjUhj8ofzz+ZVkBDDbVVzgUJ5FlbesJBCr6Zf/aegh4Uu6MAZr3Eq80EWhHEM/xU8+NlnpFCxEaht9fHP9QzF3eIRWmWBYTOcQpmATxSuZeKNrssJcd0tbewfnSSfw/xAv4Yl/AwiGKTDNm1It
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(11063799006)(38070700021)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kZbTZaxYbakf28dzSSR0d7qG+lnb06dgeKzPqiedIqhgpUe8IGU4xF+LwowJ?=
 =?us-ascii?Q?tHCR7GT9ufa8h4e81onu3pUBD74rOhzq367sLAa4G0rHhtJzgSBq0SfddDTs?=
 =?us-ascii?Q?ieLpZ5htKxwubUU+7HI7COYegsvgGLZs590f3zB0slHtkj9gt1S50GpxDRq+?=
 =?us-ascii?Q?Q6Hh3YXek3v0xe2Z+AgDUShbpFlEcl+OiXnhzah/BrvpfW1VA6YI9ekuocrK?=
 =?us-ascii?Q?6JqKTqz7cgzscgHq/lTEIjpUX+9L2eW3iSdKUhTo43OBCDnlDtz0zDfHnBYo?=
 =?us-ascii?Q?hS6gjN1o00Q8k4wSOePfbRSwV6pW7g3Jsqf0OBUrUA3o5LwpZwjvl4Iri5MP?=
 =?us-ascii?Q?31DFLvN2+XTd5CjcUbp23xxM1pvQEiL6+l4tUdYNd70o4xoa5wFns/prziWf?=
 =?us-ascii?Q?bEaSp1Ha8XaLEGXmco4sAJB1vHvrQ4Pr7kOPia/FXjgmsIjRAnXa9VFU5dtU?=
 =?us-ascii?Q?caqqu3rC4pUznOR7n9XcNziIIjFCy6cW9LOF5edwHC+qyUj9KICCv4imLExi?=
 =?us-ascii?Q?Mf/pH4gXKJv4dMf++pLdnb0rdaH5yNYLWMp+46RLIAFvjk8EXF9Y9MjZhaGE?=
 =?us-ascii?Q?bt0dbt19py/Fc4BWOYdkTcxZFDjQXITJEUIJCljzuXyzXqT0omSwPtpCoNR0?=
 =?us-ascii?Q?wE/ZgHUjF1ZHD8t32qBXI5Z440x/6zI7u4c0x13EeQWXn2Ezny1b4Xz0mjFz?=
 =?us-ascii?Q?dkxcg+RSBQ31iy5FnV1IGXl5xtWmz19pjk8zL12/XXH0/vfNgfGDL9QXU9FS?=
 =?us-ascii?Q?7jHnfiKMkcTA0l/GTumElpPy1HUUx5v+6/vE1pDrExZ5UShjAVmIKY4yD4tn?=
 =?us-ascii?Q?5DKPL5OVBP+4TbRT42moEZwIDtV4Kt93R2eNEpqxwGBWe4CLLxU4rfq0e/CW?=
 =?us-ascii?Q?rxiByHFEYyqM8ZgyGfxJ9Pkl0ungMTDK8flzPhmVrYE17k+IQVZidVj054Ff?=
 =?us-ascii?Q?ZBNU3BEwrWVmHHpW7nW+IEV7xBCDqui17LAosuv4hDjMQABNZ6sdJeic63r/?=
 =?us-ascii?Q?ejMC8gv8Nn7TwuGyUISd17OI+gqy0jNs5E8IU7opkSxNiddArHvqA6UrJIF7?=
 =?us-ascii?Q?xVi/iyahvYf/xxX1hmny8P0cSw+nqaLnzoN65crn0cUD5mBrNVCSrgGb1LpL?=
 =?us-ascii?Q?fJ/E21h9x4QWaHTKe8mVEorn546K1mW0WWj/7jCsXJpRmV6L8XGTic09yurR?=
 =?us-ascii?Q?a+NrYST6q8a/KFL9t1Tfey82rOYOcybmHMDDa/OvkLtOGHrJ9PvZEnTZRgl6?=
 =?us-ascii?Q?JydAGrUoRHYe9nAQ+Qlw0K74GIowdO5g+kpXoxChlEgEavEMJc5D9zCf9iKg?=
 =?us-ascii?Q?jlithMbADBseI6pWh+Y+RFo3ROVxS+C+wb384qyvmlVl/QWUKpUYAjfvYEZR?=
 =?us-ascii?Q?5hYwU37VTdWGJ4vTbSg9FMIzJb7Q5pouIobsw+qs3/sOUVLHCo14DSRaAK47?=
 =?us-ascii?Q?UJel+P9TrohgYVH/KGFDec8IoT6/J3Lnc417lH/dLhiBmySsR91Y4bAXbZ+M?=
 =?us-ascii?Q?z9iqzqYI5bQBl92RL5045XIG50c/mqLB2B7R0PoC0bXMlROW27sxTQTgEEO4?=
 =?us-ascii?Q?GizUddM6FCh+xboiphbSIpZsJ+Vkkx5UOTUG7h1sXPpQtZg6rWCkaeToba6k?=
 =?us-ascii?Q?YtM+2jK69dDjOv/CNoB1l4fp9fjsBjq6OlaPm8MxlTOGLFrNAUcZ65X65W5k?=
 =?us-ascii?Q?9n7bSzU9RpaWklWeiV5dXPRoaz89tj3kogqfN5v+w6MjBE+XpDVkVUgLSSaM?=
 =?us-ascii?Q?RlV3GkEvEQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: aNQqjYWr5yLwidIPvtwHbufLcOfM0rM3digLdY1DOGgiZUmpQj00Pnas2OVy9+NUDTNkXFgfsa+aLh+j+CbSKZlO9TF/SCxsoRXMpklZ1ZlsytYqqb3nV7GPJ3Qg1Q1D+S2BJ8eLmXUA+Z86Kot7/ixg+pn9HhA95+FhZ2GDnPBvZWP/vesc8ItJjKH8VKi7+nnUlk3blmoKdvfNSXIWNVkpGNc6xklcweKnN6UVZ/ltvK50hN9hjuDAokGpXr8eSgA7Z7Z2QUwI7g7B5WiTMwMl+OF590W6mOcSSulclodi9eg9+N7zpntgJVbQ2m5/fAAxCO6aiLPBdBLW3Lp8dA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb2f954-fe79-4c18-a9b4-08dec848291a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 06:02:18.5916 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OgvNepirgHOjwxFmpl72aYFXviTmDKFcAZ+24qzkNNCQUh8Gt6qn4WalhpBdxs2ix4DT1D0nFH9DNC8KTZ5mKjDQyk4q0mIglllzShgB8t0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6897
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
> Shuicheng Lin
> Sent: 12 June 2026 02:12 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Lin, Shuicheng <shuicheng.lin@intel.com>; Vishwanathapura, Niranjana
> <niranjana.vishwanathapura@intel.com>
> Subject: [PATCH i-g-t] tests/intel: Skip multi-queue tests when no engine
> supports it
>=20
> When no engine supports multi-queue, xe_for_each_multi_queue_engine()
> iterates zero times, causing subtests to report SUCCESS without executing=
 any
> test logic.
>=20
> Add xe_has_multi_queue_engine() helper and use it as an igt_require()
> guard in all multi-queue subtests so they properly report SKIP on hardwar=
e
> without multi-queue support.
>=20
> Suggested-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  lib/xe/xe_query.c                 | 16 ++++++++++++++++
>  lib/xe/xe_query.h                 |  1 +
>  tests/intel/xe_exec_fault_mode.c  |  1 +  tests/intel/xe_exec_multi_queu=
e.c
> |  1 +
>  tests/intel/xe_exec_reset.c       | 22 ++++++++++++++++++++--
>  tests/intel/xe_exec_threads.c     |  1 +
>  6 files changed, 40 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c index
> 3286a3b37..27e471840 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -346,6 +346,22 @@ bool xe_engine_class_supports_multi_queue(int fd,
> uint32_t engine_class)
>  	}
>  }
>=20
> +/**
> + * xe_has_multi_queue_engine:
> + * @fd: xe device fd
> + *
> + * Returns true if any engine supports multi queue, false otherwise.
> + */
> +bool xe_has_multi_queue_engine(int fd)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +
> +	xe_for_each_multi_queue_engine(fd, hwe)
> +		return true;
> +
> +	return false;
> +}
> +
>  static void xe_device_free(struct xe_device *xe_dev)  {
>  	free(xe_dev->config);
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h index
> 8815c6c66..9f04a7422 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -163,6 +163,7 @@ uint16_t xe_dev_id(int fd);  int xe_supports_faults(i=
nt
> fd);  bool xe_engine_class_supports_multi_queue(int fd, uint32_t
> engine_class);  bool xe_engine_class_supports_multi_lrc(int fd, uint32_t
> engine_class);
> +bool xe_has_multi_queue_engine(int fd);
>  const char *xe_engine_class_string(uint32_t engine_class);  const char
> *xe_engine_class_short_string(uint32_t engine_class);  bool
> xe_has_engine_class(int fd, uint16_t engine_class); diff --git
> a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> index 3e92dfbd9..58509db14 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -445,6 +445,7 @@ test_exec_main(int fd, int n_exec_queues, int
> n_execs, unsigned int flags)
>=20
>  	if (flags & MULTI_QUEUE) {
>  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		xe_for_each_multi_queue_engine(fd, hwe)
>  			test_exec(fd, hwe, n_exec_queues, n_execs, flags);
>  	} else {
> diff --git a/tests/intel/xe_exec_multi_queue.c
> b/tests/intel/xe_exec_multi_queue.c
> index d9d648b02..3d9e168b2 100644
> --- a/tests/intel/xe_exec_multi_queue.c
> +++ b/tests/intel/xe_exec_multi_queue.c
> @@ -1094,6 +1094,7 @@ int igt_main()
>  	igt_fixture() {
>  		fd =3D drm_open_driver(DRIVER_XE);
>  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
If below condition is used then the above platform support check is not req=
uired either one of it should be present I think as the below require would=
 make the tests skip on unsupported platforms or engines?.
--Priyanka
> +		igt_require(xe_has_multi_queue_engine(fd));
>  	}
>=20
>  	igt_subtest_f("sanity")
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c in=
dex
> 19643b887..20be33736 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -1103,6 +1103,7 @@ int igt_main()
>=20
>  	igt_subtest("multi-queue-cat-error") {
>  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		xe_for_each_multi_queue_engine(fd, hwe)
>  			xe_legacy_test_mode(fd, hwe, 16, 16,
>  					    CAT_ERROR | MULTI_QUEUE,
> @@ -1112,6 +1113,7 @@ int igt_main()
>=20
>  	igt_subtest("multi-queue-cat-error-on-secondary") {
>  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		xe_for_each_multi_queue_engine(fd, hwe)
>  			xe_legacy_test_mode(fd, hwe, 16, 16,
>  					    CAT_ERROR | MULTI_QUEUE |
> @@ -1122,6 +1124,7 @@ int igt_main()
>=20
>  	igt_subtest("multi-queue-gt-reset") {
>  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		ignore_gt_reset_warnings_in_dmesg();
>  		xe_for_each_multi_queue_engine(fd, hwe)
>  			xe_legacy_test_mode(fd, hwe, 16, 16, @@ -1132,6
> +1135,7 @@ int igt_main()
>=20
>  	igt_subtest("multi-queue-cancel") {
>  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		xe_for_each_multi_queue_engine(fd, hwe)
>  			xe_legacy_test_mode(fd, hwe, 16, 16,
>  					    MULTI_QUEUE,
> @@ -1141,6 +1145,7 @@ int igt_main()
>=20
>  	igt_subtest("multi-queue-cancel-on-secondary") {
>  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		xe_for_each_multi_queue_engine(fd, hwe)
>  			xe_legacy_test_mode(fd, hwe, 16, 16,
>  					    MULTI_QUEUE |
> SECONDARY_QUEUE, @@ -1150,6 +1155,7 @@ int igt_main()
>=20
>  	igt_subtest("multi-queue-close-fd") {
>  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		xe_for_each_multi_queue_engine(fd, hwe)
>  			xe_legacy_test_mode(-1, hwe, 16, 256,
>  					    CLOSE_FD | MULTI_QUEUE,
> @@ -1159,6 +1165,7 @@ int igt_main()
>=20
>  	igt_subtest("multi-queue-close-execqueues") {
>  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		xe_for_each_multi_queue_engine(fd, hwe)
>  			xe_legacy_test_mode(-1, hwe, 16, 256,
>  					    CLOSE_EXEC_QUEUES | CLOSE_FD
> | @@ -1169,6 +1176,7 @@ int igt_main()
>=20
>  	igt_subtest("cm-multi-queue-cat-error") {
>  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		xe_for_each_multi_queue_engine(fd, hwe)
>  			test_compute_mode(fd, hwe, 16, 16,
>  					  CAT_ERROR | MULTI_QUEUE);
> @@ -1176,6 +1184,7 @@ int igt_main()
>=20
>  	igt_subtest("cm-multi-queue-cat-error-on-secondary") {
>  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		xe_for_each_multi_queue_engine(fd, hwe)
>  			test_compute_mode(fd, hwe, 16, 16,
>  					  CAT_ERROR | MULTI_QUEUE |
> @@ -1184,6 +1193,7 @@ int igt_main()
>=20
>  	igt_subtest("cm-multi-queue-gt-reset") {
>  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		ignore_gt_reset_warnings_in_dmesg();
>  		xe_for_each_multi_queue_engine(fd, hwe)
>  			test_compute_mode(fd, hwe, 16, 16,
> @@ -1192,6 +1202,7 @@ int igt_main()
>=20
>  	igt_subtest("cm-multi-queue-close-fd") {
>  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		xe_for_each_multi_queue_engine(fd, hwe)
>  			test_compute_mode(-1, hwe, 16, 256,
>  					  CLOSE_FD | MULTI_QUEUE);
> @@ -1199,21 +1210,27 @@ int igt_main()
>=20
>  	igt_subtest("cm-multi-queue-close-execqueues") {
>  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		xe_for_each_multi_queue_engine(fd, hwe)
>  			test_compute_mode(-1, hwe, 16, 256,
>  					  CLOSE_EXEC_QUEUES | CLOSE_FD |
>  					  MULTI_QUEUE);
>  	}
>=20
> -	igt_subtest("multi-queue-long-spin-many-queue-switch")
> +	igt_subtest("multi-queue-long-spin-many-queue-switch") {
> +		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		xe_for_each_multi_queue_engine(fd, hwe) {
>  			xe_legacy_test_mode(fd, hwe, 4, 8,
>  					    LONG_SPIN | MULTI_QUEUE,
>  					    LEGACY_MODE_ADDR, false);
>  			break;
>  		}
> +	}
>=20
> -	igt_subtest("multi-queue-long-spin-reuse-many-queue-switch")
> +	igt_subtest("multi-queue-long-spin-reuse-many-queue-switch") {
> +		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> +		igt_require(xe_has_multi_queue_engine(fd));
>  		xe_for_each_multi_queue_engine(fd, hwe) {
>  			xe_legacy_test_mode(fd, hwe, 4, 8,
>  					    LONG_SPIN | MULTI_QUEUE |
> @@ -1221,6 +1238,7 @@ int igt_main()
>  					    LEGACY_MODE_ADDR, false);
>  			break;
>  		}
> +	}
>=20
>  	igt_fixture()
>  		drm_close_driver(fd);
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.=
c
> index 2f44d5555..cf8fec6c6 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -1723,6 +1723,7 @@ int igt_main()
>  			if (s->flags & MULTI_QUEUE) {
>=20
> 	igt_skip_on_f(!(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0)),
>  						"multi_queue is supported on
> graphics version 35 and above");
> +				igt_require(xe_has_multi_queue_engine(fd));
>  				/* Balancer can't be set with multi-queue at
> the same time */
>  				igt_assert(!(s->flags & BALANCER));
>  			}
> --
> 2.43.0

