Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAB1C54E58
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 09:01:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7561F10F266;
	Wed, 20 Mar 2024 09:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZOr6rQ2m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEBC510F237
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 09:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710925274; x=1742461274;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+h8+bV0OsNcY132lc2LoOMtWQYg1f4N3h+Z6q1DY49k=;
 b=ZOr6rQ2mNd2is1OeKRSLlRAd82pTBCvxAW0ZRiA9csSsHnmxmDmhvI9m
 xUQCMyHbFxvg66TMku7rUmnTKVx6kNgN879R1o/CGpZ8S3PaARnCOrC1i
 f0jVIgULr5Kk5pxG5gLpilnSYIusrT03MFklGwr40tBtEuofpjg4hEzPa
 dJM1IOMYxoZyX7cS6MuOQ4MLkDZMQvqoSzM23zKLpUW67tjiiB0gG8xyW
 1LZGITCw6y96lmsROvfTj8hNFm6VYqKNhZkENg8vT4242Rc/vCFJLd7Mk
 QE7zNMNKcB1OsL+FxTa3Aup40czapSHwrzsiWPhTuudoSXcSJKfboYYc6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="6445839"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="6445839"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 02:01:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; d="scan'208";a="14738882"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 02:01:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 02:01:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 02:01:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 02:01:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFhpjmRajylMbJlLJwvU2v48bzWoPNDiI9/yRsPq2IY4pBfQAvvUBnuDCgfI0E4yzmBQtEhnbXaKb7vtKIHgwf3Lmv3m4c8/eFfOapiBgtMecbQth20VaQlVTsZnlqNM4cTpNvyl8T0ql9smQOeFm+rWSsOVB0oHy0JKF8HczbKvKBrnKGsrBacL1X7YGNSzInVTnhprmpdG+WewtmNj71WHx7ZAMpQl+RdYoOzHAqPfPwZAJfetP7S6vsLyEjZ+TaAJCIjIo7PkdyhQoL3Rg8I8zySTdKRrYAE5t2YJeeFnNn9PfqilqILj93ktOhD00QR8Rc5vhx2i6CLO+8z6/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3osuQC0ELpIXeWX4ZoTB9sI6HgR5TyHqi644lhcxtAc=;
 b=iXMEa6i5E2FiQ9pcA1LKq+nWI+xYAgzYgXFg1pmObDaS0KoqB/XjXlDi/ZN/hsIsqOD4RfNZsssZVuyGNJqJG1Chi/GepzSlqPISbfxrpa+x7+L0e45tM2dCX+mQartsP1d/amQ2oMstUkUAM3e77L91nHl+747CcABPHb5TUJ8PeHPZRH8wrTXluFUPiaHsPqPrEGCBZiXLs7FV+H1QyRGrzTuSIWZw9D0ABss4SdjzwtNb2EGNRUCssjR1S1rQ8oqa+nZ8XC7BQl6skP5LDe0W04mtZTMYNO6pxGHdk77/W2R3Hkt2OUjRqpnzipMRlwKvTbQdt1/WsZGWBKqjFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by MN0PR11MB6230.namprd11.prod.outlook.com (2603:10b6:208:3c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Wed, 20 Mar
 2024 09:01:04 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::82d7:c202:f53d:4dc]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::82d7:c202:f53d:4dc%7]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 09:01:04 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Bommu, Krishnaiah"
 <krishnaiah.bommu@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t 1/2] tests/intel/xe_exec_fault_mode: Test to check the
 access of invalid va
Thread-Topic: [i-g-t 1/2] tests/intel/xe_exec_fault_mode: Test to check the
 access of invalid va
Thread-Index: AQHadSmi3n6y74+gMUW5aYlIsqwgVLFAX0tw
Date: Wed, 20 Mar 2024 09:01:03 +0000
Message-ID: <MW3PR11MB47489C47A495AE1EFAFF499BAE332@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240313093249.2257541-1-priyanka.dandamudi@intel.com>
 <20240313093249.2257541-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20240313093249.2257541-2-priyanka.dandamudi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|MN0PR11MB6230:EE_
x-ms-office365-filtering-correlation-id: 4dfa7f82-8154-4044-019a-08dc48bc45b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TDIzYxMLrIx9aomyXHijqsQLJarqSQmenh+CZMsR7JauUwylv/c7wtKJZCAcmZOMA8yqha8fBszAyJcBNendL8jYd74QV4HYcfLs4yEESTfC7S7q4EbAvbBpYQk+Ms1W4RmAU50wIrc1PRSCiWQn3zhxmyl63Do9wF8L2m2tQbzaRWZDD6me9uIKjSt+nu1LlBxixZzQD2U2PeQSMfbdOwYtCGza4UjUTTEqL8pAhvcO7stVYUj7RO7LOmw8yvEPXKKPdzMGYIZJfsyZM4sYACSt0Nz5LVVZCWBbIM+sw07F6JKEDaTxkCFSSUoA2QTeMfM2/5sW5XFQK4o3GX02Zjm+ybchmyUrlnGsQTR+wIgzfe72LFBsKiM7HOgrdnBFQUXjL7sgsvSZ/IsrQz3mhXHdG1TX85wS2Szd29GPLtPyxQHoU4PdhQnF6DaV+OS3OrqqDoeZtMYbvEl57kKNb1LiQ7CyAvHPk6iaoN/pXm/3MHLXvqlnTLh5xRq6vvZ2M4PX+HQk4Kp1A7YmBlG15NOsfGcF+DAhyOENCjmIjzNfe1AA/4GlcBhY5g6mndXT5xhAkQHiP+q8ZmwOiOO8MUshv24r6nY47/GOxe0k+z36kHe69DanKEq5fk+1kUm3g1ANrC90KT+H3uj2cg3JZVrOBGhydbiu2/pSMpZxeXgMm+d/sz6+/M0grCz/jZ7gkkDq0sVbcPcc8mQJurbZ0/9Md1VORRC6St+bpo7OHpM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TnCX15Rh2bpd9M5hBddJaPdlzFOxaVE/vJ22VAYSdNVhVQNisnPx3PQo+hIs?=
 =?us-ascii?Q?ccPL8a6gvpdCuQtm6/HbqaODa1EASK/GKot8nDHDeGF4o7OU04ozj0mq72GI?=
 =?us-ascii?Q?yL4054+Qv+Cx4wF32p7aAmdo/gWEyqH3ykQPoOMocI3lMhyd69a51Nw7aXzN?=
 =?us-ascii?Q?54YcPntrb3GTjx9acd7HZoS5xjBIxCPrlpVveF7huqtPK5y/+w7j2pEDltTZ?=
 =?us-ascii?Q?xL09Qb9LEYeTfh2ApKJPfKMUmIfE4bGOE1SyC62657+Q1wJw5M7WNmGpoZ8o?=
 =?us-ascii?Q?sGS1UvcWiL0gae/PlG59WsWBCl2yYayKPxOQKRGTC2yzZS00ZBs+axexyPdV?=
 =?us-ascii?Q?1PWLtkjpGtdqBoVDFrDUcOHTR8dimKXBwaK7lLmCMcL4Q936VqTnLIfinIzv?=
 =?us-ascii?Q?va8dBtm9fLQboKfYJAAxwDaDC2gDBqDiB1xOZz7tFHuZN5yOnxlG1qjjJsI4?=
 =?us-ascii?Q?S1krCk5NabRfhei0XFsQpMY5ZzFPfNBTTH2xGpUSG8xhUPHgj2J462XZ6RjD?=
 =?us-ascii?Q?/BzEnlL12UjzKAVZ9AQAmUgOk1bvJZuV0st4njyljvKkraHL7k2yudxdFSRK?=
 =?us-ascii?Q?rXJsi0a7Jw1cLNEkgRG4xIYy8JsfbXc69/R+t0PjaGnOCuH1wHzpCnOprFgX?=
 =?us-ascii?Q?zjb6UEv2YBVvqTVEHml1KbmwVIfXu0Ac1moaDXfoG9pC7mwHdYF6IYTMzn3L?=
 =?us-ascii?Q?hNm1h7haIbPZWdCm6D6i6+QSj7mfamaYVqLPq2Afl+0qPfDYCSi8On3cTZvA?=
 =?us-ascii?Q?gLOqjkzv95N0vIkTiyuNSK4ra6WdZHfZaLd1p1rSZmxYX/S/M5hxnyg2LB6O?=
 =?us-ascii?Q?f8uj9igTg60bpKOqpETVRLeR+Z2m5NFkqc+RFpYWF5HlOZ9nCARC5a3mLsQ+?=
 =?us-ascii?Q?k1mXlKMWcuXn5W8VE3ZgqYPokdiZ+aXskDaoWWj5/ZyET9hXUKGnzPrRNv9W?=
 =?us-ascii?Q?xKomBOlWXw8Ds+hnDIu6XuWzhHkyRVjOqZO6AE57TzOnyVDyQt1eLPD3snVK?=
 =?us-ascii?Q?bSSdvOD0F97XbflwofAbiE4eEXe/R9GrhoKTnhnqcqhEYh1GZNtNETRnJVDP?=
 =?us-ascii?Q?NZcqwv+sjKVYZ29j2aNLzn1LDLMv/I6Qo9eh/+Y3iolZ4+oXolqB28gxrTuS?=
 =?us-ascii?Q?wxqpGifHALHXuyo8w3SMWXTD/tHq+BGgQvDWLCBtQu4gdOgN8WNOmeDh3t+4?=
 =?us-ascii?Q?ZAwxShbEW7pEltGQx0iJR9HTAx33r71n0289/p9H28QADfN6ADJeCIUWqsmy?=
 =?us-ascii?Q?LDgGwwqaP1K+gLPeDofJawiKUhz1SyLZzgbl9jae85o+3pUWDjjngpVu0m6K?=
 =?us-ascii?Q?nkCewX6bfVXXoRBszG8EQcqD5PBSwnk+vqX+TJao4+z8l7qUNpsC6rvvXztC?=
 =?us-ascii?Q?uKgnrn0XQAQ6uKz5h9MH9UmJIQqBA7A6owqSHNwlN+M2KnQeDmWctreXs59h?=
 =?us-ascii?Q?EweMBdPojJMh3GNFk6rcQRsgn/IWteObvUXxILk5rDE2joudCjFKe3q8abR0?=
 =?us-ascii?Q?aOR+a4m1ZHxz9j0CY6tJmzdQwD3H0O7kTG5wUAcLJ12pyBA7dWUvUuRUS/Ft?=
 =?us-ascii?Q?7oYa+lIwyRW5jNRLwhzAqaB52cjjQAfY2NNJh7Sf5AD4wmVNwfP2xggzH4t3?=
 =?us-ascii?Q?bg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dfa7f82-8154-4044-019a-08dc48bc45b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2024 09:01:04.0230 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5MJyl8KBPfUxzDXFBaaYJVMbMZdI+8tpQvxZLAEIJm5PZezSXVmO5KzEXiWFjgZ6/Rb3JusIQODTOxOJxjv6DNu2DuUFznz3xW6Tvua9Zu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6230
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
> From: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Sent: Wednesday, March 13, 2024 3:03 PM
> To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Bommu, Krishnaiah
> <krishnaiah.bommu@intel.com>; Kumar, Janga Rahul
> <janga.rahul.kumar@intel.com>; igt-dev@lists.freedesktop.org
> Subject: [i-g-t 1/2] tests/intel/xe_exec_fault_mode: Test to check the ac=
cess of
> invalid va
>=20
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> Added a test where it submits a batch to access invalid va (not binded) E=
xpected
> result to be -EIO from user fence ioctl caused due to CAT error.
>=20
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> ---
>  tests/intel/xe_exec_fault_mode.c | 43 ++++++++++++++++++++++++--------
>  1 file changed, 32 insertions(+), 11 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_fault_mode.c
> b/tests/intel/xe_exec_fault_mode.c
> index 20a7cf8fe..0914e221b 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -31,8 +31,13 @@
>  #define BIND_EXEC_QUEUE	(0x1 << 4)
>  #define PREFETCH	(0x1 << 5)
>  #define INVALID_FAULT	(0x1 << 6)
> +#define INVALID_VA	(0x1 << 7)
>=20
>  /**
> + * SUBTEST: invalid-va
> + * Description: Access invalid va and check for EIO through user fence.
> + * Test category: functionality test
> + *
>   * SUBTEST: once-%s
>   * Description: Run %arg[1] fault mode test only once
>   * Test category: functionality test
> @@ -157,13 +162,11 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>=20
>  	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
>  	if (bo)
> -		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
> -				 bo_size, sync, 1);
> +		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
> bo_size,
> +sync, 1);
>  	else
>  		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
>  					 to_user_pointer(data), addr,
>  					 bo_size, sync, 1);
> -
>  #define ONE_SEC	MS_TO_NS(1000)
>  	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
>  		       bind_exec_queues[0], ONE_SEC); @@ -186,6 +189,9 @@
> test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		int e =3D i % n_exec_queues;
>=20
>  		b =3D 0;
> +		if (flags & INVALID_VA)
> +			sdi_addr =3D 0x1fffffffffff000;
> +
>  		data[i].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
>  		data[i].batch[b++] =3D sdi_addr;
>  		data[i].batch[b++] =3D sdi_addr >> 32;
> @@ -257,14 +263,20 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  			igt_assert(data !=3D MAP_FAILED);
>  		}
>  	}
> -
>  	if (!(flags & INVALID_FAULT)) {
> +		int64_t timeout =3D ONE_SEC;
> +
>  		j =3D flags & INVALIDATE ? n_execs - 1 : 0;
> -		for (i =3D j; i < n_execs; i++)
> -			xe_wait_ufence(fd, &data[i].exec_sync,
> USER_FENCE_VALUE,
> -				       exec_queues[i % n_exec_queues],
> ONE_SEC);
> -	}
>=20
> +		for (i =3D j; i < n_execs; i++) {
> +			if (flags & INVALID_VA)
> +				igt_assert_eq(__xe_wait_ufence(fd,
> &data[i].exec_sync, USER_FENCE_VALUE,
> +							       exec_queues[i %
> n_exec_queues], &timeout), EIO);
> +			else
> +				igt_assert_eq(__xe_wait_ufence(fd,
> &data[i].exec_sync, USER_FENCE_VALUE,
> +							       exec_queues[i %
> n_exec_queues], &timeout), 0);
> +		}
> +	}
>  	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
>  	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
>  			   sync, 1);
> @@ -272,8 +284,12 @@ test_exec(int fd, struct drm_xe_engine_class_instanc=
e
> *eci,
>  		       bind_exec_queues[0], ONE_SEC);
>=20
>  	if (!(flags & INVALID_FAULT)) {
> -		for (i =3D j; i < n_execs; i++)
> -			igt_assert_eq(data[i].data, 0xc0ffee);
> +		for (i =3D j; i < n_execs; i++) {
> +			if (flags & INVALID_VA)
> +				igt_assert_neq(data[i].data, 0xc0ffee);
This check looks obvious as you have updated the sdi_addr, Better to avoid =
this check for INVALID_VA subtest.

-Rahul
> +			else
> +				igt_assert_eq(data[i].data, 0xc0ffee);
> +		}
>  	}
>=20
>  	for (i =3D 0; i < n_exec_queues; i++) {
> @@ -366,6 +382,11 @@ igt_main
>  					  s->flags);
>  	}
>=20
> -	igt_fixture
> +	igt_subtest("invalid-va")
> +		xe_for_each_engine(fd, hwe)
> +			test_exec(fd, hwe, 1, 1, INVALID_VA);
> +
> +	igt_fixture {
>  		drm_close_driver(fd);
> +	}
>  }
> --
> 2.25.1

