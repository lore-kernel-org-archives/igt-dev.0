Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E40CD65C45
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 06:18:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF9210E794;
	Thu, 14 Nov 2024 06:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AxqxqZmc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B05710E794
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 06:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731565126; x=1763101126;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1gVp2LMTkbsYuGgHp7ICS75qpVPjQIODnYRvETnIIJM=;
 b=AxqxqZmcROJmDHXjBND15LbdJ9Mu1So61Rwk8P6V96v2cK3Y6EdYGQnI
 PhAWxua0VzHKV6veHzpHWpsA58yPi5rR/N7kB6B+QNRbcWT+vyW6MtKMA
 X5iDRjAuwYBcQ65vSfYmPqBaLYV4PuJJdKDBhjPVUaDqTUvxNnY1oVfFs
 9R3koMlVSED1oTIpjo/y7nXPzeVYbp0O6AFvS/r3uLEY/+u8aAg9dtfZU
 5FTbIkSWQbkbUxUPVwfCpRt1vOm1hOU7Ulwu5G4M4RMP8pXVt1BH/LqWS
 kbPobeceYhmTVb7pK4QiM4iTXUloLMSmTWXXY2WbzyDdfgKs/4hZFDN3r A==;
X-CSE-ConnectionGUID: mrt6lgBsT/CJdR+kXL/5zw==
X-CSE-MsgGUID: eOZr/1doStGdo3trzn2eZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31660320"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31660320"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 22:18:45 -0800
X-CSE-ConnectionGUID: cRTSi+spTXGfmexvKyIbQw==
X-CSE-MsgGUID: nrUVc9h5QVWlUt+7Qq4imA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="88209223"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2024 22:18:45 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 22:18:45 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 22:18:45 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 22:18:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLkwZEZvtXgU99768rxoAsd4trmtlwgJxjKEJKXKG+wq1foDqTl5EU3+CRL9N1RIXiJcWOlJ9gA8h6cfQgrke6lNVCAt/Q9LWONUrybhdkNNf9okJ+V0k3CnvBM+Vasl4CKaFotg2B/nE19PapPHOWiAt8gFpRq1up0dY2SPkZd4LeVJVgOIKEobsjL8EwdhhPGuHz3IE0oxqsb3BK2sIkMKLYPxLEP++3pgN7gVqXOcHU6hvC+qjC2CmeBqVoiYZw0qic3MGwTDwioAI9OC8xUDtDlm1jQG5H8kCgqFty4wjnzRS/h7nZpRqY4aqtpBqij0VxciwdxDjWkk8PF77Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhpXkvHPwRvflyGmcyxU5LIq2WyGlofX8BGHsjTDDG4=;
 b=VJghDYbTGASdfyQ7JcgjdTt/3wzphDkmLtZYnak1zbywakiRyMdDWz5aZynfnEs/c+Lw9Fn1j5UA9c14SuCKHu/dmgbjlJSmTIZPkhss81pvf+PtNA/1EipsFemF83wVfgZ/1i2xCour1XKh8FOTLMdSigv6F3RInza7t73jyp+aYOeBgMsO2tX9pF2v3A8+Cq2p9ntD43bi+yMKApuYaECR9ic0avGhlxvpojpvWYjaoK4XrGAzimI4kS1Di7qF3Sj7cK7RDyAy5fK1djzsM2o6fpesxajxBMRlShYQHu3UQaJ8lhY1MieBBeRQD+vRTBOBOuJL4JicgHU986ukZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SA3PR11MB8024.namprd11.prod.outlook.com (2603:10b6:806:300::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 06:18:42 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%5]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 06:18:42 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_fbcon_fbt: Add skip condition for
 bmg platform
Thread-Topic: [PATCH i-g-t] tests/intel/kms_fbcon_fbt: Add skip condition for
 bmg platform
Thread-Index: AQHbNbt8Jmi7c4TYlEq+kFRTSSwn7bK2Tnyw
Date: Thu, 14 Nov 2024 06:18:42 +0000
Message-ID: <PH7PR11MB6053D0F630E72A4AF8B5A160E75B2@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20241113110104.125403-1-mohammed.thasleem@intel.com>
In-Reply-To: <20241113110104.125403-1-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|SA3PR11MB8024:EE_
x-ms-office365-filtering-correlation-id: 99e5dc6f-a86c-4ec3-0b71-08dd04742ffd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?ykSCxJ5XFcdbwa3Hmvyj6PXOu/VeKYsYEY96mQfbx7g1AfMCfruQwroGsdOb?=
 =?us-ascii?Q?FysoHv2e/WDyiWNde6uhh6P0r1ZiYIPwoRidOuPw/o8gFoJgfvjX8yDekaSA?=
 =?us-ascii?Q?4Nrdio3QoLYkwQ+N+qAe13nqzKbKUQewk1+n+pxg21W08Bn0oo5EIsnG06Xy?=
 =?us-ascii?Q?wSyhMl1Y5FOF/RisajMsd2+fFsFHbxLJaTNm6/lhwVh1y7f+2yaQyTT504UT?=
 =?us-ascii?Q?ekRzMofV5RwOvqm0juiYLSkYxfzYSa5s76B9KwL1AHvEbQRTdN3zJUtfqZVE?=
 =?us-ascii?Q?M9Y6iaryyq7uzJiKno5zNzT+599oGCpW+NUO4U6cZJu9gG0cmihEtUuSSgjC?=
 =?us-ascii?Q?tR/PvcuYu5DJnvMWTgNikEAOAJetJn26+7+5eRwZ97K71oe30XhCYFbZ9D1m?=
 =?us-ascii?Q?7ewILMy2pzOwXhY5rrkC8xDR/8hEuhLjpN0Fi2+cKs0bWhRbxIadTJ+vfML+?=
 =?us-ascii?Q?SzteZ4Jxc07cqkgNt9dXwfloJTcYuaQqjomOFIoZ2O8AxhI9NBg4kam31gr5?=
 =?us-ascii?Q?RPlRYXlkmAv3JPSf8s7HfG5x0yQkv3PY6XNhgytOCrCPw6T24iS0l2grZImD?=
 =?us-ascii?Q?bW6NN1tgbAp4ia83ZPkrrNM1wQ4xz0/u5QttzFUF4KitXu8nq8jPZsIMjyQd?=
 =?us-ascii?Q?ix0GW03CRx9TEIpk+8LOfvhHSsTw8PNMHdmUpgV4+6POs+wyysbwKtCFszVP?=
 =?us-ascii?Q?d2I2ihhXi5VXS+/alXO9vnxqGhJI43Mwb0Qp8HsCzfRpg3wmaGKKQ3aEMUjM?=
 =?us-ascii?Q?iwnhM26iMGyDylwg4bZpraQ2uG0BJcGCpII7bENxQGPNOCi734TzbqEEGQax?=
 =?us-ascii?Q?rAipj4SpEE528Ylt8W9k1RjPXL2lMPv9CsMYHcuR4M4xWhqIvudeFl6MhiBW?=
 =?us-ascii?Q?kl44FEVF4lRNzlmwu7oT4t15aGegPAx+Njeto23ykZCqorFLlGL8LzhErfI+?=
 =?us-ascii?Q?jS6EJftknNuSejNPhDbniQjEMErTRo2FcDa5CSHB21ZG8+JMOU3wstz8IIwH?=
 =?us-ascii?Q?27DVdmZgJx8aKfdpErrZwxF8PHJpf47nmugAhySR++iMWlE4iyT0kXGwwuwI?=
 =?us-ascii?Q?Nl/QC050n5z4y78+3xFkMy6jFgpBqpiXp3pBFp9e0dfJJVeyuQw8DSBtWk7e?=
 =?us-ascii?Q?HkFtgrOQ03byRB6AFuPcbvTPOF/FLfp4Gz6UC3cUBRUpdDBYPRchCPUSVaOU?=
 =?us-ascii?Q?VpJpZwykJufMELK5Rq+vsqakCuvJUxQZKGEG9iLi8fvqTJC7uk2FEU6x+c0C?=
 =?us-ascii?Q?t4mmxjpgSYeTS/XcRmWjWZlJ9AOXpnao59qu8tq+VNcHLhbhEx6QVbNm2u6b?=
 =?us-ascii?Q?kAnCgebtdbXB3YS6eA55aKB+bOZLghUj5q9HCTUtQkVao8QDoTE7iGx1z2PS?=
 =?us-ascii?Q?hsNjD74=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SgNectKtMCqd4kFYC9O59cq7C7SM0+qZ0NRMSLapvsYuQGN68YDsv4lvNNFH?=
 =?us-ascii?Q?YGGcQE5B5FvtDKTmN8QdWhkyJDXpMU1YPL0SDFS9vOjWApY7TmLh0t5jmUBv?=
 =?us-ascii?Q?aU/2Vv4NX4kBzXFRNAoe9ApdwvGg7wKOU6lQy2hGtsvSMkX6Cq5dWj+MLl3x?=
 =?us-ascii?Q?iKIIgjTLq5goT0bqNXws6GVS2lzmPIOiBXBScJtZCFj3V8/fZW2rA3X13cHn?=
 =?us-ascii?Q?yZHe1S1Bx57IdDMD3jEJ27fcx7yHgQFljU+K1q2nPl1Hxz+VXMN4OAFhuL/c?=
 =?us-ascii?Q?utvCMuqvTtxZhEoLm+i6dMS/xcPyHDxrjY9r2DYcDAi5xLivQG5B9CwjVB5H?=
 =?us-ascii?Q?Eus2TtyY2c6Elb5e5GW7p1DTyhb8w/h40ZAz1ZUGMXX10uaCxT/rcCcIdUpT?=
 =?us-ascii?Q?3VjgrNSfkyxVcbRs97XD6LwDKSAnvWm7FY93jJsX7ZJxMlVZ8epsl/ulGrYv?=
 =?us-ascii?Q?xnX+hkEnaxn2oeNekkyLJBd0TQUrys+yi83snnK6y9cY43R95DJ8lpUFwCiM?=
 =?us-ascii?Q?CqF5UamvWM8+o1BrsiYW3FFq1u2ja+rlEqSAPUlXPW2BxTyvgojACdVL/m9O?=
 =?us-ascii?Q?1Ez6jRVK/8fcM9O6ZzP+o0XZp1L5qq8IqtgirqXbBO2A8lHuEMAcntURB6l0?=
 =?us-ascii?Q?ulK1kY3XNolaPBMvvwmNHNwGINtkr4rte7OD02j2IJisBZXqlNUbgnRmMf20?=
 =?us-ascii?Q?8Gwq6oPaaOnADHM3afrsQkrg31OTYUQetDbtkJHxiaZyk0zcGsnjwFXtGSGA?=
 =?us-ascii?Q?OqRPmPAv8SrhHiT6xGUHd9Yyj4IVGnfFlAaRAAqFDaMqQV3Rbh0rFWfgBPo0?=
 =?us-ascii?Q?U2XobMzVlmrP456EP65z7G1wXQ6kyVYpAKiwSqxC9bwHSmIclOOH2GjayhWc?=
 =?us-ascii?Q?qUnxJSCMXBqNMlnNHW63n2M/NXD6KJd6oxNj6rL1/XGMAGWpanFU4tmqIfLR?=
 =?us-ascii?Q?FVexl4rlzKLq2NZ3gfx3807/vHhY3Xs7aEOLcJAt9ZjSelXoy7mPJ1KGE1i2?=
 =?us-ascii?Q?QQLdtinnIrf8FcLsbmO7AkrVy8AQmn5EAr+F5UPBamZAdLEWHr/6YztG7GhQ?=
 =?us-ascii?Q?MDKwtjQ2VWaGqGuEfySkr/x2Vidv9sXr04JJN/BQBNOO2JnzzD6Yt/UrrQ5N?=
 =?us-ascii?Q?AcASeU2Ju+8XK26Rvqu8pdNbbvHeTgOQJeuaXY98XwY0wREj/ArpVgOWDvLp?=
 =?us-ascii?Q?2PbU+ED/3Vq5H646wi7aFYJJkSSSQ9DznjG4+YCjw81LnIN6rEDmnVNukwES?=
 =?us-ascii?Q?YbGNEuMTxS/elCa2a6vEKk5buY6OU5NzLLwoG8DCLwyuEELd/gmi0IF234DB?=
 =?us-ascii?Q?THh4Rhh7a0ltLEWDAZ3PCUnBx8fL0H6yL494KW0bC0jIeTpml9JOLbu/LWJ8?=
 =?us-ascii?Q?HMiA4fffbmPg05eS33je2kUpHIeYLFuwukUNE0Z0R8L+DX19fwoj22wfqCSN?=
 =?us-ascii?Q?dppYpVDOpa8C4CebYRDkCsrSqRtFNyNQB+dXytbQgtA5T9NSX2nQsVsj2xUq?=
 =?us-ascii?Q?T47eOi0BZd0tTtKlTG+tD0Q72eZss5ud7KurqjvGkgRm3Oad5NVvwSfAx2Gr?=
 =?us-ascii?Q?CoE15FZ4bN5Doxca5z1pLQ//M+N3VmkfpA2yQMm3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e5dc6f-a86c-4ec3-0b71-08dd04742ffd
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2024 06:18:42.3784 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Tf4sH3rPHqaCfdfsYzxDlLlRwx9+H6I+Zy4+aR7+BzQQ/BYa5dtIyTwwHOJTz/PC9BFlDr0B4lEptqz0ukRcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8024
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

Hi Thasleem,

Add bspec id. in commit message.

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Mohamm=
ed
> Thasleem
> Sent: Wednesday, November 13, 2024 4:31 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_fbcon_fbt: Add skip condition for =
bmg
> platform
>=20
> FBC test isn't supported on bmg, skip the test on this platform.
>=20
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_fbcon_fbt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c in=
dex
> ab4819d23..59a000236 100644
> --- a/tests/intel/kms_fbcon_fbt.c
> +++ b/tests/intel/kms_fbcon_fbt.c
> @@ -73,7 +73,7 @@ IGT_TEST_DESCRIPTION("Test the relationship between
> fbcon and the frontbuffer "
>  #define MAX_CONNECTORS 32
>=20
>  struct drm_info {
> -	int fd, debugfs_fd, crtc_id;
> +	int fd, debugfs_fd, crtc_id, devid;
>  	struct igt_fb fb;
>  	drmModeResPtr res;
>  	drmModeConnectorPtr connectors[MAX_CONNECTORS]; @@ -418,6
> +418,9 @@ static void setup_environment(struct drm_info *drm)
>  	igt_require(drm->fd >=3D 0);
>  	drm->debugfs_fd =3D igt_debugfs_dir(drm->fd);
>  	igt_require(drm->debugfs_fd >=3D 0);
> +	drm->devid =3D intel_get_drm_devid(drm->fd);
> +	igt_require_f(intel_display_ver(drm->devid) !=3D 14,
> +		     "FBC isn't supported on BMG\n");
>=20
>  	drm->res =3D drmModeGetResources(drm->fd);
>  	igt_require(drm->res);
> --
> 2.25.1

