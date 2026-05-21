Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348D8CD5BAC
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 19:20:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4BA10E1E9;
	Thu, 21 May 2026 19:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hFtRuwEB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1805710E1E9
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 19:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779391204; x=1810927204;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=v3YZy2oA6IzMJ4zWYmF4d5puyaSUgg8Nnb+QXCDNAfE=;
 b=hFtRuwEBRe9mIx1wXG1z9daftVlKPXZECIQ+c+4QgPbSPUPxzm/I1MJa
 C7Dznl7HrEqXROA5sqV/FypNOiKdTWKNjE2pCsdkSeFUgRxi3DbP2stNT
 pg9YHMUUBxMa9SU8e2/W/NtILqlGx+baljIy2DJudrZMb+0TyuzskdmeN
 t8uTil9C78aWIQ59bncPWjLP4BYpVwNVFH+YC9GftID4nu6E+vNuuzHre
 +36EzEwxfGk1LkQQ7zROFdFwk3Ij9AIkyvualFE3cafAtYMWoOrr+yTq9
 dIhzRkN/tn0nbnOXryHCnOzmYgRs3sNIrs0Qqz3c00k382IXiEDp87gjO g==;
X-CSE-ConnectionGUID: ub2kuL1yTZCo9Akz5UC+dg==
X-CSE-MsgGUID: QRXR83vdRMywqMJ/gEvuKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="90894596"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208,217";a="90894596"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 12:20:03 -0700
X-CSE-ConnectionGUID: UKzVHRVJTHqJO5YGC/nbCw==
X-CSE-MsgGUID: /j838tcEQ/2O3MonozAFQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
 d="scan'208,217";a="236375356"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 12:20:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 12:20:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 21 May 2026 12:20:02 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 12:20:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kdpb9GQMCo2DBcZmk3qTpu0HekIE612wHBBQIp3bBVOd13Vmbq0lhhsEBl15qnkItDQsL74nTmS+mETagPWNl9pvVqtlGNTmkwTmE8v5I3E5jqiRwEfPRy2F8+MocutrGHAvEFmUYPjvkDllxgpLch4n4lVWuHnVoZnyrVJcwsWZcCOxKCf7piuo0/naKOWS4OoKu+cGQG4j/DQp/3UFsjhaU/JJLCwKBhd5T4PP/IpHhgL8IBEtfmmAgj5Af9/xsKcmoCirFfUt2Zz8Zky2a+71UKDMu2IAe7eF1StDtJ4ppiPEDHejaqHTTqdG0LpSjmLh/N7RlnDyiTzHEbjYEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9biJ/kaYzQa/QLPs37V/f0XZRIg/r/nI7T+LtYYCZw=;
 b=nUln2YOMpuplyr6wUFbW3Yk94lcGmTLBWEaVamPzrYMFNLaBLnh8ZkyAv5K/ACSigaf2FNFzDcEt8aEnAIPJE4YIyWF6h9OtlXMyrwGW2+g2TGuFGTXIdTm0PVvAsEvJlCcO/s3B5uQ5HHoid3aUEiGM8comZYSJWZ3TU2f71GmCaPCyLOZgfcr09xSdkFosrJWTdWEHX5L0jdVHi6t6/UcvyJZLmHYlLr7sdGqQ87VsyQhtRLklSPnxXDNMZ3roiogdcie0v80FUSL181jhhfNac/1Ko/CbJzvR2wrJWb8TVmOg7/ybxNDylJFJxBblfBxOVcFZvG6HVYFdSBeHOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by DM3PPF2DEFDE2DF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 21 May
 2026 19:19:54 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.21.0025.020; Thu, 21 May 2026
 19:19:53 +0000
From: "Sharma, Swati2" <swati2.sharma@intel.com>
To: Alex Hung <alex.hung@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Broadworth, Mark" <Mark.Broadworth@amd.com>, "Prosyak, Vitaly"
 <Vitaly.Prosyak@amd.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "Nikula, Jani" <jani.nikula@intel.com>
Subject: Re: [PATCH 1/2][V5] tests/kms_hdr: Fix HDR metadata probe in test_hdr
Thread-Topic: [PATCH 1/2][V5] tests/kms_hdr: Fix HDR metadata probe in test_hdr
Thread-Index: AQHc56C918EK0P9wh0uS1LxwEaFxkrYXaiAAgAFK8gCAAChj/w==
Date: Thu, 21 May 2026 19:19:53 +0000
Message-ID: <PH0PR11MB5880AFBCBD630A3241917CC5AF0E2@PH0PR11MB5880.namprd11.prod.outlook.com>
References: <20260519150022.3964921-1-alex.hung@amd.com>
 <a01a54c7-674c-4c5a-84d9-966d51e5cc3f@intel.com>
 <2d9b2896-ca25-4a35-b0a4-af9308383147@amd.com>
In-Reply-To: <2d9b2896-ca25-4a35-b0a4-af9308383147@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5880:EE_|DM3PPF2DEFDE2DF:EE_
x-ms-office365-filtering-correlation-id: 35531c64-c74e-4dcf-7ae8-08deb76defc7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|11063799006|13003099007|38070700021|6133799003|4143699003|22082099003|56012099003|8096899003|3023799007|18002099003;
x-microsoft-antispam-message-info: dvYLl8GWKhkP6CnaZspPWPMCgDHJQG/GNX/fHCH4iDCO7T++94gCkAVnMrE+fdoIskGsLBPf1DHCLAZlj1SOiUl5sCG5aha/sBTaXQ2mQj0+WS1OEpc/D5p1MXlT1Pqv/EwrTIK27+ubI208uLTs/dtNfHT8ddE9QJDPjz1xA9i8q5T8dtCRh9wZUIXvI7tOlUzwegGhZCFBa6VKGXmp0k3sc1y4SmDcTfZCxvGIfvKqUhkVEmpITWqsOsQq/WynBEHGZZCO/yPmqhdP5UMGqDIkI0JrAT0DMFZrPoqWTDqTsVXzS9hXhhMPWoiez3FjFuTDF4hEK9lLUD+Ngtc0pgNmp4iM8Nv9DjFgvt/Eg+p50UA3GxRe37m08S2vsU7HxlPlZpJv6lrhRQ7cnaHGauiNS3LdcAn/+2wwo6EJ8zGoSjyXsrhEuQpEa7J8F+4xfH+P4qjC8sR8reUvLEORjlF1HfNGlIEIMPVmBvuluBV5UpUbQJs2kAhSP9cpoNLeFSOjJIDcgEIRretp4nEr9NLIDLfqlmSVDuIIwCGtIRik+Sz98ZzTryAPO2pGpeDDLMQRMwde55rw3SpEgBQPgSHBbtu3TZ5Zu3vwedM7Sg3mr6i/gBf4l9/sN+V5jLpOUrFl4qpCbKpf3kbc14R294WUkqigQnYrlPQaSrEne2gGXKR00feSJQKtuCKV/eJLFU+pMGfGrmtLgyS5cBZD3w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(11063799006)(13003099007)(38070700021)(6133799003)(4143699003)(22082099003)(56012099003)(8096899003)(3023799007)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?YylybSa37rqKOdWdAB6qqRf8kJ6GBhVOrnkLdkmYOWoHklYtvbJprTcuU6?=
 =?iso-8859-1?Q?jDNTeFKONO/UQGAUGSrRCOQYK6rjmyPBLXpbPbt8AM+A0zktfm2BgTN00m?=
 =?iso-8859-1?Q?jgkf62BM4igS907O4Xgxc5ndG8//H013wR/34s1s7NZzvbGEx+n0rKrlFf?=
 =?iso-8859-1?Q?ZbxxYOe0tjo7o+zlkTjBCMhz+UK9MOp6EhegIdCPx8/9u9ut/zEhc9P/BS?=
 =?iso-8859-1?Q?eY8cPKBYRmFyIcFhB5ArAkEW0W0SbMvKkpk4/eO407e5YWTi3hAZlIN7YA?=
 =?iso-8859-1?Q?5qGnmu8kodX54Q5RUV17Dprd+IfdSe7YRdSH9ZV+hXYaBCwmu4CZyNULj/?=
 =?iso-8859-1?Q?qNrnzrSxwQrm3z32oXSZef4LWInjPq2ESdXFn5oYprqs2EvQcpzVeut6Ee?=
 =?iso-8859-1?Q?Ft5sftRtAEgMFqQPb9HnWE0yKWvJYoyxPxsA3rhVWgiR8I4X970RpzmNqY?=
 =?iso-8859-1?Q?Z7Gvo866/yD52jQPhckKXCiu1PQNkIedzbR/t4sMxNfO0w4BE2QglaVi2F?=
 =?iso-8859-1?Q?uYvMqjGqyTC6UE30kv9DBRTu6UOPuyCiKkwDe/dQobSoffXDsUMwKBScoF?=
 =?iso-8859-1?Q?vJvRh5nk9YPtt15Pi7XVbH3eZ5T9c00gXUd2Ecpd99d1vKGkjVe3hvB2Xf?=
 =?iso-8859-1?Q?pek7SPRQ1T7/DtG6iuCykQBaA7rpRd2O2wtPOg6D0PQC4oTZ9/Xnry56AB?=
 =?iso-8859-1?Q?d+3FMZZLhUBmXE0/ZFzTCrG+734JoeT5jeh6QfJKBdmN2C8he2ArVL/FLs?=
 =?iso-8859-1?Q?qd/6S2SEW3dEGxmDHAckRbI229p4ZJbStmF5dRcKju/OuO5EZKqWw6mvQW?=
 =?iso-8859-1?Q?sQzD3g0SH/nDU7ynk+25inM83mcMY/9z6nh/EbZa+XJpm1npfJXDdJiTEf?=
 =?iso-8859-1?Q?44N5IOchirbXYkQiTg91+neDwweDvAdgEMIwYlDG0wGIW60Qm7l5WOUWHQ?=
 =?iso-8859-1?Q?X9IYFbbPKrqF66pRmpNk8I46lN8H1XZcXUcIy8bqvYvG8yhp6m4yehySVl?=
 =?iso-8859-1?Q?7Qbqey9HJ1u9Z3jWftX5KY84uhnmtFcOhzYfHqVz3/rychNb5BKn4erURL?=
 =?iso-8859-1?Q?jBs898/PLxkjaH8LmJohPiy2dkx3zvz5/lS+cVRoxPqaTtqcYoP4zesSLG?=
 =?iso-8859-1?Q?UGjgkHkY2HUIKb0pkzbVK1Iv92gHhlnuKxa5fX4ef91/d0+4GvfbIunAWp?=
 =?iso-8859-1?Q?rNoWSw63bdMG9jI46T329s9cRYV3DN1ZAVXX/3ACit5hAYpmvMz0B9kVaj?=
 =?iso-8859-1?Q?u0Z/bvfZ3n6wdLnpv0B50p3DWdm3/pkuWU/+A+/b9F23Ri/rnIGBaQXDAF?=
 =?iso-8859-1?Q?IyOexNeLBNoBmXZ5arw21UOkJqcRUStWHo2PuEvvcEo+FkYj0jXlORF4WQ?=
 =?iso-8859-1?Q?zMA2CzivEp0BLNigWJImSbnXcCrKTUqWr1t6LizgLF2rVCm+fshVUdMMkk?=
 =?iso-8859-1?Q?aEarQAuH72gzOEFBS8mf+KyRNm6ta4r/QuYLo4i0Lsmpe3ohK18eqhnjzw?=
 =?iso-8859-1?Q?os/nqCCiVqBI/qOSHKWhNxJGLSKpAdNZJcYsVetwtOMgbCXg9mRU+ZxLz3?=
 =?iso-8859-1?Q?1Dso/SCWpMtLfcWLu88GVGAO6FR9mIz17oaDjCA8Oa6rOb9WJrhss/TAUw?=
 =?iso-8859-1?Q?EHsXGZ2680191vY7uuTcyw08SrcpUZPYXHpMWTwUyGJx+ZwxlXy2SpHx5s?=
 =?iso-8859-1?Q?3e15RdVx6I9ok69uIbDxDIM52eduC4QCvkXMtu4leHKMEL4oIoIDmHO9iE?=
 =?iso-8859-1?Q?9gtZN26Q28XRNMpT/UFlfw/14MxdrY9Ts24P0bhnmkxd0uBspe61kbJT/J?=
 =?iso-8859-1?Q?ydMcMtUQf7NCCVlHBh7t2DKIa/bSpW1ZoK2Kn+Fa5VPkMN3AT2RrPq8Mqw?=
 =?iso-8859-1?Q?zG?=
x-ms-exchange-antispam-messagedata-1: Bccbfz9KHcWQBQ==
Content-Type: multipart/alternative;
 boundary="_000_PH0PR11MB5880AFBCBD630A3241917CC5AF0E2PH0PR11MB5880namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: iGRyjkOFs5VKEMqsQPAoREnNVyBvl7G5nbPJUl3m3Dz9OuafxKd7Nj2/BWVE5uCkN9Wg+CkZlm7uv3tzFlh+dHk66Ss2ryQ9xemZM4I5To5NK29qqhpGXsjxREUvb8Ib5rri8ZtjKW4e5jnLYMYs5B1ghWBdxCl1ADg8eoggF9iHnQCxDLxZJK+FKAcNDO4zRXNBh7ZFgGqpE/2TFodtMdHKKIudenq0HFbGLg3xKoEXjW+39ATM0oaE7AuTasRqBsm0oP9Bz5jJyUjDICPjqWp6a19gGIy8c1JrclX3EswwIgyMqCUGEDogWLDI0LYIXqlHP0B+WZGr+gmf5gUyvQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35531c64-c74e-4dcf-7ae8-08deb76defc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2026 19:19:53.4762 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ElTKYBMkest4KcKk7Oy6+Svzdq9igFpNOzAsr6Bwog7A0Sr8bAkMkL8Ao44XBULqjxNp75aTNVeojn/DXfLVqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF2DEFDE2DF
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

--_000_PH0PR11MB5880AFBCBD630A3241917CC5AF0E2PH0PR11MB5880namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Alex,


This test is only for "eDP".

NOTRUN -> SKIP is not regression, it basically means test was not executed =
with post-merge CI build, however got skipped with PW build which is expect=
ed behaviour on DG2 since we have external panels connected with DG2.



Thanks and Regards,

Swati




________________________________
From: Alex Hung <alex.hung@amd.com>
Sent: Thursday, May 21, 2026 10:22 PM
To: Sharma, Swati2 <swati2.sharma@intel.com>; igt-dev@lists.freedesktop.org=
 <igt-dev@lists.freedesktop.org>
Cc: Broadworth, Mark <Mark.Broadworth@amd.com>; Prosyak, Vitaly <Vitaly.Pro=
syak@amd.com>; kamil.konieczny@linux.intel.com <kamil.konieczny@linux.intel=
.com>; Nikula, Jani <jani.nikula@intel.com>
Subject: Re: [PATCH 1/2][V5] tests/kms_hdr: Fix HDR metadata probe in test_=
hdr

Hi,


Most of regressions aren't related kms_hdr, but one of possible regression =
is with kms_hdr on https://patchwork.freedesktop.org/series/166879/


  igt@kms_hdr@brightness-with-hdr@pipe-a-dp-3-xrgb2101010:

  shard-dg2: NOTRUN -> SKIP +1 other test skip


Is this NOTRUN -> SKIP a concern? I do not have DG2 to verify it.


________________________________
From: Sharma, Swati2 <swati2.sharma@intel.com><mailto:swati2.sharma@intel.c=
om>
Sent: 20 May 2026 15:07
To: Hung, Alex <Alex.Hung@amd.com><mailto:Alex.Hung@amd.com>; igt-dev@lists=
.freedesktop.org<mailto:igt-dev@lists.freedesktop.org> <igt-dev@lists.freed=
esktop.org><mailto:igt-dev@lists.freedesktop.org>
Cc: Broadworth, Mark <Mark.Broadworth@amd.com><mailto:Mark.Broadworth@amd.c=
om>; Prosyak, Vitaly <Vitaly.Prosyak@amd.com><mailto:Vitaly.Prosyak@amd.com=
>; kamil.konieczny@linux.intel.com<mailto:kamil.konieczny@linux.intel.com> =
<kamil.konieczny@linux.intel.com><mailto:kamil.konieczny@linux.intel.com>; =
jani.nikula@intel.com<mailto:jani.nikula@intel.com> <jani.nikula@intel.com>=
<mailto:jani.nikula@intel.com>
Subject: Re: [PATCH 1/2][V5] tests/kms_hdr: Fix HDR metadata probe in test_=
hdr

Hi Alex

On 19-05-2026 08:30 pm, Alex Hung wrote:
> Fix the HDR metadata probe that failed with EINVAL because it
> attempted to commit metadata without a scanout buffer present.
> Create a minimal framebuffer and use DRM_MODE_ATOMIC_TEST_ONLY to
> validate the commit without modifying hardware state. The
> framebuffer is freed immediately after and the display state is
> reset, so the actual subtest starts from the same clean slate as
Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com><mailto:swati2.sharma@in=
tel.com>
> before.
>
> Assisted-by: Copilot:Claude-Opus-4.6
> Signed-off-by: Alex Hung <alex.hung@amd.com><mailto:alex.hung@amd.com>
> ---
>   tests/kms_hdr.c | 31 ++++++++++++++++++++++---------
>   1 file changed, 22 insertions(+), 9 deletions(-)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index d50f87787..d21f1b3f8 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -571,16 +571,33 @@ static void test_hdr(data_t *data, uint32_t flags)
>                                                              "non-interna=
l panel.\n",
>                                                              igt_output_n=
ame(output));
>
> -                                     /* Signal HDR requirement via metad=
ata */
> +                                     /* Signal HDR requirement via metad=
ata.
> +                                      * A framebuffer must be present fo=
r the driver to accept
> +                                      * a metadata commit. Use TEST_ONLY=
 so hardware state is
> +                                      * unchanged.
> +                                      */
> +                                     igt_create_fb(data->fd,
> +                                                   data->w, data->h,
> +                                                   hdr_test_formats[i],
> +                                                   DRM_FORMAT_MOD_LINEAR=
,
> +                                                   &data->afb);
> +                                     igt_plane_set_fb(data->primary, &da=
ta->afb);
> +                                     igt_plane_set_size(data->primary, d=
ata->w, data->h);
> +                                     igt_output_set_prop_value(data->out=
put, IGT_CONNECTOR_MAX_BPC, 10);
>                                        igt_hdr_fill_st2084(&hdr);
>                                        igt_hdr_set_metadata(data->output,=
 &hdr);
> -                                     igt_require_f(!igt_display_try_comm=
it2(display,
> -                                                                        =
    display->is_atomic ?
> -                                                                        =
    COMMIT_ATOMIC :
> -                                                                        =
    COMMIT_LEGACY),
> +                                     igt_require_f(!igt_display_try_comm=
it_atomic(display,
> +                                                                        =
          DRM_MODE_ATOMIC_TEST_ONLY |
> +                                                                        =
          DRM_MODE_ATOMIC_ALLOW_MODESET,
> +                                                                        =
          NULL),
>                                                      "%s: Couldn't set HD=
R metadata\n",
>                                                      igt_output_name(outp=
ut));
>
> +                                     /* Reset IGT display state; hardwar=
e was not changed. */
> +                                     igt_hdr_set_metadata(data->output, =
NULL);
> +                                     igt_plane_set_fb(data->primary, NUL=
L);
> +                                     igt_remove_fb(data->fd, &data->afb)=
;
> +
>                                        igt_require_f(!is_intel_device(dat=
a->fd) ||
>                                                      igt_max_bpc_constrai=
nt(display, crtc, output, 10),
>                                                      "%s: No suitable mod=
e found to use 10 bpc.\n",
> @@ -591,10 +608,6 @@ static void test_hdr(data_t *data, uint32_t flags)
>                                        else
>                                                flags &=3D ~TEST_NEEDS_DSC=
;
>
> -                                     igt_hdr_set_metadata(data->output, =
NULL);
> -                                     igt_display_commit2(display, displa=
y->is_atomic ?
> -                                                         COMMIT_ATOMIC :=
 COMMIT_LEGACY);
> -
>                                        if (flags & (TEST_NONE | TEST_DPMS=
 | TEST_SUSPEND |
>                                                     TEST_INVALID_HDR | TE=
ST_BRIGHTNESS))
>                                                test_static_toggle(data,
> --
> 2.43.0
>

--_000_PH0PR11MB5880AFBCBD630A3241917CC5AF0E2PH0PR11MB5880namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi Alex,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<p class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px;">=
<span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService,=
 Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">Thi=
s test is only for &quot;eDP&quot;.</span></p>
<div class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
NOTRUN -&gt; SKIP is not regression, it basically means test was not execut=
ed with post-merge CI build, however got skipped with PW build which is exp=
ected behaviour on DG2 since we have external panels connected with DG2.</d=
iv>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature" class=3D"elementToProof">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<p class=3D"elementToProof" style=3D"margin: 0in; font-family: Calibri, san=
s-serif; font-size: 11pt;">
Thanks and Regards,</p>
<p class=3D"elementToProof" style=3D"margin: 0in; font-family: Calibri, san=
s-serif; font-size: 11pt;">
Swati</p>
<p class=3D"elementToProof" style=3D"margin: 0in; font-family: Calibri, san=
s-serif; font-size: 11pt;">
&nbsp;</p>
</div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Alex Hung &lt;alex.hung@amd.com&gt;<br>
<b>Sent:</b>&nbsp;Thursday, May 21, 2026 10:22 PM<br>
<b>To:</b>&nbsp;Sharma, Swati2 &lt;swati2.sharma@intel.com&gt;; igt-dev@lis=
ts.freedesktop.org &lt;igt-dev@lists.freedesktop.org&gt;<br>
<b>Cc:</b>&nbsp;Broadworth, Mark &lt;Mark.Broadworth@amd.com&gt;; Prosyak, =
Vitaly &lt;Vitaly.Prosyak@amd.com&gt;; kamil.konieczny@linux.intel.com &lt;=
kamil.konieczny@linux.intel.com&gt;; Nikula, Jani &lt;jani.nikula@intel.com=
&gt;<br>
<b>Subject:</b>&nbsp;Re: [PATCH 1/2][V5] tests/kms_hdr: Fix HDR metadata pr=
obe in test_hdr
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr;">Hi,</div>
<p style=3D"direction: ltr; margin-top: 1em; margin-bottom: 1em;"><br>
</p>
<p style=3D"direction: ltr; margin-top: 1em; margin-bottom: 1em;">Most of r=
egressions aren't related kms_hdr, but one of possible regression is with k=
ms_hdr on
<a href=3D"https://patchwork.freedesktop.org/series/166879/" id=3D"OWA24b47=
485-6598-1816-30d5-9044ccbdc9c8" class=3D"x_moz-txt-link-freetext OWAAutoLi=
nk" data-auth=3D"NotApplicable" style=3D"margin-top: 0px; margin-bottom: 0p=
x;">
https://patchwork.freedesktop.org/series/166879/</a></p>
<p style=3D"direction: ltr; margin-top: 1em; margin-bottom: 1em;"><br>
</p>
<div style=3D"direction: ltr;">&nbsp; igt@kms_hdr@brightness-with-hdr@pipe-=
a-dp-3-xrgb2101010:</div>
<p style=3D"direction: ltr; margin-top: 1em; margin-bottom: 1em;">&nbsp; sh=
ard-dg2: NOTRUN -&gt; SKIP +1 other test skip</p>
<p style=3D"direction: ltr; margin-top: 1em; margin-bottom: 1em;"><br>
</p>
<p style=3D"direction: ltr; margin-top: 1em; margin-bottom: 1em;">Is this N=
OTRUN -&gt; SKIP a concern? I do not have DG2 to verify it.</p>
<p style=3D"direction: ltr; margin-top: 1em; margin-bottom: 1em;"><br>
</p>
<hr style=3D"direction: ltr; display: inline-block; width: 98%;">
<div id=3D"x_divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Sharma, Swati2 <a href=3D"mailto:swati2.sharma@intel.com"=
 id=3D"OWAdd890a56-b0d4-c1cc-3240-3ad801268204" class=3D"x_moz-txt-link-rfc=
2396E OWAAutoLink">
&lt;swati2.sharma@intel.com&gt;</a><br>
<b>Sent:</b>&nbsp;20 May 2026 15:07<br>
<b>To:</b>&nbsp;Hung, Alex <a href=3D"mailto:Alex.Hung@amd.com" id=3D"OWAa6=
8c57e5-6341-5022-6b99-f7c2954c5239" class=3D"x_moz-txt-link-rfc2396E OWAAut=
oLink">
&lt;Alex.Hung@amd.com&gt;</a>; <a href=3D"mailto:igt-dev@lists.freedesktop.=
org" id=3D"OWAe9d76485-6864-bafc-32fb-56c9979a1f3b" class=3D"x_moz-txt-link=
-abbreviated OWAAutoLink">
igt-dev@lists.freedesktop.org</a> <a href=3D"mailto:igt-dev@lists.freedeskt=
op.org" id=3D"OWA5a0b208c-eaf4-5cbf-6519-b9a2af5fa32d" class=3D"x_moz-txt-l=
ink-rfc2396E OWAAutoLink">
&lt;igt-dev@lists.freedesktop.org&gt;</a><br>
<b>Cc:</b>&nbsp;Broadworth, Mark <a href=3D"mailto:Mark.Broadworth@amd.com"=
 id=3D"OWA5aa53016-04b8-ed7e-39cc-b0662510801e" class=3D"x_moz-txt-link-rfc=
2396E OWAAutoLink">
&lt;Mark.Broadworth@amd.com&gt;</a>; Prosyak, Vitaly <a href=3D"mailto:Vita=
ly.Prosyak@amd.com" id=3D"OWA2b618455-fd05-2af8-1e84-6f70fc536924" class=3D=
"x_moz-txt-link-rfc2396E OWAAutoLink">
&lt;Vitaly.Prosyak@amd.com&gt;</a>; <a href=3D"mailto:kamil.konieczny@linux=
.intel.com" id=3D"OWA4f7d82b9-1b0b-61cb-6497-31bad54f8655" class=3D"x_moz-t=
xt-link-abbreviated OWAAutoLink">
kamil.konieczny@linux.intel.com</a> <a href=3D"mailto:kamil.konieczny@linux=
.intel.com" id=3D"OWAec7858f2-9ee0-a913-b3b2-7a86051c1938" class=3D"x_moz-t=
xt-link-rfc2396E OWAAutoLink">
&lt;kamil.konieczny@linux.intel.com&gt;</a>; <a href=3D"mailto:jani.nikula@=
intel.com" id=3D"OWA76bdf19d-8ffe-d7f3-8aca-8667c8d97504" class=3D"x_moz-tx=
t-link-abbreviated OWAAutoLink">
jani.nikula@intel.com</a> <a href=3D"mailto:jani.nikula@intel.com" id=3D"OW=
Ae1a13906-f788-773a-601d-cedddd00c306" class=3D"x_moz-txt-link-rfc2396E OWA=
AutoLink">
&lt;jani.nikula@intel.com&gt;</a><br>
<b>Subject:</b>&nbsp;Re: [PATCH 1/2][V5] tests/kms_hdr: Fix HDR metadata pr=
obe in test_hdr</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"direction: ltr; font-size: 11pt;">Hi Alex<br>
<br>
On 19-05-2026 08:30 pm, Alex Hung wrote:<br>
&gt; Fix the HDR metadata probe that failed with EINVAL because it<br>
&gt; attempted to commit metadata without a scanout buffer present.<br>
&gt; Create a minimal framebuffer and use DRM_MODE_ATOMIC_TEST_ONLY to<br>
&gt; validate the commit without modifying hardware state. The<br>
&gt; framebuffer is freed immediately after and the display state is<br>
&gt; reset, so the actual subtest starts from the same clean slate as<br>
Patch LGTM<br>
<br>
Reviewed-by: Swati Sharma <a href=3D"mailto:swati2.sharma@intel.com" id=3D"=
OWAb4115b9b-de0e-5649-d6c1-0f0c86deabae" class=3D"x_moz-txt-link-rfc2396E O=
WAAutoLink">
&lt;swati2.sharma@intel.com&gt;</a><br>
&gt; before.<br>
&gt;<br>
&gt; Assisted-by: Copilot:Claude-Opus-4.6<br>
&gt; Signed-off-by: Alex Hung <a href=3D"mailto:alex.hung@amd.com" id=3D"OW=
A6eea8979-d8f4-b35e-fd3d-4e6fc3fe4972" class=3D"x_moz-txt-link-rfc2396E OWA=
AutoLink">
&lt;alex.hung@amd.com&gt;</a><br>
&gt; ---<br>
&gt;&nbsp;&nbsp; tests/kms_hdr.c | 31 ++++++++++++++++++++++---------<br>
&gt;&nbsp;&nbsp; 1 file changed, 22 insertions(+), 9 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c<br>
&gt; index d50f87787..d21f1b3f8 100644<br>
&gt; --- a/tests/kms_hdr.c<br>
&gt; +++ b/tests/kms_hdr.c<br>
&gt; @@ -571,16 +571,33 @@ static void test_hdr(data_t *data, uint32_t flag=
s)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quo=
t;non-internal panel.\n&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_=
output_name(output));<br>
&gt;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*=
 Signal HDR requirement via metadata */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*=
 Signal HDR requirement via metadata.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; * A framebuffer must be present for the driver to accept<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; * a metadata commit. Use TEST_ONLY so hardware state is<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; * unchanged.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ig=
t_create_fb(data-&gt;fd,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; data-&gt;w, data-&gt;h,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; hdr_test_formats[i],<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; DRM_FORMAT_MOD_LINEAR,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &amp;data-&gt;afb);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ig=
t_plane_set_fb(data-&gt;primary, &amp;data-&gt;afb);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ig=
t_plane_set_size(data-&gt;primary, data-&gt;w, data-&gt;h);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ig=
t_output_set_prop_value(data-&gt;output, IGT_CONNECTOR_MAX_BPC, 10);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; igt_hdr_fill_st2084(&amp;hdr);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; igt_hdr_set_metadata(data-&gt;output, &amp;hdr);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ig=
t_require_f(!igt_display_try_commit2(display,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; display-&gt;is_atomic ?<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; COMMIT_ATOMIC :<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; COMMIT_LEGACY),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ig=
t_require_f(!igt_display_try_commit_atomic(display,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_MODE_ATOMIC_TEST_ONLY |<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_MODE_ATOMIC_ALLOW_MODESET,<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; &quot;%s: Couldn't set HDR metadata\n&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; igt_output_name(output));<br>
&gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*=
 Reset IGT display state; hardware was not changed. */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ig=
t_hdr_set_metadata(data-&gt;output, NULL);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ig=
t_plane_set_fb(data-&gt;primary, NULL);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ig=
t_remove_fb(data-&gt;fd, &amp;data-&gt;afb);<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; igt_require_f(!is_intel_device(data-&gt;fd) ||<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; igt_max_bpc_constraint(display, crtc, output, 10),<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; &quot;%s: No suitable mode found to use 10 bpc.\n&qu=
ot;,<br>
&gt; @@ -591,10 +608,6 @@ static void test_hdr(data_t *data, uint32_t flags=
)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; else<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flags &amp;=
=3D ~TEST_NEEDS_DSC;<br>
&gt;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ig=
t_hdr_set_metadata(data-&gt;output, NULL);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ig=
t_display_commit2(display, display-&gt;is_atomic ?<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; COMMIT_ATOMIC : COMMIT_LEGACY);<=
br>
&gt; -<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; if (flags &amp; (TEST_NONE | TEST_DPMS | TEST_SUSPEND |<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; TEST_INVALID_HDR | TEST_BRIGHTNESS))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_static_t=
oggle(data,<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;</div>
</body>
</html>

--_000_PH0PR11MB5880AFBCBD630A3241917CC5AF0E2PH0PR11MB5880namp_--
