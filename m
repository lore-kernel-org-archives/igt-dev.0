Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A3AC4828D
	for <igt-dev@archiver.kernel.org>; Mon,  5 Feb 2024 06:03:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD8B10E028;
	Mon,  5 Feb 2024 06:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EA+QJIV0";
	dkim-atps=neutral
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Mon, 05 Feb 2024 06:03:56 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA8510E028
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Feb 2024 06:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707113037; x=1738649037;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=iyr9e87/2hg7QbPaqZ30bDtYmzA4duYcM17bg0GiOD4=;
 b=EA+QJIV0ER15CAM0Hp5GAz+2GOueG41XuWyAPN9N9V5gt+XtcFY4R3D4
 EoAF5M3ywWG2m8moc7Rqaemn6v+BCxXxqYJxKPgrPF19XZCafQaZx9dbc
 uxSpQpVWfRYzcv/U+mtUbbBR5CXprHtMf5bJ1dLjhj2vbL8xR8e8r9dQ0
 y26Jhn7RgIjNTo4fZ4GOF4fosKnwao+j4AeUjZPoIZV5R+Ddv+j98pq0/
 SUvusUKjZ3VOwHkZyjqBqKwq/LFK/FUCo45cJSmNDyYt2mahM+AcSg6uK
 GiVYRAtTfSc3qEyx1JE+ktsmfdrnu+/FD7aGcxYEsnBrKn9iCB2SByEEl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="347716"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="347716"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2024 21:56:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="823770067"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; d="scan'208";a="823770067"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2024 21:56:49 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 4 Feb 2024 21:56:49 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 4 Feb 2024 21:56:49 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 4 Feb 2024 21:56:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUKo4a975uImTBvUSpfD6SmSSCpXmWbBuvZWBIJd16vQfzF9T4qLa6afXd93dgFgjvETwEZJ6oXrjtMzteA05XJMwUcXzKqtnWJZWjyEsOP8wqxbd9TVFiP3UaiOmDX9MthTbqE6uI7ZzwkTmn/uSKvkPPZuXlno7MFxF5oA7y+M9WtHd9kbY9t6xUct6JvLhzuGacGY50DVZiZXnQ+3Csw8ybjVegKSjaz5JTNmFpF+81QHt3cp+iXKjEPRsN4VLg1syIYMRMV4DioiKX9AwJFLSyaxc3zKkHxqXe0Z0fiqPJARcCHR3+/AQx7j0lgnwXphtVR0QBtDjvhTCPrqVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gUCGAw3IQtwi8R/+YezNG2cq4I8LM6dPms3Br/sfI8=;
 b=gzKgoxO0eBbbzs3VjZpXErkdc05djs0nkOKjq3aWtcc1TM3lByYuqT4756Pw/Tet27jk00hPd+T8a571fuqrCBaE7w1rHqmFahfUaKKLPKwWwkbNZsdjCLeoTpPIvgJ5ZqKEcQE9f1VXUYVKDZuHSsvAvROsEr4mEViNg15jY+PVBNVepCTFKDW7u8JchZXdxK0n8ajsQpIUsU/STMBIdDyQMEnQek5Jkg6xrxMW3blCf1yGMSbJWMk9tY98+YjeNtK3miKe81oqa02zQXGxIehapdzvA0UPkKeUshTixFzTQhdhg764nGRW7jnNCNMAt4/NMwcQHnjeRilhU8R81g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8428.namprd11.prod.outlook.com (2603:10b6:806:38b::20)
 by DS0PR11MB6543.namprd11.prod.outlook.com (2603:10b6:8:d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Mon, 5 Feb
 2024 05:56:46 +0000
Received: from SA1PR11MB8428.namprd11.prod.outlook.com
 ([fe80::d6b:6160:8399:11d1]) by SA1PR11MB8428.namprd11.prod.outlook.com
 ([fe80::d6b:6160:8399:11d1%3]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 05:56:46 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t] tests/intel/xe_exec_queue_property: Remove persistence
 queue property
Thread-Topic: [i-g-t] tests/intel/xe_exec_queue_property: Remove persistence
 queue property
Thread-Index: AQHaV/c/eZu1kAcKZUu1mKJvQLHVM7D7P9eA
Date: Mon, 5 Feb 2024 05:56:46 +0000
Message-ID: <SA1PR11MB8428E53B7F5248D735C845868D472@SA1PR11MB8428.namprd11.prod.outlook.com>
References: <20240205060225.35672-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240205060225.35672-1-tejas.upadhyay@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8428:EE_|DS0PR11MB6543:EE_
x-ms-office365-filtering-correlation-id: 62c1b747-0145-4999-2b8c-08dc260f3c99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /mdS2B+U1pBQ60yDUrCAP15R917aNqg6d7kNynXBgFf+jrzhDze0TuOOSMSUMNI6BXME9sQdKReG9UXsmAYTG2Uu+WlQE5ypUs2csUNJOARW+OQ2x+JlVcyNlFNGikPEf3Uy6rs9xPnLch26yQlvfEHCFsdnKtYPOsv/4BFf7Y08ZhbAJo9okblz5ZID/MRyvOQdAgKSZNe4x0fJTJKJ9MAvZBlUNMFAtBj1NsCEXSP021jHzdO+OhKSUv+4Ov+jzY98e2IlQYJtzm2oHzE+vmuAkKWbOpOARatRSx7INbrC7rFIcJmeIso2K54suJYGmitvyG1ZnwpU1ZdfkB4G3e5Q0KL2Pti7uVRlfENjM0hu2U2jNb92tgY9eTXLWQs9LRxUJLhfpjmXtY0c665XGX9fF1x1tgjCvBgLVE8FrO6HsxAzuym+WFJiepy8cwxJm2RGXelCwNhE9rMRL/6l+pc53QHLV+Xn00Iu2pwhgiwo1yT3yPb0tsjfKz5hMYyh54Amwj1QjhRBhjxYphyOyFvDGir6AKTQ2wF0d2MtualGK3q4RPHd58jL4W1/anv1DT4/yPAd8B9IAMgjZVbBB+JIaZBU7JSNyeQUilhuXAE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8428.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(39860400002)(136003)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(66946007)(122000001)(86362001)(41300700001)(38100700002)(52536014)(5660300002)(83380400001)(2906002)(33656002)(110136005)(26005)(9686003)(71200400001)(7696005)(6506007)(53546011)(478600001)(966005)(38070700009)(8936002)(8676002)(76116006)(66446008)(64756008)(316002)(82960400001)(66556008)(66476007)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vpFOhn9PsED0N6+WxF5Y7ZNLmAWJG9aUmr5DwThBBHLrGOxh2JYICvW4JJwR?=
 =?us-ascii?Q?s92Moh+FO42BMzpsCHGR4+l+LH/IDgNLXWQAPyT+Sg/qoc76ETFo/PlFGXlE?=
 =?us-ascii?Q?kuFClp5TNTvWgevQV7vRRsq7++zcsMIEsKFAPLdeFcku9pE4LfsElU035vyP?=
 =?us-ascii?Q?poPFg6ROA6+Znrr6IQ9cM+r9BHErZTX3GRMExTuIo+1016FBKaSjt3qnlr9T?=
 =?us-ascii?Q?bKA0yB+mELXNl/S6jAXc/UG2OQ0CG6UjM259mh85NBYQX1aRvwDfZMWO7WSa?=
 =?us-ascii?Q?turAO82u97aVuRMck6BlZ6BPF1YoiFEsxW0H2OtJUMTssUGr5rWrbobR5S4u?=
 =?us-ascii?Q?L37a9YiR5rdXf+r4M4XN17jDg4TPOV+7+Mqb/WtRJBv3hi0+Ec6p6/M0wkbw?=
 =?us-ascii?Q?S8LYaWyzeXhvavLd6JClAIufAlZ06gK3Cywu8oKWH6XYKz/WMBZVFopifH1N?=
 =?us-ascii?Q?Nn8bUPTrLq8Da86pUnRlXRE75jfgWfZTGxDC70e0AKBjcFH4T8VXjGPs07A2?=
 =?us-ascii?Q?+Bpb8smXCfqbesj6EzD4AKKiJ3Dng6JcpQfv2JqN5vA6ZX7ijmj+HQ0Ktwid?=
 =?us-ascii?Q?GTMaYvINJ3AWz+HABsCe8/bQsgYTIAcOKKmHgKfc2jDVNDqRaRIRtrOpf9Mz?=
 =?us-ascii?Q?O80QW7GFwcyiS53pTFFaE2PZVf3Og23esdKn/hNJiNToht8Pl/fqqNgiKTrc?=
 =?us-ascii?Q?DkKsmKFdT4B0nHEuci37+6Avw3SffFHoDGHX3TMS7hZUyx4gefWE0kHyUyxx?=
 =?us-ascii?Q?lBAEBzXdMhEmO5MbZlMh1bnPM/qnQFmFNB8dqXmR3+zFH+EN6SaizJtLmrgP?=
 =?us-ascii?Q?Uc+rsQDDxaP62bGq3yIgBZGXluidHEEskaATaShHT4QsKaDPlYOpcrQKLSyr?=
 =?us-ascii?Q?pYuMwAJ1tQrMM6X9T250XJHotmDfLBJAl562so9UBaR33OkaarTFBiNPtTHC?=
 =?us-ascii?Q?iEhrfUxqch4Be1LEA+vxtN5fy6zl2mryysk4FX3QZ7wS3/x9FiIPY0bP2r1B?=
 =?us-ascii?Q?FSvGuCC4MA4udxzwaEYjciKJNXo9PKXzeC9Wl0+1DuRvyWgITdMwIV3fUOcE?=
 =?us-ascii?Q?kVKh92F9MPReIJfNZQZ3Urmfv4fFLPbObcPYz+RqH3jC0QrAXLmyp/13UcNa?=
 =?us-ascii?Q?fs7yMeT0voX4VqP81zIcdpzTBG0zYoJXYaVJDjUGQI6y+0yUr8FIWSBZ5Q62?=
 =?us-ascii?Q?8gnuAgP2EPPX2KAVABITZipP6aQwSBGDcDN2unCZ9/pe8SfFBV4n5Ro5csuY?=
 =?us-ascii?Q?MpLBCWy2epDnzzPVZTqegEHIQcUhbRmkWgivUX3fRlAIJrMP2SlPT4Bv48yT?=
 =?us-ascii?Q?gi5F3xmoGGMRekl2FZv8F4Cg0Wd+EjsbQgFGTmOjvm74ty/WWNAWIKzC7R6Z?=
 =?us-ascii?Q?8VAEy74zNjPdJctCBjtYH+dQMbKsC+506tzINLQOgClYi+4wBaj1QZEnkJ2X?=
 =?us-ascii?Q?C9slD7g3iu6/1/xS07hwHvhkvpP4ZfIvaEs1yjhfj4mPnuT/OWQlQJL0u0zT?=
 =?us-ascii?Q?BqH/RLHu1ijbXXc7GnpNzntd89bDLZpRQmFaahBmJnRTDk8wCczypYqkR/FA?=
 =?us-ascii?Q?f6M788nDrPOksBv0Gg4l5F7+C+UVyT5czo2A+S0rMsS+hnQ1P7GJv0OtEFD7?=
 =?us-ascii?Q?eg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8428.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c1b747-0145-4999-2b8c-08dc260f3c99
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2024 05:56:46.2579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R9ruv+pkgyvq/0it2Ag7o7JYabez6A37fqnOjmxxzZAVgt+mC0yNdO11NagwFj9DHnyOVx0TOSih70LpYJz66KGQIOSm+gi4Gugl7SYtGW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6543
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
> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Sent: Monday, February 5, 2024 11:32 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [i-g-t] tests/intel/xe_exec_queue_property: Remove persistence
> queue property
>=20
> KMD has removed support setting persistence queue property here
> https://patchwork.freedesktop.org/series/129311/, to have parity remove t=
est
> support as well
>=20
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  include/drm-uapi/xe_drm.h            | 9 ++++-----
>  tests/intel/xe_exec_queue_property.c | 8 --------
>  2 files changed, 4 insertions(+), 13 deletions(-)
>=20
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h index
> bacdca787..1917e4c50 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -1046,11 +1046,10 @@ struct drm_xe_exec_queue_create {
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT
> 	2
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE
> 	3
I see from the KMD patch they are renaming.=20
DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE to DRM_XE_EXEC_QUEUE_SET_PROPERT=
Y_UNUSED_1
Can you please check this?
--Priyanka
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT
> 	4
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER
> 	5
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT
> 	3
> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER
> 	4
> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY
> 	5
> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	6
>  /* Monitor 128KB contiguous region with 4K sub-granularity */
>  #define     DRM_XE_ACC_GRANULARITY_128K				0
>  /* Monitor 2MB contiguous region with 64KB sub-granularity */ diff --git
> a/tests/intel/xe_exec_queue_property.c
> b/tests/intel/xe_exec_queue_property.c
> index 53e08fb0e..4fdd4ceae 100644
> --- a/tests/intel/xe_exec_queue_property.c
> +++ b/tests/intel/xe_exec_queue_property.c
> @@ -11,8 +11,6 @@
>   * Test category: functionality test
>   * SUBTEST: priority-set-property
>   * Description: tests basic priority property by setting invalid values =
and
> positive values.
> - * SUBTEST: persistence-set-property
> - * Description: tests basic persistence property by setting positive val=
ues
>   * SUBTEST: %s-property-min-max
>   * Description: Test to check if %s arg[1] schedule parameter checks for=
 min
> max values.
>   *
> @@ -214,12 +212,6 @@ igt_main
>  		igt_waitchildren();
>  	}
>=20
> -	igt_subtest("persistence-set-property") {
> -		/* Tests persistence property by setting positive values. */
> -		test_set_property(xe,
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE, 1, 0);
> -
> -	}
> -
>  	igt_subtest_group {
>  		igt_fixture {
>  			sys_fd =3D igt_sysfs_open(xe);
> --
> 2.25.1

