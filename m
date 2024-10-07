Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F225CFB43C
	for <igt-dev@archiver.kernel.org>; Mon,  7 Oct 2024 17:31:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A7510E213;
	Mon,  7 Oct 2024 17:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eggtvwua";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB6710E3EC
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Oct 2024 17:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728322285; x=1759858285;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=60rhNCrlo0zPEmGjsd3CErzOSxSLbdyccW5GWFQgGIs=;
 b=eggtvwuasjxlipSAOr+rdThAlIVQxHB3qE5qidXcBFbN0+lZ/+DpsB9T
 BkzYNSGOYHxEfIKAFU6Xfk3fU5HAknJl6DX//u29ry4K7YScNPwiRuqKt
 COwTEP7gAwqa433H8k0c27d/DJZcqKzFpq/lEJRmSoccVSKd2x5JkQHo6
 J/40xuPXKB14AhNQKjKsZ2OXoZSZKUjExf/Vu3nw9YCySY0cv4jKbmmnN
 +dDUiriKFLx5sQbaK+KhtWQ3pQYu3U3r/gBqKfL/uV9WlsRIkUkKRWfPy
 WmCjVLg/4WQ9vWKDf3vycZb8yuj9EqUzagOG8ok3kOHhfRjYU5mAMXxC1 g==;
X-CSE-ConnectionGUID: ZWUJeWpkQCyCWezbwbau0w==
X-CSE-MsgGUID: p6QxXCz3Q2ae4TS7vw9f4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="45010783"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="45010783"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 10:31:24 -0700
X-CSE-ConnectionGUID: gT+5IubIQ4KHO+HiZWin9Q==
X-CSE-MsgGUID: d3gygpMgQkuL1Z1S82aK5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="98872739"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 10:31:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 10:31:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 10:31:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 10:31:23 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 10:31:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rF1qtnPfAcrq6Mcv2ULDkCFPG1RR16XJ+oqq+mSh1gKrWN+BV64TE9hYRrx+OrMSdu3MUdGraKAyfdmxJ7bZR3IKb7bwqVzOK4GHWUihDqg4QKj4xq5MaXqlviDzNTEXNbaXGE2bgY9tUV/mHmUqB34EYIX0ULhX1s233vvGCOILfXMaOMj04tuvqf/WzPcwZTfspkBwLPKipphgDq+dGTHYY0LVtEa9DFur5yfAjvUG+WvKb3MxHGon5qJCcqTHns8vpJh0RnsGCMe3lXAeBrrddMOML5kX36Dv9t9Hu+4UmauJPSt8zGPHqb1Ewm7PNheQLJWctgIfY7DmzwlfaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ksRVZ3Jj4GLyW+3QPDUPpfeh0PXRMKo6Ese67p8yx8=;
 b=N0J0RY9UCwQaRuTreGEk3MlUDkMvy2L1ujd6LGezkUsxE5GsDlVFfSimZLFdaR915sh7Dw18knrM6PW3FCzIw0nt0KohuwE2l6PmZ5Qw6HaJcnwb8VAj+zNDRkYkPAxFdEjV/0liFbHkLhXwVOqGNYyd4qld4cWOomJbVtQDsAO9DveFBrBG5P/Ao00H1MvBM1mY6hOjWRt7T34hzlMMS16g+eO+HZ5RO8Xc9FjPOC9oL6eBQCp94LmY+Dc4MstyJfXVcZpDGW0VEM2UevpVJIkJL0S+oCv5lZZkl0zHx0OEJtll1FltC+iY+7HD/U3zYV5SMNtdhKD84Rds5E4rWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by SJ2PR11MB8514.namprd11.prod.outlook.com (2603:10b6:a03:56b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 17:31:19 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161%7]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 17:31:19 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>, "Poosa, Karthik"
 <karthik.poosa@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 1/2] Revert "tests/intel/xe_pm_residency: Add an
 assertion on MI_STORE execution time"
Thread-Topic: [PATCH i-g-t 1/2] Revert "tests/intel/xe_pm_residency: Add an
 assertion on MI_STORE execution time"
Thread-Index: AQHbGNseKX84anAtJESiyl3tya56xbJ7i46g
Date: Mon, 7 Oct 2024 17:31:19 +0000
Message-ID: <BL1PR11MB5445C79B8D45726D24EB743EE57D2@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20241007172356.1747943-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241007172356.1747943-1-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5445:EE_|SJ2PR11MB8514:EE_
x-ms-office365-filtering-correlation-id: 2cd6c0c1-c93f-4707-c369-08dce6f5db1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?FuMfJIqkY/oxjs3W42GIPYmkz4Z6+ef/XWTeMWGlhzVMZBIub+ao+1/138v6?=
 =?us-ascii?Q?a6qs3rVKEof48vuVGS3jbkFslTAWLsLKBP04O9EEMkJIiDPBERm2pK6efmvJ?=
 =?us-ascii?Q?aoZYS2i+Z1PwmX85xR44xyPZ9xExUwZGGtrtRKK2dVnPbiaHiXm4ML2k2wzm?=
 =?us-ascii?Q?4bIBY+gYM5XSciUYWH6DTHsVZhNukBLO++LBOwL1z1u1borSTvUj4rV6I5zk?=
 =?us-ascii?Q?vaLmIIUInzzdCgVOfto2V6uvw5dywlJBxt9xeNYNwOxOc2gKS6nIdFpE+gFU?=
 =?us-ascii?Q?kuOt3rCCVuXIV/fLVTXdsWXsfO5Pn1W2Ul2uYlA3OE8ARkFQzjwlJLPc8Tk0?=
 =?us-ascii?Q?ib5aj9h6ZepOEPl33m2WyobPGJtnJNGocB93pPDeHS8rG/mvT3SJaWu773R5?=
 =?us-ascii?Q?WMmOZQplHo/HcASGAuN4Xq5FbjgWi9SxbNVuxMP8aSMo1dMwZdVyXd3xjcQi?=
 =?us-ascii?Q?A8GPPIAy35t/34QAojs9RnYtFO7rfQr3X6OAGpvsjFW2wv/OQOikUVFGPPz4?=
 =?us-ascii?Q?YyRTEOcXEjFDVIputmQ3qiqDnzFBMDBJjepKy7GL5YxaaDYZOaKvLTgVdvMM?=
 =?us-ascii?Q?pQnqo4WIqOIW8OSRvza2rsC0GW2adQkfxvW016tj59ItHeNjs3tCj3UCXoAv?=
 =?us-ascii?Q?k07JqvRoYYd2r/lhTZucvnlJarlTYfIXUq2CXpQIfGR+68oGG5PiwFyyb8wu?=
 =?us-ascii?Q?OFGzxL/Mpi5ejXPEPPDIY0l7YnNZyj9hPbBpM4O9BK3yxxxqtjt2ZmDaYODc?=
 =?us-ascii?Q?Kd1mlQILCVrapUA/Ea2nr5wDgaKnbfHR9z2HcY85/T0XIzNke+s5tLi7Era3?=
 =?us-ascii?Q?kdYPKi9KYSookaZbmyqeVu+N7V63p8X/gnZHJ97Mwhxbv+Nx40Cy9L0pL1Ld?=
 =?us-ascii?Q?J9Uapf9d2zLeKvvJTaO1yFTp4xwe9DpBKxu5PEFbrMRDDkQV80RY6XGFyqgX?=
 =?us-ascii?Q?+j2F5YBgbCDkv2cBvE1Qm71wVjZi1w/aJ7fV0yePuL9+EdF8LTszoopkXyO+?=
 =?us-ascii?Q?9TmXJu65M5fdP/njA1H5H8V0svcfVEcV2s2tcHwWKBVpwMkGgB3VTMQDdArC?=
 =?us-ascii?Q?6elYZJIqQDIVkmfYXAJKzEPtXI4+O4HcDHq2wfQUczhhRVEfteD+tkNTMBiL?=
 =?us-ascii?Q?sOaWpsVHEugjbRA6spowmxf0IRJZFJgq3veBGT6tfNmnc46SztAjv2qKAyI2?=
 =?us-ascii?Q?b/CrOSzzPd9FWAxcJ+2BsBvH16fhrHpFsJ3ia+CA5io8qgnrZuxitTw2DEjA?=
 =?us-ascii?Q?+7YhWeAj/lps8HsuROU4sK+0mikXJSm83pTxFSswPVMEVhfOSXnHmDkqMk5Z?=
 =?us-ascii?Q?KMRe5tdor3V9l+BvDLXWBf6kyHrAObGFfBbznVOgr4Oyyg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OUPhgcioM1lErbdSKNR1hF58co3DqsGZ4OfdEIO89j8dTpXJ25KMs1bxTxCr?=
 =?us-ascii?Q?wx+gRhr2QB/lVjVlMof2/AgFTl0R69aW/3td2/ZKqj70eSxSXEcc6feFSVUK?=
 =?us-ascii?Q?yjdLPz/HXSXNeGudbjoUBIQZeOWqx7aljMHwvJH9pJmt6HTlvIEysTlFYbCg?=
 =?us-ascii?Q?nu60bTvuZ9Sjf2CaoPaxwa4uPj9QM2YG9AqOIDsvzxyiecmStqPT8l2pfx8S?=
 =?us-ascii?Q?iAhczRVM/pwwlCBSxd9R6y9ZuuOxWOMKMJENbQWdy6N/X5qA9DIUJ8jmE/rA?=
 =?us-ascii?Q?qGGjDZPAHaJU3ePZzJoJt5qwkc5VrmvdiXuGMUQTOBgfC2n8eXzFklO2cEa/?=
 =?us-ascii?Q?U4XMyMdYQTIePZKpwfhCwVivL1i8G/SuH4DGWYjsdtgXPT4qNovZ4wIzbBAd?=
 =?us-ascii?Q?Pj50a7lVMXIrJe2K4CL4oB6To7BOZZYP/oNr3gijSuQ1HIce5zQlqPD2XbQb?=
 =?us-ascii?Q?tFUyRcGhGdN1Dv93QhnXLDJwLrimHJjjiNQ67Uj0Dbpv1QY/PiwuTcfbdAFI?=
 =?us-ascii?Q?ObOSvMeHTxoYBglZ+3+4lzAs1Y1g0hGclKzY0HFcMXpKhbkGR4pcmQUFHVbo?=
 =?us-ascii?Q?4ZSAkNAMl88E6iq2Ejsis7iN7gRQpJwabfo42DLJdGbiZAg/HZ+d+juiY+BG?=
 =?us-ascii?Q?7MqFpIbzrTTnRdyNFFrjZGHw16DSRRwY7iYn3I1eLgd9y8PASNLKetkyuPXr?=
 =?us-ascii?Q?5lQ+V9K7uB4ygBQcP+DgZK4TZb7UQhhFtzZNPGEdf1GzHd42oXBm69MQRYMX?=
 =?us-ascii?Q?HpCQ7FHAOI4nkaKL2SpfEv36UilvELtMnkpXPDy5MgYs+RMPsuhYqziyfojs?=
 =?us-ascii?Q?ZTo0XsFsFsPDkdSaB6cvA9yTqLlt3L2sB90jvm7cJFEJGg6y8yNFqxOI2MvF?=
 =?us-ascii?Q?jemgBYKOwarjKdK39KwQMXgt2xrYqeEIMm8MMcEwCTZYS3NmU4s9GJd4UQP5?=
 =?us-ascii?Q?OLXWSKY3RBfDptFgbYhWj59mQlKv5vqr0c8qYGwrcH688YXE1B3rGmH/sEbf?=
 =?us-ascii?Q?d/5i+TunnelQJAdxrt2XCjXNQ3N/0MW6esnkU2NVq/0jlpr1jYnOvMhlPSLe?=
 =?us-ascii?Q?GXODPI5ZvjzcGwWM3E96Te5jnA8E3h8VFL49Xy9ITHQ8WThCi2aCvNEo1QoY?=
 =?us-ascii?Q?glxlxO5meS7M1Xx0o2Khmc2o8AAXodfydmk9gIt7xpaNrvmihAifoQicRmv9?=
 =?us-ascii?Q?ZLU4lEMZAY3Dq7eBBCM60VlWLqmHXe9TO5Kdt+W8685uYxsIC7HWwki164Ib?=
 =?us-ascii?Q?ERp4GXAu1JwYOhSD540H7PcvhfebASmfxVZ2KLv5qQdY1hCNX1ZQrQvFnaU5?=
 =?us-ascii?Q?TamuqCsaUtEzkC5yelV5wpT2EAaPQQZPS7+DQ0GSGzlzGlpZHimaVylSeh/B?=
 =?us-ascii?Q?HYLr3YV9fK/xRbUz+/OIqB6jtqu8BFQS3gw5Xv4AhhjzuUpOqnRAWFdfZa99?=
 =?us-ascii?Q?mwCcqR1kAKaSaGKQ4ysjRJNTyfxivB9UQnTM2G/fGJ3+c4LP3a7zu5yMvYBH?=
 =?us-ascii?Q?HveP+yJnkpoDwSincpa5VJ7HGo2kT3lYV9SvIFWpBVnf9/UBG/QjvF+wSCzN?=
 =?us-ascii?Q?M/8o0DNfK5M1q1uqg4vq3AWC8H/Nas1CWF8R+8Vz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd6c0c1-c93f-4707-c369-08dce6f5db1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2024 17:31:19.6950 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m8waOESIYEthgqH+Q7uTyrFeZAfQC5jchXXlobCwVtOLG1wvjn/iU/8SgeGQpoPz6KVpIAAh9imrfhjVW7AJS4UDCJIBucBQIBhNocpzggw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8514
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Himal Pr=
asad Ghimiray
Sent: Monday, October 7, 2024 10:24 AM
To: igt-dev@lists.freedesktop.org
Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost, Matthe=
w <matthew.brost@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>; Taur=
o, Riana <riana.tauro@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com=
>; Poosa, Karthik <karthik.poosa@intel.com>
Subject: [PATCH i-g-t 1/2] Revert "tests/intel/xe_pm_residency: Add an asse=
rtion on MI_STORE execution time"
>=20
> The reported time does not reflect the completion time of
> MI_STORE_DWORD; instead, it accounts for the delay in the scheduler.
> Therefore, it represents the time taken between xe_exec and
> syncobj_wait.
>=20
> This reverts commit 92825ed72be61c5419d95db944fef1c9dda2215a.
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Karthik Poosa <karthik.poosa@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Seems good.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  tests/intel/xe_pm_residency.c | 9 ---------
>  1 file changed, 9 deletions(-)
>=20
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.=
c
> index 772fe9b57..f4d05889c 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -144,15 +144,6 @@ static void exec_load(int fd, struct drm_xe_engine_c=
lass_instance *hwe, unsigned
>  			  1e-3 * submit,
>  			  1e-3 * (elapsed - submit));
> =20
> -		/*
> -		 * MI_STORE_DWORD generally completes within couple of ms.
> -		 * Assert if it takes more than 1.2 seconds, as it will cause
> -		 * IGT test to timeout due to sleep of 120 seconds which is
> -		 * the current per test timeout. Currently there is no way to
> -		 * read this timeout from IGT test.
> -		 */
> -		igt_assert((uint64_t)elapsed < (uint64_t)(1.2 * NSEC_PER_SEC));
> -
>  		syncobj_reset(fd, &syncobj, 1);
> =20
>  		/*
> --=20
> 2.34.1
>=20
>=20
