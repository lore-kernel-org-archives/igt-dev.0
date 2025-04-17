Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2826C369C9
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 12:04:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56CC710EAE5;
	Thu, 17 Apr 2025 12:04:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eu2U5Iuh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D587110EAE2
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 12:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744891490; x=1776427490;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JhDopYi5ijK6HVXAqocA87Smw00/NzyqO4pRSNuOwE8=;
 b=Eu2U5Iuh5VZ6hTUfmEEXs1b5/HcU0tefOxKDXvKTlbRGU024mlJcoqKs
 IGk5cMZbCRNQTrFARzNhiZ8UJfIx7TxS1RbUksFW+03AGqkOz8pCBQ6vW
 8NeAljmgoHBoFGnXo7i1WJ1SPf7Rjf97Pgr2ft2XIjoDUoKcycC0tlsiJ
 WgFGDTbVkBvYaMO3iXgxRT382Exr/3AdxNoYIaNGw1POwAK2I/8qSDtGk
 QyaA7ZYeqJfuQlTrQeGaqPrPaWLC5JOLzb/6JHV/fpoDEBGW4AkButLTo
 rjwdwUgw1vh6TYPayBYXf+VX54H17e5sFHS/ioZtqhRXLgE4ZrotHYd1h g==;
X-CSE-ConnectionGUID: HS1xJhGJS76SopBEqwiyZg==
X-CSE-MsgGUID: I/XM8lClT3KC6TJWAvqMGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46398544"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="46398544"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 05:04:49 -0700
X-CSE-ConnectionGUID: XGmu4MryQHiCpzr+JrLVyg==
X-CSE-MsgGUID: CzHOqxBBRI6nPxgupoNi8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="131313411"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 05:04:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 05:04:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 05:04:47 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 05:04:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CxKqAWycte9SHP/SLbsVO54iEMn/EGDf+i7CqqtskTTjF4e35jTkLxGUO1pyGoV/mKxGDscXaVX8f5TahiSz4uuE4T6eqskb/GjlYrGcSmarsmG4vAnDqVpTVFmOL2NVr+/X58Bh5WoYxiGFk5miWHfY9spp6H3rSqHaseL6dx7EQRx5YF/LTx43gtI48NNEkelTINkn/j/21Xar1qvrNCm6pKS2sx0dk1vmu77qrLiKPjdGmjZhtMvgmCkts7XAarCrQlfdF86bsiRi2fYDeJl3c1cLge9L3Lb3/QAOitqVC9f+PeKxsScxM18guOn2RJ6d18h5xaEk2rLbv3NXzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZXuNmmxlHESMFS0qLBaPuMz4OaLBJdFQzKtIw/jPHs=;
 b=EPtlV24eYpaejv04DHpTRvKeIk+RmMpqaG8IML7mhKPoOfqCMbad7P3vGNjWhuKjKkIWQkhlTH6ttyRD5iA//KdBJlyNuIUkrKiHMg6BWQq4vjugNvaoVSAnnoGtyWbPQKA+AN2ovQkVPPlzzldp/LNgV0bVcSUlXtIZl5gBl/R73Ne3bk+/mtiixoDCidHRyWCkHZT4VZBxr0ayXyxSXYz/wPBEF19guE1KkXhjbXZXzUYZ+X39TFyIgHOs8F0XgYCXoT+8976AoOzeZ3mAMQlb4r4stdKLBK5jDfW0lA1+UNfeAGnL5WKmnEFEOnvjQX+sSinzsHLdkRe5zmTHTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5819.namprd11.prod.outlook.com (2603:10b6:510:13b::9)
 by SA1PR11MB8491.namprd11.prod.outlook.com (2603:10b6:806:3ac::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 12:04:02 +0000
Received: from PH7PR11MB5819.namprd11.prod.outlook.com
 ([fe80::dfc9:d5e9:2cd4:8d2]) by PH7PR11MB5819.namprd11.prod.outlook.com
 ([fe80::dfc9:d5e9:2cd4:8d2%6]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 12:04:02 +0000
From: "Sokolowski, Jan" <jan.sokolowski@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Konieczny, Kamil" <kamil.konieczny@intel.com>, "Tahvanainen, Jari"
 <jari.tahvanainen@intel.com>, "Chauhan, Aditya" <aditya.chauhan@intel.com>,
 "B S, Karthik" <karthik.b.s@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t v2 1/2] tests/intel-ci: Add platform blocklists to
 enable platform testlist creation
Thread-Topic: [PATCH i-g-t v2 1/2] tests/intel-ci: Add platform blocklists to
 enable platform testlist creation
Thread-Index: AQHbrtNw3JPN89OmoUaaqS77IyjD3bOnw9Zg
Date: Thu, 17 Apr 2025 12:04:02 +0000
Message-ID: <PH7PR11MB581910E34EF81A10242E022199BC2@PH7PR11MB5819.namprd11.prod.outlook.com>
References: <20250416132129.1363764-1-karthik.b.s@intel.com>
 <20250416132129.1363764-2-karthik.b.s@intel.com>
In-Reply-To: <20250416132129.1363764-2-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5819:EE_|SA1PR11MB8491:EE_
x-ms-office365-filtering-correlation-id: 1bd37940-61e1-4fae-957b-08dd7da7f1b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?4aVvX9zDwcGGF0eLv3hQEcYf5r7W8s2N9dtjW0PpvlfW8UjJPhwVp44HGm3w?=
 =?us-ascii?Q?oAW+2SRUcMRjJUT++YU4Cxd5cxgyeimuREfnyHwMf7f7CF8Jh1hOUUKjLzMF?=
 =?us-ascii?Q?I6T9WoVoOsfeIT9t1llgOxz0Lqbz9zMWUmGTPq02v/6ahC5BaPHZCys4K+xd?=
 =?us-ascii?Q?JOJ/3nVRw+xdCzhsFYRSxdHIHpdxVCsWtw6z+9a0zDble6KGGbxIkhbltrIQ?=
 =?us-ascii?Q?l02Ge8FT30QCROzGxQ+zdSJOyRxaTdsf5xs86C+JkiaTBEsy5WtIvEbqR7OV?=
 =?us-ascii?Q?2gPiTDjdV2uV0qQtoP5HBhwDk+9zJewnPygcIgn3y1cB9vk5W3XsC/wFn/dA?=
 =?us-ascii?Q?EbAKr4/ZMC9Io5s3UaxCZTb157t5hkHW4a+K51HRMpH7n6DACOruNjD8fU5P?=
 =?us-ascii?Q?qQtTdondmUp6iAUoWObDiCCATj1VpvSPWaweoo380K/WtgDE3ejuda4eKV5F?=
 =?us-ascii?Q?FlC0tyVkp7B0lDNGrEbGDLUZI3SGLBc38OWoVnlY/Ywi3cIbW1ic3Ubq6viP?=
 =?us-ascii?Q?/muPIXmH2D4I28RqzUzX+iez0LVOkV3GzTLFDMDMUR6O6rV04T/o5ZsHOIT4?=
 =?us-ascii?Q?xEYh573lYXUisgppWhLhPUjfbV35aHvRSWw0ZXIf4R5I1IqbFUJAZi2FGVaK?=
 =?us-ascii?Q?MepjkmSSn1J1Xa17Mu9IUSM8y9O7itRwk/J/7gtEGuxFWiGwvKiH7Pc0bf2l?=
 =?us-ascii?Q?xr+MuCQ0681LK8ARhVCujVBX47mkeQPYrYKKfpmHNwhbsZA6xXWl1G87/J4C?=
 =?us-ascii?Q?BNx2Ohfu3lyHKBqZTIeQJEDYB3j6ARRa+J3ElEUQcy4NTy8Yta0ZjntdL+/V?=
 =?us-ascii?Q?ZkklZZJgTiyAVgMwjO9kwx3uykBd+vzHYk45UugPn2zlJMyiKrKN6CSKcJ2v?=
 =?us-ascii?Q?EvMVYrdRxzg376U2I1YDSthUITANVYFS5dPFaDtP1E/p4/hONgrMqkT5uFlP?=
 =?us-ascii?Q?pkAucrYkX6sFZRl+Osvhblz1CAlOmjXI2bJJ/4sbbnQ70Jn97tXgqmOAe3ZW?=
 =?us-ascii?Q?gZ5V4MNPj2+LpLSmL79AkgTfjwGorUm9RsaPm7uw5zHn8BvA3CoakTgIIPuL?=
 =?us-ascii?Q?L+8HSNNOJ6HSJ4zE/wgw5xBsBoriPx9iwl49CzSvgKl9ikLG+dz3U2gZiPKd?=
 =?us-ascii?Q?AZWxHkcUM8MZlM5eKUpQtCVkm/9IGWs2WXq4+HGqVI4chXaTnSR50r6jkNYe?=
 =?us-ascii?Q?5CSsvCd0wVqq7DfFOrwsrvhVdAVOC34qOyUvgPs48ZZ7zI4V6F5i1apNI+23?=
 =?us-ascii?Q?wXE72jZcw5WNZ28kzGnEwHFaYDeiXLWFX95/b1WN4SE3aR8FjRha8BjRbGk6?=
 =?us-ascii?Q?oct9gvouyTCKdJ3Qe899eSFmvw8pXRV6VFjGJNnbuVSjVUC0QEWL2Pvt4NWR?=
 =?us-ascii?Q?sz3jyZ2mqmqkvT3VL4/4OvHeh/s0bTgr++UzoUKGE1LqK+QBw57q9z2S3dwT?=
 =?us-ascii?Q?kqXvDTlZaH3j5aI4o6fcLq0BD7entEe1ahVTVXhdusr8IAEyvdx5QIhNNeHb?=
 =?us-ascii?Q?bJJ008paisDR278=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5819.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rqFH3xR73boDdGk6UDVXzUoRUae0+iyUpmTfdJh5Yr6q1muFhjFIL6Po81qt?=
 =?us-ascii?Q?9RH+Dw3jMCgvERhLbrV5a6gOOB1mrLG1QlKHw5UXy47S9zWW/2gd/RSunYa5?=
 =?us-ascii?Q?W/A8drIePXEonlo4uCsPkOygaNuAQeEv1XDbnPFKIa772GFR34uZnv9DaVVH?=
 =?us-ascii?Q?ycd2MzIRKEQCad8anWESXqtFVC+oCkVFJ3gRRjsa+pe49ZP/Gag7UXIKZvdq?=
 =?us-ascii?Q?5t7+Po94GztCSImiMm4EZ1pOsRDr03ds3wCle/21JzD1rm8wUbOqQQNVRXKx?=
 =?us-ascii?Q?dx7TSS4KMwZFtHWBpZ1/uNbb6nB+pBx3qDh5SDWY+xMuMX5l9vjrBgRKk3x5?=
 =?us-ascii?Q?lzkAxzu/lvX3mNazE2FnlEaQbhDuLn4m2QRJeNizr/f3KSqldKiWkwp1d18+?=
 =?us-ascii?Q?Ecc1auy+MssihJf9jnUCe1LgWwkfJlNRW7W+OC8NrNNJXM0j5emiblgGr3cU?=
 =?us-ascii?Q?jN4cedC1UP5EPO2oZWuNLqttrj1hJ37yTUf49AvgfN1nmjoVeo1e/KAZdyM+?=
 =?us-ascii?Q?pxnKXvKtXtChINyLu10NOPHb+91OUQpPJa0Rds/lyKKP1IRaLa326rLsU5iZ?=
 =?us-ascii?Q?ss3rbBIlEZZ0i9Q4I2KucA2Eo/leb0Esq0FAVuWXVYHorn/tRoGvW50hMovd?=
 =?us-ascii?Q?au4KbqIUyFwzMMx+fQqbcycIOWbsJ9VVRvzXnyfygAmtgnjjRG+7kwgiSX4j?=
 =?us-ascii?Q?2wCnjVHBvenI1la0VCcuFNTy3QMlBIgBicJzviPqhi4xEjaHR9IveDU7uBlU?=
 =?us-ascii?Q?Pvxenf+pTMiCLIMiiMFXq3Z8yKxZzXPVQ1XGlWzxYoNBoBMmRoGJML4fuZfE?=
 =?us-ascii?Q?hM/SqvU+HIiDbsF/oK+3mJgOwtkqAofZXEdjSMfbWTlohE7KO4FmqxerSytQ?=
 =?us-ascii?Q?ACPyz/OD0ZEhXty/VGlEjXJIZmluzqyt4Iex1m9Z4nBku9YA1NGztfpJRO8L?=
 =?us-ascii?Q?wOYm9f1w2H2VP4/WcNfsEQ/nVIxJ0QbS29Oun51T4NlNc2nGCrH03gzC9hT0?=
 =?us-ascii?Q?bM8mqcu4sq/XiBiSyskgM9qIp2pHIYivzdsqafPy7QVWH+aXpWHrOUuMJM6Y?=
 =?us-ascii?Q?W9cMIlAra0DzEYcx+tLpOkqQuH8YrsBlF4nHKllRnexD+ehvapV0v8CXmMKT?=
 =?us-ascii?Q?nuqwvVd9Uzr7VeCoAQgeKesLaTg3enOg31Fp539F8wY2o/VupMiejIlCeNpy?=
 =?us-ascii?Q?FlepisRsH2InZRevaTSsTkGJNHN/Y/37Ur+D3Qh1hNZ7JghDawPxAON1vU4k?=
 =?us-ascii?Q?+PtfPsCgPeiPKYneptmk5t9bzKMMdPzvsL8am2LcBa8VtPWa06ij1PMgu/Lh?=
 =?us-ascii?Q?QKe82mnZNC6e7jLoJWZ91VtyvApaEWM0e60IekuOE3eTlpf6EELU+gtHNtFa?=
 =?us-ascii?Q?J8CxRl74rKsPS1bS3N3xkLLAzs6tVmN3S/IybN1RcdFcJ9WPJ3a/BnVzBUr/?=
 =?us-ascii?Q?84hMaMJUuZKyWLRMAVW2T7jNEOSrpImuHYRV7fKudCGKrqs+NQKkTctoP5JX?=
 =?us-ascii?Q?jdKDnwgtqUQ2m4Ei6C1isSBo0TM0sj7pUjIPso5g04G06ET7qpqIca0PzzL5?=
 =?us-ascii?Q?NNXSSgfwdc+u4Sx9UoS1bMRN8Nb7P4QDXYmd5kqY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5819.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd37940-61e1-4fae-957b-08dd7da7f1b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 12:04:02.4150 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gSz0IzFvJA7HtrV0aYP6Ex/LNQJDE+k80DP5sKuOFq8muKzCE4TH5XtwiaIyfJcvLt3zA4jh/tnBWwRFe2EfUdvVH0JQ2gNemcjZdGpTtvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8491
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

LGTM
Reviewed-by: Jan Sokolowski <jan.sokolowski@intel.com>

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Karthik =
B S
Sent: Wednesday, April 16, 2025 3:21 PM
To: igt-dev@lists.freedesktop.org
Cc: Konieczny, Kamil <kamil.konieczny@intel.com>; Tahvanainen, Jari <jari.t=
ahvanainen@intel.com>; Chauhan, Aditya <aditya.chauhan@intel.com>; B S, Kar=
thik <karthik.b.s@intel.com>; Kamil Konieczny <kamil.konieczny@linux.intel.=
com>
Subject: [PATCH i-g-t v2 1/2] tests/intel-ci: Add platform blocklists to en=
able platform testlist creation

Add BMG/LNL platform blocklists to enable platform testlist creation.
Blocklists are defining test cases that are not supported by LNL/BMG platfo=
rms.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Jari Tahvanainen <jari.tahvanainen@intel.com>
Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/xe.bmg.core.blocklist.txt    |  78 +++++++++
 tests/intel-ci/xe.bmg.display.blocklist.txt | 158 ++++++++++++++++++
 tests/intel-ci/xe.lnl.core.blocklist.txt    |  85 ++++++++++
 tests/intel-ci/xe.lnl.display.blocklist.txt | 171 ++++++++++++++++++++
 4 files changed, 492 insertions(+)
 create mode 100644 tests/intel-ci/xe.bmg.core.blocklist.txt
 create mode 100644 tests/intel-ci/xe.bmg.display.blocklist.txt
 create mode 100644 tests/intel-ci/xe.lnl.core.blocklist.txt
 create mode 100644 tests/intel-ci/xe.lnl.display.blocklist.txt

diff --git a/tests/intel-ci/xe.bmg.core.blocklist.txt b/tests/intel-ci/xe.b=
mg.core.blocklist.txt
new file mode 100644
index 000000000..a43e43a62
--- /dev/null
+++ b/tests/intel-ci/xe.bmg.core.blocklist.txt
@@ -0,0 +1,78 @@
+##################################################################
+# Tests NA for Native
+##################################################################
+igt@.*iov.*
+##################################################################
+# KMS - Display related tests
+# Other Display specific tests
+##################################################################
+igt@.*kms.*
+igt@testdisplay
+igt@xe_pat@display-vs-wb-transient
+igt@fbdev@.*
+##################################################################
+# Expected Skip for xe2+ platforms
+##################################################################
+igt@xe_pat@pat-index-xehpc
+igt@xe_pat@pat-index-xelp
+igt@xe_pat@pat-index-xelpg
+igt@xe_media_fill@media-fill
+##################################################################
+# Expected skip on xe1 & xe2 Platforms
+##################################################################
+igt@xe_pat@pat-index-xe3p-xpc
+##################################################################
+# Expected skip on single card machines
+##################################################################
+igt@xe_peer2peer@.*
+igt@xe_query@multigpu-query-.*
+igt@xe_create@multigpu-create-massive-size
+igt@xe_exec_basic@.*multigpu.*
+##################################################################
+# Expected skip - small bar not supported
+##################################################################
+igt@xe_mmap@small-bar
+##################################################################
+# Expected skip: CPU host pcieport not supported
+##################################################################
+igt@xe_pm@.*d3cold.*
+##################################################################
+# Expected behavior - CCS mode enabled only for platforms
+# which have more than 1 COMPUTE ENGINE instance per tile.
+##################################################################
+igt@xe_compute@ccs-mode-basic
+##################################################################
+# Expected skip as tests not applicable for the platform
+##################################################################
+igt@xe_vm@.*export.*
+##################################################################
+# Tests not applicable for the platform
+##################################################################
+igt@xe_exec_multi_queue@.*
+igt@xe_evict@.*multi(-)?queue.*
+igt@.*@.*-multi_queue
+igt@.*@.*multi-queue.*
+##################################################################
+# Expected skips, Kernel support not available
+##################################################################
+igt@xe_eudebug@.*
+igt@xe_eudebug_online@.*
+igt@xe_exec_sip@.*
+igt@xe_exec_sip_eudebug@.*
+igt@xe_live_ktest@xe_eudebug
+##################################################################
+# Expected Skip as per the current behaviour
+##################################################################
+igt@xe_oa@oa-tlb-invalidate
+igt@xe_oa@unprivileged-single-ctx-counters
+##################################################################
+# Temporarily blocking the tests until we have
+# support for exhaustive eviction
+##################################################################
+igt@xe_evict@evict-(beng-)?cm-threads-large$
+igt@xe_evict@evict-(beng-)?mixed-many-threads-large$
+igt@xe_evict@evict-(beng-)?mixed-many-threads-small$
+igt@xe_evict@evict-(beng-)?mixed-threads-large$
+igt@xe_evict@evict-(beng-)?threads-large$
+igt@xe_evict@evict-(beng-)?large-multi-vm-cm$
+##################################################################
diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/x=
e.bmg.display.blocklist.txt
new file mode 100644
index 000000000..f145d6c0d
--- /dev/null
+++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
@@ -0,0 +1,158 @@
+#########################################
+# non-KMS tests
+#########################################
+igt@(?!.*kms|testdisplay|.*display-vs-wb-transient)(.*)
+
+#########################################
+# Valid skip :- Y and Yf-Tiling are not supported
+#########################################
+igt@kms_(big_fb|ccs|rotation_crc)@.*(y|yf)-(tiled|tile).*
+igt@kms_(plane_lowres|frontbuffer_tracking|plane_multiple)@.*tiling-y.*
+igt@kms_flip_scaled_crc@.*(yf|y)tile.*
+igt@kms_async_flips@invalid-async-flip
+igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
+#########################################
+# Valid skip :- 90/270 rotation is not supported
+##########################################
+igt@kms_big_fb@.*rotate-(90|270)
+igt@kms_rotation_crc@.*rotation-(90|270)
+igt@kms_rotation_crc@bad-(pixel-format|tiling)
+igt@kms_rotation_crc@sprite-rotation-90-pos-100-0
+##########################################
+# Valid skip :- Mutable zpos is not supported
+##########################################
+igt@kms_atomic@plane-primary-overlay-mutable-zpos
+##########################################
+# Valid skip :- Requires TV connector not present on BMG
+##########################################
+igt@kms_tv_load_detect@load-detect
+##########################################
+# Valid skip :- Scaling mode none is not supported
+##########################################
+igt@kms_scaling_modes@scaling-mode-none
+##########################################
+# Valid skip :- Valid for display ver > 13
+##########################################
+igt@kms_psr2_su@.*
+##########################################
+# Valid skip :-  Cursor sizes of 32 and greater than 256 are not supported
+##########################################
+igt@kms_cursor_crc@.*-max-size
+igt@kms_cursor_crc@.*-(32x10|32x32|512x)
+##########################################
+# Valid skip :- Downscaling factor is not supported
+##########################################
+igt@kms_plane_scaling@.*downscale-factor-0-25.*
+igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-(5|75)
+igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-(5|75)
+##########################################
+# Valid skip :- Downscaling is not supported on second plane MTL+
+##########################################
+igt@kms_plane_scaling@planes-downscale-factor-0-(5|75)$
+igt@kms_plane_scaling@planes-.*upscale-.*downscale
+##########################################
+# Valid skip :- Unsupported cursor size
+##########################################
+igt@kms_cursor_crc@.*64x21
+igt@kms_cursor_crc@.*128x42
+igt@kms_cursor_crc@.*256x85
+igt@kms_cursor_crc@cursor-(offscreen|onscreen|random|rapid-movement|slidin=
g)-512x(512|170)
+##########################################
+# Valid skip as BMG doesn't have eDP supported
+##########################################
+igt@kms_vrr@seamless-rr-switch-vrr
+#########################################
+# no VGA connectors in BMG
+#########################################
+igt@.*chamelium.*vga.*
+##########################################
+# Expected skip as GSC not present in BMG
+##########################################
+igt@kms_content_protection@content-type-change
+igt@kms_content_protection@lic-type-1
+igt@kms_content_protection@type1
+#########################################
+# Expected skip as BMG doesn't have PORT_A/B
+#########################################
+igt@kms_pm_rpm@modeset-lpsp
+igt@kms_pm_rpm@modeset-lpsp-stress
+igt@kms_pm_rpm@dpms-mode-unset-lpsp
+igt@kms_pm_rpm@dpms-lpsp
+igt@kms_pm_lpsp@kms-lpsp
+igt@kms_pm_rpm@modeset-lpsp-stress-no-wait
+#########################################
+# Expected Skip : flat ccs has only one buffer
+#########################################
+igt@kms_getfb@getfb-reject-ccs
+#########################################
+# Expected skip for graphics ver >=3D 20
+#########################################
+igt@kms_getfb@getfb2-accept-ccs
+##########################################
+# Valid skip :- Feature is not enabled on kernel
+##########################################
+igt@kms_writeback@.*
+##########################################
+# Valid skip :- dc6 is not supported by dgfx
+#########################################
+igt@kms_pm_dc@deep-pkgc
+igt@kms_pm_dc@dc6-dpms
+
+##########################################
+# Valid skip :- DG2 & MTL specific
+##########################################
+igt@kms_ccs@.*-dg2-.*
+igt@kms_ccs@.*-mtl-.*
+igt@kms_flip_scaled_crc@.*dg2rcccs.*
+##########################################
+# Valid skip :- Simulation specific
+##########################################
+igt@kms_pm_dc@dc3co-vpb-simulation
+igt@kms_simulation_hpd@sim-hpd
+#########################################
+# Chamelium v1 HDMI receiver doesn't support 4k
+#########################################
+igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
+#########################################
+# Valid skip on non-hybrid configuration
+#########################################
+igt@kms_addfb_basic@invalid-smem-bo-on-discrete
+#########################################
+# crc-random cases are resource intensive
+#########################################
+igt@.*chamelium.*random.*
+
+##########################################
+# Valid skip :- cursor moving doesn't take slowpath
+##########################################
+igt@kms_cursor_legacy@(short|basic)-busy-flip-before
+igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-(transitions|tr=
ansitions-varying-size)
+igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle
+igt@kms_cursor_legacy@basic-busy-flip-before-cursor-(atomic|legacy|varying=
-size)
+##########################################
+# Valid skip :- Use of a single CRTC for two connectors
+##########################################
+igt@kms_setmode@basic-clone-single-crtc
+##########################################
+# Valid skip :- Connector uses CRTC that is incompatible
+#		with the connector
+##########################################
+igt@kms_setmode@invalid-clone-exclusive-crtc
+##########################################
+# Valid skip for display ver < 20
+##########################################
+igt@kms_frontbuffer_tracking@plane-fbc-rte
+#########################################
+Unsupported for platform with Wa_16023588340
+#########################################
+igt@kms.*fbc.*
+#########################################
+# Use either of linear-tiling or
+# connected-linear-tiling
+#########################################
+igt@kms_bw@linear-tiling-.*-display.*
+#########################################
+# Linear + hflip combination is not supported on BMG
+#########################################
+igt@kms_big_fb@linear-max-hw-stride.*hflip
+#########################################
diff --git a/tests/intel-ci/xe.lnl.core.blocklist.txt b/tests/intel-ci/xe.l=
nl.core.blocklist.txt
new file mode 100644
index 000000000..1e69170d8
--- /dev/null
+++ b/tests/intel-ci/xe.lnl.core.blocklist.txt
@@ -0,0 +1,85 @@
+##################################################################
+# Tests NA for Native
+##################################################################
+igt@.*iov.*
+##################################################################
+# KMS - Display related tests
+# Other Display specific tests
+##################################################################
+igt@.*kms.*
+igt@testdisplay
+igt@xe_pat@display-vs-wb-transient
+igt@fbdev@.*
+##################################################################
+# Expected skip as platform has no vram support
+##################################################################
+igt@xe_create@create-big-vram
+igt@xe_evict@.*
+igt@xe_evict_ccs@.*
+igt@xe_mmap@small-bar
+igt@xe_mmap@vram$
+igt@xe_noexec_ping_pong
+igt@xe_pm@d3-mmap-vram
+igt@xe_pm@d3hot-mmap-vram
+igt@xe_sysfs_tile@physical_vram_size_bytes
+##################################################################
+# No d3cold support for LNL
+##################################################################
+igt@xe_pm@.*d3cold.*
+##################################################################
+# Expected skip, S3 is not supported on the platform
+##################################################################
+igt@xe_gt_freq@freq_suspend
+igt@xe_pm@s3.*
+igt@xe_pm_residency@cpg-basic
+##################################################################
+# Hwmon feature isn't applicable for Integrated Platforms
+##################################################################
+igt@intel_hwmon@.*
+##################################################################
+# Expected Skip for xe2+ paltforms
+##################################################################
+igt@xe_media_fill@media-fill
+igt@xe_pat@pat-index-xehpc
+igt@xe_pat@pat-index-xelp
+igt@xe_pat@pat-index-xelpg
+##################################################################
+# Expected skip on xe1 & xe2 Platforms
+##################################################################
+igt@xe_pat@pat-index-xe3p-xpc
+##################################################################
+# Expected skip on integrated platforms
+##################################################################
+igt@.*@.*multigpu.*
+igt@xe_peer2peer@.*
+#######################################################
+# Expected behavior - CCS mode enabled only for platforms
+# which have more than 1 COMPUTE ENGINE instance per tile.
+##################################################################
+igt@xe_compute@ccs-mode-basic
+igt@xe_compute@ccs-mode-compute-kernel
+##################################################################
+# Expected skips as tests are xe-internal specific
+##################################################################
+igt@xe_vm@.*export.*
+##################################################################
+# Tests not applicable for the platform
+##################################################################
+igt@xe_evict@.*multiqueue.*
+igt@xe_exec_multi_queue@.*
+igt@.*@.*-multi_queue
+igt@.*@.*multi-queue.*
+##################################################################
+# Kernel support not available
+##################################################################
+igt@xe_eudebug@.*
+igt@xe_eudebug_online@.*
+igt@xe_exec_sip@.*
+igt@xe_exec_sip_eudebug@.*
+igt@xe_live_ktest@xe_eudebug
+##################################################################
+# Expected Skip as per the current behaviour
+##################################################################
+igt@xe_oa@oa-tlb-invalidate
+igt@xe_oa@unprivileged-single-ctx-counters
+##################################################################
diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/x=
e.lnl.display.blocklist.txt
new file mode 100644
index 000000000..1c6ea8c14
--- /dev/null
+++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
@@ -0,0 +1,171 @@
+#########################################
+# non-KMS tests
+#########################################
+igt@(?!.*kms|testdisplay|.*display-vs-wb-transient)(.*)
+
+#########################################
+# Valid skip :- Y and Yf-Tiling are not supported
+#########################################
+igt@kms_(big_fb|ccs|rotation_crc)@.*(y|yf)-tiled.*
+igt@kms_(plane_lowres|frontbuffer_tracking|plane_multiple)@.*tiling-y.*
+igt@kms_flip_scaled_crc@.*(yf|y)tile.*
+igt@kms_async_flips@invalid-async-flip
+igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
+#########################################
+# Valid skip :- 90/270 rotations are not supported
+##########################################
+igt@kms_big_fb@.*rotate-(90|270)
+igt@kms_rotation_crc@.*rotation-(90|270).*
+igt@kms_rotation_crc@bad-(pixel-format|tiling)
+##########################################
+# Valid skip :-  Cursor sizes of 32 and greater than 256 are not supported
+##########################################
+igt@kms_cursor_crc@.*-max-size
+igt@kms_cursor_crc@.*-(32x10|32x32|512x).*
+igt@kms_cursor_crc@cursor.*(21|42|85)
+##########################################
+# Valid skip :- Mutable zpos is not supported
+##########################################
+igt@kms_atomic@plane-primary-overlay-mutable-zpos
+##########################################
+# Valid skip :- Requires TV connector, which is not supported
+##########################################
+igt@kms_tv_load_detect@load-detect
+##########################################
+# Valid skip :- Scaling mode none is not supported
+##########################################
+igt@kms_scaling_modes@scaling-mode-none
+##########################################
+# Valid skip :- Downscaling factor is not supported
+##########################################
+igt@kms_plane_scaling@.*downscale-factor-0-25.*
+#########################################
+# Mei interface is not supported for LNL
+#########################################
+igt@kms_content_protection@mei-interface
+##########################################
+# Valid skip :- Downscaling is not supported on second plane MTL+
+##########################################
+igt@kms_plane_scaling@planes-downscale-factor-0-(5|75)$
+igt@kms_plane_scaling@planes-.*upscale-.*downscale.*
+#########################################
+# Expected skip for graphics ver >=3D 20
+#########################################
+igt@kms_getfb@getfb2-accept-ccs
+#########################################
+# Retention flops are not supported on LNL
+#########################################
+igt@kms_pm_dc@dc5-retention-flops
+#########################################
+# Horizontal flip is not supported with
+# tile4 surface formats
+#########################################
+igt@kms_big_fb@4-tiled.*hflip.*
+igt@kms_rotation_crc@primary-4-tiled-reflect-x.*
+##########################################
+# Valid skip :- LNL on CI supports only 3 pipes
+##########################################
+igt@kms_ccs@.*pipe-d.*
+igt@kms_feature_discovery@display-4x
+igt@.*@.*pipe-(d|D)($|-.*)
+igt@kms_bw@.*-4-displays-.*
+#########################################
+# Ultrajoiner is not supported with only 3 pipes
+#########################################
+igt@kms_joiner@.*ultra-joiner.*
+##########################################
+# Valid skip :- Feature is not enabled on kernel
+##########################################
+igt@kms_writeback@.*
+
+##########################################
+# Valid skip :- DG2 & MTL & BMG specific
+##########################################
+igt@kms_ccs@.*-dg2-.*
+igt@kms_ccs@.*-mtl-.*
+igt@kms_flip_scaled_crc@.*dg2rcccs.*
+igt@kms_ccs@.*4-tiled-bmg-ccs
+
+##########################################
+# Valid skip :- Simulation specific
+##########################################
+igt@kms_pm_dc@dc3co-vpb-simulation
+igt@kms_simulation_hpd@sim-hpd
+#########################################
+# HDMI/VGA subtests on chamelium are
+# expected skips for LNL on CI
+#########################################
+igt@kms_chamelium.*@.*(hdmi|vga).*
+#########################################
+# Valid skip when HDMI is not enabled in VBT
+#########################################
+igt@kms_force_connector_basic@force-connector-state
+igt@kms_force_connector_basic@force-edid
+igt@kms_force_connector_basic@prune-stale-modes
+igt@kms_hdmi_inject@inject-audio
+igt@kms_hdmi_inject@inject-4k
+igt@kms_3d
+#########################################
+# Valid skip for non-hybrid configuration
+#########################################
+igt@kms_addfb_basic@invalid-smem-bo-on-discrete
+#########################################
+# Valid skip on non-tiled display configuration
+#########################################
+igt@kms_tiled_display@.*
+
+##########################################
+# Valid skip :- cursor moving doesn't take slowpath
+##########################################
+igt@kms_cursor_legacy@(short|basic)-busy-flip-before.*
+##########################################
+# Valid skip :- Use of a single CRTC for two connectors
+##########################################
+igt@kms_setmode@basic-clone-single-crtc
+##########################################
+# Valid skip :- Connector uses CRTC that is incompatible
+#               with the connector
+##########################################
+igt@kms_setmode@invalid-clone-exclusive-crtc
+##########################################
+# Valid skip :- Valid for display ver > 13
+##########################################
+igt@kms_psr2_su@.*
+#########################################
+# Valid skip :- ccs modifiers not supported on Xe2
+#########################################
+igt@kms_getfb@.*ccs
+#########################################
+# Use either of connected/non-connected
+#########################################
+igt@kms_bw@linear-tiling-.*-display.*
+#########################################
+# Valid skip :- linear + hflip combination is a new
+                capability supported on display_ver >=3D 35
+#########################################
+igt@kms_big_fb@linear-max-hw-stride.*hflip
+
+#########################################
+# Expected skip/fail on CI
+#########################################
+igt@kms_pm_dc@.*dc6.*
+igt@kms_content_protection@.*dp-mst.*type-1.*
+igt@kms_pm_dc@deep-pkgc
+#########################################
+# Expected skip/fail on CI TypeC configuration
+#########################################
+igt@kms_chamelium_color@.*
+igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
+igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode
+igt@kms_chamelium_hpd@dp-hpd-for-each-pipe
+#########################################
+# Expected skip as config missing on CI
+#########################################
+igt@kms_joiner@basic-max-non-joiner
+#########################################
+# FBC with PR/PSR2 is a valid skip
+#########################################
+igt@kms_psr2_sf@fbc-pr-.*
+igt@kms_psr2_sf@fbc-psr2.*
+igt@kms_psr@fbc-psr2.*
+'igt@kms_psr@fbc-pr.*
--=20
2.43.0

