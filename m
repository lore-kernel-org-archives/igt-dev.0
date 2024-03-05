Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B62EC5478C
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 04:50:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B3710E4E6;
	Tue,  5 Mar 2024 04:50:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nQg+cB4Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336F110E4E6
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 04:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709614255; x=1741150255;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AZO09bem3MucEHpeN2C2oyY45ivYE9PA0wZ7s5IvglU=;
 b=nQg+cB4ZjtPUbOff6w+KSXPTCiV8H+Fyu+ZLpb3jTeaUBSLaMfaxE/1b
 hG7hWGFY8S3kTzGqadoT4I/E3deQEwqhFe4021GOtQRp+gMiy78pQFgqg
 2vxZndyD5xJE3ZcCKgK5QeXPcHWke0VtS1dniuUqq3GftK3mqI/eOO1aG
 xi1hAuWP+aUHm1nG4xrvZFhqgIiPtO8wSVo8Lv6DnZvYXZ++OIrFBFWuK
 8Ill9skknspuVCv3lZZD6jyNJS1IYFu0SJ4/8nFDFM96gbtPFYY7aJBXG
 0zAX+RVOnD1RbzmEW7r8sy+L2FuorMkOVbWwXiwtwl8txhn2NFrygE05V A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="26603804"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="26603804"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 20:50:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="32401610"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 20:50:54 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 20:50:53 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 20:50:53 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 20:50:53 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 20:50:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LBdKY7JFXShaVuNwIg1b36nTewUM9evy6nXXenevJRO2SluboQeQ3ZI8DGMXy1OLOr4C8NLYJ9hHVXN2PH6y1zGEKn7PtAARoJ0ZAlQ34KhBnkwpCMDFDZj3HvrLcDp0CF7MisbeTGpCC9JvoLJzUyIyJbAU3Nx97Ig3axAt1jWdqE7bjxOqLFQrAEoPU5Hj9XWo+Rvrm9xkDR1jPRr+qWqHL4KhK2voILY2xMB7LRhK5b2aGuTq3UhtFTXQLFgTCfJR2oyyq70Vb1rZH8+Ie6B+Z0JFgt68dKt5we8mfU7n1h4ZW2yyo65fR8ZSvlC74ETX6Vs6oml1dgqU2NvUOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkkWA/RFnI0wgvYUZpv6U1/2vV59R23yFEGGUUHAzXg=;
 b=ETeCdxsWSoCuUSPZXGdVmkONqfguCY240c+Bb80GsxiPCcUjKrqOZkX7rjFPTzSRQ2+KkqnpkJ+Mv/tJV7/tImE46OCr+99e6euwGmG9WuMfG9TCBu0FoPJxuNl0MNgPZqJEA04JtUrsdKWbnSm7+0pLjU56jW2tc9KVpkIA38YG6xpn7cPDr8Q7GW4VD4ouVSjKN3zVEQmgVnoO3Rzn+ooG2/NLsy+B2mLTGHZwzXSBjTEv+T52dI/0elEw30uIx4Hy006aDXlraSNA280LW8PBAtSQTIdfCA4wE0poRFfFser0CnFpvx5c3LWpTnxbOOVbLVlive1nr5oDT1mr5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by MW3PR11MB4729.namprd11.prod.outlook.com (2603:10b6:303:5d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Tue, 5 Mar
 2024 04:50:50 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::2d99:e524:71bf:8b67]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::2d99:e524:71bf:8b67%5]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 04:50:50 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH] xe_exec_compute_mode: Add malloc-ufence test
Thread-Topic: [PATCH] xe_exec_compute_mode: Add malloc-ufence test
Thread-Index: AQHaaSZJEW9+dgXNbUKlYpyHNz/TGLEonjEQ
Date: Tue, 5 Mar 2024 04:50:50 +0000
Message-ID: <CH3PR11MB84346627949CAEA170EC88B88D222@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20240227023956.141475-1-matthew.brost@intel.com>
In-Reply-To: <20240227023956.141475-1-matthew.brost@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|MW3PR11MB4729:EE_
x-ms-office365-filtering-correlation-id: f7ed7dc5-c3f7-4809-e7d4-08dc3ccfd490
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fAVSkNAxZ7wA9LiPn6YuwmKqghgunzvNS7/Wg6JZFWL6S+03CEqYT+9ItCNWdlu4PZKjZ+2eRc0gQX5AkMsEMX2FqHpvHeoqUdVyeJMaVw5KRYwTDinAFcKu18xrtrZBoDNDX1FgaV7ARVVINGC4qA4lUxFo9j+pcpAYLJhZrOOtoH/sq7xBLoztClGJn9T2cvYUhMMYrAxYGtzk0Cf2osU+rwYiXKWLFYFAR1vhBsDvKbjXU4m53Rjd69n/M3WBREGNvPe6pUD5HA5ORcwSw8yTEW0OmEXWzNLytXCw5iY8TvEfiQW0R8DyGOswxdgtwzXrdT6bksV1rOwd5WtPxPOdEyiy0/aOOyz9oIaE6L72ZCc3acQFs90i/iOPdSAcIXI/S8GZJYyfRwBhmy8srWJsRtu6+rEB3BiqvLcnmWwyeMaoQx+C+g9SejYKSqofRSeWxf3jP+dtQH6C1g07j5wlVi2jSzPg/G6gc0gH9T1eh4N0bCXsjrTfo7oCPV9esNgfZ16A4uCmNYtyccb1DWBXsN1XLsXRhr5iDwwuM7k1JF2XC2X9kd0Wo95OgeEbYvuLWSy/N5uVW6RnjK65Tgiy/s6UE5k5QR3npBEReklvnW4Wjz2zaGVAS8V5yBsWi4sPIWnCgdBIdGHXyuaq1tE/zik/EQXeVwDnYyB//TGM/ionGNIJUbqcZ8nNzwYWDFxRt1Rm0gL1YPMF4LpKmA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1LSsxzPJxW0k8M5O3Gja6CSdZuff1LTd78cjp0Ujtjb34z6RmUfzMHJlSGHa?=
 =?us-ascii?Q?vCg6s/Fou4ely7/v6vcwGEpUTzoz7hv+W9NwQ01KhZmsXbVlwKMtlhG//KMZ?=
 =?us-ascii?Q?h7y+zoi4iZU5RhiDYQmJ5ufxqS92BsA0nbDDaGUxOi4D8jWMu50AnOw72OAV?=
 =?us-ascii?Q?yS4YnImWYxLF0HMZHhUqxXgUwrarnZq+V86YzN9y9uLKDppIXosw5DP7fIBt?=
 =?us-ascii?Q?buqyQBNMdTK2CrlADG56iKuTrx5ubdMd8pfZDavv6iCAINaDg7XbRqnonqHr?=
 =?us-ascii?Q?KKgT+6smx6ZFAZ7DlSiqC5VX2+4UuF9u40flc03pDBXiby9TOEY5NzztR9hx?=
 =?us-ascii?Q?/DK3Tfh1xVL71YAV88SClkTFcLHSlfMGKCYIbAEx56Iz3iUXO7dQrHtsQGpB?=
 =?us-ascii?Q?2P/F9rcGzS+G7RAe9RVLyvd7mj3+T3N2bO9bhnjuP9o3ua3/SlOeLAz26i7P?=
 =?us-ascii?Q?9kppKkS028sCSvp5NLSE97yFD+Qx+0rkptnCUoV8I6tmExBFYecaa0wR1wmQ?=
 =?us-ascii?Q?P1IF4E7qq8Kz9Qv9N9C9QomfGTSNp7vyJeP0wr0zWxuVO2BX5ozB8/2XCoaG?=
 =?us-ascii?Q?aKR2JPkePCWsutXr+9o0tqfQBVz3vMdBhyWS9duYLw+sTJZ7T8gwD8pwBS45?=
 =?us-ascii?Q?WaKGpB6136RRjH5/eH3Tk2gCgS3gzuKZK3P9xHZsqCfaSwRBGgySepKilUL6?=
 =?us-ascii?Q?uBUN4J8le1FxUXOiNuOUqyCYLhhVFgeq4CqGPaoF/WA3B96gKd49N2Tw6SAf?=
 =?us-ascii?Q?VCB6VQu7tWz4CxaUmL7oKvFYuuF8nvNO0RdUTYbMKez0zXcuazOqhAUlFkr1?=
 =?us-ascii?Q?1GBPA7OJhz0XLkTme+vqL7RCExa1NunH0b4WFF/wUMy8CaFL6BNx1clRPZJ0?=
 =?us-ascii?Q?2RY1s9Kpxzkol/Eq3MmdJEXyapsjora9zp8Pc/oZ1OWbDLP337wlCVTZKf05?=
 =?us-ascii?Q?nIPbAOor3DEKpggyYFNtlMoWmsRH3kO6i6UcB1Si6YRlKH81pW8XX1viU6GB?=
 =?us-ascii?Q?x9DfHHwZWwCVz96TN1vvZ0AKx0AIAGqYJROeGz5gbr+/NPqo7S+4QuqozJ6r?=
 =?us-ascii?Q?5TY74b1q3dUKFlb7sobQW04xrRZ3+27Q7+Asfq/Ufpce6s7I1POAjhW3Xxul?=
 =?us-ascii?Q?o6+QEMVrPf5WsSjjhRl4D2130cFI4QuAP9eDE6ASHbGRtFWgg2EasMinXUE8?=
 =?us-ascii?Q?tAEh+chmQKW5pJ48vHJ8okdO6XK3uZP2ma/y63YdxEQQkgZfq9C4Iv18dsjK?=
 =?us-ascii?Q?bFkFnXQN6voxDRfNdqNi8cebGgZjKaB+LTIJdCd1HFAiqnGaI/lBaQmjdiq7?=
 =?us-ascii?Q?8ZLLOG5gJ3kMnj6cYAFxhWdBAZbzSVISLiSMZg9NgDibilBIl3GLqGb7bkn1?=
 =?us-ascii?Q?TTuUn/lDMa9qc/zgGpNLnBcd8qIvQtQ9WqUcYPscOxLx2x3BU7BL86PIMWsE?=
 =?us-ascii?Q?a35+Vhr0FmnilXjyD3SJJbHickCb/BsgaH3q12hdHjL6iPzWgwvjun4Vhom6?=
 =?us-ascii?Q?HB6rKqT9dMcNPNRPFCGEZacX+jfegV+UR2/79cOK9fKzX33RFyT+BsHJVM81?=
 =?us-ascii?Q?JEwdOtGNHZyZzXm3Nw8/tw4ZYxKtkyPwbX8QWlN9jGnJApyDqYwhj0TVN6xA?=
 =?us-ascii?Q?+g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7ed7dc5-c3f7-4809-e7d4-08dc3ccfd490
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2024 04:50:50.1793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uMsIe5TWKwl7S4j+kJD5YyPkJoiVWX4JZd/o8XDXa5zRZ0TaGNQjaGfvgHH55EQ8Xk5WPigAqvifAn7pijoBiHWRgeIE4N/Rr8HZ+a+TqzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4729
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w
> Brost
> Sent: Tuesday, February 27, 2024 8:10 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH] xe_exec_compute_mode: Add malloc-ufence test
>=20
> The get user page ufence path is not triggered by the test as ufence memo=
ry
> is a mapped BO. To trigger this path use a malloc'd address.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  tests/intel/xe_exec_compute_mode.c | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_compute_mode.c
> b/tests/intel/xe_exec_compute_mode.c
> index 7dad715093..c0cddbc02b 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -31,6 +31,7 @@
>  #define BIND_EXECQUEUE		(0x1 << 4)
>  #define VM_FOR_BO			(0x1 << 5)
>  #define EXEC_QUEUE_EARLY	(0x1 << 6)
> +#define MALLOC_USER_FENCE		(0x1 <<7)
>=20
>  /**
>   * SUBTEST: twice-%s
> @@ -48,6 +49,7 @@
>   * arg[1]:
>   *
>   * @basic:				basic
> + * @malloc-ufence:			malloc user fence
>   * @preempt-fence-early:		preempt fence early
>   * @userptr:				userptr
>   * @rebind:				rebind
> @@ -110,6 +112,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance
> *eci,
>  		uint64_t exec_sync;
>  		uint32_t data;
>  	} *data;
> +	uint64_t *vm_sync;
>  	int i, j, b;
>  	int map_fd =3D -1;
>  	int64_t fence_timeout;
> @@ -149,6 +152,12 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  	}
>  	memset(data, 0, bo_size);
>=20
> +	if (flags & MALLOC_USER_FENCE)
> +		vm_sync =3D malloc(sizeof(*vm_sync));
> +	else
> +		vm_sync =3D &data[0].vm_sync;
> +	igt_assert(vm_sync);
> +
>  	for (i =3D 0; !(flags & EXEC_QUEUE_EARLY) && i < n_exec_queues; i++) {
>  		exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci, 0);
>  		if (flags & BIND_EXECQUEUE)
> @@ -158,7 +167,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance
> *eci,
>  			bind_exec_queues[i] =3D 0;
>  	};
>=20
> -	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> +	sync[0].addr =3D to_user_pointer(vm_sync);
>  	if (bo)
>  		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
>  				 bo_size, sync, 1);
> @@ -171,9 +180,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance
> *eci,
>=20
>  	fence_timeout =3D igt_run_in_simulation() ? HUNDRED_SEC : ONE_SEC;
>=20
> -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> +	xe_wait_ufence(fd, vm_sync, USER_FENCE_VALUE,
>  		       bind_exec_queues[0], fence_timeout);
> -	data[0].vm_sync =3D 0;
> +	*vm_sync =3D 0;
>=20
>  	for (i =3D 0; i < n_execs; i++) {
>  		uint64_t batch_offset =3D (char *)&data[i].batch - (char *)data;
> @@ -202,7 +211,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance
> *eci,
>  			xe_vm_unbind_async(fd, vm, bind_exec_queues[e],
> 0,
>  					   addr, bo_size, NULL, 0);
>=20
> -			sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> +			sync[0].addr =3D to_user_pointer(vm_sync);
>  			addr +=3D bo_size;
>  			if (bo)
>  				xe_vm_bind_async(fd, vm,
> bind_exec_queues[e], bo, @@ -213,9 +222,9 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>=20
> to_user_pointer(data),
>  							 addr, bo_size, sync,
>  							 1);
> -			xe_wait_ufence(fd, &data[0].vm_sync,
> USER_FENCE_VALUE,
> +			xe_wait_ufence(fd, vm_sync, USER_FENCE_VALUE,
>  				       bind_exec_queues[e], fence_timeout);
> -			data[0].vm_sync =3D 0;
> +			*vm_sync =3D 0;
>  		}
>=20
>  		if (flags & INVALIDATE && i + 1 !=3D n_execs) { @@ -264,10
> +273,10 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	if (flags & INVALIDATE)
>  		usleep(250000);
>=20
> -	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> +	sync[0].addr =3D to_user_pointer(vm_sync);
>  	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
>  			   sync, 1);
> -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> +	xe_wait_ufence(fd, vm_sync, USER_FENCE_VALUE,
>  		       bind_exec_queues[0], fence_timeout);
>=20
>  	for (i =3D j; i < n_execs; i++)
> @@ -288,6 +297,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance
> *eci,
>  	xe_vm_destroy(fd, vm);
>  	if (map_fd !=3D -1)
>  		close(map_fd);
> +	if (flags & MALLOC_USER_FENCE)
> +		free(vm_sync);
>  }
>=20
>  /**
> @@ -408,6 +419,7 @@ igt_main
>  		unsigned int flags;
>  	} sections[] =3D {
>  		{ "basic", 0 },
> +		{ "malloc-ufence", MALLOC_USER_FENCE },
>  		{ "preempt-fence-early", VM_FOR_BO | EXEC_QUEUE_EARLY
> },
>  		{ "userptr", USERPTR },
>  		{ "rebind", REBIND },
> --
> 2.34.1
Change LGTM
Reviewed-by: Priyanka Dandamudi <Priyanka.dandamudi@intel.com>
Can you check the build once before it looks like some failure is there.
--Priyanka
