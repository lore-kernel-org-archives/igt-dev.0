Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3749CF9C6C
	for <igt-dev@archiver.kernel.org>; Wed, 25 Sep 2024 06:08:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6D710E791;
	Wed, 25 Sep 2024 06:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hcDmlVNl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB5A10E791
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Sep 2024 06:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727244515; x=1758780515;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WIvzJIkhASXfPc7Tf7IOOIy+7cflz+ofbKL2AmrXMW8=;
 b=hcDmlVNle9kk5V/JxSDFHvp65ej3qp/+f0Jd4MalqaEZT1jDvpE4JKVb
 PrVs69bnP+zTE33VzzA7B6eXUXpO8+8mf67wifu5D6vMu4uY5ulWM3+Ba
 6KThibr+2EFpLtMnf9+gEEW5GTcgGPofKtf+8jBmRF/qYEJk3t1FJdeuG
 dcJ7ylAcyFk5taXWvy+M0FFnCUku4zM1VC6BLbrd32VBw481NQbnHdgGq
 ZFOBzw3n6pgy9iuCE5OhvCvnqkHO5EO3x74w56SjSLQobVYL9jAmznnkK
 nHy2Lg4n2bBw8Eba9YMaGrQuZs9e/TO5t8PzDfMdf2qA5xJER+BNxsvve Q==;
X-CSE-ConnectionGUID: UubK96BxT+ifRwc2FJLhjg==
X-CSE-MsgGUID: FG47KsRPTFObGb+hb5ByxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26221585"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="26221585"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 23:08:35 -0700
X-CSE-ConnectionGUID: j7sR21FCSGiQLKtLJr0/Eg==
X-CSE-MsgGUID: QCw+H2t3RH6n2XFlA911+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="71807175"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Sep 2024 23:08:33 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 23:08:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 24 Sep 2024 23:08:33 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 24 Sep 2024 23:08:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sSxdStvFumqR6fYzs9ncIQdCmze5a9yHBh0s4j5HV5ND3X7ygAtIfhVCkQNuLzZYUNn1RLooANPCXI5b/HEBNXTc0kxgOx+8aAjiqwxBX/kf6LNtJ9tkXTBfXbtB7FOVsWbOROZP+/YZNgkHJYDQHm34nHv8hgA/n46NNKuS+fDyHH5XfuUIL1I7tASmaUEME4uKIkVyOddh5GZvNlWDhmGm5DxhMJlNwrK1o77JyvCgC2kLdZ1lF29lKNc9QrMrJolQccOwJOhmtXkeK5jWFw1b4TrUu2+7lRvNr9sLBRSnGcuLOYD5r6dRxsdU83TwiKCql70k7EKBLlsIyU9c2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2C5o9Wak3dem/PFcYyWtKyFIZ+HeHqtw5LtIozpiHw=;
 b=ibzengUds7IFEGJGBqX3XRlS2MEar7WZ0WkIYL5fmqmsbQ6m2o8EOxN7DarbjCEIgS1V2VvNcvU3tw2CPtPcxTl/Zdkc3A/+KmnUAIl0MqP0KGU0JOqQlG57202ehRZIl8r5dGIr+0j0tGTETdcLPeqZEr1jiyQ3IgSKLfobNNGnm3bV2dylQ5Sbhe0JTaYT6twD7hVw2axIZObg19GJ0fcPAWVRvdMwsTerm9zf9G5EI3Qz8G2FPkq3Rm6aRs0a/Svp1K7zDykX3aQrhEK1saiBnavVoqPELuqVE8+BKu+dMxW/YblppQLRVQfQCIUoba5fKDwgjc5/daSTKcwPGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by PH8PR11MB7093.namprd11.prod.outlook.com (2603:10b6:510:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.26; Wed, 25 Sep
 2024 06:08:30 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b%5]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 06:08:30 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Garg, Nemesa" <nemesa.garg@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/kms_plane_scaling: Add mode override in
 scaling test
Thread-Topic: [PATCH i-g-t 1/2] tests/kms_plane_scaling: Add mode override in
 scaling test
Thread-Index: AQHbDneic/b/asK1R0+jONxgUVYnLLJoBQIQ
Date: Wed, 25 Sep 2024 06:08:30 +0000
Message-ID: <CY8PR11MB68895DF5228AEDBF3C01E97ADA692@CY8PR11MB6889.namprd11.prod.outlook.com>
References: <20240924114708.2100110-1-ramanaidu.naladala@intel.com>
 <20240924114708.2100110-2-ramanaidu.naladala@intel.com>
In-Reply-To: <20240924114708.2100110-2-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6889:EE_|PH8PR11MB7093:EE_
x-ms-office365-filtering-correlation-id: ebfed9e5-e7ed-4a0d-03f0-08dcdd287ab8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?IfDBX2ijCqPqTTyTK8A+xh2XTwuXWndCn6PD2Jo3CAPA2wFVKM96dGG0CSUd?=
 =?us-ascii?Q?4seHw0DjllmJTh8FmleWStT9j1QIE0SwI6pSbCNjNDE0SCxInjNd4zdoUJk4?=
 =?us-ascii?Q?tWPPmBbU0bE/f0YoYzxQ+vib0E2SLUqa70rRqZtGTp6FGDG7r8P3GSgoHufP?=
 =?us-ascii?Q?uxZ0OM386/1RjuO8FgbNp/ugYyfMi+jzpN+JAIjUdPvIzs3wxQ0yVWMw1Fw4?=
 =?us-ascii?Q?QRr87kxzghHtc6rm6s5Isn35j3OjCyRQdTU2gLOMt0czC0JXzpidSaOBBtIk?=
 =?us-ascii?Q?xhljUedJePR/A7ZdzoXjXbFhc6pWZBih3xG14UayjZFWn5OP/VKVc91wKjxk?=
 =?us-ascii?Q?yNoKp3ir5i0b75or7jo6iEn2t+P0cYLAf442gJRKa+8jmh6CQD9JnLP9MOmA?=
 =?us-ascii?Q?0H4jsNEzeavL8xCHWiDSXFveAcGvo9rlqRfM/m4cX/5j/5cq0jcTa5tZFehd?=
 =?us-ascii?Q?nwHM1GvUicny1W6iQqqH7vzr4k70as3aoiOq0bUh2yG7PEECW/lOKghgPYcX?=
 =?us-ascii?Q?ajG7wzsrHDXnvBW8wQTOsHOcV9sr+hKNRkMAoH2y2KDEOb+KlZwa72zJLG2C?=
 =?us-ascii?Q?bGO/ZJAJWXLNrijZ8k7bHE2e/EPnux0Fdxvg1WVb9F1SoBMHCe/QGTKSgt6g?=
 =?us-ascii?Q?4u9+kATEfD3ZNcK5pyQKZDygh8D6ZcsboJlSMLaUK+EUBVFlJTkSZxEbEaTh?=
 =?us-ascii?Q?Eqx84xoAwZHoOegV9oow9e1Pqoi39KlGUGElYw9R/Ec3KUQela5mhfBGFH+e?=
 =?us-ascii?Q?heNlIjOrnujU7J0Q2t5zEr20Ao4f2odPqwSdFtI1xVVd2hlH+c3eBcqRtBar?=
 =?us-ascii?Q?vbSTOOXqeDYWy9a4DuS1lxr41UH/PVZjk6qY6cooUag+CTj2sbLoRfFhr1LA?=
 =?us-ascii?Q?jNn44PLGGdt75WL3SlT0+sxiDLYSwWSb0npiGQ9obksHt7zmLQZbE1OXfM/N?=
 =?us-ascii?Q?dZGnTQRVNCHrsS6OfLYeK8M+/hVQO9CDuge6XwWG9vGlY3i1GjGPU+pVJmDD?=
 =?us-ascii?Q?2z8zsnfS6SdNRAMwqntTevlYxUsijRMUD9Va0ctYUYIQQwnXPdiJRge7ygDA?=
 =?us-ascii?Q?7Ulri+tSDsb55XKJn/xYmmXHLkvOeZfGEDIxgkBkI1HO3s3xH5ZgCTHwj/u8?=
 =?us-ascii?Q?mw2y1ifL756IcScd7jvUcO9QP1RdFmKyWTUiq+pAjZbu9klh+aqwcMHKrmDl?=
 =?us-ascii?Q?K435O89E1z6w34afGxPr2gSA7UjZoGAzr1LQhWXFAmUuXXSqm6FwsCXvY1WJ?=
 =?us-ascii?Q?A3YG99fRpt9ezQphJOhc34ftF6yJhaz2lzRhTm6U7PlQgFVxHqjqkw4DILkp?=
 =?us-ascii?Q?IHLTdSALsbXbHNbXyIpXWn2Ta0RTZ/GswPcOWAefLkBnFw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xN5wTG1frw9UHH/3Jz/qiks1q2jGJLYa+IU9gsAnPkhpM0k2UJ/l3UPrmpan?=
 =?us-ascii?Q?9kdF26HEKbq4bMQrHOYEI43Udz4HgGxmopzy87wYKbX5rS3tt7qvyhGrMA5y?=
 =?us-ascii?Q?zATQyFO98Z+WGFrxRxALoI8FAVJZCApVFhf/5dKYlDut3z8LYRzehfqKhuxn?=
 =?us-ascii?Q?A/IrFRUcUJpuB63pK0acsgL1uxvYEkmR+QgsNBJqE+txLgTzk4pBEv++UL/a?=
 =?us-ascii?Q?Evy41QW7i87VOTQm+TVcyJRu45TExy3HYgRParueo1WMLKjwjEOxbyAdjq9R?=
 =?us-ascii?Q?HLDWeptmMIfksAMclEHEO5shOzMu3gcarjDelBxBGIJNbWIRVSfuZsPkJYqe?=
 =?us-ascii?Q?UmVgsn4eHJovOtXFmrIpBqjCKMD2PuND9/eaM8QLXkqqc5WDjDEKeh2TTq3O?=
 =?us-ascii?Q?Xy4H/i6UZnCLj3Kxp0fNlU0bPU3tliPSE74O8SEccpUxNqpc/4YZECeUZVBS?=
 =?us-ascii?Q?LdewwJnL3BCEAK/eglKfKu8mvkJ1BQo4xyulOn3NKfvf07w5dQuQGV/8Lup2?=
 =?us-ascii?Q?fdkBccEGK685cR/ZpMMlV8crY2Lc0ZmxoRsYYhe1Vfmxg/3guC4BlbD8Xb+r?=
 =?us-ascii?Q?7GaxtEa5h68mlrgEu3JUdDuRk7W+xBVJfYa7uoMWKprhz8FtyVXKO8mpajVf?=
 =?us-ascii?Q?FfkQMip9Ms+1bTaFaOtO55sv/sOB9U7Q6Wwps+FoDTUSohOLpZvmp7HNSMRX?=
 =?us-ascii?Q?oENoKvGzDSCg/Ha1tiBq+ELsWUmNyWhQo2iKVW8nRd7T+2Ty9h1KFoAPWRuO?=
 =?us-ascii?Q?+5sR7n+sU/68fx/H8OF9VStBJB189LO+FETP4lOXbUMFGPPapro23mG7p9eP?=
 =?us-ascii?Q?N0H7h20u3pDiEfRG1RhIYtta5N/wZWrJhdi0oHc9xGE5Ane7RUxQsMhKw24d?=
 =?us-ascii?Q?rD9H8/V069Cg9hAWQPbowDHHLYTM7okQyWH8hLs2qJbqkkYtYMgZZxE8IgrP?=
 =?us-ascii?Q?IGZfYjY78PVAC7XYcQrkQRox8k6Pn3L0JctRyqY4RUpa9I9xSpV8ypf43MAO?=
 =?us-ascii?Q?op2ZDjUigNm/DX/Gi4sO+yEpG2b2ix1RXfL8QjrCBjLfAA0EA212pY/fhHP/?=
 =?us-ascii?Q?P8awVsq4F9yzT3M5E2eZf5h06vaYXiTnX+EEhwZv/E1iXzph0U6TCHUpHYRE?=
 =?us-ascii?Q?KHe553mKnKdm6n6nIYy97NBMrYexCNqmjLWHf9WQ6l9HzFVSDZusNnfE0DtP?=
 =?us-ascii?Q?bVC3Nj/C77C73Q60az3zaucEKVgJH0fJPiIvEPA89gYhI9X/w/ZG0LwXBCjK?=
 =?us-ascii?Q?j+42UGpiEXX8TZALj5QGjAjtCKJsJWAO0FwJFuyZI4jlhztVfI6T9dlkfTyg?=
 =?us-ascii?Q?TpsyZhK3dFV34s/hzCp8Rb02rjIADJ1K7Vanu48XqzxyylcbJxQ1+5YdbsGB?=
 =?us-ascii?Q?ElSAzsDiqbijAMkD62chzF5Ved/S3ER9vgZZfxraNPojpmS/9SzC1BFxnVVp?=
 =?us-ascii?Q?eqxgJoiGJoO1ngMxP2+5VO0kH13pJYCKWRv8amp3xan9bsLagmUh4PNc0F87?=
 =?us-ascii?Q?QkVoBYCsJT1FSFnxMIs55Nh6LKJB/SEJOutusZRg6JRxQ6IDC0zIbjvyTGsw?=
 =?us-ascii?Q?M9Y/HL7EoWYmWEvNilxYJun2tXGaxOD/HLAVOeqe?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebfed9e5-e7ed-4a0d-03f0-08dcdd287ab8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2024 06:08:30.6554 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o1Bfo6MVrmg2sAKPHpjj/EYcCj1telp7pzOpcvUhNu0z8nxWewUpozkWa2N3hFW1WHzWPmCi5E8aAW73lWYZKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7093
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


Hello Rama,
> -----Original Message-----
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: Tuesday, September 24, 2024 5:17 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Garg, Nemesa <nemesa.garg@intel.com>; Joshi, Kunal1
> <kunal1.joshi@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t 1/2] tests/kms_plane_scaling: Add mode override in
> scaling test

Since this is a fix, commit subject should reflect that.
git commit --fixup sha-of-commit-introduced-this-issue

With above done.
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>

>=20
> Add a call to igt_output_override_mode to ensure the correct mode is set =
for
> each connector. Modify check_scaling_pipe_plane_rot function to include
> igt_output_override_mode. This change helps in accurately testing the sca=
ling
> functionality by explicitly setting the mode before running the tests.
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_plane_scaling.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c index
> bc9114acd..96ceedee2 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -585,6 +585,7 @@ check_scaling_pipe_plane_rot(data_t *d, igt_plane_t
> *plane,
>=20
>  	for_each_connector_mode(output) {
>  		mode =3D &output->config.connector->modes[j__];
> +		igt_output_override_mode(output, mode);
>  		igt_debug("Trying mode %dx%d\n",
>  			  mode->hdisplay, mode->vdisplay);
>=20
> --
> 2.43.0

