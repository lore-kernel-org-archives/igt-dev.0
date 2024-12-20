Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12570E77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 05:57:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E2510EF03;
	Fri, 20 Dec 2024 05:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XKdwPxiO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6B910EF03
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 05:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734674251; x=1766210251;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fD3tSyeUwSygz69mfw90LV2QDykVvr6v+0viDUi0EXc=;
 b=XKdwPxiOOAtmu7iBZtIfbDpGB9ZvTc+xJrJtV1Tudb4JbZEgeE5ZJoOD
 4O6pWJmGsARY3TDBYFiAdyipnzw7QjaVFPpH0mf4C1XoRmXnEcJogywBg
 EXf2WS7gnfLAVhZS2a3XEbbWCUibtzmDeUbgpiJJJ/N6A24Qe+0ajwRIx
 4jcbe2/I0KxRyQ6YRPx+humRAS80OpiuqW1usFpRTzFYPHDki/s72kBN5
 QoPmtd1eHzmySo4m+MNYzHKJfOV2leR7vcQ5P1jW1zw0v7D6J9KgSnowX
 houFXEn26ELfX9HDVdG5mUxMFwvC2+IDLxrrkIX5Qrvhlje4sJnCMq+ST w==;
X-CSE-ConnectionGUID: nFJMjfMLQoKFreyvToJRAQ==
X-CSE-MsgGUID: qixdAwd4QqGRCikMBCDYDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="45819408"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="45819408"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 21:57:31 -0800
X-CSE-ConnectionGUID: nMwkydM1RuCnzDHXOl2FSg==
X-CSE-MsgGUID: G+1+gxtzT+6kaU25J5LfYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="98317730"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 21:57:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 21:57:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 21:57:29 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 21:57:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+KY/TRQfNJfCqmqLZShItvjL8T6Rwc931mRdmTSyxS2AfwXg041Cto14BSAQsxc5qbPHwh5MrleVVy8hOkWlCt64PutnzTs5BHZmT2kNKcbxAbGo6Oaditsk4zfS3AnUULKst0sGhUK7/iUmug52KdccXBYYvJ2YL37plS/qnk0Hh7MTAfnNoUxfsQiDUqCJMttnCJbIREN1iNAkQnAdPDFylzaydrrNU9Ulml/QYYrUZLOFf3cFIpO3WUEELZvUlw1AR80vzXEk6UgiBSEw28/Snt+PyqWtF5M0PeEjWpCC3gjvAeMBquGaaGmBZXcNAMLVbOKIc2zFTenYRjLMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqCpX3goVer1msbYaxeyotnGrlDx9u07NNiDmdB4CEs=;
 b=FRd1RLkNt4vUgycZmJw9RSQ2qeOo2HWNGZ1OTZxZ4PhBRL3Tvu2d9tnrX83FqL11qwbeHEUcMiKnx7xXEflDLJAGJ/Tg7uy76bOOm2ub6xGWU425MAlAV7VmzsjlKUzaMj6W7cNtBiD95hum4C00tO2cIjk6JC4FjVNtgV51aDEF1bnkq+zSScVkgQ/Lm/iZLIkLSkShazW10tWhvz0i1yJH7CD5XDReSNGXAXD7Bf+5rmgRnjSl+6DmCvG9KnqoBjn59N5vHhZ1V3nQEIHCOzEKL5K1bDwKC3RtlwW2BcGQSXsCdKBZHskt/9EN40crUsZUPwgKbUCdxuL872utsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH0PR11MB5173.namprd11.prod.outlook.com (2603:10b6:510:39::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8272.16; Fri, 20 Dec 2024 05:57:18 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 05:57:18 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>
Subject: RE: [PATCH i-g-t] test/kms_content_protection: Add HDCP retry after
 LIC failure
Thread-Topic: [PATCH i-g-t] test/kms_content_protection: Add HDCP retry after
 LIC failure
Thread-Index: AQHbUS3Vq+AW+MWxZUKSb2ALmnj1ILLuo0cQ
Date: Fri, 20 Dec 2024 05:57:18 +0000
Message-ID: <DM4PR11MB63122D7422D7617B9B3A3D2190072@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20241218091826.3014999-1-suraj.kandpal@intel.com>
In-Reply-To: <20241218091826.3014999-1-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH0PR11MB5173:EE_
x-ms-office365-filtering-correlation-id: 97261bcf-f9ff-4760-bc7d-08dd20bb297f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?YGosc9HVouJsilpp52/o3ap/tBvk38mIG/W6kJR8Zr6AMyKzREHUpfaz+sIE?=
 =?us-ascii?Q?iNakd2uktnqsNv6voJWTKE8waFVOPB70qhFVAEO7vuOe2TRcPa8kJwend0mC?=
 =?us-ascii?Q?vw/jwpMBCDGhq3ncMzXFmnuIop0hbXMWZNDHss39fR/FQeVZcmCQB8HR57ld?=
 =?us-ascii?Q?wJmmhZv0zYcxHcpUbVGTwFnodARK2wD8XNIISnxOq/HR9NKWZPcS7aot6FFm?=
 =?us-ascii?Q?UWfH1V4uSENVrdPzY4Oy5JK96w2hk99TEcYmWB9Z3WltmyTmVcH3lnyZpjjH?=
 =?us-ascii?Q?bFzaoA1sx5v9KUDGeeCtGYN60QnsMQmz92xp7BuT2DINRBvPMws2OBR8kvJd?=
 =?us-ascii?Q?UzvXGvwQT/6xsKWlCixmoAP+8X4KMbYI+adUYzjBvLz8DZ+8BLseeoKJJsP9?=
 =?us-ascii?Q?6yPyuSS0lFxKTGg3X7LMvobnc4C97CH2ayiKsOiv9MfipZaxk3mvw29KSXoo?=
 =?us-ascii?Q?SvtvtjRFW/4sk302T/V6VhGNNUKM29KGuJoSQQoJ/6KAQfs4dRZcu1+dQfLK?=
 =?us-ascii?Q?9GeY9UcIDLDcBiUr7NxbGKjwOdAqeVeV+6Yr3dvpEcfxhYaMXu0v4sP2Ufld?=
 =?us-ascii?Q?pRVN+qiWmCu1Q+5yoOpjlj+I2AmNfx1nYRVQM7EvNK3e5ZVH1JWDWUlA6Y8h?=
 =?us-ascii?Q?0PJDt8MYOcMxDjaOVx301OkZSWvMEdMD+jjQiu3poVCQVo96p/sUP4MIqNno?=
 =?us-ascii?Q?WtRjyNvBN9uAjNyWEEGtBU/rn+xskvAdgEUocp8RNNxQbb42yfh9813v4I33?=
 =?us-ascii?Q?mo6BG+Ds60ndquufPaGRntGvruE4N0DDUV/FofwXi9qDL9wpprXKbaCgFiT0?=
 =?us-ascii?Q?IeNwpfxjvc1i6qDY3dad5fIQv2zDbYH7CK37ISy6IZvBeubM/FKragPmgpJa?=
 =?us-ascii?Q?fjOo2sMMvPFEfDGeIUm3e4wCOQydNtUTgLza5izSjvLYlHT4ODfh6bhxXfUp?=
 =?us-ascii?Q?tIJq/bozCsUvhsdEnOpQPBF3B2ouG0f7SkJqHjh7ytiGmHoQA0iTFp6ln6vr?=
 =?us-ascii?Q?Ia9R8L41HJTF4upK0hYXU/dEfJm3yR6a3E7q8qG622uPdaQROSeHqxFPvcY2?=
 =?us-ascii?Q?OyNO0TSFtaYU0wxQDHffwtKANIRe1FByUs+OfpBz54AKTYGV1oX9W50yBGY1?=
 =?us-ascii?Q?mjd1jOkj7bPAlY5ebpMWLIrWDf1VDNSxTyakTtOEomfdV3CKuK4DKL5qrbeN?=
 =?us-ascii?Q?JJpEwW1d2e6lETnTk9snmSeVveANr/vWsvBywSICuy12HxUOsXMGjzRqpbUQ?=
 =?us-ascii?Q?ywOnDMNIABtpCYURLfgl6AeS9+RDV0PETzEGb+Pr9fMmvg5pQh1tot998Yvn?=
 =?us-ascii?Q?vtnuySYtOMejNNWPqeZ0xTjEeHzliwM7O2o/YzP1gY/D5YoDmE40xUgUAunT?=
 =?us-ascii?Q?QH1KUN0hT2F9Ik6QCC6JKxSk/luc3hQ0Md7uoSy7AnLUrwr2AOD0ianWzA8D?=
 =?us-ascii?Q?Mt7aqyDK88QE5uqDduesOKB8Iu86+Xpx?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tJEqaSnnwI2ncp7QQP/BTgc/iZm6pDY+x1e2uDlni9KnP16TE4/YXEl8cI3R?=
 =?us-ascii?Q?MDXJJ22D2s7pDuDKDWOudsTBDVWrAPixvigFl7s02q7sf5g+Crb8hIuCqzHU?=
 =?us-ascii?Q?KHSUaZ4pkNoCigY1yjIfyfBaTsz4UcWkvKa+8JN7qLtB5dSDMVXIBVIxRi5S?=
 =?us-ascii?Q?j7DgVdbiw1WHpZVzbWm+f4rPcz9x0eU33h/e+pMRQHoEGdP3pKco7wQWY5Aw?=
 =?us-ascii?Q?ldi2ltEnIjmbwICU8To7Yf/wDEkj1yAZ86pyCEtBNLfwnUUFbvctrmGEv50S?=
 =?us-ascii?Q?5ohbgADEDNbGItJdEeQ8UKIXcJuX5utbaQfnIOWtsikJDOWEC8Fl0AGhsWk4?=
 =?us-ascii?Q?l69pw27c/nlk8aC9ZmncI4Q/wdKm4+nKGlZ7Pc2zFUvhF1nzNJMjL6lOv+5m?=
 =?us-ascii?Q?otJ7pAdjRbTJiXx8yxKbho8IJvLfMw+MYYkfg+F5lSGeqC0P4Q3q8Myvi0M9?=
 =?us-ascii?Q?UZdMvF9ogyYWDrId4ngYpL/g6bJLGDpGw64nu79dacgDnrIjMKWQZtYeluFH?=
 =?us-ascii?Q?du+HuzPNmi7H+PK7bkmeAYr3a27+K3auoyEcPjhVMfQVNkvbbo73mFHkNVQT?=
 =?us-ascii?Q?rcO/gQE4jks8lWFb3WQz8UKYg7h1yacpHnD3k1N1qLun+vjuwsHCPozjz11Q?=
 =?us-ascii?Q?B4s3R9FmNn6NlRKFHRST5x6429C52tqxoCOSd0X/4sQwBdCVYSg8xheeB3bh?=
 =?us-ascii?Q?j0MJNNsD01IsKNo0Bg/F9msdH+ftn4EMHLoaC8I6L4N6S6MVNnatGBXgQToB?=
 =?us-ascii?Q?fQGrQx6FmEk97cRs8bf+LGthY9ZkTg97iWpP/LH//2GbWM0/aVTxP83skCfZ?=
 =?us-ascii?Q?WnojKesZYGUfnBjNTngrEHa80EHzYftg4n4PoV5oNBnGF7NoT1fNv/ylr6xN?=
 =?us-ascii?Q?4bWs5psHoI0TO11sxrbXi+VE4toyR/7zt0uEyYD9WjhloGrGqdXJIEheB0eq?=
 =?us-ascii?Q?PPlngL9wFki1ya1IEKidLUmemn0ctTe/GVYBgnpuVNvrfdyDWW5xAw3LkIy/?=
 =?us-ascii?Q?obGKOlaIpZp9BkZUd8RY1iXdmTtrbNNkZalQr1lBnYTR2dpUK/aBsZxwCvgu?=
 =?us-ascii?Q?eYtlPUDHA4LnzCUwT5LB5CmJojrxR5xr36GUW8Hx2jbn4zcDiHuKMDNfc7fA?=
 =?us-ascii?Q?4AMviIqAFVkfr3ptur9tDs/BxGP6LiVqMXw1c8SAyQ3TFbLkPgmPMLS9udPF?=
 =?us-ascii?Q?MWcyMgZpd8iYDIxQuLTwabus29T+2Xkq61MumMF7eIol8ok5X66vea6E4GLC?=
 =?us-ascii?Q?x/4YF0zZtZduS1UzfwF/3AxkCESscsRkSdrjDfQX8Yh/3OkghimGZ7VCfDty?=
 =?us-ascii?Q?D2b7rXriT5/21paUjfik2W1yB0B9aWPGOtqJGtcKl3H5nFuupRWthABO1+5Q?=
 =?us-ascii?Q?aUj9f+vPmLVdA5Fef3b2C2qxWRe2Yijzt1OqjNStnZwt6vMnNjokVmGmbvnn?=
 =?us-ascii?Q?9C+Q1oXmwyOTs7tggKA5vewIW915sVVA6AQvqkcRi0+VRn5sTVRvZCtk6Idf?=
 =?us-ascii?Q?bJ0zYD0LeRBnLgmvwYPBTmuxNK/DskbGLOt898QpTy+xB+kGBDaljpd6AyuO?=
 =?us-ascii?Q?RSCmSUZttk6YGzB7yL4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97261bcf-f9ff-4760-bc7d-08dd20bb297f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 05:57:18.3125 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cdlw55fbHEbVd4SYIJ6WcfDWJbFWLemPe34rnWp/U0pw8F2EnW9yyiyoZi8970kULROZ02fKW0wdLRiKqUjsnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5173
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Suraj
> Kandpal
> Sent: Wednesday, December 18, 2024 2:48 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>; Kandpal,
> Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH i-g-t] test/kms_content_protection: Add HDCP retry after =
LIC
> failure
>=20
> After LIC failure HDCP should be reenabled when retried in the subsequent
> commits add function to re enable HDCP when LIC fails in IGT.
>=20
After LIC failure HDCP should be reenabled when retried in the subsequent
Commits, add function to re-enable HDCP when LIC fails in IGT.
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  tests/kms_content_protection.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>=20
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index 04dff7a05..5b3e8f00f 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -373,21 +373,22 @@ static bool igt_pipe_is_free(igt_display_t *display=
,
> enum pipe pipe)
>  	return true;
>  }
>=20
> -static void test_cp_lic(igt_output_t *output)
> +static void test_cp_lic(igt_output_t *output,
> +			enum igt_commit_style commit_style,
> +			int content_type)
>  {
>  	bool ret;
> -	uint64_t val;
>=20
>  	/* Wait for 4Secs (min 2 cycles of Link Integrity Check) */
>  	ret =3D wait_for_prop_value(output, CP_DESIRED, LIC_PERIOD_MSEC);
> -	val =3D igt_output_get_prop(output,
> -				  IGT_CONNECTOR_CONTENT_PROTECTION);
> -	if (val =3D=3D CP_DESIRED) {
> +	if (ret) {
>  		igt_debug("Link Integrity Check failed, waiting for
> reauthentication\n");
Can we change igt_debug to igt_info.=20
> -		ret =3D wait_for_prop_value(output, CP_DESIRED,
> LIC_PERIOD_MSEC);
> +		test_cp_enable_with_retry(output, commit_style, 3,
> +					  content_type, false, false);
> +	} else {
> +		igt_assert_f(!ret, "Content Protection LIC Failed\n");
>  	}
We can rewrite a=20
	else
		igt_assert_f(!ret, "Content Protection LIC Failed\n");=20
Avoid {}

Apart from these change it look good to me.=20
>=20
> -	igt_assert_f(!ret, "Content Protection LIC Failed\n");
>  }
>=20
>  static bool write_srm_as_fw(const __u8 *srm, int len) @@ -452,7 +453,7
> @@ static void test_content_protection_on_output(igt_output_t *output,
>  	}
>=20
>  	if (data.cp_tests & CP_LIC)
> -		test_cp_lic(output);
> +		test_cp_lic(output, commit_style, content_type);
>=20
>  	if (data.cp_tests & CP_DPMS) {
>  		igt_pipe_set_prop_value(display, pipe,
> --
> 2.34.1

