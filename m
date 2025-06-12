Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF58C71136
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 07:52:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1064610E044;
	Thu, 12 Jun 2025 07:52:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n6se2F6d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DE610E044
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 07:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749714744; x=1781250744;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iowkQDaTojmrQkcFnFflMYnLXQpORcs9NgTR8xeuE/4=;
 b=n6se2F6dY8pg9smDXyf4O8ID7alcZTh5Z3/MykjpmhM5DMMOWBykr9gc
 sJaoDEbmE3pyPt3xbkrqGNzwpSiG9Zs1lucyJxUfmL4jkAIzBhhqIizoY
 vcTkyutJFArSsHwG/wzYs3zaHk0B+K9afOd0yD9277jxoH2RLTZAXCqzl
 6Dbct+XZr408szdWa4TkpJDzVTbSMtjhMSkMNOdr/mTp2myr7DFMcTw0X
 9eT+LfTts+DKjKbZ1eJMnoueptRskOTtDi+PgR0bq9LCdMK0RCafjNFUX
 4VyKeJ0Ai6ckhCrLVByjAfPaS8S3zI+lrcGGXQld4n03cUkkOpPWe6X4U w==;
X-CSE-ConnectionGUID: yVpybVk3QOmtHq4IMsqlgw==
X-CSE-MsgGUID: 3MvSNX8sSuOAp3WdvA7hqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="62918829"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="62918829"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 00:52:19 -0700
X-CSE-ConnectionGUID: 80RqC/68Q2mj3m9OyrI84A==
X-CSE-MsgGUID: oj+DLcbdQICTJkaCMZiNGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="178409951"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 00:52:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 00:52:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 00:52:18 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.79)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 00:52:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MdbMwpqe9+0xsayejbcvNXJE0/qeiWWnFCX95ON6UqfZDhqzssogvFKJGx0Rsq3SnK81wxmxOlp7IkTDft78Yi7VYcLji861WM0x8RKIFjlT0a8fBVbcc7h1pyqhqJa1lMgvJiawBt9Y8bM96ouGjkkiTWgZZQcPT6DGZV8IZpfNYEi5deXBJt822EXBduDto0OybAmGCqaXjY1fUxmO8HXmgBzptMZHuaxBsQjjxMR42gi+jfFPP+A9Vl8zqr2WvvQ9PaVy/dDFXwVLhD+nEk/JHLis23dbzkU6mGhD0yMfIv7r1aLryDdMT5uQln8y8qMCxcWqWoqhPlBOoDqWfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HReq5m4b5ZImzn8s3UY3AuPI8JlvyvXw8Trev/7dg08=;
 b=bgDq0gvX+kPJBkwTmnbhSByMqfXN6iwVo+sVynXKKFwizSwpiIRwjN/oK6+BOe/TGR5RjyVWiwfuVs5MoquqLo/uV3gDV4FCn+nwaTYQYFe/6paEa8FbOSkIQZzloJJmkPdcn+/pRiNwuVRF6dlgK974ZFLGJJtQs44trOT05O0fK6cEo/0MMdLBRx4eTy++4SQkEhN+wP4puYieBDEhOCmFi92UdIjHL/GeFLUWPad3AlpN3xVeI/Mc1Nps0jlSCpb1ml2Sy/ALBJPnolslIahXjhEHxbSW40+982VbQSDuWmU5hO/pu5MWbqFsU0+0rjfe4zRQha1y+OHJvzyAaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SJ2PR11MB8538.namprd11.prod.outlook.com (2603:10b6:a03:578::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Thu, 12 Jun
 2025 07:52:02 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8813.024; Thu, 12 Jun 2025
 07:52:02 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Harrison, John C" <john.c.harrison@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_fault_injection: Suppress Guc CT
 dumps during fault injection
Thread-Topic: [PATCH i-g-t] tests/intel/xe_fault_injection: Suppress Guc CT
 dumps during fault injection
Thread-Index: AQHb2hkl1fk5szUyIU2Wxeyx55an6rP8ieEAgAKfTdA=
Date: Thu, 12 Jun 2025 07:52:02 +0000
Message-ID: <LV3PR11MB869521C0BBF1A6299B302DD8F974A@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250610152151.4260-1-satyanarayana.k.v.p@intel.com>
 <CH0PR11MB544459718691875DC0A52B33E56AA@CH0PR11MB5444.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB544459718691875DC0A52B33E56AA@CH0PR11MB5444.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|SJ2PR11MB8538:EE_
x-ms-office365-filtering-correlation-id: 35463574-5030-4e2d-ba5d-08dda986047c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?o6c8znFUl3BP4929GeUKl2+TWVAEtGXAvtpO9ucrS6WHrbGbK6kckWC0t8iu?=
 =?us-ascii?Q?2Yk76lVt188pTxkQyR/mkP9zomgVhP9Cyfczo8az2rjIXVyEJaw08mqc3bf4?=
 =?us-ascii?Q?4M43dwGDaGi8HueZ9z1q6Y4BJ7VdDR0E/pQ1wuf7GY4IO3knnqr18tnCVNHx?=
 =?us-ascii?Q?aZhsFGsNW7s0WABEBYNmon9Ggchs727whUWOWypfhsUfzcpHvlY3a9SNTUuU?=
 =?us-ascii?Q?6libDITBchdPO5+kKBYbVtHNN+m2kckCiBxadPi47JsWVTMZoLZZ3kSS+S0f?=
 =?us-ascii?Q?89tq+Ck16tw4PuaRBm+xwDHXGdiGOyaD8X1QYG6JroW8YnxMkNxsgerXqkoG?=
 =?us-ascii?Q?Fd0kr2NOei+olXhCmqlL15W2IMFFHbm4Di9edEB6wWuKSYOhzlKOKRLRCUcR?=
 =?us-ascii?Q?Z5lo2aAAYbcxezacEX2BITdJ0+vUnnRifRdfdt/VFB7eqmg3H97PJCTnwTvx?=
 =?us-ascii?Q?qiOKOdMLlQKIjlWwKgjftGITv/JdGjC0pbYCPrTLkZVIRKkGqNytK19voAAf?=
 =?us-ascii?Q?wIRjnrz3UIFb5a8PSr+W2eyh/0sJEMYGJxNkk69NFvlUm7sAItJar4pk7v3o?=
 =?us-ascii?Q?U3KrDRTMbq56mHQlI764CR+Sf78Bln9d6wAdVZTSf+5JFxQIgceXwSKhGGY9?=
 =?us-ascii?Q?KdtTxUPs9n6Ex6e/mPyHir9muuPnosBNtKIeMXB32R5lNYlfWOeciPvMXmQ9?=
 =?us-ascii?Q?FL/xNwkV1wdhdySKVHCRBULjf4N0VwM+NfoMrXFsp8u3khqDjmOjVpHO+Fsq?=
 =?us-ascii?Q?N2eszsdoGuySSTxfk1aEzxKg2bknj7fUw9y/0R89bwvU+GH9ELotOvq1L6X7?=
 =?us-ascii?Q?7abm/wDWDRfaHCTzmS64diGFZcwas4qCU4oBFUactLya7D9TQAfQVA+p38uD?=
 =?us-ascii?Q?BOBg2laY3/1jDw1zlbEvY4Z46SedGnIpFt6G2NR4s/AbfYNIHm4+jyHrwFNY?=
 =?us-ascii?Q?ep/xUSg4lSkOjyc7zNKDPzFjE7/ewmtr344Z3icAwQPjxxMVOAtollxr2NT2?=
 =?us-ascii?Q?HK47GeuY7lHOpfHf9PVmg0W/oNcxnQKO+4uem1DLs7tAQQEQrFcGc6Ti0zfz?=
 =?us-ascii?Q?LfD1WK/n8KmsF/7QOk/UC+VzsyzAjuvfCqs/AXWK1Jrmb7R7qt556hIDeAVo?=
 =?us-ascii?Q?miBmfj/USG6Dt6X2jLXIl3BZqZEyzP9ZzximA3HbplFp6E02/kxks5C/DgWz?=
 =?us-ascii?Q?JxiQXuBUi9iTdKxOVzEk8ylwfwD/EDC7lJMYApzj0pvzQixc1hamE6Kv23gG?=
 =?us-ascii?Q?YaevrwuaogcuCjQq7Uj6HnGMJ83ELC5WsjMnm8/ZDTypZmEoGOOA6NztrW0w?=
 =?us-ascii?Q?kaiYCmOKLeXQjOx84n7coprIqMpDNDWKFjT/odv/K5Hg8ZDqd3juNty2Efk3?=
 =?us-ascii?Q?FLuDEGkiXOxFOpd8HZ6en0YQo2aPradNuLm04IoJ+ResL/yR/KFwLCx9UvOD?=
 =?us-ascii?Q?+y7HZYt0DbQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Qawx3OT9vlO7PPzPZ/DeBpcUiSu2RHOPeLLwimPIu2qSZ2Olcmt22SsMGHRT?=
 =?us-ascii?Q?gjlk/L92xxOeOLhkEfY7W6SwjPz6C4aA81gpyNzqKqZE7e4tJHL3wvdTJsUU?=
 =?us-ascii?Q?DoyfYr3jjFV/S7yehk7UUdXudEEbRvKJdB92J2SJFKAkIp2N6WwU7SnPlqgg?=
 =?us-ascii?Q?PS52lRougcHiWUDNwwPdzdQ72V68BycqVSFJinzWqMq1qovNGTQZiumQH+8E?=
 =?us-ascii?Q?Kvess+ujDTWKs4UH0VTllrX3DjbYdURFTljvINyok8BXXGQdcIOEWr3EZ3jX?=
 =?us-ascii?Q?Dm2GLij7XO0FZ9IK/hPJ8SqzInDl5sNL3JMmxewFuB0X9f4Yd7uICaqr9ZoP?=
 =?us-ascii?Q?Auz8vPU45r8wf+knWCz5Kbo6xKgdHXLlG0XnS6a8n7cmwJ9Y8cVv1EtT56bA?=
 =?us-ascii?Q?Qq+qv6ytPM+tXQPJdVaYLPSHTBcouS9iJNNgU0GpHrca9zdxs6Jvesznwuqg?=
 =?us-ascii?Q?j9RJIFNnES7NNwxepll++a2vyV9FgiQS8qcvW9s0JXvWCwYcAhyRrzObJiqN?=
 =?us-ascii?Q?3u8D2W/JF7zZdC1pqYI8Pxk/2ESwHRY7jCWMeJoBN3RcaQqvoluzwKf7vnDO?=
 =?us-ascii?Q?Iwxxm/ZcMbhOeuhMknfnkKb/aWujEV54H37GnY4KC7zMSqmYMKwag0sGGT7F?=
 =?us-ascii?Q?cXt8aZqNcvUj0nM4MRCVUmSgX6bzEaa3ry77pKdJD0HCZtUC2FIrtx/VLZZ9?=
 =?us-ascii?Q?DlvIfOduh7e+FX+vrAcRd8NpkYNuvmMr975PmB65JFkT6vCAaazDzYodwC3j?=
 =?us-ascii?Q?Q/L1P0F2TWAWcGzfdUwJgl0/71IgmrQHSix8ceBg2seIVqsilpBirTagiAk4?=
 =?us-ascii?Q?nptdO/Sg2ngdJBGS4NPhiLMpPtxYpyeEab7ykIbhdYJDA1EGysuojk0mChhl?=
 =?us-ascii?Q?pObgM4OJQc/r68B8SxDVborQJfj+CexrnRLfjG7d2n5zO5gC2fFKh9ELLJMz?=
 =?us-ascii?Q?m6+yrYykAtYz9D6BfayF1x5kDJGSJ+ZMWDUV6bXyNa7ZhKFxNF0oVmEsSILK?=
 =?us-ascii?Q?txstrlTGdy/6NtUf4PivAL05NmdmX5h8NqA2acPOaTy+IHzDikZpzmyGgB8T?=
 =?us-ascii?Q?tv+KiQqPRht8FSPAmFHSpXJsrsXj4eqei3ma7D0s8+Vygnb3MxyEVGFXclj6?=
 =?us-ascii?Q?7g07VA3TNDiVGuOAHDoGhVc7+FFAWpYTSuNi7qvVw6T60qHfPBTW7WUZ24f7?=
 =?us-ascii?Q?XImWRMW63H4Rl3qvTrRaDnpOPAHZrTp6iJAypyvMNJHBwFECrVdRVsrqMQ6f?=
 =?us-ascii?Q?rEH7Svc1TH9JlfpSxdYOpHjEPNomLVNNr8KrlaIPS+vCqJRRaePvQxbaAfrz?=
 =?us-ascii?Q?GtWrogunDfoUw2IAI/ySiZZ9MmYyn8qk71esvRdxnXrNJa0VCcNyXLE4QW3k?=
 =?us-ascii?Q?8y9HbH3trBSP+Bz3ilkA4dmebAqimvoNTYgYaA/7/XThcHCmpDVyA1s00+1m?=
 =?us-ascii?Q?nlqjkg/YseyUHpVOzOKozw5+aSfxqNN7s43krnhb6PFcX3Xd2tRolZClXe/K?=
 =?us-ascii?Q?WifHhkmgLiLLAK7cZ5N8qNWwKHu40vuWQlMxvy+24SzNvHa10kDTJG39UyUc?=
 =?us-ascii?Q?0kuuhGPJrS0QgnSe3UG0R4ZDFS72bOoqTN6/8FQnKSTdL5BzD8r+LbvEgdlb?=
 =?us-ascii?Q?PA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35463574-5030-4e2d-ba5d-08dda986047c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 07:52:02.2230 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DXFoJF4wGUVlhnaf5ueQ+Q7iynDEVLIeU71u5cqqCij6qQBES4X6PcLcALgwZuTWqnaDrZDsX9C3pzUixHoHZwEikSjode4t7SfTJagyZlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8538
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

Hi.
> -----Original Message-----
> From: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Sent: Tuesday, June 10, 2025 9:18 PM
> To: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: Harrison, John C <john.c.harrison@intel.com>; Dugast, Francois
> <francois.dugast@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Subject: RE: [PATCH i-g-t] tests/intel/xe_fault_injection: Suppress Guc C=
T
> dumps during fault injection
>=20
> -----Original Message-----
> From: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>
> Sent: Tuesday, June 10, 2025 8:22 AM
> To: igt-dev@lists.freedesktop.org
> Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Harrison, John =
C
> <john.c.harrison@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>=
;
> Dugast, Francois <francois.dugast@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_fault_injection: Suppress Guc CT du=
mps
> during fault injection
> >
> > When injecting fault to xe_guc_ct_send_recv() & xe_guc_mmio_send_recv()
> > functions, the CI test systems are going out of space and crashing. To
> > avoid this issue, a new helper function is created and when fault is in=
jected
> > into this xe_should_fail_ct_dead_capture() helper function, ct dead cap=
ture
> is
> > avoided which suppresses ct dumps in the log.
> >
> > Inject fault into xe_should_fail_ct_dead_capture() function along with
> > xe_guc_ct_send_recv() & xe_guc_mmio_send_recv() to suppress GUC ct
> dumps.
> >
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Suggested-by: John Harrison <John.C.Harrison@Intel.com>
> > Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > ---
> > Same as https://patchwork.freedesktop.org/series/148416/ which was
> > reverted due to change from XE was still in review.
> >
> > Test-with: 20250524144613.11970-1-satyanarayana.k.v.p@intel.com
> > ---
> >  tests/intel/xe_fault_injection.c | 28 ++++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >
> > diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_in=
jection.c
> > index 9fe6bfe35..bbc8e71d6 100644
> > --- a/tests/intel/xe_fault_injection.c
> > +++ b/tests/intel/xe_fault_injection.c
> > @@ -123,6 +123,22 @@ static void injection_list_add(const char
> function_name[])
> >  	close(dir);
> >  }
> >
> > +static void injection_list_append(const char function_name[])
> > +{
> > +	int dir, fd, ret;
> > +
> > +	dir =3D fail_function_open();
> > +	igt_assert_lte(0, dir);
> > +
> > +	fd =3D openat(dir, "inject", O_WRONLY | O_APPEND);
> > +	ret =3D write(fd, function_name, strlen(function_name));
>=20
> On one hand, we should probably guard against openat failing by
> implementing
> some error catching here, I.E.:
>=20
> """
> 	fd =3D openat(dir, "inject", O_WRONLY | O_APPEND);
> 	igt_assert_lte(0, fd);
> 	ret =3D write(fd, function_name, strlen(function_name));
> """
>=20
> On the other hand, if we fail to open the file with openat and attempt to=
 pass
> the broken fd to write, then the write function would end up failing inst=
ead,
> so we'd end up catching the error later in this function either way.  So,=
 I
> suppose it's not strictly necessary to implement a guard here, though I t=
hink
> it would be preferred for stylistic reasons.
>
Fixed in new version.=20
> > +
> > +	close(fd);
> > +	close(dir);
> > +
> > +	igt_assert_lte(0, ret);
> > +}
> > +
> >  static void injection_list_remove(const char function_name[])
> >  {
> >  	int dir;
> > @@ -202,6 +218,15 @@ static void set_retval(const char function_name[],
> long long retval)
> >  	close(dir);
> >  }
> >
> > +static void ignore_fail_dump_in_dmesg(const char function_name[])
> > +{
> > +	if (!strcmp(function_name, "xe_guc_ct_send_recv") ||
> > +	    !strcmp(function_name, "xe_guc_mmio_send_recv")) {
>=20
> I think this if statement can be shortened.  Try:
>=20
> """
> 	if (!strstr(function_name, "send_recv")) {
> 		injection_list_append("xe_is_injection_active");
> 		set_retval("xe_is_injection_active", INJECT_ERRNO);
> 	}
> """
>=20
Fixed in new version.
> > +		injection_list_append("xe_is_injection_active");
> > +		set_retval("xe_is_injection_active", INJECT_ERRNO);
> > +	}
> > +}
> > +
> >  /**
> >   * SUBTEST: inject-fault-probe-function-%s
> >   * Description: inject an error in the injectable function %arg[1] the=
n
> > @@ -236,6 +261,7 @@ inject_fault_probe(int fd, char pci_slot[], const c=
har
> function_name[])
> >
> >  	ignore_faults_in_dmesg(function_name);
> >  	injection_list_add(function_name);
> > +	ignore_fail_dump_in_dmesg(function_name);
> >  	set_retval(function_name, INJECT_ERRNO);
> >
> >  	igt_kmod_bind("xe", pci_slot);
> > @@ -273,6 +299,8 @@ static void probe_fail_guc(int fd, char pci_slot[],
> const char function_name[],
> >  	for (int i =3D iter_start; i < iter_end; i++) {
> >  		fault_params->space =3D i;
> >  		setup_injection_fault(fault_params);
> > +		/* Clear the injection list  */
> > +		injection_list_clear();
>=20
> Hmm... I think it might be better to perform a targeted clear, instead of=
 just
> wiping the list clean after each run.  To do this, maybe we can have
> ignore_fail_dump_in_dmesg return some value.  Perhaps:
>=20
> """
> static bool ignore_fail_dump_in_dmesg(const char function_name[])
> {
> 	return !strstr(function_name, "send_recv");
> }
> """
>=20
> Then, in inject_fault_probe:
>=20
> """
> static int
> inject_fault_probe(int fd, const char pci_slot[], const char function_nam=
e[])
> {
> 	int err =3D 0;
> 	bool ignore_fail_dump =3D
> ignore_fail_dump_in_dmesg(function_name);
> 	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
> 		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
>=20
> 	ignore_dmesg_errors_from_dut(pci_slot);
> 	injection_list_add(function_name);
> 	if (ignore_fail_dump) {
> 		injection_list_append("xe_is_injection_active");
> 		set_retval("xe_is_injection_active", INJECT_ERRNO);
> 	}
>=20
> 	set_retval(function_name, INJECT_ERRNO);
>=20
> 	igt_kmod_bind("xe", pci_slot);
>=20
> 	err =3D -errno;
> 	injection_list_remove(function_name);
> 	if (ignore_fail_dump)
> 		injection_list_remove("xe_is_injection_active");
>=20
> 	return err;
> }
> """
>=20
> We could alternatively keep the injection_list_append and set_retval as a=
 part
> of
> ignore_fail_dump_in_dmesg, and just check the return value at the end of =
the
> inject_fault_probe function when performing the injection_list_remove.  O=
r
> we
> can just keep it the way it is currently.  I'll leave that to your discre=
tion.
> -Jonathan Cavitt
Fixed in new version.
-Satya.
>=20
> >  		inject_fault_probe(fd, pci_slot, function_name);
> >  		igt_kmod_unbind("xe", pci_slot);
> >  	}
> > --
> > 2.43.0
> >
> >
