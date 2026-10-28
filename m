Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE4E606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 06:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oJbkMvUQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18D510F9CA;
	Wed, 28 Oct 2026 06:09:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC65A10F9CC
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 06:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793167710; x=1824703710;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Pt5JmKswa6xVmSe3FyNpsUVxc41IuDlJBA8Xpuiarrc=;
 b=oJbkMvUQ8qJ6PUQSfFNwx7yN74fhXY7rfY4O2ikCqO3GW01NyRhNYet8
 pgBVlhpl66Y1MKvb4/pE6V8D8apxgtLaeA9fBK//99EBuKqavNlh6HXCQ
 yQtSzIcv5WAU2NwIufwaCUEyTPntDBbA3GgQu7VVRg/VcPNj6G3eY7K+f
 magSAkS0DJlo+DUau9KMat99awzf4nRCeZYIDw2SKQ5d0di0V3Z2sVZK3
 H7Gb+hvSPZ0Ye6Bmq4cu5LK/PkYuTdPKtzURPNxxMLuze84zXEMCtZNGB
 iOTFaZOduVgw41xBuXf+mTIPTcNVWTiZD1Yi9K2Tz65tSAucs8ud5dosB g==;
X-CSE-ConnectionGUID: BvAXw/+LSIKzYnv5yyObSw==
X-CSE-MsgGUID: QmsOue5qSL29Swts/ejVoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1761999"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1761999"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 23:08:29 -0700
X-CSE-ConnectionGUID: pTEvCFPZSIiYPtrwuEWcDg==
X-CSE-MsgGUID: Jb7s1gmoT264qTyGTkK1fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4847413"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 23:08:29 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 27 Oct 2026 23:08:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 23:08:28 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 23:08:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SrIOgEsqSVMedY37fE/9vC+6VdKnAaIuOaVMX/Po5wG4p4TCGopKbiZ1+pLve2j9itt3CDrUjk30e9tSknfQC0kDWmO1oj6jnyD0XtNwE/Irk6RUxcuMbeoLbevzcyzzmWJrkffSzm5H6IrLCpaegWEJWLjO5+ZNQ/Gh+MGGJfYKiaNcdggshUPUTB3kHZUfAUyfuWiN8+NoIxyUHEH16S2IXUg5WD/xqnLBnbLJIbHx8r5sWBntqtvDIHJwa+8Bgfy6XBc7KWzIGqX5jL0fLbXNpLtndGqnKGJRetWg7Y/C6fp9EETa7WUgrne6wnYhEiShbKman4hBCmwsxFE2RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIFEnJLOc0TLZ4iYT5VrQlLxBru1tfB4wn5ugelr3Ts=;
 b=n8SkdEaJXzuPiO2EiFKygPJZrOntHyHQXoEpr5n3RwJnkkb+AovtTQIQ8sboH0zBwacIU9WrhZP9jSxilRiXZj+RLM36q18Y/6ODpAlP/KGWEumOahr1zTjX5p4KHtSlozV8snjq4S9LNxlbBxYwEBFv3SDcQF+dj/lqKZhSxCVi0Tvl6WcJr+C8WwArS+G+01vrcHX4PnYDMllAUi+Qt1DF2pPigKol9gqpH2uh9zDp3PKCt43FGmOjKQmBDEKGh53Z0Qs33MemeN75Q4yVbifwhhUv6commEZXIj02fQiVoSois2ZBAEdCfI8ZfJg085arb1EQBjLWJqkO5p0Dxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by IA3PPF7DA1589B2.namprd11.prod.outlook.com
 (2603:10b6:20f:fc04::c8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 06:08:27 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%6]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 06:08:26 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Thomas, Sobin" <sobin.thomas@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Sharma, Nishit" <nishit.sharma@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v7 2/5] tests/intel: Add random-size BO leak tests
Thread-Topic: [PATCH i-g-t v7 2/5] tests/intel: Add random-size BO leak tests
Thread-Index: AQHdYYNWtsTeAuyZIUiTGJFnzaaLercSgloQ
Date: Wed, 28 Oct 2026 06:08:26 +0000
Message-ID: <CH3PR11MB843493CF20EE41DD6F1697478D6F2@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20261021174032.18337-1-sobin.thomas@intel.com>
 <20261021174032.18337-3-sobin.thomas@intel.com>
In-Reply-To: <20261021174032.18337-3-sobin.thomas@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|IA3PPF7DA1589B2:EE_
x-ms-office365-filtering-correlation-id: 1921e840-f7bd-4e20-7ee6-08df34b9e19c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|38070700021|261026140227099003|4143699003|11063799006|261009223027099003|56012099006|261022105027099003|10067099003|261021121427099003|261022075727099003|18002099003|261026121527099003|22082099003;
x-microsoft-antispam-message-info: Y6sdRYQ22UwvuUNiP4sC2aCAk0U2xvuxQ9Oknz87K2WtTe5uB9lYDYTisG0+yABRk4bbhVzKeDvRoS1xQHTj9RyiW4/Ohd/Nz2l4cAaRWG/qIe5SUZi4ozF3UeTNu3LxbqC+VKF82X1stNE3bTfjaL8aTjJAET3p/vTO043spQ6pXoqIfw+xIrsKUqzUJLLU2sMRUJAXZyRRyE0in4KNeia2RsvzKU7MxpY2FTUO7tP8vnOujVie5IYO39zD3exjArPalsyL+T7r2gio4mJZaC+TGHbx150W9LM7PYAodmy63N5izq3AXesEzOC3SeThjSJOlcjcFGTtiOngRIhUE3efvh2wha20rczZnMgUlO63tjEwghWf8f6fBQMBaR+eCYR7bF910e4pFE+JlAA8VvXld/MVizpz4gb1vjBcDyfwuKMMGzHcl3xbNtE3EcGK7I+oLBJYFt/B+swQfzCExbIcUnfKlc9xMjCQRzKDVobRgF3um/wRx5Xc4pR+kx+TsV5YkxisXnTpN+KzBFmukT5Su4q1CF4GvjO8hOcfITghuXXcyO85reZH4do/APviRXI3XfZ/GsP4BTI/OGJAqOCtZBrpthdgwajiDjA1CmaQv0gFv7+1yfe+s7JrdEyexGUX/qZgfIGwx9kkZn0aEFrGKuoXSYAuY9xkqE36Cml3BUly8BREgeYANoO0jrS90zpGqVqISE23oT/J9JOzzAi8Nn64gwnZCvL2HMoNgeo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(261026140227099003)(4143699003)(11063799006)(261009223027099003)(56012099006)(261022105027099003)(10067099003)(261021121427099003)(261022075727099003)(18002099003)(261026121527099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?V5Uyg7ogHQQveUuty7Aiwd5ubIwRyGyRoBYCVHLurlmhicFbepRuDlzpOHcI?=
 =?us-ascii?Q?2C1qFhYAHRSWn2iEtZFGGq+qoz993Ymna0v+i0GLqL0Oum0xcOdRnwAav6Fz?=
 =?us-ascii?Q?ZGEcbrsgDo8Ob5nx7TpVUFgiHXLlHrhZ3loYpz6oqvYwErfZ8dq25spAMPCN?=
 =?us-ascii?Q?S6TDO7Xxwa9f4rLmfF4ecyenh3QvDgJlCbH0M8KKu5QKRd1IiOl66QxoNd3J?=
 =?us-ascii?Q?6WeDn/qRL43+1IvPs6Yz1GZXiN26QpzRuTfKNKBYvSYkfpMuzljfrPN0udRU?=
 =?us-ascii?Q?hB6sPgd8yQiiX5YnH7fGUuX3QyzhDfs9U8DeB5U9OBjzPT8iYuAZTCGD5X8E?=
 =?us-ascii?Q?xmBSyWCGudn0SleUA2k25ZD6ohPiwc2E/WuFFPE4w5XxKjLrISh6grzMx+4u?=
 =?us-ascii?Q?h2lOSZUZpu2ZtsA95as0H4n4EonOY2txd3trU3yWoDO19u1X0oYGz+m+ImoM?=
 =?us-ascii?Q?Y9tjMTGEJ8bLBDOLUTnKaZfYz7JLqW1Y/PUih4dioM2Z5vvwdicF5n69Jdcl?=
 =?us-ascii?Q?VCmuGbtF+EqupdP2LMoIETazO8TcXPj/dizPQAnp60nBh/JS3tKimIEeeTx3?=
 =?us-ascii?Q?V4AB/5HErguFfb4g6VwrBIbIhbaK/aETlihxuefwjidSnso+OfCOFvnEGb4m?=
 =?us-ascii?Q?6vFUIG+UZn6GEpw1FPcxCiild945WBtRx9OZEoSuvZ/F1ayzktN9YzlYD343?=
 =?us-ascii?Q?ihpz5LrtlAb0lotwtAx/hxVB2RPizqfdGZJFFdw8tTwcJzPb//WS/1kIOxES?=
 =?us-ascii?Q?NhungDqBU0OhJit/Mq8gyquqnHybl8iC5KI+32ERgmVzbu63ZrQYUApTSgmf?=
 =?us-ascii?Q?K/ltm3ircDirZQVK76SZqPF7z4e13b5FT8L01qmd0bxRKNe6norNfF6DAZs0?=
 =?us-ascii?Q?jSn9Bu66gCqAoLUCFYXklWsEoXTt0kejJ7npuXSR4u/xi6qmWI8IZ3bP4mtX?=
 =?us-ascii?Q?VC2MKj233MX7XxBuvM6dJAfxFLvoPudZgLQY1VcoZLrTDUpogdUsYDNGZK0d?=
 =?us-ascii?Q?vdlm79pCZTCjCtPTR2ZS4K53xiST4eaQAXiaE0bfmy0xryGexoZZmYptJivs?=
 =?us-ascii?Q?FrDfsjw/NDPMuvSrqywSRxHZRuJ8vFBSD7JjuUIDFoBPE8W/Fi9His76VEUH?=
 =?us-ascii?Q?F4wZqkIzJU3ZnaKEmm3qsyo1scnkKqaBYu/Yqpahzxf/+f389c5A9tGpRzt9?=
 =?us-ascii?Q?GUWcSTOGi+DhBqqAfULeTed86C2ATZTUclyb563PSfuA5rkL7D/pTZdSOcKi?=
 =?us-ascii?Q?RQ52OjDnf88rqDkfBxfG4gzyHd5fufeHQPsxwSwBRUsxJfRN/o4jWsxdQvDY?=
 =?us-ascii?Q?N6V9BBh+LFFWKn7BWQFuzXnNTh/4ab95rTK4+QK191+TUcsShGAp765rq0TB?=
 =?us-ascii?Q?vdoJjAWDLkZM+nuKnQx1sdYZjt+/VXVHRv00n+NfN7cKxmJXd8EOpb1X3Apz?=
 =?us-ascii?Q?BQeP9jkHT8AS9qveGEV7DqaMD7UC7/5EK0XL/1pVpEvR+agdtFEeD2LBBOFB?=
 =?us-ascii?Q?IHD0HemNHMLZ+S6rdBA4HUYBAO0ykpKFlLzHIIjDlzSQ83Rj54iJdUBBNscN?=
 =?us-ascii?Q?lpwymHYXuXVcriTjPOGwUwEDynHKU/P1odcygkF+zyL47v62K3ueDubAQ3/g?=
 =?us-ascii?Q?2wVaqMBDKYrzxkTeXEr9BPejsWN6AFI9iql1eNWsoLO8z8B5ttIm0yOQRmNm?=
 =?us-ascii?Q?G3CV4DkOB8Ai52XTRTryK8XEVPfV7xjb6eK9dJKPNqrEfy3rNCpV4ElVrPWk?=
 =?us-ascii?Q?jUfu3Mg5mygUiq7j4ZyBIBrm/LD11dI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: V5rS+GE7hq8HQJEFUdi1bmE3pwmsUns1R//w2WCWzX84zxLBxBaRMtKoY7IwOzyzlvLdEdohUjQQ0/cZw0XOFEfVy2GkA466l6pWeW9GEo6GxUUF1+doGykhu9wUbm88OEgwNtXVVFhlbi0lCBS9iOB59YK1byAUl9aalceccyf8y89xpK6XrH7bHsxTuV0RQnBtQybVcdddbDJhOumfhSCWsqDA7GWTuwFh8gWgbjuiWOoB/WmZM20kSetm01nTfyzSfbpRLqYCIMZAviFv1+rRXtfvFZXrxLTD81j3j7F/psZ4yn3D9RxlNOvt2ZCFJI9oUWnqXU+xQrIpIbjSXg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1921e840-f7bd-4e20-7ee6-08df34b9e19c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 06:08:26.8272 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LJowwqR42XLfHeih0wImNE90ljcGjZCiwVOfrmAU50eAMyq7gPaSI6eKNaniyjs5GW4GNJDkvJNjBhGIZew687xPUyAwHYlPrCjmS+56fJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PPF7DA1589B2
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



> -----Original Message-----
> From: Thomas, Sobin <sobin.thomas@intel.com>
> Sent: 21 October 2026 23:10
> To: igt-dev@lists.freedesktop.org; Sharma, Nishit <nishit.sharma@intel.co=
m>
> Cc: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Konieczny, Kamil <kamil.konieczny@intel.com>;
> Thomas, Sobin <sobin.thomas@intel.com>
> Subject: [PATCH i-g-t v7 2/5] tests/intel: Add random-size BO leak tests
>=20
> Add new RANDOM_SIZE subtests exercising randomly sized BO allocation This
> test excercises allocation, execution, validation and cleanup paths acros=
s a wider
> mix of BO size, helping to detect issues that may only appear with specif=
ic size
> combinations.
>=20
> Add the following subtests:
> - rand-sizes-10
> - rand-sizes-100
> - rand-sizes-100-unaligned
> - rand-sizes-evict
> - rand-sizes-leak-100
>=20
> v6:
> - Set LEAK_BO for rand-sizes-* so leak path is verified.(Priyanka)
> - Add rand-sizes-evict subtest which uses EVICT path ( Priyanka)
> - Drop unused pthread barrier parameter (Priyanka)
> v7:
> - Keep an explicit assertion for unhandled test types.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_bo_alloc.c | 120 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 120 insertions(+)
>=20
> diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c index
> 38d581d18..80b1ae887 100644
> --- a/tests/intel/xe_bo_alloc.c
> +++ b/tests/intel/xe_bo_alloc.c
> @@ -27,11 +27,32 @@
>  #include "xe_drm.h"
>  #define BO_BIND_BASE_ADDR	0x1a0000ull
>  #define SZ_4K_SHIFT	12
> +#define MAX_ALLOCATIONS 50000
>=20
>  /**
>   * SUBTEST: all-sizes-once
>   * Description: Test all BO allocations sizes in test table
>   * Test category: functionality test
> + *
> + * SUBTEST: rand-sizes-10
> + * Description: Test 10 random BO allocation sizes in test table
> + * Test category: functionality test
> + *
> + * SUBTEST: rand-sizes-100
> + * Description: Test 100 random BO allocation sizes in test table
> + * Test category: functionality test
> + *
> + * SUBTEST: rand-sizes-100-unaligned
> + * Description: Test 100 random BO allocation sizes, with bind address
> + not aligned to BO size
> + * Test category: functionality test
> + *
> + * SUBTEST: rand-sizes-leak-100
> + * Description: Allocate and retain 100 randomly sized BOs, then
> + validate their contents
> + * Test category: functionality test
> + *
> + * SUBTEST: rand-sizes-evict
> + * Description: Allocate and retain random-sized BOs until VRAM is
> + overcommitted, then validate them
> + * Test category: functionality test
>   */
>=20
>  #define N_ALLOC_SIZES	256
> @@ -44,6 +65,7 @@ static uint64_t *alloc_sizes;
>   */
>  enum test_type {
>  	TYPE_ALL_SIZES,
> +	TYPE_RANDOM_SIZE,
>  };
>=20
>  struct test_case {
> @@ -54,8 +76,14 @@ struct test_case {
>  	bool requires_evict_ram;
>  };
>=20
> +struct bo_group {
> +	struct bo_alloc *bos;
> +	int n_bos;
> +};
> +
>  #define LEAK_BINDING		(0x1 << 0)
>  #define LEAK_BO			(0x1 << 1)
> +#define EVICT			(0x1 << 2)
>  #define UNALIGNED		(0x1 << 3)
>=20
>  /*
> @@ -466,6 +494,85 @@ static struct bo_alloc *test_alloc_size(int fd, uint=
32_t
> vm, uint32_t q,
>  	return NULL;
>  }
>=20
> +static void validate_bo_leak(int fd, uint32_t vm, struct bo_alloc *bos,
> +			     int n_bos, uint32_t flags)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < n_bos; ++i)
> +		check_exec_data(bos[i].map, bos[i].bo_size >> SZ_4K_SHIFT);
> +
> +	/* Rebind to force migration back to VRAM, rechec */
> +	if (flags & EVICT) {
> +		igt_assert_eq(test_bind(fd, vm, bos, n_bos, flags), 0);
> +
> +		for (i =3D 0; i < n_bos; ++i)
> +			check_exec_data(bos[i].map, bos[i].bo_size >>
> SZ_4K_SHIFT);
> +
> +		test_unbind(fd, vm, bos, n_bos);
> +	}
> +
> +	for (i =3D 0; i < n_bos; ++i)
> +		bo_release(fd, &bos[i]);
> +}
> +
> +static void check_leak_multi_group(int fd, uint32_t vm, struct bo_group
> **groups,
> +				   int count, uint32_t flags)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < count; ++i) {
> +		if (!groups[i])
> +			continue;
> +
> +		validate_bo_leak(fd, vm, groups[i]->bos, groups[i]->n_bos, flags);
> +		free(groups[i]->bos);
> +		free(groups[i]);
> +	}
> +}
> +
> +static void alloc_rand_size_bos(int fd, struct drm_xe_engine_class_insta=
nce
> *hwe,
> +				int count, uint64_t vram_target, uint32_t flags) {
> +	struct bo_group **leaks =3D NULL;
> +	uint32_t vm, q;
> +	uint64_t vram_used =3D 0, bo_size;
> +	int i, max_batches =3D (count =3D=3D -1) ? MAX_ALLOCATIONS : count;
> +
> +	igt_assert(count > 0 || (flags & EVICT && flags & LEAK_BO));
> +	leaks =3D malloc(sizeof(*leaks) * max_batches);
> +	igt_assert(leaks);
> +
> +	vm =3D xe_vm_create(fd, 0, 0);
> +	q =3D xe_exec_queue_create(fd, vm, hwe, 0);
> +
> +	for (i =3D 0; i < count || vram_used < vram_target; ++i) {
> +		struct bo_alloc *bo;
> +
> +		bo_size =3D alloc_sizes[rand() % N_ALLOC_SIZES];
> +
> +		igt_assert(i < max_batches);
> +		bo =3D test_alloc_sizes(fd, vm, q, hwe->gt_id, &bo_size, 1, flags,
> BO_BIND_BASE_ADDR);
> +		if (bo) {
> +			leaks[i] =3D malloc(sizeof(*leaks[i]));
> +			igt_assert(leaks[i]);
> +
> +			leaks[i]->bos =3D bo;
> +			leaks[i]->n_bos =3D 1;
> +
> +			vram_used +=3D bo->bo_size;
> +		} else {
> +			leaks[i] =3D NULL;
> +		}
> +	}
> +
> +	check_leak_multi_group(fd, vm, leaks, i, flags);
> +
> +	xe_exec_queue_destroy(fd, q);
> +	xe_vm_destroy(fd, vm);
> +	free(leaks);
> +}
> +
>  static void all_sizes_once(int fd, struct drm_xe_engine_class_instance *=
hwe)  {
>  	uint32_t vm, q;
> @@ -487,6 +594,7 @@ static void run_gt_dynamic_subtests(int fd, const str=
uct
> test_case *t)
>  	uint16_t seen_gt[64];
>  	int n_seen =3D 0, j;
>  	bool dup;
> +	uint64_t vram_target;
>=20
>  	if (t->requires_evict_ram) {
>  		igt_require(xe_has_vram(fd));
> @@ -517,11 +625,18 @@ static void run_gt_dynamic_subtests(int fd, const
> struct test_case *t)
>  		igt_assert(n_seen < ARRAY_SIZE(seen_gt));
>  		seen_gt[n_seen++] =3D hwe->gt_id;
>=20
> +		/* 1.5x visible VRAM of this GT so EVICT exceeds capacity by half
> */
> +		vram_target =3D (t->flags & EVICT) ?
> +				xe_visible_vram_size(fd, hwe->gt_id) * 3 / 2 : 0;
> +
>  		igt_dynamic_f("gt%u", hwe->gt_id) {
>  			switch (t->type) {
>  			case TYPE_ALL_SIZES:
>  				all_sizes_once(fd, hwe);
>  				break;
> +			case TYPE_RANDOM_SIZE:
> +				alloc_rand_size_bos(fd, hwe, t->count,
> vram_target, t->flags);
> +				break;
>  			default:
>  				igt_assert_f(0, "Unhandled test type %d\n", t-
> >type);
>=20
> @@ -538,6 +653,11 @@ static void run_gt_dynamic_subtests(int fd, const st=
ruct
> test_case *t)
>=20
>  static const struct test_case test_matrix[] =3D {
>  	{ "all-sizes-once", 0, 0, TYPE_ALL_SIZES, false },
> +	{ "rand-sizes-10", 10, 0, TYPE_RANDOM_SIZE, false },
> +	{ "rand-sizes-100", 100, 0, TYPE_RANDOM_SIZE, false },
> +	{ "rand-sizes-100-unaligned", 100, UNALIGNED, TYPE_RANDOM_SIZE,
> false },
> +	{ "rand-sizes-leak-100", 100, LEAK_BO, TYPE_RANDOM_SIZE, false },
> +	{ "rand-sizes-evict", -1, LEAK_BO | EVICT, TYPE_RANDOM_SIZE, true },
>  };
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
>  int igt_main()
> --
> 2.55.0

