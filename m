Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106F6C30653
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 05:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05A410E52A;
	Wed,  3 Jul 2024 05:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RptTrK62";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F99110E52A
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 05:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719984039; x=1751520039;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2d7WGS9DxBhQ1aq/J+1YxmVBHz6bfEwgHo3ma+uuVPk=;
 b=RptTrK62/e896fzIhH3SnO6EP0AZYZ31/Mcmb2QLpNSZUeGQUiSaLIlN
 uySpmwnlm20mVgI+stV5Qpe2/LHkrFUrCFoSlnMllCtrNd/c8dANl8/WH
 kNTLT2RObzOaSh0w7lECEgyFmmIllb+UOmPhEGo9Or+QzDw/vhK1CiX0A
 Q1AzIFofHkLlEAaHW7Q13Hx3V8dFyToAUgb3UqwpJsHQMELpTXscxYo4x
 AVW+D2xo1X4BFWmKM0HmxuhKwtV2mZ8988e6XIHimxaMonYpecB04EFOR
 Z5/MAdql8/ycITCf9eZnVDFRQUESBnGGlx9DVLqxYaekWkFSaVeOFGp/M w==;
X-CSE-ConnectionGUID: mijNegIOSueg6p5jJo+PTQ==
X-CSE-MsgGUID: OsugOejeSGSLnc6/WIcE+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="34729632"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; d="scan'208";a="34729632"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 22:20:39 -0700
X-CSE-ConnectionGUID: 2SFJGNUqQ2WUeXP1lLnsyg==
X-CSE-MsgGUID: UMLTIkiWSLe/1i/pphQAoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; d="scan'208";a="77282620"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jul 2024 22:20:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 22:20:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 2 Jul 2024 22:20:38 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 2 Jul 2024 22:20:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1bcNuH2zYXrmfpo2zER9SmPZhVLXa/Lndg5tnPdYLSBXgWyyxkeQwg3oRX3RXkMG+ajQl4PY/e229VC8oKlgzU/M3u5pmmBtAX7rJFCPT5tqerUoYDv5Jk3Ey2V3UbAOL4wVMsJI9BSNOIJzKrPtQmvaAkBTF55XCwELzfXFp6yzowZEUJxq4JpV0TDKz345hiCTjB+Tip7LsmdO1qtC0Ai8kUwRwpUcQEAZj1r9RG3HsMVRnRVZFlIr9w0dalCd+P5LrYAGl8TlvX/0f8jvLN6MJNosgacl/swFBOm6EKz+nqyvo5Ef3qTcKXVrp2NoeZJ44WFYYh/UnGGye8ESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8Bk3rf73TLsIbf92dri7A+zXEp6eybBd539I7NrxRY=;
 b=OcdnrxLGt5n+ZezahW0ztT+fsGULgIx2sT+R8TplHtFQRZrTyZhKwHZE7Pp2gbRtkhv6yzZeFT35VzypRSSDGMfcPAAozna0Vg8xIDLkcj9MidJw4kdJ15G81ZTjKAbhNg8IEQUbhbbSFNH8aaUvSVOT1YtADye7OzBDZ+4fZsDOYBLOWnIqjVcbFgk8RZ8WErzUyG1GnX3e2VxWPw9YFgiF40awsgnO5kDea07iPJ1riVT1J6pihwyaDsdpsiPHODpgXzx0DacJPkFFgUAT5ePVM0GrQHeYdjOLCNMbXo2+eNPX6SiOSmVPV8e/xXLhuXA96DrY7tWymjd92VOqmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by SJ1PR11MB6081.namprd11.prod.outlook.com (2603:10b6:a03:48c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Wed, 3 Jul
 2024 05:20:34 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4db5:b0d9:b6b3:bb52]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4db5:b0d9:b6b3:bb52%2]) with mapi id 15.20.7719.028; Wed, 3 Jul 2024
 05:20:34 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t 4/4] tests/kms_vrr: Fix virtual mode for CMRR subtest
Thread-Topic: [i-g-t 4/4] tests/kms_vrr: Fix virtual mode for CMRR subtest
Thread-Index: AQHaw7jJUS6/IIs9m0OmYcQm0ogVU7HkiISQ
Date: Wed, 3 Jul 2024 05:20:34 +0000
Message-ID: <IA1PR11MB63480D702F2B0E33AB9C3C35B2DD2@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20240621084711.68444-1-bhanuprakash.modem@intel.com>
 <20240621084711.68444-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20240621084711.68444-5-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|SJ1PR11MB6081:EE_
x-ms-office365-filtering-correlation-id: 7512b43e-2939-4205-7a5b-08dc9b1fddb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?s+YjV7QAhtE/ECVpj+MR39kXEIrkp4sgDxVa68nXs4/JAXaOcxI+k4fdj3El?=
 =?us-ascii?Q?HPzTI16bA//hQQSO8O2s5nnSzxK06dhfwa5YD0wS56EsR3qjxsZ3FwBcwFz5?=
 =?us-ascii?Q?FzEC/f04utzyYdfIbXp7QLWNT5vObKcInak8eqX9nmwbO2TUJW/+GiiIYMWr?=
 =?us-ascii?Q?/7Y1iY+VYow48EOzulkNm3XnmSKnFKc/PMa2ify/gfekdB+4VfjlaO0d0qWK?=
 =?us-ascii?Q?IwOXn4K8G3ckXYZHhM/L40xLZFtiSrLo73eSsFqUY5Nzk9XOIDZ855OAKaEn?=
 =?us-ascii?Q?TEwl8N8zpLIrltHTYTixMhhKoblWH40Vfz6UJF1AldW2xEjNSBRyzx6Lp6mv?=
 =?us-ascii?Q?cYY7UW4wjbXPskxxUjJh4swGIXloVkegX0nq8B+InzCjXBk7FbV8oZhfQUHr?=
 =?us-ascii?Q?LP2o5w0XyXS9/c1xGcKdL41ArDvy3BCa8qJ+ICT4kuklCN0CvXajdVMLbYVV?=
 =?us-ascii?Q?NIHKRmgIMULxIf1Bo/LfpKY00Sb7wdRHWfnZXST0NEn7TkY/qA+nUico2c6A?=
 =?us-ascii?Q?xFTVV05V2MZ4B3AiFQ00PQ1MGhUSziTyMosm/NZxz2ggItxUVCbxRdoWkyzE?=
 =?us-ascii?Q?uWaAivl136rdEGWruf4yXvnelZGRkOs6UR08h8WonqiykEaysKFXF5q4q5oF?=
 =?us-ascii?Q?i47HCwcyuYg5Ihih6CF724XK8gRMH/GpXmIt3SMQZlJLwmaYyoNWys7FYSYt?=
 =?us-ascii?Q?emimKDgLAmMnmjI8Bq12E3Cmv3N1Igzjx0M4Bzsbj42Y+34iFhnDbtbTziAM?=
 =?us-ascii?Q?I1pM3bJu+QdyX47cf9kEX8b7hcJC+Y+pPdZKTnqCvChCeiHS67UC3DLP54tX?=
 =?us-ascii?Q?pgQyuggJxWdb038dtPmp23O17GhEWNqh7z4yF6ka5eXQk/Q4WAGw0IoHL2N3?=
 =?us-ascii?Q?bQ2p/5jPLM6S04FjuXiFnEhO1Fazc4JfPM9OKc8/gCjbSGIgMK4+HtbZkWd+?=
 =?us-ascii?Q?we/fHdKP1alMDuQdvo/K/H9gu67rjs/pOFH3PJ1PArPyXPm+KqVpE0o8yQN8?=
 =?us-ascii?Q?3gZ/m8RVQ0xBwKwEZAYC4EVoQ8ZwBBcByZ0DjkZlyywdDPXdF3GBPhL3D8tF?=
 =?us-ascii?Q?UdV0VwaZtP4oQdQXatBj/rkREH1iwyC7C0vSCnrsiDBHP+qEFLL98c85VNP/?=
 =?us-ascii?Q?pCc/FXQQ1CJCoLDVtnG+P6dR2COc5wCd2tK1/Q/zIqIfhCmrzgq7OFn6zhKn?=
 =?us-ascii?Q?SOe2lOxWnXAHd1oyo7MPRwwsHeeb/hSuKxXJyaTddeZtUOPWnPIYBbEP7XoB?=
 =?us-ascii?Q?opHqmX5BTm7+wSYqoH4NfazC9LaTpkaIMPmuEOqthHgEQJN4hf9oa/CCejBt?=
 =?us-ascii?Q?9p9cD5xKW7utf+EGbUZVP1JdOhSoqDdU3oR633PGtjEp/IB8tVC7RdbMsbh8?=
 =?us-ascii?Q?qlbv/Wy9aix8oOhM7L9eH3v5L0kJ/ZOpK605PEE92Qacc26iYQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IKQ+vky09eAGrPEUBG2O/Aw5ttuVbnrvpiNnmzRU4gywYaoX3iNjQdzx/PRR?=
 =?us-ascii?Q?H3Zis+TvgDjrhVigGHmp23lTouTYKHJ7hxGc63LE1T22iIybHPI2+v4GpEGD?=
 =?us-ascii?Q?2hw0tKvO/3rO59fQ4nIPKF9CUFFodyjozJTS0yJwIqfkIAlgf6x1N62gM9OK?=
 =?us-ascii?Q?6i/UF4M0x5kgcK5DLMyA6XfEExI8jQSMtzK2frS7M4TvFq99BA7VfDEnz4rJ?=
 =?us-ascii?Q?2joi9a5jSLjNtGdUvr9k9vYByppHv1GnDkuY2MX1h9eGsHb0TorJJwoKW+Nl?=
 =?us-ascii?Q?j4XKWPCDs/mWdd8c2OyDOicPCUKfUHs+7mTqozI4G/3S85ZMPJ1BhwYn3Lhp?=
 =?us-ascii?Q?oY/aHoDXluG12nXzju1n7alT68OBLaHyMDx2R9z1L8N4u3xANt/L3WYxXo+E?=
 =?us-ascii?Q?MAeYQY9e0AcYZPrZ0+t96/n9Pr78vW+BeBqKMCwOzED5kYLTPScfxVr440rc?=
 =?us-ascii?Q?n9J5qQ8ukbgqHx22YlSBwKlzCNHk4+6FKV4Q+5TOpVafYK0xs4Gd4B1+erdk?=
 =?us-ascii?Q?vmg3IaEdiUf1uYXy/WT6cy7rEhZrtoFYyNvQbhmDBvq2pck3EFMZTSvdl8fQ?=
 =?us-ascii?Q?ryJ/LbEpOZhty1IPNgom6HHGr21gevamkRtTc8VyjKsNrQ3lb8bFA6zsnbF/?=
 =?us-ascii?Q?SkVmbAuYBNVczMXDt8f/8QdwJe0J3oOPqZ2gHPyKQRlzTQPZgWeuTuGFlF3N?=
 =?us-ascii?Q?qc85dy5BNrxLPQtM/5NPet511FlndtwqcXrb+DJuuEySFVTniPbZbB3sTPW6?=
 =?us-ascii?Q?yKNDVn+IVX3kfmjuzm2NEBLo1GwJxaFEvBYU9F1PMzag9S8/WFORtrf7V+Zi?=
 =?us-ascii?Q?iFOOEUfAljdq9/E4NhgWC/LQHtlNLB9cEj8TRLEhpAytQP8kH0cLcjmrO2xh?=
 =?us-ascii?Q?QHGZyYkjTM482tyOZsnqewpolbGNgwyFe5+DCgF//8js058zTW7lt0bcxAAs?=
 =?us-ascii?Q?EQiTapmhkFF/Q5fCdJGuoUY+Kn+TYFiJ9hlZHp2TZp5BUy8Sdk/5Wa1nFByN?=
 =?us-ascii?Q?p3FpKd4QzpJfUTpO75wLlYVJ3ulNdkABB+RlaAL23nRyRw6JCJL0C70vIt0w?=
 =?us-ascii?Q?M4YOG1pJBQrKAgiXty58q8wWdhn2OqLPdfWdbT6uG9x4PKcM4PpmHqSR8LqF?=
 =?us-ascii?Q?x/7IMyE8B73ZKuZlSdZs6jpULe73IsyhMEhc/0KLcqRbf8eukH0pzOsNfKWB?=
 =?us-ascii?Q?fbDU0eBenAg7u+jg6QqYbzXQjFCRUbX/PvRXD4n0lXGJCllJB+F30Ve11Zpd?=
 =?us-ascii?Q?x/ApKKXa8XVbsR33mv/umxBP0R/TJvyDqBuXo+13sBlEFjN7zUGIRjBuOx8n?=
 =?us-ascii?Q?bWkVvQgEI0RRTKqvLhFEu3619rrmxBlWcEhLMC4+Itl+mKpy5XB3dCzwp8AQ?=
 =?us-ascii?Q?7i3aRUf8eCBX8r4t6W6ttDLRoxnagoG9oQMhJWygsmhn7kEfArihQd0Iy166?=
 =?us-ascii?Q?kAknvLmIa7ILnisRZMkvW9/Nl61GWpskzydkpuYyjDBTww//I+d2owWucrLP?=
 =?us-ascii?Q?njwu0Q99gAXdKJemjFY+SuahOVPvwgUiF7M6Ue2IHMxe6J8ds3BHkqWulw8w?=
 =?us-ascii?Q?7FweNlpU2fdEzGWD5A1pufS+Z7tTAWgDABi94IQwqwm7um05WTtiNgKDPTY3?=
 =?us-ascii?Q?kK2cyTRBW0n7XUIdlLQDeKw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7512b43e-2939-4205-7a5b-08dc9b1fddb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2024 05:20:34.5275 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q39yQmiwzOcs+j4k0EA0e2ogaYSc3l5MSDKrhYb5v4ynKv3c9MRhPAtjiSbX3lOe/yZYK7mqhBH8cHofhlegMYjy5dNL/R0j2+3MGRwTX1UmItVWohb76dkPgzDkwt5C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6081
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
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Friday, June 21, 2024 2:17 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Golani,
> Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>
> Subject: [i-g-t 4/4] tests/kms_vrr: Fix virtual mode for CMRR subtest
>=20
> Instead of tweaking the mode->clock, change the mode->vtotal to create th=
e
> virtual mode.
>=20
> Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_vrr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 6f90f4729..f12d23c3c
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -809,9 +809,9 @@ test_cmrr(data_t *data, enum pipe pipe, igt_output_t
> *output, uint32_t flags)
>  	kmstest_dump_mode(&mode);
>=20
>  	if (!found) {
> -		igt_info("No CMRR mode found on %s, try to tweak the
> clock.\n", output->name);
> +		igt_info("No CMRR mode found on %s, try to tweak the
> mode.\n",
> +output->name);
>=20
> -		mode.clock =3D (mode.htotal * mode.vtotal * (mode.vrefresh +
> VREFRESH_MODIFIER)) / 1000;
> +		virtual_rr_vrr_range_mode(&mode, mode.vrefresh +
> VREFRESH_MODIFIER);

Hi Bhanu,

in CMRR, with underlying changes, in response to clock tweaks, vtotal is in=
c/dec by 1 scanline to match with requested fps. Now here with test itself =
we tweak into vtotal.
>=20
>  		igt_info("Tweaked mode: ");
>  		kmstest_dump_mode(&mode);
> --
> 2.43.2

