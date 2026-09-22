Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1833FC98302
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 13:52:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85B910ED0C;
	Tue, 22 Sep 2026 13:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PGEgcurc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F003D10E489
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 13:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790085117; x=1821621117;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GEo2VSsGQmBTTu6FpfNjx31Y6bLFXQInduwmrXJlDs8=;
 b=PGEgcurc69TYdWhyGhj0IVY0xmGY/p5SeBL7I4wez7gzS+5pl37b97O4
 grXSzTE6qYwZ8PG1uoaJBdjku9afyXx4lNZDWV3kbUhrLf6JHp3xPzmp6
 Z+4M6laXJZzR7mR9CWBT41HDwus7HigVI/dxF7MEXF3Phr3ipjlFua6AT
 RGcwicbEp/JZ+XDHe3V6Lh0mxaO3N6a5PKEmfOOia/kVB6QAcvnApyh6H
 QwkI/p16Y9alzGeyTPDz7XlqcehkpYxhMnPbSTGdRV9Is/AL8T9ZIhi20
 aYCWIY2F1ffMK59KwBliqSJSu3BrnsAZ7gGzUIhpUBU8tnd8u91F5gdcx A==;
X-CSE-ConnectionGUID: S/2SI3x6T4iWD47OThNCig==
X-CSE-MsgGUID: aP2DeFD3TQ6BMyytO6RpzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1190744"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1190744"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 06:51:57 -0700
X-CSE-ConnectionGUID: SVKZZXpPQQKrgZWaubj83A==
X-CSE-MsgGUID: JoAUwErtS6KMwvtMHL1S/g==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 06:51:57 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 06:51:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 06:51:56 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.30) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 06:51:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6cCulVCsXCepyeTjdL5xyDDdm2OKINqOSNgcxUstCdNCGWVOJNPyvIiTUjpwoQW5KTDveSHs7ILHJK/C/i0vSMDkYj5RePa+U4MH7amND/br5uyjrmIvA7ImT62DO9QZzqYfnXpFECPGrsqKWaVHCpyALcpPvpdSXbpupyRcrObw5TYVqmCc29ge/dRwdiT69z1PoQ5ypFTO342Y9PFkgkRMZty4OAuIQ6FbCwU4Xm0xri7K9udrl9x5OISXSVFx0fa6LUcniLVmWJLNIXaTMeYXlWxgVM7D0aSG9HEJMeH3+TRn0aCvEPCOltu0aGEJlqOE0vtZ3wtFifV5jznCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2C/l0v+BZju27k/f0VGkuKrOdwqzjVHl3SnW/aMvKl4=;
 b=r0l/95u+xAPmXLw2m1TjzPBrZyCvXGYoL/9rA1juIMcUHR5ITSY+2XaOZLIoM1jaZ0lv8HTufCxvWUwa+f9/1/IRnsuU/oPuqDWkPdYtZ36OuZEKd5VTrxSiHs2MypMxb7R1fKXECvBLmrfzn6cgQyLFw4vzkcWALpQNkuMrr+r/XJi/fssbCapmw7Q2OH0b6SJdDw25jrRsKnM6S5suiCE4RmbAANdQjGojOvKxcHx9m1u0RkgvMZ/ETDgMnEck+DKL0YItsga7V9Aer55j5ohrPOHYGDCBbQ+A1tcCiQTYf0KdrGSK4vuKy3L3xQARBk0sNtEv7mipmPohnK7GgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by IA1PR11MB6347.namprd11.prod.outlook.com (2603:10b6:208:388::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 13:51:54 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%3]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 13:51:53 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 06/13] tests/intel/kms_dp_link_training: Train every
 allowed link config
Thread-Topic: [PATCH i-g-t 06/13] tests/intel/kms_dp_link_training: Train
 every allowed link config
Thread-Index: AQHdRZSeCewDw8XMvUS1VBVyzl411bbaotvA
Date: Tue, 22 Sep 2026 13:51:53 +0000
Message-ID: <PH7PR11MB679664910EF97214C090E11DE5832@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260916044801.1279102-1-kunal1.joshi@intel.com>
 <20260916044801.1279102-7-kunal1.joshi@intel.com>
In-Reply-To: <20260916044801.1279102-7-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: kunal1.joshi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|IA1PR11MB6347:EE_
x-ms-office365-filtering-correlation-id: b994292a-2c9a-4111-97cc-08df18b0a90d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|38070700021|56012099006|3023799007|6133799003|10067099003|5023799004|4143699003|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: 92aCswlfOW5i5/SmWWCuVzpD0zX2HDfJ7EQTdKJYLKE8FthidZJrD688KtTgbHFCSBlQRKEC0bW2Lr0SfImZpM8DdKnglORZJHj41kGm1z127M59hjKQIblxaFUGvTqxUwtsa+N1KRXfAYFIVz8YtyKpDS5Y2cypjlbap1MIK+oqYWGhbl175sEQWPdLGGnjGKmKRVYnXjvjXg+d3jcCDBZIht2Vgwt5TE5uNt2c3hIoYPYMqW75bvP2oZAvTKxuXbOP9uPKYcgL/LxfkeCUxOOHRsNxHVOCs6pBpgwagwuVbDBHrdJhqRHIRyfcY1x1pmf5OEG/ean8GOvmDQfwGLwcxgIm7cvrg4WOWpkygtl/i20AultGQ7QSLWfkPVOv8JRc1BlO9DvhavtFRimZ2laPxdKgkS7E3JWLCmLXh+2W+EsP8n+grTWo21CgNCF7ALFFsxz9LdCSzOxMggW0hN2XITs5rGnvhjhkZZ7NOhHfTzPDUUx/HIJneGkWarCt7BCBqQW2QrD5nNH0a2hCfYbjVMYtLfEiM2XE/ejTbumGOtJBN7manX//cbuxZ30Q9OdZIVi6GqeQuAix8mct20Z+7Hr6UYnD7ZfTMgLELig+J6Ml1Yn/LlxP0npS05r5v0VIkJxF0QBX86Uv7B/eOA00mqOEI487rpBoQ4iGmuyaxprrH596ZoZma3dVdHhoaYUpfYMYAFWJfzDYAXlGz0qRurWq9YPal4EvCmv+7YY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(56012099006)(3023799007)(6133799003)(10067099003)(5023799004)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5GF4VZ40ZXpZMACGvZ8XlZqld7QwgbJM5jJtCPVUfJN8w/1jcRHPpT0lnymY?=
 =?us-ascii?Q?3pTUf1iRdcEDPznSOxqpke51TUfx6X/PjPM2LJGsdVaCdRY3IoLytsrKsV48?=
 =?us-ascii?Q?dl04whn6QWXBJKXlxGb1LfVjiylGjhZjDkcWVvvQYZAjwg/79qq+bEgLrKXK?=
 =?us-ascii?Q?fX44qW+kzu1IQizSSHURS8ixQlqLukwQf9LDMOOCQS8ubQOGycq7O/D8mScj?=
 =?us-ascii?Q?VCwh21uxaH6/wD55jrnvZYLpKtYWDiSLgCkvNelteIRxxBMtMKrDu8KGXTYd?=
 =?us-ascii?Q?OQOop8Swc6oCv6k9FJQXK4F8j/wEN+81zHYMZzc/ZBjJyz/G1ioKj0bVQysB?=
 =?us-ascii?Q?8YYgSSxyamRv4rz9I7rpAN1KyK3Zk3K7so8umx2CDcTfBZdODycWL5We79+i?=
 =?us-ascii?Q?vqY2kbkk0CPqFkobgnyTrmmlO0J+jB9ccNSfYIEN4Xx1IiUm9HNQQ0OO+pxg?=
 =?us-ascii?Q?EyCrfjzKd0LeGF3K4cT9X9kgUFSc9XFQhwvmD1J0WHWAzDEoMThKela/LDWu?=
 =?us-ascii?Q?GMkUweQ2Gdb/QRBzx+tAAExg343Higit4lsaS7/jSM5Cn4F4TqWPwH+7CwT3?=
 =?us-ascii?Q?KwPKTTfgCve4Yh6G/HR/CpPbPsK7igJOKQPCBa5MPPtmOcr6jNvPdvRWc/pt?=
 =?us-ascii?Q?56xXYub0vJLNda6w8vJUnJXlmfaOi+ln0t9oLZ8Dqh+qh3P6pwSnn5f1lDJT?=
 =?us-ascii?Q?HDKLGLNBDpvYgNUAwN6K3I+J5BBe+cgwVDajjJfFcC40yCDQVfklH0LFSJOw?=
 =?us-ascii?Q?yboUNUtmuMgTTOaKa5KYGK2fRtIT3tjZTAeoExi9O9MvNeGNkayGdYLejDsm?=
 =?us-ascii?Q?CoGwXQVSBenYVCsHO+LzjNpDYxtzyLsy0nUJj8wLOyu9/4qcEKhFbkBqDolV?=
 =?us-ascii?Q?9kfTN7b04urrueVjIGE4+Rrm6M91dVNsgs198m+CDFBKWBQLqcUwDhXd1b3o?=
 =?us-ascii?Q?Nubi0Qv3LHcIxOgJUeDejifBwy35LO7sHVF1B2pR1XvwmFeRG7dAJXPUcPFv?=
 =?us-ascii?Q?HaHBqjaBkkaqcDufuWHQJRWWbWssiPlaF4dtmgXRxawjPhRFWeQznb5nSCt4?=
 =?us-ascii?Q?P5q54AW4wb+Zy/2+mmfarQaDb78oFTgbY2IEUpYH3YXWBPnAtuFWo4wNKQ4E?=
 =?us-ascii?Q?qfJoibwwlNAx822B16xX8YQJCWzOHHPmkTgwWsLmyyek3pF92TXX49EYdaGV?=
 =?us-ascii?Q?BvL7GjCAzn0JkcjF8NlfXOPUcD7jfc8e1seQONUk3yKFam7W4pncZRiHBiqB?=
 =?us-ascii?Q?Go2lo33KMQnZV5jwpIPI6saTDjHp2IXC8rrwLQj5OB6q6B7uxrOGaOaOfTt1?=
 =?us-ascii?Q?ofMoFPF1Zm5M4YcNHvA7HivY4UwtfFqoKwY9JuNR/5nJnLUJNSMhmyflvHVf?=
 =?us-ascii?Q?01V62lIctBPOVUZA6gj1Rt3QoKUL5GrAKy2v5Nh2ANChbf65/38icPmfajK9?=
 =?us-ascii?Q?+AuMuwZ1jqOtjQd3obfy5j9cdTFXUft31iJB0ys124SfsanKW8tJspJtqlRF?=
 =?us-ascii?Q?zdZNLhKVRRcCiJ6mm+U9Z7xg/tVZgiudH/KATpWVsVrZs/FhZH2B9usuE0lZ?=
 =?us-ascii?Q?H3H++I0R+RrLd1Fo61kepBAvQxVe8bVDWBFAcywKJNtegnvXcDsF/RaP/RK2?=
 =?us-ascii?Q?NeRhur6qnrLyJ31tPImVL+b2nxsr6KIoOC9sR3Kajyi+8LN+E7iAivTIwBCH?=
 =?us-ascii?Q?p6U2NwNzYP+hN3ktttNI9cczzhZ+6xJwWwU2nel0BT6Nipo1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: OGTBeu+dE88S6/qNh4LMC14l/PhHrk1zG6BcfkWaCUTDasF2X6sDe3gpQfcSV74x5iLNw8qbqfEtSXl02ZBRiB+CchCOLIdq+jI9DWCwdLmqmSDh5Pa8dTMRvGd5hGBCBnwqkdLDw4QgZ6S2zOzvLhB3M9WtuMd1+SQD+H4pttKWsMI07jnx5CcMWHMo53FgbY7Nd0qReid7+l2RXXi4tzYX1bIBg4Ta1dk5hrVnSTHPMLgIW0g+O2cAozvDXGAd2IY8dXJzzryuxHnuX+39+HJN/j0hFFinb0jpSp0TH86HRAIhTS2tKSNUWWA6949p8UJAb3ocnFXz1ez1n7ft6A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b994292a-2c9a-4111-97cc-08df18b0a90d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 13:51:53.9304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MOMbIxAXFb5AOnlNsxICC8OZExkyYBcAm4Tgo93ztxZHUzutxmfyvmDGk53nTvet57WzwR2ztffyampi5v5sJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6347
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

Hi @Joshi, Kunal1,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: 16 September 2026 10:18
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 06/13] tests/intel/kms_dp_link_training: Train ever=
y
> allowed link config
>=20
> Currently test trains one configuration per output, the maximum. Everythi=
ng
> below it which is what a bandwidth constrained modeset and every fallback
> actually use and currently is never trained.
>=20
> Train every configuration in intel_dp_allowed_link_configs that belongs t=
o the
> subtest's encoding class, as one dynamic subtest each, named <connector>-
> <lanes>x<rate>. Enumerate with the forced parameters reset, or the set be=
ing
> read is the forced one rather than the one the driver would pick from.
>=20
> Bring the link up inside the dynamic subtest rather than once per output.=
 The
> reset, the modeset, the retrain poll and the link-status check can all fa=
il, and
> igt_subtest_with_dynamic() does not allow explicit failure in the contain=
er:
> igt_fail() asserts on it and aborts the whole test instead of yielding a =
dynamic
> subtest result.
>=20
> A configuration too narrow to carry the modes is skipped, not failed. A f=
orced
> retrain goes through a modeset commit, so such a configuration makes the
> retrain fail and the driver queue a modeset retry, which shows up as a BA=
D link-
> status, a correct driver rejection that must not be reported as a link tr=
aining
> failure. Derive the floor from the modes' own bandwidth requirement rathe=
r
> than from the configuration the driver picks when nothing is forced: for =
MST,
> and for eDP after a fallback, the driver configures the maximum link band=
width
> regardless of the mode i.e "For MST we always configure max link bw" in
> intel_dp_compute_config_link_bpp_limits(), so using its unforced choice a=
s
> the floor would mark every other configuration unreachable and quietly
> reduce MST back to training one configuration.
>=20
> Sum the floor over every stream driven over the link. The modeset drives =
all of
> an MST topology's streams, so the link carries all of them; a single stre=
am's
> requirement would let a configuration that cannot carry the aggregate pay=
load
> through and turn a correct driver rejection into a link training failure.
>=20
> The floor assumes uncompressed 8 bpc and so overestimates what the modes
> need, which biases a borderline configuration towards skipping rather tha=
n
> failing. Note also that 8b/10b MST runs at 78.75% efficiency rather than =
80%,
> because of the 1-in-64 MTPH overhead that
> drm_dp_bw_channel_coding_efficiency() deliberately does not account for;
> using 80% there overestimates the available bandwidth and turns a correct
> rejection into a failure.
>=20
> Clear link-status before every attempt. It latches BAD when the driver fa=
lls back
> and only userspace can clear it, so without this a single fallback anywhe=
re in
> the run poisons every later assertion. Assert the forced lane count took =
effect
> too, which only becomes meaningful now that the configurations differ in =
lane
> count. Reset the forced parameters after every configuration, since they
> otherwise survive a sink disconnect.
>=20
> Require the allowed link configs debugfs, so that a kernel too old to hav=
e it
> skips rather than training nothing.
>=20
> The subtest names and their scope are unchanged.
>=20
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/intel/kms_dp_link_training.c | 193 +++++++++++++++++++++++++----
>  1 file changed, 167 insertions(+), 26 deletions(-)
>=20
> diff --git a/tests/intel/kms_dp_link_training.c
> b/tests/intel/kms_dp_link_training.c
> index 6a174da88..71531e8dc 100644
> --- a/tests/intel/kms_dp_link_training.c
> +++ b/tests/intel/kms_dp_link_training.c
> @@ -29,6 +29,9 @@
>=20
>  #define RETRAIN_COUNT	1
>=20
> +/* The driver allows at most 10 link rates over 3 lane counts. */
> +#define MAX_LINK_CONFIGS	32
> +
>  /*
>   * How long the driver's link recovery is given to reach a verdict, in s=
econds.
>   * The automatic retrain is queued without a delay, so this only has to =
cover
> @@ -106,6 +109,103 @@ static void assert_link_status_good(data_t *data,
> bool mst)
>  	}
>  }
>=20
> +/*
> + * set_link_status_good - Clear a latched BAD link-status.
> + *
> + * The property latches BAD when the driver falls back and only
> +userspace can
> + * clear it, so without clearing it before every attempt a single
> +fallback
> + * anywhere in the run poisons every later assertion.
> + */
> +static void set_link_status_good(data_t *data, bool mst) {
> +	igt_output_t *outputs[IGT_MAX_PIPES];
> +	int count =3D 0;
> +	int i;
> +
> +	if (mst) {
> +		igt_assert_f(igt_find_all_mst_output_in_topology(data-
> >drm_fd,
> +								 &data-
> >display, data->output,
> +								 outputs,
> &count) =3D=3D 0,
> +								 "Unable to
> find MST outputs\n");
> +	} else {
> +		outputs[0] =3D data->output;
> +		count =3D 1;
> +	}
> +
> +	for (i =3D 0; i < count; i++)
> +		igt_output_set_prop_value(outputs[i],
> IGT_CONNECTOR_LINK_STATUS,
> +					  DRM_MODE_LINK_STATUS_GOOD);
> +
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC); }
> +
> +/*
> + * link_config_data_rate - Data rate a link configuration carries, in
> + * 10 kbit/s units.
> + *
> + * Channel coding efficiency is in 1ppm units, matching the kernel's
> + * drm_dp_bw_channel_coding_efficiency(): 96.71% for 128b/132b and 80%
> +for
> + * 8b/10b. 8b/10b MST is 78.75% instead, because of the 1-in-64 MTPH
> +overhead
> + * that helper deliberately does not account for. Using 80% there
> +overestimates
> + * the available bandwidth and turns a correct driver rejection into a f=
ailure.
> + */
> +static int link_config_data_rate(const struct i915_dp_link_config *confi=
g,
> +				 bool mst)
> +{
> +	uint64_t symbol_rate =3D (uint64_t)config->link_rate * config-
> >lane_count;
> +	int efficiency;
> +
> +	if (i915_dp_is_uhbr_rate(config->link_rate))
> +		efficiency =3D 967100;
> +	else
> +		efficiency =3D mst ? 787500 : 800000;
> +
> +	return symbol_rate * efficiency / 1000000; }
> +
> +/*
> + * mode_data_rate - Data rate a mode needs, in 10 kbit/s units.
> + *
> + * Uncompressed 8 bpc, which is what the smallest mode of a DP sink is
> +driven
> + * at. Deliberately pessimistic: overestimating what the mode needs
> +makes a
> + * borderline configuration skip rather than fail.
> + */
> +static int mode_data_rate(const drmModeModeInfo *mode) {
> +	return DIV_ROUND_UP(mode->clock * 24, 10); }
> +
> +/*
> + * link_min_data_rate - Data rate the link has to carry, in 10 kbit/s un=
its.
> + *
> + * do_modeset() drives every stream of an MST topology, so the link
> +carries all
> + * of them at once. Summing them is what tells a configuration that
> +cannot
> + * carry the whole payload apart from one that can, which a single
> +stream's
> + * requirement would let through and turn into a false link training fai=
lure.
> + */
> +static int link_min_data_rate(data_t *data, bool mst) {
> +	igt_output_t *outputs[IGT_MAX_PIPES];
> +	int count =3D 0;
> +	int rate =3D 0;
> +	int i;
> +
> +	if (mst) {
> +		igt_assert_f(igt_find_all_mst_output_in_topology(data-
> >drm_fd,
> +								 &data-
> >display, data->output,
> +								 outputs,
> &count) =3D=3D 0,
> +								 "Unable to
> find MST outputs\n");
> +	} else {
> +		outputs[0] =3D data->output;
> +		count =3D 1;
> +	}
> +
> +	for (i =3D 0; i < count; i++)
> +		rate +=3D mode_data_rate(igt_output_get_mode(outputs[i]));
> +
> +	return rate;
> +}
> +
>  /*
>   * assert_link_recovery_idle - Let the driver's link recovery reach a ve=
rdict
>   * and check it had nothing to recover.
> @@ -160,6 +260,8 @@ static void train_link_config(data_t *data, bool mst,
>  		 igt_output_name(data->output), config->lane_count,
>  		 config->link_rate);
>=20
> +	set_link_status_good(data, mst);
> +
>  	i915_dp_set_link_params(data->drm_fd, data->output, rate_str,
> lane_str);
>  	i915_dp_force_link_retrain(data->drm_fd, data->output,
> RETRAIN_COUNT);
>  	igt_assert_eq(check_condition_with_timeout(data->drm_fd, data-
> >output, @@ -171,6 +273,9 @@ static void train_link_config(data_t *data,
> bool mst,
>  	igt_info("Current link rate is %d\n", current_link_rate);
>  	igt_assert_f(current_link_rate =3D=3D config->link_rate,
>  		     "Link training did not succeed at the forced link rate.\n");
> +	igt_assert_f(i915_dp_get_current_lane_count(data->drm_fd, data-
> >output) =3D=3D
> +		     config->lane_count,
> +		     "Link training did not succeed at the forced lane count.\n");
>=20
>  	/*
>  	 * The link parameters read back above are the ones the driver asked
> @@ -280,14 +385,14 @@ static void do_modeset(data_t *data, bool mst)  }
>=20
>  /*
> - * run_link_rate_test - Main link training routine. Expects the MST vs. =
SST
> check
> - * to be done beforehand. Returns true if tested at the correct rate.
> + * setup_link - Bring the link up at the parameters the driver picks its=
elf.
> + *
> + * Runs per dynamic subtest rather than once per link: everything it
> + does can
> + * fail, and a failure in a igt_subtest_with_dynamic() container aborts
> + the
> + * whole test instead of yielding a dynamic subtest result.
>   */
> -static bool run_link_rate_test(data_t *data, bool mst, bool uhbr)
> +static void setup_link(data_t *data, bool mst)
>  {
> -	struct i915_dp_link_config config;
> -	bool is_uhbr_output;
> -
>  	igt_display_reset(&data->display);
>  	i915_dp_reset_link_params(data->drm_fd, data->output);
>  	do_modeset(data, mst);
> @@ -298,27 +403,63 @@ static bool run_link_rate_test(data_t *data, bool
> mst, bool uhbr)
>=20
> i915_dp_get_pending_retrain,
>  						   1.0, 20.0), 0);
>  	assert_link_status_good(data, mst);
> +}
> +
> +/*
> + * run_link_rate_test - Main link training routine. Expects the MST vs.
> +SST check
> + * to be done beforehand. Returns true if tested at the correct rate.
> + */
> +static bool run_link_rate_test(data_t *data, bool mst, bool uhbr) {
> +	struct i915_dp_link_config configs[MAX_LINK_CONFIGS];
> +	int num_configs, num_dynamics =3D 0;
> +	int i;
> +
> +	igt_require_f(i915_dp_has_allowed_link_configs_debugfs(data-
> >drm_fd,
> +							       data->output),
> +		      "Kernel has no intel_dp_allowed_link_configs debugfs\n");
> +
> +	/*
> +	 * Enumerate with the forced parameters reset, or the set being read is
> +	 * the forced one rather than the one the driver would pick from.
> +	 */
> +	i915_dp_reset_link_params(data->drm_fd, data->output);
> +	num_configs =3D i915_dp_get_allowed_link_configs(data->drm_fd, data-
> >output,
> +						       configs,
> ARRAY_SIZE(configs));
> +
> +	for (i =3D 0; i < num_configs; i++) {
> +		char name[64];
> +
> +		if (i915_dp_is_uhbr_rate(configs[i].link_rate) !=3D uhbr)
> +			continue;
> +
> +		snprintf(name, sizeof(name), "%s-%dx%d",
> +			 igt_output_name(data->output),
> +			 configs[i].lane_count, configs[i].link_rate);
> +
> +		num_dynamics++;
> +
> +		igt_dynamic(name) {
> +			setup_link(data, mst);
> +
> +			igt_require_f(link_config_data_rate(&configs[i], mst)
> >=3D
> +				      link_min_data_rate(data, mst),
> +				      "%d lanes, rate %d is too narrow for the
> mode\n",
> +				      configs[i].lane_count,
> +				      configs[i].link_rate);
> +
> +			train_link_config(data, mst, &configs[i]);
> +		}
>=20
> -	/* Read max_link_rate and max_lane_count */
> -	config.link_rate =3D i915_dp_get_max_link_rate(data->drm_fd, data-
> >output);
> -	config.lane_count =3D i915_dp_get_max_lane_count(data->drm_fd,
> data->output);
> -
> -	/* Check sink supports uhbr or not */
> -	is_uhbr_output =3D i915_dp_is_uhbr_rate(config.link_rate);
> -	if (uhbr !=3D is_uhbr_output) {
> -		igt_info("Test expects %s, but output %s is %s.\n",
> -			 uhbr ? "UHBR" : "NON-UHBR",
> -			 data->output->name,
> -			 is_uhbr_output ? "UHBR" : "NON-UHBR");
> -		igt_info("----------------------------------------------------\n");
> -		return false;
> +		i915_dp_reset_link_params(data->drm_fd, data->output);
setup_link()'s own i915_dp_reset_link_params() already resets before the ne=
xt config forces its value, correctly scoped inside igt_dynamic(). This cal=
l sits outside that boundary, so if i915_dp_reset_link_params() ever assert=
s here (e.g. sink disconnect), it aborts the whole igt_subtest_with_dynamic=
() container instead of just this dynamic subsubtest. Suggest dropping it -=
 the exit handler already covers resetting the last config's forced state.
Thanks,
Sowmiya S.
>  	}
>=20
> -	/* Force retrain at max link params */
> -	train_link_config(data, mst, &config);
> +	if (!num_dynamics)
> +		igt_info("Output %s allows no %sUHBR link config\n",
> +			 igt_output_name(data->output), uhbr ? "" : "non-");
>=20
>  	igt_info("----------------------------------------------------\n");
> -	return true;
> +	return num_dynamics > 0;
>  }
>=20
>  /*
> @@ -386,7 +527,7 @@ int igt_main()
>  	}
>=20
>  	igt_describe("Test we can drive UHBR rates over SST");
> -	igt_subtest("uhbr-sst") {
> +	igt_subtest_with_dynamic("uhbr-sst") {
>  		igt_require_f(intel_display_ver(data.devid) > 13,
>  			      "UHBR not supported on platform\n");
>  		igt_require_f(test_link_rate(&data, false, true), @@ -394,7
> +535,7 @@ int igt_main()
>  	}
>=20
>  	igt_describe("Test we can drive UHBR rates over MST");
> -	igt_subtest("uhbr-mst") {
> +	igt_subtest_with_dynamic("uhbr-mst") {
>                  igt_require_f(intel_display_ver(data.devid) > 13,
>                                "UHBR not supported on platform\n");
>  		igt_require_f(test_link_rate(&data, true, true), @@ -402,13
> +543,13 @@ int igt_main()
>  	}
>=20
>  	igt_describe("Test we can drive NON-UHBR rates over SST");
> -	igt_subtest("non-uhbr-sst") {
> +	igt_subtest_with_dynamic("non-uhbr-sst") {
>  		igt_require_f(test_link_rate(&data, false, false),
>  			      "Didn't find any SST output with NON-UHBR
> rates.\n");
>  	}
>=20
>  	igt_describe("Test we can drive NON-UHBR rates over MST");
> -	igt_subtest("non-uhbr-mst") {
> +	igt_subtest_with_dynamic("non-uhbr-mst") {
>  		igt_require_f(test_link_rate(&data, true, false),
>  			      "Didn't find any MST output with NON-UHBR
> rates.\n");
>  	}
> --
> 2.25.1

