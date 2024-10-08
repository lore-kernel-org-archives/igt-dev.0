Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41ED5CED24D
	for <igt-dev@archiver.kernel.org>; Tue,  8 Oct 2024 02:01:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B388510E0F5;
	Tue,  8 Oct 2024 02:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ahlUewGF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0CE10E0F5
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Oct 2024 02:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728352876; x=1759888876;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Mj5cI6PuXMmiRdxQYQ+DlOzkxA0E+Auf8XjWMp5AEpA=;
 b=ahlUewGFwODBmGYw8GCuzh9H2PWMbWjfOThTM/pjO54/wYn+6rs2HFqw
 u7cXIfyItoTkOO1dPztffi+T6uidu0TugMwkkmNpHAiMZ2+7hxo9gJkVO
 M4ubuA1XqSbdVa6rUUZ+M1x8VBkVsQBDIRQ5+AJ2v3FQ9e4ddw2VQCNQa
 x2Ltj/mh6sUs4IjwX0QKi5J15elidp5Mr10qJVNU61aDt9FlUox3hicGB
 uNVfmnmGD1S/hiCOiL6oqQfj7GXo0KBDEobQqLQyS1xJXturW2wLyYZtc
 dFC+giVk0R+t4hgbCQSuakuLAsQauCjUqJL9cpl0ewFXIrrA5vRG2jGU8 g==;
X-CSE-ConnectionGUID: Q1+/5O4XQXaehSGRmk3bOw==
X-CSE-MsgGUID: 90hBaWISQXOkTApw0v4dmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38654369"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="38654369"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 19:01:15 -0700
X-CSE-ConnectionGUID: Xn3dCbngQW+eCIbo3DdQAw==
X-CSE-MsgGUID: ASA7m3l/Qo+eS6QfSBPvig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="80498684"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 19:01:16 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 19:01:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 19:01:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 19:01:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=croPz0q1s3e6XZbBDOID2erfxE8NglGZ2VnuB9V6m5IMl7UQVOSGvegX2npnXDjKeF9qZvG0S/mGbhXosn8zwHPIs7TdkMR5+5jYZiM+3zSw2V/j3jNvd0hqy4YdPRmrXKMhUuxt06WBG87NDly1cI4cL3Jb0LT4lNftYDhGiiJf/a4Yp2Yv3exOMWNo6zAJa8T68r71Tr1cjORPSXdvKece1eUTY5Q/KGldIHcv4xvQHSPoArqV/6VDMl+yF68lQHpdzxUI/HeSvyF4Fp4S8yqH/e9N8HQEsXy/EJ40tqgn4YUG57VlND4F2WvperMQs5U+nXmnr0tVUFpa+kneIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WA9h730GkhIYYwHXz8Q1p+5KmcHHx+/UiZjAvHPsj/g=;
 b=bH8Mtf5397hx1N9P2+9hPATdOibnvKeSNVVK0gYjU1KMszBk1gcWkPjV7fV3k4SKepGKFedTUJ256dv9rIwSB3SkYI1OH0c7x4xBvVzyQvHU38NkSAHOx4gS7jhSwIfPxuU8ekZztWtojwyJ+f6S/VVx7AafPo5W0XqB4HmbKilYMhuT3C0IEbVuoEzxaQv/wzUdQWT0N9685sMRfRqS5jIwVoV+AWscKDnZFMfbFUvHIrS2m9aoAcB3DTld3dr+5p1jeluOAKh//sT0iJ8mk/rTtO9kLzMI0zglv7dP+wuf1kitw6hDzH4fgAlV88+/Ceno8mAVXnpfSyFgbvDWCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by PH7PR11MB6795.namprd11.prod.outlook.com (2603:10b6:510:1b9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 02:01:12 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%5]) with mapi id 15.20.8026.019; Tue, 8 Oct 2024
 02:01:12 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, "Poosa,
 Karthik" <karthik.poosa@intel.com>
Subject: RE: [PATCH i-g-t 1/2] Revert "tests/intel/xe_pm_residency: Add an
 assertion on MI_STORE execution time"
Thread-Topic: [PATCH i-g-t 1/2] Revert "tests/intel/xe_pm_residency: Add an
 assertion on MI_STORE execution time"
Thread-Index: AQHbGNsi1gRAhPQv1EqKYxWp4XzyK7J8GVtQ
Date: Tue, 8 Oct 2024 02:01:11 +0000
Message-ID: <CY5PR11MB62119CD942646EABA7CA5D91957E2@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20241007172356.1747943-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241007172356.1747943-1-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|PH7PR11MB6795:EE_
x-ms-office365-filtering-correlation-id: c1dcd9c6-440a-4115-ef6e-08dce73d1583
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?cxlwDRHFNkOF6/xJZn0qnFUSLsQZU/Ku/0GxXPnSI7y0DjlPUqhmEiCRpgOx?=
 =?us-ascii?Q?eEsgKdwCGU9YlsTttzuwdUBKLWrOirGXdPch9JJodk6A5wg/fZC7QmbTGj7F?=
 =?us-ascii?Q?PZg8rcmN4QlNu5l4jGzue0I8uV9oJzedsMFjH1q7D4P/ubknX00mKqRksvyh?=
 =?us-ascii?Q?m/6EMp6nQ6gdndBjbXie1lZ7DZhOtkZOJAabGnC+9ZveFnWoOqby35i4hHyO?=
 =?us-ascii?Q?YMwh6++a29axYJEbX5lo5Z73Vr1dq1vLlyFIcQgZIt+LJKIU+jXV7B9igkwP?=
 =?us-ascii?Q?9HQvKJx2QBG9qPEAELLGO1my7mNYI9b1jpUAu7dW+YSbwpiy9MZ4nljEbmJP?=
 =?us-ascii?Q?1z4EwUSqnA4WvVQnQ6eD0bwrJaqGzZRcou3aZ8/V52GV02+2TPY9TLDBAjuC?=
 =?us-ascii?Q?arxQoGk6sCwszj7f1ww/6JbUoozOFQXRdTduXSOuFj81MM9rtT5oHGmrMbB4?=
 =?us-ascii?Q?ITN+dfq1IXo9DrJrvoF5waUlk076UrpV0hJKdnCRaQEW/uZjRbMXnhtuEZf+?=
 =?us-ascii?Q?8wp+ATs4UYxFKRr5XEODnS6Aompxu13yQ3Rq0tEh/aZwLhqiA2jq67gouGuy?=
 =?us-ascii?Q?HzrQ4DGw9FMGWf6VVVUDn8oy/QQ1fqXvOJP+v1DD8wKgjEUHx3YzxtWkLc+f?=
 =?us-ascii?Q?sXPK9IU7hH0B6DD3yCqRd5qfd/vHFP30xcuhGTx5oig59s3FabocDPY74o5p?=
 =?us-ascii?Q?pzvw1DPXxkSrajB2pk0IJTxc7fyXV01zVLPicb57/8WwxXyTLVBAMcEKDWYa?=
 =?us-ascii?Q?IPAGmq0pG1WYwYSlqcDXPNgmro0iqBB6NDK3MFYrcrd7JXsAeskODXSd12JP?=
 =?us-ascii?Q?n46EHQI06g2fPEiS3tY1+TCP18sSiHiNNMeccZcXIjXHNDP8fMrVGG7V5yLb?=
 =?us-ascii?Q?AzJ6QgtJtcW17XVXD7DQiftRjFHIM62NGVYE9ja8/DDQ2HK5ufU1mjcS3uA7?=
 =?us-ascii?Q?EB7yAPP4q62DjFyIQ3j8KKKf+1UnD6wcPr+BWeFI+5HbkDcjULXMGQt488AX?=
 =?us-ascii?Q?j4KA2K9Z8GCAOI+BP+fdQ+42A5zdPxAitMOE1UDbFaQo8zsL5vjsuNei7AiZ?=
 =?us-ascii?Q?OgnQC1zIopasxWGlFZNgcpmefdVrsGDL9F/tfh55gGhC81JNdPJSGPPASBc3?=
 =?us-ascii?Q?mFk1yeVMzRDLDtwSU/7lhXpOsbbNjzSGYO4racE35/cEfgf4iyxuqyuaV+Vf?=
 =?us-ascii?Q?qTX6SAPieFKvjF8Wk1QNAvvVjyuUpUDJRo9EU9nJs7u20o06eGiutWbTj1ZS?=
 =?us-ascii?Q?IMb9L2Q72aJgqTzCsImLi32Yam0xqrOvWfboyHwlXhqSd/mhAKnTJm/+PlGQ?=
 =?us-ascii?Q?/zOsqh6fMqAXli+lxze6/uH4PhPGOnR2J6oFaH+TZg2QLA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wLOb/Acnt+GiCCyaVohiC+x9Sb8zXJsoBQYQ9QSAdNH0ZBRkQZYVVYAEtSRi?=
 =?us-ascii?Q?TbF3S4baWktxSDSGOvAIOFqRJcdn01LDwMbSTnmSBLs5pCeYAX9LQbSNyVhP?=
 =?us-ascii?Q?mt/SD6mUaBHwsIWokz9m18OIIeA8P6GeVhjy5kFkoxa5CAHPnqzxCwqHXBsc?=
 =?us-ascii?Q?EXwGSoECuZpEfD/5z+L6aaEC2uZYHR+nIHfwQvkQ0kuywPseHTOacdeyk5J8?=
 =?us-ascii?Q?6UPMq95lJSXVICNbKbIV0QIjXc9HRUkFEs7aYIcmmfO/9KUsJf548u43XyQ3?=
 =?us-ascii?Q?ynlWlbx07sR0Ag/iwXqGWVZSenCJGI6Gdy4zfL5C/6y8vv44lE/eCTFIFJe6?=
 =?us-ascii?Q?dmXD/9vt4JjNhH/KD5TjRx0ltqorguH5K7yDaAdyFg1YXrGrq9na8i7dVGK2?=
 =?us-ascii?Q?qJehhH2/Q+Wg+9npqroO1kXrFRkcFH8M+JYAVjgm1v85BuV6AC476g0PTGKL?=
 =?us-ascii?Q?trpUvwI12POGr/DQnNMTno23EuH1Jgvs/imCyx5nZHFuWf20abxDLzfI+/uf?=
 =?us-ascii?Q?bf1osI+qjxiKOl6TvMtE9+hZ7fdfN5gaxDr3FFmGFO+E38+vF41FofyMl90D?=
 =?us-ascii?Q?hD/zG3dwYbb9ugexk4KEFQucFrkGSKgsB3RXoMETnc4DjdnitHeEgo/pIpTl?=
 =?us-ascii?Q?OlYbfqI+NMCG3aWnbUs5C6TkLCNRutvn/aNMGV89KKIflzrOrnckfFrCY1ni?=
 =?us-ascii?Q?LgN8zRfVR/eOtNCppZ3C4raJLGhvU1xjJEfyDWlW8/WyvsfGzqXXWuviLI5P?=
 =?us-ascii?Q?4STtSkhKgzWLmzDeIMs+n7GYWbNHXS/V5DQixyBbGH+mlAUv3ee+RYJMcWVe?=
 =?us-ascii?Q?K+4Z0QbEYUBcPZxaeFC3+08LkVD/UEvSDoCv3UeTqpIVUuTIex7kdgccIrEX?=
 =?us-ascii?Q?exGLtz0+eFjarSIyNVJ1TkI4S4WwFZasxlZV0qF8tgYiMyfOfS/0XQhfm8Dj?=
 =?us-ascii?Q?wnH2fUd8YyjquMyjT7SB3YiNIWAVjC+3ohYRKXEY004nZ4qhWbFtZjYmVUqp?=
 =?us-ascii?Q?o1rqvaeT9WrtSU+MBkXReV2SsVrJDyU4TMxW0z452ohRJ2Y3wYY5HhddA5Ee?=
 =?us-ascii?Q?U/Z0s4Mexovu53JI5BnmE0m6ShvsONC7OsY1KFhBiF7wqjj/E8YH1OYPjqot?=
 =?us-ascii?Q?QbZvI3R4H6XZJE/kWMZb8bHP0CQEKQw3DbII1XjQTUKe+C060Zbu1qz4AwIJ?=
 =?us-ascii?Q?ETPwa82vrhpLCHAkOpLaHJwbJCp/nJW3+VLTLJqC7l/KdxvTRVhtMbp46KAB?=
 =?us-ascii?Q?puJ0OEPpYYdo7g0zVWmMWYE6+/l8jUzwWseowQZl96RR/yhohL2APj8lFtSx?=
 =?us-ascii?Q?Wo8JPzELmrt6FV+O6KrfVMQQtwDOhgOceMx8T31vbD6NogfI4eLORQ2cVKee?=
 =?us-ascii?Q?rZ6g1AK+5VP79sukcxn5jc9d0IAGe61Jh3RgwX0JB8fAwHUUmxJ6dkYwrcLV?=
 =?us-ascii?Q?D8YIAHjoV4eXlk4hRtKTOdhRxCtH4v0VEWLG1et224roHxTT8EG6tV3YkynB?=
 =?us-ascii?Q?l/RIGMawlWbyjapCsxjqu2YzWNsWMQMbswQsjys0o9NiYp8bF7LnhuZv1psQ?=
 =?us-ascii?Q?06K/EhXCbUrSkUcx94193K9P5H7hyNd01MHqpyVlt8WmJZ2O0I7MJ0nKqYRZ?=
 =?us-ascii?Q?6Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1dcd9c6-440a-4115-ef6e-08dce73d1583
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 02:01:11.9277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1ad4UncXxxgorWCx/rIq5q2nw8ghU/dsljrEBrk/VQWj/DJDS9rAaa7NslK44QOiVeXzVCgM03SddLaQqWj5CRVA9WzF8kffpsl7L703hFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6795
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
> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Sent: Monday, October 7, 2024 10:54 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost,
> Matthew <matthew.brost@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Gupta,
> Anshuman <anshuman.gupta@intel.com>; Poosa, Karthik
> <karthik.poosa@intel.com>
> Subject: [PATCH i-g-t 1/2] Revert "tests/intel/xe_pm_residency: Add an as=
sertion
> on MI_STORE execution time"
>=20
> The reported time does not reflect the completion time of MI_STORE_DWORD;
> instead, it accounts for the delay in the scheduler.
> Therefore, it represents the time taken between xe_exec and syncobj_wait.
 igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
elapsed =3D igt_nsec_elapsed(&tv);
elapsed is taken right after the syncobj_wait() therefore it represent the =
time taken by xe_exec + syncobj_wait, total time taken for completion of jo=
b.
Thanks,
Anshuman.
>=20
> This reverts commit 92825ed72be61c5419d95db944fef1c9dda2215a.
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Karthik Poosa <karthik.poosa@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  tests/intel/xe_pm_residency.c | 9 ---------
>  1 file changed, 9 deletions(-)
>=20
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.=
c index
> 772fe9b57..f4d05889c 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -144,15 +144,6 @@ static void exec_load(int fd, struct
> drm_xe_engine_class_instance *hwe, unsigned
>  			  1e-3 * submit,
>  			  1e-3 * (elapsed - submit));
>=20
> -		/*
> -		 * MI_STORE_DWORD generally completes within couple of
> ms.
> -		 * Assert if it takes more than 1.2 seconds, as it will cause
> -		 * IGT test to timeout due to sleep of 120 seconds which is
> -		 * the current per test timeout. Currently there is no way to
> -		 * read this timeout from IGT test.
> -		 */
> -		igt_assert((uint64_t)elapsed < (uint64_t)(1.2 *
> NSEC_PER_SEC));
> -
>  		syncobj_reset(fd, &syncobj, 1);
>=20
>  		/*
> --
> 2.34.1

