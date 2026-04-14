Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE53F9D0CA
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 12:26:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E7210E5E3;
	Tue, 14 Apr 2026 12:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YFE4E7pE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3672E10E5E0
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 12:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776169556; x=1807705556;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yrQ3VR2I0uLgVyurtgXWHJbYC7JZ2saqRF0jyfmxFX8=;
 b=YFE4E7pET3qvIbytb7gzqe0NDiE4GtLEedZt2JB3kFDCs6GNbkdfuJv/
 zwzNhvSxCZehH/gZEWNzGr+he8KqXySjBxJEDdiCW8HPtULYBXGf8MGEe
 9ccLym1MVz1B9iuR0bAw6s/zQv93UbnpAV1XCg+XdpZLN/fG3d8JvtEJX
 2ADU3755ZRU7OIUHvCKlhkb+J4Or9zSUvsZx5PPY3gjk0jO/i+066xtpL
 /m9qUs027l8UYy5GPWV5Jgg87KRwhOSyXBRXtuEvJPkX1iVBXSl1A+enb
 b5HDwDDLfUPyrLi6Pd0LNnT/HRbUwmGulAeIXSBu9RNhpDnIMwSQAQu+C w==;
X-CSE-ConnectionGUID: vrQrlNtNRdqdFehCAz9u/w==
X-CSE-MsgGUID: bjgP8dfSSM6BKE3ZXoB97A==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77005871"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77005871"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 05:25:55 -0700
X-CSE-ConnectionGUID: B+65fR3VTxetTr0kJaSGbA==
X-CSE-MsgGUID: NYN70S2bTDKqf12EdqYkaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="229951737"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 05:25:55 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 05:25:54 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 05:25:54 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 05:25:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhznLkEh48yU6/dKlPIyQ4iEjE83dEsZO7ZMX2mcj2SQVdCJGlyA+gLVUtGfpzIO1CJkAq/wHcpIs3CxJkoVbQPvna5t2273KuKabc5HbB7dd/OtTi1La1a7WDP48aL0jJmDQ5awLelRwOXVLj+TKXH95NgkrLBQkw+LRrwk1ur4Ze1HPhvrFAMJwyvVRazAjvAzx8AYdYIXKwW2d/XFyDJjh5Xybqj6NtX2gp8RWUZKy2yVgZXhSyDrwhE3R0GsqDmGrFZWGbqw8X7Ibbiu/Z/UxB5Y7nAVZ3OZrJJlI1oeAY6PlGByiulPmARkZR/DQdcl9Lo/fwx2eCk78746gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LB4xqqoOmvKV82/zmWqY488Z8MEOqP3WgdZnqwCx2I=;
 b=TaTyCnsjMT/8XpRcEmjl5bHBEC7xkkfZEn0sNNx+jVjSCsd3+iT4kmwNWhyLWyhGA6/t6VT0rWLznDpnBlOcllZmYaUACOEHd5srlop1APE9NxihLQ13VK/LvJGdmx8F8KYcpmCw5khReGLag9TerRZr3/nnGE0d8DBwB+tFBXqDtoaLIe0IK+uTSWjHbTTo/Lp8GuqzTFNtJK0ZzLHXZQcIWPoQM7ZVaZRhu+Yw8IzKV2Wo3FPLxTH6u+JQAYommv8DvzR1PjeG54QHYrSOotvEafSSHBrAwBSQ5G78NpXY0RcBwMTyIZdiiFX4qn6bO+PnCsPpCzF9EH8vTroFCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9304.namprd11.prod.outlook.com (2603:10b6:208:57d::5)
 by SN7PR11MB7567.namprd11.prod.outlook.com (2603:10b6:806:328::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 14 Apr
 2026 12:25:51 +0000
Received: from IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::6349:cd26:d23c:4ece]) by IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::6349:cd26:d23c:4ece%4]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 12:25:50 +0000
From: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Adam
 Miszczak" <adam.miszczak@linux.intel.com>, "Laguna, Lukasz"
 <lukasz.laguna@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>, "Piecielska, Katarzyna"
 <katarzyna.piecielska@intel.com>
Subject: RE: [PATCH i-g-t] intel-ci: Block SR-IOV tests on i915
Thread-Topic: [PATCH i-g-t] intel-ci: Block SR-IOV tests on i915
Thread-Index: AQHcyzBtTnfKNdu2+0y5myX9AE6YUrXc2b4AgAGdl3A=
Date: Tue, 14 Apr 2026 12:25:50 +0000
Message-ID: <IA3PR11MB93045415C58BDA22A3956416AC252@IA3PR11MB9304.namprd11.prod.outlook.com>
References: <20260413112013.102762-1-jakub1.kolakowski@intel.com>
 <adzSYHFIURjTxWzz@intel.com>
In-Reply-To: <adzSYHFIURjTxWzz@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9304:EE_|SN7PR11MB7567:EE_
x-ms-office365-filtering-correlation-id: debc4d29-87fd-4d11-8a35-08de9a20f71c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: FlmWLwAS0xYFfT9kgRvtBxiepZRZs6a4BM+mCtyMGqfoxToLHIfR6h1qIYiNnTlKy4Dam3us9qBeYn0u/q/hDyMTtJJMq2FHVfCkIoyrte16gzhFbG/yHREvfMeaVHu0LIzSkBCjuFfBcTf/InqBIyLyhRNl5pxztKw0G5IXL25PG/wU4+wdNnUlhcMavaVBIleXcSj0Tvz1vZ6n4koeglKkRu8N+Zo0fWDvtLbp6mlZ3wCYgRhTnb5UkF9bcDXSr7cDa0qYEGE3HRetN7BdBFYZbm7rzOQVC5z3qJD494tLgKv1rwtIw+c/2hU2NHLUfXksASHfE5+CWE00mIQ8haZ2e1zOVIjRoRNtBGHUM99qlryDjXCxO4M6pBtk2DFARCKVEHVZyGBnH9EEQj7lTm/T2MPdwI797NUkd6HIJbbM+B/asdP4j9xZFS9PIbQECOWK5fzCogliSUYe9I2HtlZjGM2QbUK//LBPogeCx90/8B+Ae8saAHeDhflmsGzN3XA73LOhx/1g9egMEd4C3gdQ0kPjdn5XiOuOQuXVfoBrkzUn+kERMaU8+A3diY/PCCb199zpgBYtIkmL5RhKDqTE6qFfKgVsH6+qyZrdfROOFh3AG3RJGufWjzV/5UHO/XCQo2j30UR0QDJOmRl2GxQKUT/e8M7Jx60IOUaazAnsW1UyFVKMy+fZ/AHcq0w2wbJDAdSt/p8ScJ0L51FKcVOB4Gy4Poz+/4nMCYejNQdct4YG4DEFywqrxOTbqMGq3YOx9BpO6VdNZSVbRnAfTeD55gqjw4FWFFoH7jClnaA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9304.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?XhMrQPY9j774fNh7w0GDS6jG/9kQ+0FGrBqCCF/8+mkHAGFnjXLqNQPG4P?=
 =?iso-8859-1?Q?APbJCO2jbTVF7+gRlqHz+N+tr1CQYxfaA2aCLfXE/mGXojhIRvpdNb7U1y?=
 =?iso-8859-1?Q?HDoIgWgCHnZMxUHfaKnMk9PW2NFUt+qfg5sh29dpBZ+66Pf2jaYRhc23LD?=
 =?iso-8859-1?Q?Q80xtZQQJMI6LZVeCvUeQm34jHZ/XVtdzz1gEJQNXoqwRi72HNcSYO+z/U?=
 =?iso-8859-1?Q?NEvXheKQlMiDEu/d06aInh7xWmyGhdYRFUzMeVm3ovHz+MSYNjUn6KcFFv?=
 =?iso-8859-1?Q?tZZPUunOUIGGRSHNOjMrQ/cJpQPGR1An1C1JH1vQhtnCJjGrFni/I4yr4D?=
 =?iso-8859-1?Q?0vVU9+ar7eeVbc9tfGuBAaxtBAoVQqrypjokuHnZuiCSq//KTOxNPY0e/3?=
 =?iso-8859-1?Q?lvAg08Ubhoy3tIbr2MMbwoJ1rFRKrcV/dVe9L5RRSmiWxTPyCHH5GKlVKf?=
 =?iso-8859-1?Q?T7gIpWxgc+XvkC8UbS053vDoiMTsOXnpkwXNXG0aLJ2BxGnvAiRhOn9C++?=
 =?iso-8859-1?Q?kQGprleRz6xn/kY/0gFN3ZoawcWHzCHIbHzQILnO04uOOEkfWPV/se5tdg?=
 =?iso-8859-1?Q?Zupy6EGmq35wiE2o6/iXHehKccEvfOEfCkdeRzTztvwFpwT3AaNlOQ3MOl?=
 =?iso-8859-1?Q?eNr9zn9bBJbPg6tF5UDJZGDLk1o7s7WxVHTwKYCrCbWQixnRDnHEG7z7q9?=
 =?iso-8859-1?Q?1yuCWqiebLNKy6kpPhs2wYOa6Hr3hsWGa4U2oIkoQWn1htedS2k97A/t3z?=
 =?iso-8859-1?Q?osjeL+CWSDb6kBuwUpdA3p7m1UvECjFQS2sPxHDQq20QsDcKGXiHgq3/II?=
 =?iso-8859-1?Q?YQC5AMRnmWtRnib9INBWxRHTLDanu9YgwZGqLhKGY/VxXQ2Vk8uZxciJ6e?=
 =?iso-8859-1?Q?rWPF7BnczfthY1QnEe5wrq0MgmKgCyc7UdCHjaFI5K2UvZegbsGSs9ddtV?=
 =?iso-8859-1?Q?T3x8lyddEDkOkpBnNLWUXOXpBEvhNDyFxjwzZpeaUAfRsWnIzl+o3bfige?=
 =?iso-8859-1?Q?hz2d2YmGmCox8qyNWI1YZbCW4cCCTWz2airYNPMIye+LKsAcT8MndrcOba?=
 =?iso-8859-1?Q?swFUFx5PZnLI6Nol+9LoHEsyJcauQZbbkgFyZmCcestVuF2eJ6gP61sLf2?=
 =?iso-8859-1?Q?md/STEW3Mi7A42CctPYYh6wdE9vKdKECTVBCtm8/iNn98r9y/2EipT6XCh?=
 =?iso-8859-1?Q?W1xIZDWmnOHtimlZSRlutHmuMDHpzlfPW9ujSaSICY+sNWlftdCU02WOA0?=
 =?iso-8859-1?Q?hzRqhvEMpqYGsmJuzOjXR+G5pVZXkSDTNWjT+0y69ynqc45n0ntASj1LU9?=
 =?iso-8859-1?Q?vWWiNOUx7rd7vj8Qm2r3hXOoONafLoblVWtC2buXoXRiRLGqNdUv+pETtG?=
 =?iso-8859-1?Q?kkXrxFE89j0WbsvTBzoj8IdzOTo6sRS7DgD9zFp0zZSC3620GJKOkNi4gz?=
 =?iso-8859-1?Q?nrdDji7h+PPAucxdpQdlw1VoeKZRzIqKlPuvkaMV5WzApre+fTkGfi5C2C?=
 =?iso-8859-1?Q?zVY7YKDtLvvwn9fBu8b4tY4b1XkxgxLLBWWVpvvDv5PjiSBrJJDjBHHbeq?=
 =?iso-8859-1?Q?/+8YBf0goX3H8SL97HoQ8H+ctvFZN4bT238TGIWgKi16xjsXERDS73Zroa?=
 =?iso-8859-1?Q?oNpW1ff4NzjKeyKNFWfgBLlG8IJmPdkuJXDIRT525jAroXY40hn5T7/nNj?=
 =?iso-8859-1?Q?qagYyuNamGNdpmHT75+oNBq9+8jhJ9F96IJjxIuxJLhYW+I8mdEvCsKS77?=
 =?iso-8859-1?Q?xUfS2v82N/xqmjw8f5qCnJCiOAhjnfJ5SdpfIvZbwGRvDwEV/++yGFhrdg?=
 =?iso-8859-1?Q?lrw6qHuJ1Q=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: pN3PqrlboEaB0eMYiIWPRR/vQO83uTuPLz+TpLBjm5jY71mfhJWvHb8JDNnzE2NLRQ5jcQgHGBDsZHwA/3Qvtp57vjsr1mny8IfyxLvM1qG8Kt1j+nM3diCpGAnKPYVuslgMQk3FKKwVWdpwNnBDARQqpb30QsCQorfiEBhaZLJ3zQwqNiqacig/v27YgT53WJ6Po6R8vRREXno/+0WZRYoBMV+9JdcVL+FhzPOBqvia3HY3YeoO2ttm+HocjzuLsrhC8kWwqamu8uEEJzSSsArGn1gv1xM5pQO7g/kA94ps+jaxHQiN5DMgnspcX8LkQk/37bK/XdCOaK0MV/oauA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: debc4d29-87fd-4d11-8a35-08de9a20f71c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 12:25:50.8337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oqib0fcss2Sa/79E4OZayvP6UR3avXXjdzfstaNcyzKBKsA8qzHOjLnGKiB3a3IFZqla8upF5d9QhpIfDkMXERDtHelPzlWh9DphnB7If9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7567
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

I did some checking and it appears that some platforms expose sriov capabil=
ity while others don't. On platforms that do not expose it we are getting a=
 skip. On those that do however, the prerequisite of checking for sysfs val=
ue of sriov_totalvfs is passing and test continues eventually failing on tr=
ying to enable VF(s).
I can prepare a patch with a fix for this situation in parallel to this.

Thanks,
Jakub

-----Original Message-----
From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>=20
Sent: Monday, April 13, 2026 1:24 PM
To: Kolakowski, Jakub1 <jakub1.kolakowski@intel.com>
Cc: igt-dev@lists.freedesktop.org; Adam Miszczak <adam.miszczak@linux.intel=
.com>; Laguna, Lukasz <lukasz.laguna@intel.com>; Marcin Bernatowicz <marcin=
.bernatowicz@linux.intel.com>; Piecielska, Katarzyna <katarzyna.piecielska@=
intel.com>
Subject: Re: [PATCH i-g-t] intel-ci: Block SR-IOV tests on i915

On Mon, Apr 13, 2026 at 11:20:13AM +0000, Jakub Kolakowski wrote:
> SR-IOV isn't supported on i915 - block SR-IOV tests from execution=20
> with
> i915 driver.

What is broken in the sriov tests that they fail on some platforms and skip=
 on others?

>=20
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> ---
>  tests/intel-ci/i915.blocklist.txt | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/tests/intel-ci/i915.blocklist.txt=20
> b/tests/intel-ci/i915.blocklist.txt
> index 1068e2e15..3a54853f1 100644
> --- a/tests/intel-ci/i915.blocklist.txt
> +++ b/tests/intel-ci/i915.blocklist.txt
> @@ -207,3 +207,7 @@ igt@kms_color_pipeline@plane-lut3d-green-only
>  igt@kms_frontbuffer_tracking@.*a(bgr|rgb)161616f.*
>  igt@kms_flip_scaled_crc@.*linear-reflect-x
>  ##################################################################
> +# SR-IOV: not supported in i915
> +##################################################################
> +igt@.*sriov.*
> +##################################################################
> --
> 2.43.0

--
Ville Syrj=E4l=E4
Intel
