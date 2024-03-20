Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15CBCD11BF
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 11:32:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280EF10EB25;
	Wed, 20 Mar 2024 11:32:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fzcqlGjI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C20D10EB25
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 11:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710934353; x=1742470353;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ru6mRhbCAWxJLKYu3m52u7dAeuDJ3ebKAzCMX7hnP+w=;
 b=fzcqlGjI64K903aVSpM/ko4CtBouHy52gjB15SCpPceX8jcerozYRHk7
 2o/JbVqBOHI4JqRlA/yMbVT1gi1g6h2/vI4JObAS7tlHFjrwwm0C1vljd
 QAYPFGz5N4aIMsvLBcHp4o8s/CxMGoX0JWr1/ugeLpti6iJeQwS/a6Kw7
 l6l8H4RIpN709lZ8ZG9w1w1rB8R12QdvRkgyEvvdCe/awYitW1Y7A5/fJ
 8taJy4l5mcN6vJ/i9BAofNpGwwR5J22ob37rqoSqXGEYDn/VsloOObDHm
 FH4Bef+xu1Q70Z+Z6S0NJs4uw1N5VaXTI6Gd32unzeE9wBpDH3dtgc1KP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="17255874"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="17255874"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 04:32:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="14103913"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 04:32:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 04:32:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 04:32:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 04:32:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 04:32:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffrdwWuM/ymqodpgzr3xjtYeXkxRoITUBzEq7TA2OmbEbz6tevWkGK5rQOQtsUDQPsKhJ6+ue7mphiS6mv60N5VDc+MWnelz+PlBNbub7bhWISV+nHDU2P+psbwApfm7qA/SW9XQhNfSwszCUBMUwe+gM56pLCDcWPxrLyK6Tg2ajXGWyn27Rl2m3ZQzbIr9sC8ExVyUNRUme1vRvEnRA1bb01U8LpdKhGslTf2wvoxgznT+FgBTiPPtghLBWQgM6cNUpVQ1LX6TvDLusJttMb0nCItPOUa0yF0LmEOIpBqYJGsRrKOmXb3vxkQjlc2J2oMFsbHOy/1uLPz6eogM1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQwl0NUI/PtF/NoGNLtWGWWjgjK0lshQFU/VdnAiSyc=;
 b=gQ1QAlqLUXOflxgxW2+ssozoLN8fkFiV52fazBE1Mdv9jFsl7tRq/yB/mSfpYQwZrNngk0A5CfQq5x53Yw+kZdvpfBPvD9cwPSB2Tc13Jts9IVEAdx1nhLX9xM5q8T5J8UHF6qYQgSKghwMv9D5r/4klthFeQacB/QeGj5QStyRvBblFRU/Ik2HYm0QGa4CyNyA2n+HeMgpQUIR42uiOwpWJtaAoKVq13WWVkiNkdvBCFowP2d1bjoLz914nqzjGJlN905/JJTwbzQqp+lRT7BwLuHPFVIyTfA0+IgL5RDLQRmxPDeEKVyM9RVIZyCAzl4jSR9B9v2C0fL6R+P3/tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by SA3PR11MB8004.namprd11.prod.outlook.com (2603:10b6:806:2f8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Wed, 20 Mar
 2024 11:32:29 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::82d7:c202:f53d:4dc]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::82d7:c202:f53d:4dc%7]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 11:32:28 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "Bommu, Krishnaiah"
 <krishnaiah.bommu@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t 2/2] tests/intel/xe_exec_fault_mode: Extend invalid va test
Thread-Topic: [i-g-t 2/2] tests/intel/xe_exec_fault_mode: Extend invalid va
 test
Thread-Index: AQHadSmoHlkSx81n4kG8VVbR5qbN8LFAYBXAgAAp2eA=
Date: Wed, 20 Mar 2024 11:32:28 +0000
Message-ID: <MW3PR11MB4748F04C8B0E5C2447827265AE332@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240313093249.2257541-1-priyanka.dandamudi@intel.com>
 <20240313093249.2257541-3-priyanka.dandamudi@intel.com>
 <MW3PR11MB4748FC704113B52F57EB4D44AE332@MW3PR11MB4748.namprd11.prod.outlook.com>
In-Reply-To: <MW3PR11MB4748FC704113B52F57EB4D44AE332@MW3PR11MB4748.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|SA3PR11MB8004:EE_
x-ms-office365-filtering-correlation-id: 344760a4-5057-4883-e8c7-08dc48d16cac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CNW5/voixjcSXsIgpPkxCsKOQ0qLK7tQPOt/c+3nZncq5HgNorBIZNTlXRxdRhindIWl9jeKePHYHnu5UDAwWekM1Nqgnwnvl+zpk0K3sC8tf+TYteQ6FHFRJ8zXFJf0S/Arg4cDDXXLdK94MZhgaylR2VlbDvYALlZGvooJo5TDTszBVF1RBdEq39OIgd+/fb/lU79aYFo28126NJaVfeWJDqcTmyH+fow8/HCGh9dba/FQBADrUCj8s/6QqjwdgLHg56QyGthel+5vQNoSZAwtZnhqoe1B0gXwnFBMUPH7V/4LalrK1UonawyuDXE8ly4gQ54jPkoTi/CqzKrP5VV9t1I+RJsAAA3dOIhcIOCpn+Md1NypKe7//g+SpP4CyOChLBJiIso5k1VJxnDOlUqQcuUl5yQW9HHmptRbjc+XRewvjhutsvR+NqHAPXa0HbalyxuSzJhCf+g8VPu4fdQ5G8Fv4sfx7l6njw2xN+NbusbYEXlvGXi1CmW/FrfO9qArLUgQhhxcniXCVn8977MtRSbP6KxpPgfFAeKa7GwCuZR8BMx9eA6uDcD1phXf0Vqri2YR8RgGUBllcG+XAX2t25xZFwHjmHMJkOApFGGwmC59TI7rL3esnRBdtah49wxCAMrVU4laBmbQHH5BXEb0rFlKNWrRabXdkgGE8pcQpldT6I1UiuQeLWglWXI3k8kSZMIZ2U1UOzZuR85a3g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3kB6lSDEgUuJSdqif4OY3aTCGaxuRvZcXOzhsOg9z4jjaXBCIoAW1Iyw/X6n?=
 =?us-ascii?Q?7BKVPSyW6QkhSUCzijb6+GtsZHkVVDGdhV4WKE4QwQ/IQAfHWdJgEXmvXIb4?=
 =?us-ascii?Q?dNW0JsFZ+L9gOkbOSOz2DvQX54YV6o91Mjj6eFlLI3ETk+h0aJ2HNILUN9G7?=
 =?us-ascii?Q?ADiezPn0V9EUc+bNlIZINE4nfZ4XibtpC2WsJo6NBp4XkaAMsnd4yfE96VX0?=
 =?us-ascii?Q?wGpA79Eyb8J718kBC/I1+FUCIZ6lpZc/QUwmolLbBSDLDgQiu0e6/1FQWUfe?=
 =?us-ascii?Q?x5dIfb4M8VICu3lO17R+CawkY6sXAR5j2Ac4Sao0Qc8u+PmBNOtsFjFkDWvY?=
 =?us-ascii?Q?d7DgKbAJJm+61DgFRdYZkEz8O4YFcsmEKuwFIKw7YEoroH5Qt2tsx3ILFtom?=
 =?us-ascii?Q?8ostctJvA/hvsUre5t/PhWS72hgEdyvxfYg9bTydDwKy5Ywfaoa7SPThyqla?=
 =?us-ascii?Q?H2q0pbPUJeHOKdjtycSEg6o8fykw4iVIyvF1VdjBMUIAQ8OQqer+/rhuXCRC?=
 =?us-ascii?Q?dTwWq8Z6l43XdyDs65zpWrQwz79r2hetKBGAUwnv5pB1jLaNzh/mpiTZa7qv?=
 =?us-ascii?Q?mULstdKJcfCz+qXX3tEhxzqmhwtPM0598wq+RXlNoL7YkTZAb95JNofQtshw?=
 =?us-ascii?Q?00oBkUWANcB1/nRf6gaVsW8Y+uqjiQiyZQ7fdyR0td13Dq4lH/xrFKV6wcp8?=
 =?us-ascii?Q?pB2Se26/K3L6++0j1uQlqZw0l0QqmYeygL+o++BhlSzfPkJrG9Qgov6C39C/?=
 =?us-ascii?Q?KH5RBdGj3Oe+GvUyCPYm14PR2zNeA8KwsGHp3ZljRoO/oljEKsQlA/h8UGIx?=
 =?us-ascii?Q?+h+tmdDdzUrCJ2mlqFI39Xp5MKLhEinjQsrgWz6gxa8SxABlZJgTipRAaK7Y?=
 =?us-ascii?Q?2hJ8dEI4cnhlDb9wxTjfMUZ1PuEP7yjAGggV7PfdlVaRifmuBbLW0k9n87KJ?=
 =?us-ascii?Q?ax5mCESVWZRQu8mCJBVvBV5ko8eEOAuv2SD9ofZXkPoQF6UbNy5TSnmsogf9?=
 =?us-ascii?Q?5FhrbbMuuQm+ahKVSsk2f5lfbPbTCK2inkpLdIn+kn/8pYmTxGi4gT7ciT7A?=
 =?us-ascii?Q?KqfOdJF6A+PN+i4+oCipzNto1U6W3oUwJ7itG/LRuMnDI/i/t85Z4nThzE6B?=
 =?us-ascii?Q?ksBams94z5IDhZBTu8nIwBwRHQFvuGt4/RTHrcaWMGbBUjUFVDsXmbqPT5IG?=
 =?us-ascii?Q?NCyyHUBJN5YYT2Jt/2NmeRjMYmwYQ6ksH9sxlRcduSQnCU96v+2xcco2lK34?=
 =?us-ascii?Q?UJ+y/yxQn6o1VYeLFsdFxFZM36cS7WPA2AhEBq6Tu+2x5ek6pmwqUB5d8fj1?=
 =?us-ascii?Q?0oINVuCykwjr4QpRU0f2mPJvvQW57mWly7ajoyp4osAM1YKzwQGSUn6GQqqp?=
 =?us-ascii?Q?lQoqT9Gvcp8yi1zlCgGlNLPxadLptKvYhZhtIWLbRyOR+l8kExgFhokAWj66?=
 =?us-ascii?Q?I6sGgr6VO85+u0Y4xF46qKpcW3GlH+GzO9e3d9Py8b6MWSZDK44XFZ7qjK7b?=
 =?us-ascii?Q?aHUEYizgA6my5rtkJIAsF/ri9LBNgQM1Go5jQtnoePXC4pUc8weVLUQ12hXX?=
 =?us-ascii?Q?TByU8Rj/diE9Zx7lCdm6s/PmdCaj4hhjyg7SYc/hOf/15ZRfzytUhvKYO3xp?=
 =?us-ascii?Q?Cg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 344760a4-5057-4883-e8c7-08dc48d16cac
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2024 11:32:28.8117 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qfIiNZjaXtC+sEXl9OBDBwJRVeUB9j5OYAnR4ETnEYVvGkiYYdH1oDOvwSCRXWNdjD50XU3uLcLOJxwXi4ACQDGlzWXW8Te6sA3RxuC9/cY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8004
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kumar,
> Janga Rahul
> Sent: Wednesday, March 20, 2024 2:32 PM
> To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Bommu, Krishnaiah
> <krishnaiah.bommu@intel.com>; igt-dev@lists.freedesktop.org
> Subject: RE: [i-g-t 2/2] tests/intel/xe_exec_fault_mode: Extend invalid v=
a test
>=20
>=20
>=20
> > -----Original Message-----
> > From: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> > Sent: Wednesday, March 13, 2024 3:03 PM
> > To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Bommu,
> > Krishnaiah <krishnaiah.bommu@intel.com>; Kumar, Janga Rahul
> > <janga.rahul.kumar@intel.com>; igt-dev@lists.freedesktop.org
> > Subject: [i-g-t 2/2] tests/intel/xe_exec_fault_mode: Extend invalid va
> > test
> >
> > From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> >
> > Extend invalid va test by enabling scratch page without pagefault and
> > check for success of userfence.
> >
> > Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> > Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > ---
> >  tests/intel/xe_exec_fault_mode.c | 17 +++++++++++++++--
> >  1 file changed, 15 insertions(+), 2 deletions(-)
> >
> > diff --git a/tests/intel/xe_exec_fault_mode.c
> > b/tests/intel/xe_exec_fault_mode.c
> > index 0914e221b..9701d32ad 100644
> > --- a/tests/intel/xe_exec_fault_mode.c
> > +++ b/tests/intel/xe_exec_fault_mode.c
> > @@ -32,12 +32,17 @@
> >  #define PREFETCH	(0x1 << 5)
> >  #define INVALID_FAULT	(0x1 << 6)
> >  #define INVALID_VA	(0x1 << 7)
> > +#define NOPAGEFAULT     (0x1 << 8)
> >
> >  /**
> >   * SUBTEST: invalid-va
> >   * Description: Access invalid va and check for EIO through user fence=
.
> >   * Test category: functionality test
> >   *
> > + * SUBTEST: invalid-va-scratch-nopagefault
> > + * Description: Access invalid va without pageafault with scratch page
> enabled.
> > + * Test category: functionality test
> > + *
> >   * SUBTEST: once-%s
> >   * Description: Run %arg[1] fault mode test only once
> >   * Test category: functionality test
> > @@ -120,8 +125,12 @@ test_exec(int fd, struct
> > drm_xe_engine_class_instance *eci,
> >
> >  	igt_assert(n_exec_queues <=3D MAX_N_EXEC_QUEUES);
> >
> > -	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> > -			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> > +	if (flags & NOPAGEFAULT)
> > +		vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE
> > |
> > +				  DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE,
> > 0);
> > +	else
> > +		vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE
> > |
> > +				  DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
> > 0);
> >  	bo_size =3D sizeof(*data) * n_execs;
> >  	bo_size =3D xe_bb_size(fd, bo_size);
> >
> > @@ -386,6 +395,10 @@ igt_main
> >  		xe_for_each_engine(fd, hwe)
> >  			test_exec(fd, hwe, 1, 1, INVALID_VA);
> >
> > +	igt_subtest("invalid-va-scratch-nopagefault")
> > +		xe_for_each_engine(fd, hwe)
> > +			test_exec(fd, hwe, 1, 1, NOPAGEFAULT);
Rename NOPAGEFAULT to something like ENABLE_SCRATCH_PAGE.

-Rahul
> Add INVALID_VA flag to check scratch page functionality.
>=20
> Thanks,
> Rahul
> > +
> >  	igt_fixture {
> >  		drm_close_driver(fd);
> >  	}
> > --
> > 2.25.1

