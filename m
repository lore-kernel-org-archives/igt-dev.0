Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D42CD8CAC
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 07:47:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2073610E157;
	Tue,  9 Jun 2026 07:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X5xc9pRR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCBA10E143
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 07:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780991245; x=1812527245;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZsB3SlEKRMFcVwbMOI+5L9N2vloT2mc5aBwSP8xlL88=;
 b=X5xc9pRRV7ExelR/niF3JsmbRRcTAW6PL1Oud0V4moE6CfvQrcWuv2s+
 ezTDKa9rCNSDfesGGduEKILzUcVAlOeQarEL0U6wplvNFRnrWqM8twYm8
 hHBuHM8GusWkWcgikNVKFC7r8y8lQDPAjLJNxkLRrExZBe4VDnleJ4eoa
 xUXpUdNbNDV6jidz3LlKjPOlRpN6MPhtINZkI9WiaXXhraJguVTgTbYGw
 +9tLkd0eiUVbnLfQQOnVie0AUR0xo9u4tZVWdDPj6rzvDRIr6gucnkIs8
 ym7pPVYvLWy9B+6jzdY5hh9ttd9sBpxoFUTGzADo8I8H7nby9ipA+e0sR A==;
X-CSE-ConnectionGUID: tVLsSe4JQmqiNr8T7+WktA==
X-CSE-MsgGUID: yBfbhoaXTYSUu7QFobfs6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81748291"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="81748291"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 00:47:24 -0700
X-CSE-ConnectionGUID: Laa9IQXPSyy8aM4IV7SAbg==
X-CSE-MsgGUID: PmV9hZKCSueOE0fNdTOAyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="244936768"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 00:47:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 00:47:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 00:47:23 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.4) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 00:47:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXkVI64m3+1nOs5x2SkbX3LVHN6EUU9fSNRwKp+ok5jkHLLsYIQ29kgYzb3ZCHEoBidxeAM4wz7qKNQ66PvMxF5NuhTx+qsRIOSJZRlV4aIdEHOXxBdTROR/SybhFSRi1iNZtlZe91jnPNoTuchxOXY5Io/SySgVY6qHvF62KFzk3zZX3o1yF9d4QJVOCq6oIvyAIKB5H+uAt9eyOHZGPbKjZje+CAJxEYcyqU/71oz6X9ePd6w9FTB5XR1EKT3A4NWIm4KXBS+cpUevHrxszDmOgnkhELsRFXSD4RFUWH76wNfa9kz20KHrE2vd967mZTWgm3f44jbSJsnEyraWuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7UelUmGSWVeEv2usZkyFMIVyl1p3hW05yoyJFJvwPnQ=;
 b=Tkn8V5a12XOLBS71EjF1FdcEb5QXFxq5ww7tMEwIvl4HHc5ODHgsxXP8mCIxprfNEZTERpTndHPbZmv5rJ/kyaBgndrqM0gokrnjCr7Wi9YE/+zJH5mafwRWUhimzXLf1QJYlx0CjEV8t41of29hzdKHCucBOgMULYKLA5QVp+ySavDsqjkpty82oWjoZjpKFyCF6XBQTbHuLyk015dAWfmCrj+N5k2+xZ9+0vxpbgRv6Y7rywt6qK3hbpJeE97tbs1M6mQoNNMi90wBN4cGd04SEE4P2IOF/KF9R5Rl91T+LFIeQaTJq2JN2i6gMZLPiMVwSEte8RN6a+lybkGEKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SJ0PR11MB5199.namprd11.prod.outlook.com (2603:10b6:a03:2dd::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.12; Tue, 9 Jun 2026 07:47:21 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 07:47:21 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Subject: RE: [PATCH v3 1/2] tests/intel/kms_pm_dc: Add DC5 DPMS suspend/resume
 validation test
Thread-Topic: [PATCH v3 1/2] tests/intel/kms_pm_dc: Add DC5 DPMS
 suspend/resume validation test
Thread-Index: AQHc9LrdUi3FIx5cBkC2QYUWUdDMBbY13kNA
Date: Tue, 9 Jun 2026 07:47:21 +0000
Message-ID: <DM4PR11MB6312DDDAB742E77BA02B66B2901D2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260605070235.42439-1-mohammed.thasleem@intel.com>
 <20260605070235.42439-2-mohammed.thasleem@intel.com>
In-Reply-To: <20260605070235.42439-2-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SJ0PR11MB5199:EE_
x-ms-office365-filtering-correlation-id: ea960023-11fc-4c1c-3735-08dec5fb56a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|6133799003|38070700021|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info: 0iLcswSb1qyZRwidNLLOQdembjAqT9oT9Mt0qzxkize/1zxGYEuFJYzA3tC9LozP2Du1vRJ3ozA7PWPNjmv2gmNuACrc40hqObWNz+Xcdo8GHMX03jlco5g9dB+IIDv95kaPxf4WjuuPJ8ZGNbHHo1AR+/yH8nbECQX3xVQHmOqJQjc/rD/x5TH9smqM35UA8Zje9FzNarvBV6zp9ZOgAQuFIZdi3rHyS3DGHN57ATNxbSfB7vnXYwiG8E01+xfoZAQsP/xd/CQbq83yrJBWZNYJ22VhhWu135tZTQ+wBoRtRxbpfC0QUZHXZ3YojWMZMXRxJ5KL0O/CtHppmHNARZcjcHUlHI7NKFdru8JaMJI5ttoGBVy/yn0JTSi1XxqigNQIN1nVA2lWJPaA1Y/Lw3rNc8uUsL9/vULExfJeu+kULCKAqB3dgkrnyR8egTTvrfFaZkGTJgsekjXvnDvEYx6W/ZLHIw7mHDo6++z67q41o2c6gFH/ouTCyzDuU1Xz7znS9OgHbl/faDaKwqCPzjIcADFMkLsbyqoghhFywc4AGyFgLaSoC+6NSpOtSXtP02gc5wkdnTGGyrEKcRunpEM+KIVx9on8zKPLGqJwxGdOhGive4prEEQ39r7u4tH8imqLBwqHMRRV/zIwR9gQZx6tRt6azPRiTaMT98ZHFggKeP41AMSHIQwlbKPtxMqFfiW+zRccU6zc1sPDUvuAZ4JFlWRkFsdRlLrJr0M6Cbw/qgmQ1A7mLsiSHGoXvCkQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(6133799003)(38070700021)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?M/SwR57exbZBzWyTLwgUIlUJ6sIRAStrz4qO6L0Z4O4kgn/yZWVv4ypxigZF?=
 =?us-ascii?Q?wQjxnj0jjLbRYtq0/7Pi0M9cb4dv6adBishHboo4bjkSDACT0F7rP1Sr5vxm?=
 =?us-ascii?Q?AeOGDFZBm/mxmGS72BptYX5+JA8D6/nkg+LMwChGwxPmYXNtZe3lH7jIQr5U?=
 =?us-ascii?Q?rThLGgkT9CetFOTg9xSoY6uSeqxb2aWIaATMRmE+YPfjLiNcaQSIlNfkjKyJ?=
 =?us-ascii?Q?UkQwD1f9GrEXRnrLnYz9rLZI2/nQZGexRo/hiyMq3ZETl4OmTxpaglQCa/yZ?=
 =?us-ascii?Q?x4fBig19zy2mswahTBh4izQdXs130vStjz1L36pjSNY3YCiic5fSoiQLFzvI?=
 =?us-ascii?Q?gARh3bArnaPN43brNHm/tW1nhWT/rpXGuFd8ocdRAIZUz35tKQ0WLSbN8YPH?=
 =?us-ascii?Q?BzvfnEkh/+1m2rGPUenq0AVqK8xUuM0/tjzL8XHZsy05Dl91Wcwzs3zZ3DmY?=
 =?us-ascii?Q?oh38XV2ERfdV+EUrW9tWX2+COn/B5McI9LjTWjykwC70w43sO79/ILzgs1U1?=
 =?us-ascii?Q?JiL4kMncLiTNQ1CORK3f41mTcSieaHfjwW9AQl42uW4FbKjM2U4Bzgg7x7dF?=
 =?us-ascii?Q?h+dgFsguqOQAmEepdNGKrqOnLGRGani61Ys1fJyARrX56SReAYRz9v2d63Iy?=
 =?us-ascii?Q?E6aWv9LRgW3k9DEo/W9kIMsY96HNXv/eCD2lzkfFb6Exlm+glMcdXRKjIUHW?=
 =?us-ascii?Q?e4amoseAROYAIBxi8cVCZr9zmvZiEF+MV1AqZ0ee/yINSJAqQuLfWsJLPvVr?=
 =?us-ascii?Q?0ZxMn5eyROG7v7JFa5SHdR3/DHFZsOUyVrtIcJvskyz0X0l4sCsVXrR32J1x?=
 =?us-ascii?Q?kquVhcJ2IaLveaRLmlcqDaWBkFU3T3+0Q68NBf2wo52k7CAsZe+npTItvv/N?=
 =?us-ascii?Q?lxrFy9ZdSCsOKNXMC8G3p+EE77HvKd0WUkhXa6XGkNISryw7HZuMdqukbjIw?=
 =?us-ascii?Q?bgoL5lhTq72oj7AljoRofLxQVKjV6xL3gRNC+9iNPLieikbsYjsNMv/GFw0m?=
 =?us-ascii?Q?OYvFZJ8Cs3sMGyWMvQetXITj0yoCi9MqdXafCDDUNWqx8BpY3LkGXPPBvz3M?=
 =?us-ascii?Q?3HPKici1CEIbxxMofuW8/qyYLVUIkx20T6zuGpVsLQ8UUcP0XeITdjyhqzOD?=
 =?us-ascii?Q?2gTF5TSNPg9RAe2jaeot9oChw2/BUpUroAj+1NOes/XFTUlO60iRRhmxHPGx?=
 =?us-ascii?Q?kPq0z3hv3FLFDiOPc3RahmJt8rk9qdJ44U8BVq6tY6rooKLcO1DYWVSssBc0?=
 =?us-ascii?Q?SSE0TlBEgSq5xZ8jeYP7mtRFtHPE0w5A3UlecQhtpwIsNVVkz1EcZoa+JHfB?=
 =?us-ascii?Q?WXrCFKzPTPlXGYO2dr2BKfmoJvlUgiN0NmjUUqU5fX4klekrRSPBGbnZd9UR?=
 =?us-ascii?Q?C9zGBmCrO4UiSS49WuqSnbR6CvIW51ekRqGBParvHM7sGDsyu7AP/Nh9kSqo?=
 =?us-ascii?Q?0NTIxNXSMCmg5mlXtowcO0PSpAnnauMjkdBuYYE7Wc5ckmYZPkmcTHHUMDLf?=
 =?us-ascii?Q?UvPZExbmqGbaHEYkA24EYU4IF4dAVZdcjw9zz7fA7fJwuTosDLOKzDbwSIj5?=
 =?us-ascii?Q?dFcnCAlDL1XBbfxotFVHIxWDClkZxE8AhUyNyd5iX1g8M36nMdfP9BV435iO?=
 =?us-ascii?Q?dP8srwXCmL7VWFAIDVHu9kFA1HSAT4rJ2Q60nIMPcUyybItxYFfB9hlHKP1r?=
 =?us-ascii?Q?Pkfk4BDQmHS5r3klu2y9/pYVdJOI9vA9Bd/dYiood0g7G2N3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: C51H4rFPtxaeJy77mLWybH1zc6yjnyaImiLnHf4svuHlP7tHtIOxkHN4Oq4pxy7Zn1yh9QEi9XiveIH2852Ce2XhESPV0eGZDjDysPWqdakA927UB11si4jG3vhY0hR4G5UQwMbnSEZFg6rIzd+3pxh7TBdIeZ7QOV9zGzydEEpdW7x3VzniJtd+ZBqpCD3PW9MQtldN57pBb+4A4HNWUcTjaRfyiwlV1BL6Hnr4Uirv0psTQqc/RLKOTkg+ntEGK2KEQAV+RtyI7KjyArDOtyCrXAFagmE2VQzcpyilbSy51LuR3UEW8Vh0jZw7O4hrKeh8xt6IOOJUeVWxNMrSvA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea960023-11fc-4c1c-3735-08dec5fb56a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2026 07:47:21.3988 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ylGWWHTVARGHXu35UMOqYVu0gEfF9BeQleAfEVsJsvVaeuz+uUHaAEKJbnjMalOfTEuXmEOKJ01M2RQy754ePw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5199
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Mohamm=
ed
> Thasleem
> Sent: Friday, June 5, 2026 12:33 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> Subject: [PATCH v3 1/2] tests/intel/kms_pm_dc: Add DC5 DPMS suspend/resum=
e
> validation test
>=20
> Validate DC5 state entry before and after suspend/resume cycle using DPMS=
.
> Ensures DC5 functionality is preserved across system suspend/resume
> operations.
>=20
> v2: Remove repeated word. (Pranay)
>     Remove extra line.
> v3: Update test description. (Jeevan)
>=20
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> 423a5c4a4..249d9e11a 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -77,6 +77,9 @@
>   *
>   * SUBTEST: dc5-retention-flops
>   * Description: This test validates display engine entry to DC5 state wh=
ile PSR is
> active on Pipe B
> + *
> + * SUBTEST: dc5-dpms-suspend-resume
> + * Description: This test validates DC5 state entry before and after a
> + suspend/resume cycle using DPMS
>   */
>=20
>  #define PWR_DOMAIN_INFO "i915_power_domain_info"
> @@ -622,6 +625,13 @@ static void test_deep_pkgc_state(data_t *data)
>  	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n");  }
>=20
> +static void test_dc5_dpms_suspend_resume(data_t *data, int dc_flag) {
> +	test_dc_state_dpms(data, dc_flag);
> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> SUSPEND_TEST_NONE);
> +	test_dc_state_dpms(data, dc_flag);
> +}
> +
Wrap with debug log for failure detection.=20

igt_info("Testing DC5 before suspend\n");
test_dc_state_dpms(...);

igt_info("Resuming system\n");

igt_info("Testing DC5 after resume\n");
test_dc_state_dpms(...);

With this change patch LGTM.
Reviewed-by: Jeevan B <jeevan.b@intel.com>
>  static void kms_poll_state_restore(int sig)  {
>  	int sysfs_fd;
> @@ -743,6 +753,11 @@ int igt_main()
>  		test_dc9_dpms(&data);
>  	}
>=20
> +	igt_describe("This test validates DC5 state entry before and after a "
> +		      "suspend/resume cycle using DPMS");
> +	igt_subtest("dc5-dpms-suspend-resume")
> +		test_dc5_dpms_suspend_resume(&data,
> IGT_INTEL_CHECK_DC5);
> +
>  	igt_fixture() {
>  		free(data.debugfs_dump);
>  		close(data.debugfs_fd);
> --
> 2.43.0

