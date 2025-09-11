Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A655CAC58D
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 11:58:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5224C10EADA;
	Thu, 11 Sep 2025 11:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gm0OPLUG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094AD10EAF7
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Sep 2025 11:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757591936; x=1789127936;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FQKexC37lfM3wkbN22RnR2uTXSdXb4Zh51Qkv4hIpi4=;
 b=Gm0OPLUGeTUSD6QvtfZ4RapnugR7JaXf40WeewlpOJ9qQi3899HYSNdy
 mUf6M73JAg4z0bS3GpFq7+oE5SnhC0wfu7TMiApafXDKs1uk3LWF2EpEh
 mFOAkSZzSsNOkUS0d82TtolN387SKuuqISXAkkP0vV4i/LHHPklXBwdlN
 jHshlK+UkSxXd4KlWx1d92a+lZVVlrL/ppa0t7m1j+3KPSwXlrduLljZ3
 JPC6YdZ58Hv4OMIlppKK07QrQ+/NaRHxKk2PO+0nYf6KG1P4dwK9Up/we
 gb4jT0sNN9jDKCE0F+7zekMmcfLLWxdKhCER7um3Co2iIJDZXuGTE4ncR A==;
X-CSE-ConnectionGUID: tRKGCeUaQwynmxFz0I8JhQ==
X-CSE-MsgGUID: 9UFYNcDiTwW2GF9U4Ylflg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59153229"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="59153229"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 04:58:56 -0700
X-CSE-ConnectionGUID: MuJUFvg9TsOpBI2MVg5Wcg==
X-CSE-MsgGUID: A5QuqNN2RHeWZ44LaGDEAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="173742240"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 04:58:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 04:58:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 04:58:54 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 04:58:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGvX/tsgKU7WraK2CAksHB8AR30SYlAdYszoU7l8iqLVf8u0uF9nfU78aEHpCY8SgyoLO+IJBWGhczAbfIzUwmq1wRM4eaINlqCoT+a3wEaKkibSurQZigzFHsqgywNFHOIbtEvsvOtE5Sy+X+Kgz2zisWVXcLLx0scXod/FIyLtvbl3QEbcZn3bAUAFGYVoHY0mDXm9byvOAWGcganYrY22jYw9J4Sy9AalPdQGxc8GNBuohFXsev9h81WRGR81ppMDkYkM4x6JuEOk92DEJNleHdi/rf2/Fiv5Q4H5Dj1tPqyJRLp2z/y6AsEhCo0VF29WhgARiupUy3AnSVpyZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rizfFSGJxwEJlvpBfTpvIH6spes+OnlL7EnUS0U3A3E=;
 b=ac97nvTrqePnzfGEoEC1FZUicUID5pAX0yaMKU30eqIRPybThWvTYxhGpfGWy7vAvQeVpQ2Eq3fI2XL8ls1UfNtl9LaqXFQ2vuA+DFOWDZ6VuK70xSlCbpTwnH2LZUOxEvnpfmiM9G2Cczv+WiSJMxpbS7gyAMXvrS8r6wR19fbJvV8hSuquz0EKfemnbDSwiKta3NhrDu2fxHd020hlttzs8zufdOumX3TSgz5evYpQptYfLZ/RH96w2jgZqqddlpJq5x1NdefQL545SNjCMv7HnVVQfGwTIgTe+tF4UKIYFhlAz0y8wLImZxZzWet+qPpd0OEFr58db2VG3+mT3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF07B018B9F.namprd11.prod.outlook.com (2603:10b6:f:fc02::7)
 by SJ5PPFF6F855567.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::861) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 11:58:52 +0000
Received: from DS4PPF07B018B9F.namprd11.prod.outlook.com
 ([fe80::c61d:d689:b899:1e63]) by DS4PPF07B018B9F.namprd11.prod.outlook.com
 ([fe80::c61d:d689:b899:1e63%2]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 11:58:51 +0000
From: "Thomas, Sobin" <sobin.thomas@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Konieczny,
 Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH v3 i-g-t 1/1] tests/intel/xe_compute_preempt: Compute
 preemption check
Thread-Topic: [PATCH v3 i-g-t 1/1] tests/intel/xe_compute_preempt: Compute
 preemption check
Thread-Index: AQHcIncyyZTglkYQYUqpXGSIwcEoarSNi5CAgABS0yA=
Date: Thu, 11 Sep 2025 11:58:51 +0000
Message-ID: <DS4PPF07B018B9F10DD18ACECE4A5218B6C9409A@DS4PPF07B018B9F.namprd11.prod.outlook.com>
References: <20250910171959.1852534-1-sobin.thomas@intel.com>
 <20250910171959.1852534-2-sobin.thomas@intel.com>
 <CH3PR11MB843412041E1150999B18C36A8D09A@CH3PR11MB8434.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB843412041E1150999B18C36A8D09A@CH3PR11MB8434.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF07B018B9F:EE_|SJ5PPFF6F855567:EE_
x-ms-office365-filtering-correlation-id: 7f6d5c8f-992e-484a-fe59-08ddf12a9350
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?vpbaDMN0SV9zCNbW6oxwPt0CIYkfH+2JvOtkiVIFdjDbn0wcH9aGqEMcIVxG?=
 =?us-ascii?Q?yHg1oDL2czV4FI1lCpA/wpr1sgBHKjgNGF67BtMrFNkTOZ0F5ayKusGS5v8t?=
 =?us-ascii?Q?PJMUbZ8A1v11XTiF7gSzqYSAVMf2cPlqmKfjgMZXazj0AzlFPxZT3eKzF4ul?=
 =?us-ascii?Q?ayTHAoewEVCSIone5lpUZ0Fnq1Ac+nCu/a4mFbcFIMSynjMg6e722eqnGZFE?=
 =?us-ascii?Q?kdbL2ySzXUc2SqheKkfPsTCANdeJ8ylH18CFf0uir9CAMlqZT3zEq7quS3Gn?=
 =?us-ascii?Q?qNM6tpXUMcuNKxFOAMBrz+BrDCPsFAtEbm1O70WCmQW4NfLGYgPLkpsKLA9w?=
 =?us-ascii?Q?tda93imzjQexLE0lb5qz/UjPKlwqPENzJf3G1fy0E7xHPeTX9OGBxzS0AJRO?=
 =?us-ascii?Q?fH0ERbQSrvZuODT2JyzWD7IuSSyHkYDvcC2K8d0Xved/OpNmdnhrgZ5jP+XW?=
 =?us-ascii?Q?b62RawCGEH7a+AmJzsih45KLCmUNuAccLs/lKJ5lBdXHhzJyWpl0xwcT8329?=
 =?us-ascii?Q?/W9tIaM17hxVUNxLRMFTSHWHG/qQlrGnCffeRe1XtXK8J8j62R8O+NKTKbkO?=
 =?us-ascii?Q?AFL7aifh90tWBzZZhu+m5ArPefYnm3YqfXfVestrQWzOBE/F1djOIcn/NbX/?=
 =?us-ascii?Q?+jf8fHdIyWW9gScXcPIIvnnW3hpJekikqqpjEPEoA6d0TEduxIRsebzECksZ?=
 =?us-ascii?Q?Mj51ugIhY2jjrvd/ya1n8LG7I6vT2qoBzEvmu81t2X6KKWb7d99iPSwCGCEA?=
 =?us-ascii?Q?dym7pnH57pErshAnliMZ6rfyl8588VqfFvfS+k2mFK1FuTC8ImGKK905kMyl?=
 =?us-ascii?Q?W7+CH1pL45zN4AS4mrSGpOf2ofqsk4usRAO46ZnM2My9ogZQrFlk9VHxFRet?=
 =?us-ascii?Q?OSQ2bm+OQJDISPH+toa0Q7N8Y9pL23z5As+JVFPrGkLi1bG53XhTO6ffta5x?=
 =?us-ascii?Q?711QxEAQ22mkoyhjOHLMG2fi2NMMHmU0XprpQSUrhgRKEMLrPEWlHYMxIJbf?=
 =?us-ascii?Q?jrn/BwDQ3/0o8BUjE8Le2U+H2R7NUuZmzewz3SLbriUmianuGuzTS+OzM3x6?=
 =?us-ascii?Q?P7pHZX/DbkeB+wyd2j7dtt1YYxZZVB4PTmnoKihJIrwEqAn5WBUZHFVgyI0m?=
 =?us-ascii?Q?U3MqWgHykF1JxryGAHlo+H6SY2o+Yah03r9CgDSNo0LiQxzPRosoN/hNyAGq?=
 =?us-ascii?Q?bjCG/d/i9jQ2XGogGB9TawKTyvtzdI9xIvPI0V2csmfQCDfMlJn6WDDHWQX9?=
 =?us-ascii?Q?pk+0gnbCfVFKLMl+2A2c5xeTvC94Q7f+k1rY2I5OP+EGuF+pTbZHAziraxsS?=
 =?us-ascii?Q?P0AfjuuKmKOl67nBJdnJfWJnCw0JkZwOWS4MQAPKqSbHICI5cyq+P+x/VJ3L?=
 =?us-ascii?Q?bfR3aWpses6moJvweUV/h2V/NQxwFpsr9INSVj3NRHWktL8IEiNPJiKZSlZz?=
 =?us-ascii?Q?vvZflJhou58iWLMDA6ylvHx/EWfrVpU9orJSO9gjPD3k/4igjroSnKYpwNom?=
 =?us-ascii?Q?hWxj5EMP9ZySrEk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF07B018B9F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jOXyUHq6DtF07j+FTTiTJQaExHYXetCQpU9hX8KIbYeTXHnLx6/brXgAxd9r?=
 =?us-ascii?Q?1COGnA95yuJWOmUezy0+S7XTr7n0JjwWX1FwoDuXQGAJWt9NYR6IbPTxD9Oj?=
 =?us-ascii?Q?LuM38lgQ3QIdvoMYN5CAANYDXzT7Av4gsdOSss8ykbawRCUhBVRiUfIHSyFb?=
 =?us-ascii?Q?zbKBca2RNCSGdU8wiPM0BuZJ4Do2wUW/TbkNy5h117jZHVlHsABMJUqci0/k?=
 =?us-ascii?Q?KVcCo/IcRbV/mqpYbcShSbjxdA/5Ot0vPGWdU+MIKgChfFjbwJU9Wr8EJc26?=
 =?us-ascii?Q?9HLoJu4zVn6hDmDdVp1Z2s8efgWQPIzL/wDjE+2cjS20iPPuXETyN4BWGZfC?=
 =?us-ascii?Q?JysDfSOxggC2O/sptNRxz6/6Bk//6NeBe5CmjnyqYprHG3EScC7Y9MDPbV4a?=
 =?us-ascii?Q?6MUaaokeWJ4vpmYDSQpfF8f+0BWst6cTgGEdVmCEpgoou1D+vbvxlrPf36To?=
 =?us-ascii?Q?w6YBZuEPQ4UBV3KhBhmk4vykip/WBkGRzoH87NaGR7Vm09igCOA3Hp/RQ2YI?=
 =?us-ascii?Q?/5tN0Sq3teX6rRuEongUIfttGkWv4n66cPzg64yDdUvv48zVXBRAMfXdalof?=
 =?us-ascii?Q?GeFmdC9kIU+MPvDhIuMZ8mXuO7mtOorl9+4z/kJVOeEyT2/V2NWjQXxjjtHB?=
 =?us-ascii?Q?ypLr67RiX9XJdElKDAzkPBBnYNuh0Vg/1jdaWeIMnwdJuDBaaZ23Kq/M4zAq?=
 =?us-ascii?Q?fP1v1lJNJJWmJxS5Cw17mYSMky4S6CJfrU3AmRBGX6wBSXZvRglah7rhUFLk?=
 =?us-ascii?Q?7TW8cggZ+3IL0u3vTQPDc1Bb4fyzTEAvtyWj/Ho8Ia55MctpJr5BegbccRU7?=
 =?us-ascii?Q?M2pK98satFgLnByTlQxxXsON86dtANAmKXFV20m9VjxhFMOifQuFPKwRxcrr?=
 =?us-ascii?Q?81M2cxceZAJTpxjO6J7WVKui8Lyx0B95KEe1kyPpxVlbH74j4/G06VlGSbTW?=
 =?us-ascii?Q?msZ5OYo7+80ShBJtnYG8cynkUHbbL68CueyiPRij12myu4no/cbb2kZtrUbk?=
 =?us-ascii?Q?lNpatMl1lvZM+cHOgtzypfUhvUZRUFoTa+7yFbGea1cy+WvvB1H3fGXoMAKJ?=
 =?us-ascii?Q?iJIMSb/qZCC5O2L2ijpucHPYA/Asl9GQt1ipq2/P2jgtgO6mw13G8v5kxTGX?=
 =?us-ascii?Q?8nqRL9PCXksTz+igBpgwUWIukJ9EzJZshtSM8c6MSYZ/+sXuwjK5SjwC1G5m?=
 =?us-ascii?Q?oWedj8Q5oMzk++yyCWL9AC41ZQUp01tPTPwXYETOVGp6e/8tG83Fx+41NHDK?=
 =?us-ascii?Q?1c4hWaGaBB0PQiF5zGy2hrJBdFb7emL+yKBc/1Dc7vX5yJuiSrVnQD1WHtpq?=
 =?us-ascii?Q?YB71NLu4rVkjNK2pJOAhyuc83rL5jR0yf8DD1SvWryjjVkC/wCRgCuaeVsFE?=
 =?us-ascii?Q?gBoUYrbr/KMb2N3Xre0WVmnPmPeOfdQV4mziR4SQIlGXklttt7YpPKDsuJZR?=
 =?us-ascii?Q?T4WpOih7f+NOPHflYYbvgqxlO3nqaliluAfv1iLjF39FF55efg9y+ff/ixLI?=
 =?us-ascii?Q?aJflq9z1rLSsknLGOpbYjHl4raQsmoLxV/sRIPtvwzb/zE3Rbb89Gcu7J9Nf?=
 =?us-ascii?Q?hQZXZIk0zg/7yoBsiS7lbcz9EpTo5y+4TkNP9wbO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF07B018B9F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f6d5c8f-992e-484a-fe59-08ddf12a9350
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 11:58:51.8903 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3F2IHPMOcBwmWy0+foSSC6H2JJsnyC3vDqXDBj70FRd/qmdcvqWG8rVK3KDhVff3fBLuEAInyaSPU4gEBhzfNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF6F855567
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

HI Priyanka,

Please find inline reply:-

-----Original Message-----
From: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>=20
Sent: Thursday, September 11, 2025 12:20 PM
To: Thomas, Sobin <sobin.thomas@intel.com>; igt-dev@lists.freedesktop.org
Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Konieczny, Kami=
l <kamil.konieczny@intel.com>; Thomas, Sobin <sobin.thomas@intel.com>
Subject: RE: [PATCH v3 i-g-t 1/1] tests/intel/xe_compute_preempt: Compute p=
reemption check



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of=20
> Sobin Thomas
> Sent: 10 September 2025 10:50 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Konieczny,=20
> Kamil <kamil.konieczny@intel.com>; Thomas, Sobin=20
> <sobin.thomas@intel.com>
> Subject: [PATCH v3 i-g-t 1/1] tests/intel/xe_compute_preempt: Compute=20
> preemption check
>=20
> On platforms like PVC that lack walker mid-thread preemption, running=20
> tests in forked threads can cause inconsistent states due to mid-=20
> execution igt_skip calls. This patch adds a kernel preemption check at=20
> the start of each subtest to ensure consistent behavior. If the GPU=20
> lacks required preemption, the test is skipped gracefully.
>=20
> v2: Moved compatibility check to igt_fixture per review.
> v3: - Added thread group preemption and WMTP checks;
>     - Introduced enum flags for preemption types. [Zbigniew]
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
You are sending every version as new series but it should be sent as new ve=
rsion for same series. So that it would be easy to review. Please check tha=
t out.

- > Since this patch is specific to check the compute kernel preemption sup=
port so renamed the subject.

> ---
>  lib/intel_compute.c              | 22 ++++++++++++++++++++++
>  lib/intel_compute.h              |  7 +++++++
>  tests/intel/xe_compute_preempt.c |  6 ++++++
>  3 files changed, 35 insertions(+)
>=20
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c index
> 147dd2916..7538c4b42 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -2193,21 +2193,25 @@ static const struct {
>  			     bool threadgroup_preemption,
>  			     enum execenv_alloc_prefs alloc_prefs);
>  	uint32_t compat;
> +	enum xe_compute_preempt_type preempt_type;
>  } intel_compute_preempt_batches[] =3D {
>  	{
>  		.ip_ver =3D IP_VER(20, 01),
>  		.compute_exec =3D xe2lpg_compute_preempt_exec,
>  		.compat =3D COMPAT_DRIVER_XE,
> +		.preempt_type =3D PREEMPT_WMTP | PREEMPT_TGP,
>  	},
>  	{
>  		.ip_ver =3D IP_VER(20, 04),
>  		.compute_exec =3D xe2lpg_compute_preempt_exec,
>  		.compat =3D COMPAT_DRIVER_XE,
> +		.preempt_type =3D PREEMPT_WMTP | PREEMPT_TGP,
>  	},
>  	{
>  		.ip_ver =3D IP_VER(30, 00),
>  		.compute_exec =3D xe2lpg_compute_preempt_exec,
>  		.compat =3D COMPAT_DRIVER_XE,
> +		.preempt_type =3D PREEMPT_WMTP | PREEMPT_TGP,
>  	},
>  };
>=20
> @@ -2260,6 +2264,24 @@ static bool
> __run_intel_compute_kernel_preempt(int fd,
>=20
>  	return true;
>  }
> +
You haven't removed the below code in  __run_intel_compute_kernel_preempt w=
hich you made that change in previous version.

Sobin: This function is specific for only checking the kernel preemption. S=
o it will get the batch and from that it will get preempt type to be compar=
ed with required preempt.
We need to have this checked at least one time. Regarding the changes,  tha=
t is a different function we can call run_compute_kernel_preempt=20
without calling check_kernel_preempt() first.

> +bool check_kernel_preempt(int fd, enum xe_compute_preempt_type
> +required_preempt) {
> +	unsigned int ip_ver =3D intel_graphics_ver(intel_get_drm_devid(fd));
> +	unsigned int batch;
> +
> +	for (batch =3D 0; batch < ARRAY_SIZE(intel_compute_preempt_batches);
> batch++)
> +		if (ip_ver =3D=3D intel_compute_preempt_batches[batch].ip_ver)
> +			break;
> +
Here there is no condition to check for ip version failure. If ip version i=
s not found then also it might return true. Please check that out.

Sobin: Initially was planning to keep this function for pre-emption check o=
nly before forking the test. =20
Agreed there can be a case where preemption check passes but IP version  ch=
eck can fail. So will bring the check here.

> +	if (required_preempt &&
> +	    !(intel_compute_preempt_batches[batch].preempt_type &
> required_preempt)) {
> +		igt_info("Preemption type not supported %x",
> required_preempt);
> +		return false;
> +	}
> +	return true;
> +}
> +
>  /**
>   * run_intel_compute_kernel_preempt - runs compute kernels to
>   * exercise preemption scenario.
> diff --git a/lib/intel_compute.h b/lib/intel_compute.h index
> 412791d07..b70cd7185 100644
> --- a/lib/intel_compute.h
> +++ b/lib/intel_compute.h
> @@ -71,6 +71,11 @@ enum execenv_alloc_prefs {
>  	EXECENV_PREF_VRAM_IF_POSSIBLE,
>  };
>=20
> +enum xe_compute_preempt_type {
> +	PREEMPT_TGP  =3D 1 << 0,    /* ThreadGroup Preemption */
> +	PREEMPT_WMTP  =3D 1 << 1,  /* Walker Mid Thread Preemption */ };
> +
>  extern const struct intel_compute_kernels=20
> intel_compute_square_kernels[];
>=20
>  bool run_intel_compute_kernel(int fd, struct user_execenv *user, @@=20
> -81,4
> +86,6 @@ bool xe_run_intel_compute_kernel_on_engine(int fd, struct
> drm_xe_engine_class_in  bool run_intel_compute_kernel_preempt(int fd,=20
> struct drm_xe_engine_class_instance *eci,
>  				      bool threadgroup_preemption,
>  				      enum execenv_alloc_prefs alloc_prefs);
> +
> +bool check_kernel_preempt(int fd, enum xe_compute_preempt_type=20
> +required_preempt);
>  #endif	/* INTEL_COMPUTE_H */
> diff --git a/tests/intel/xe_compute_preempt.c
> b/tests/intel/xe_compute_preempt.c
> index c9b194869..a4c0bc59b 100644
> --- a/tests/intel/xe_compute_preempt.c
> +++ b/tests/intel/xe_compute_preempt.c
> @@ -76,6 +76,7 @@ igt_main
>  	}
>=20
>  	igt_subtest_with_dynamic("compute-preempt") {
> +		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class !=3D
> DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> @@ -86,6 +87,7 @@ igt_main
>  	}
>=20
>  	igt_subtest_with_dynamic("compute-preempt-many") {
> +		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class !=3D
> DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> @@ -112,6 +114,7 @@ igt_main
>  	igt_subtest_with_dynamic("compute-preempt-many-all-ram") {
>  		igt_require(swap_mb > CONTEXT_MB * 10);
>=20
> +		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class !=3D
> DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> @@ -138,6 +141,7 @@ igt_main
>  	igt_subtest_with_dynamic("compute-preempt-many-vram") {
>  		igt_require(xe_has_vram(xe));
>=20
> +		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class !=3D
> DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> @@ -164,6 +168,7 @@ igt_main
>  	igt_subtest_with_dynamic("compute-preempt-many-vram-evict") {
>  		igt_require(xe_has_vram(xe));
>=20
> +		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class !=3D
> DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> @@ -188,6 +193,7 @@ igt_main
>  	}
>=20
>  	igt_subtest_with_dynamic("compute-threadgroup-preempt") {
> +		igt_require(check_kernel_preempt(xe, PREEMPT_TGP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class !=3D
> DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> --
> 2.34.1

