Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86F6CD98C7
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 10:35:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8E010E458;
	Wed, 10 Jun 2026 10:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H6C7tz8F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C4410E458
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 10:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781087716; x=1812623716;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qA4EtU3ciGeVVRW8Ie9/DsYMAqHHR6qCuGl5pcaLyr0=;
 b=H6C7tz8Fs2VV7xtY2IKBCmvavQlApXZIDlVIqafPwSe9jQi3NeZDqB/6
 RULyjr/HZU30zC+Qo+UhHjlSOmBsRNo/NZTuj7faLMALwpOsR6/pNLEd0
 E/iSJBhlo9TKebR4G9SBpiQaXQyPX++BoqYQnqHQJZOr6V13vsCAJPrYQ
 +hT/oFd7switmgtt0UKV7MecgGpZinBv29ossVCmURS+wgh5PR6nKwoNw
 PW/d07vnHpGrxb6jM5KesnCWnUBevggzqn2pNHVhKa8vOSpscNukuzk6+
 RNInW7wHgB3DtCSk7UQKN0KWEhLaDJeduOUp7z3vumZcxUUZxDOBEtz/K Q==;
X-CSE-ConnectionGUID: yaPsGla3SaKT/hTQTlLlYg==
X-CSE-MsgGUID: rb1M0I26QB+b41SKh/wyUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81919652"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="81919652"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 03:35:16 -0700
X-CSE-ConnectionGUID: WbcscPE2QA6jdhkEByMx8A==
X-CSE-MsgGUID: PKuj1GjEQna0gsNyu1/ELA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="243169634"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 03:35:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 03:35:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 03:35:15 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 03:35:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Em8enclxessFKxGyfXopXZRj3V56zgTh90UzNzF3s+8XZiE5JxblYxptBKLKvhUXNqYYihIdkZ8gtRHWgK2C0DvvDo3rBNOQziVxliRC80YN0dpIgV4Kr0s7ywQ9dsZVatdpSXq9tZ+Z3pk7EKKBlPL14OFRpqje78YCnJylLqOC/dNqSCx6tytLoENSU7MQjBlzT1/zvGh8cy3liwEN1+j5mAGk4d8Jkebzdg+A2jVZkbu7EtGvg36CpDOEWsK6Cq3on4vc81TPrgJwBGyCx95nNN0XEhAGbru8IHNtoosd2Xc7uzOyJgrdj+bOm7lc+Tm633w++P/Y3Z9f4rNYMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aS8ctPgI8nNza7RPaf8BJfktE5Qk04LAKvUN16Cl/c0=;
 b=LzPwd0gIzEZZ1P7yaU1cKhYK5j9XJ56PDDH4DrDkhHBc1glUuQHsIpRWu9lSucZJG+Iikdl5J6l29e/ftco2m/XdpiY9djhFaJ2V0Vj20U6ZN3ZCY1EOJHyV4Z88WyXWdhIMV/SifEd5OVZOhP9lsEZ1mxYMvjjFZIQkGBUzPMUfRxIYGpZmdgBXANG9w4FJzCZvSjPseisS8KDHRUGCtqL3VnLxg4RQeOILHK5ip6ZOd0JvHdR1NjgW/R6Ko5iqMkGyNZ07H8f0srV8UpPq2n5G4r+85hgwDGjs2iERBlH2gGbTc4LtGihflZsFzeon0mi+kBBE2VY7X1Zm1um9KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB4926.namprd11.prod.outlook.com (2603:10b6:a03:2d7::16)
 by CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 10:35:11 +0000
Received: from SJ0PR11MB4926.namprd11.prod.outlook.com
 ([fe80::50b8:e73:5783:b611]) by SJ0PR11MB4926.namprd11.prod.outlook.com
 ([fe80::50b8:e73:5783:b611%5]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 10:35:11 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Hogander, Jouni" <jouni.hogander@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>, "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v1] tests/intel/kms_psr2_sf: Restrict ET validation
 to eDP only
Thread-Topic: [PATCH i-g-t v1] tests/intel/kms_psr2_sf: Restrict ET validation
 to eDP only
Thread-Index: AQHc+LwT+sIfCNZVck2HXvxZNXMTc7Y3j93g
Date: Wed, 10 Jun 2026 10:35:11 +0000
Message-ID: <SJ0PR11MB492639B8E48A7A7ACC2C4A0AE41A2@SJ0PR11MB4926.namprd11.prod.outlook.com>
References: <20260610093215.979237-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260610093215.979237-1-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB4926:EE_|CH3PR11MB8441:EE_
x-ms-office365-filtering-correlation-id: 6cbbdf46-77b7-4e43-2363-08dec6dbf32e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|56012099006|11063799006|18002099003|22082099003|3023799007|38070700021;
x-microsoft-antispam-message-info: 102e8JHpaQGXFqwuQ6XcAHaThnXpnQ5e45Hxt86ppURCpl/VYtk1DSp6m2ITyBE82ROCFA4WHdP0HaBAbOZOZJ76thjjF+xkApFdhkLOE5jKwnn8Z0vu3PBouIn4dp0cL8660OiXy3+8eogA/VxLxSzfM4MuU9m9ZxR3TnMSZDWkMmt9+NPdokVK3xyrzx/dDxtbLOD5qUOZwP9yIDbWB27z9yk+XvIMQ1xnC1scfXzGD9v8E2PfIyeJXvso897SWw2VKhgDNPo6t5RoBGmbCLLgnq1NUE8RWmO+5d/WTgcrLX4Zi0j20sBQqv7fxSVb4NY92z3UJooRgC8wQiNe6Bv10OGnKJBZsn20ELFLvvRqGpPsgcfQy48DyKCJN6kHPUlbGXjfjTG3uG9GA5ZAn8snSG+1IaoQCcL9rqh0cfkj1eef7ntOrRUAK5RQ9UYpKXq1NI7qx4Ge4rYzfGc4HL1dMdCWMY1uxatcNja5NLPD2s88Ra6E4Be75EOiF5p5V+Xjr6OlITby82l1RfAKd6wLV9bnNzufho33ciYZz2kKxzPneLCioKARBlwMGJzYf3at5bGKAKpoH2UGygtlwhFnHcaXnbUvAGD8n6Qc2pgMfneqwyJI4vwpshq9SmZLmKSOAWuVMcv4GEcTrN7lOCVzLLpBUnQ9DvHv7JTjhtUxjwCQ2otjaA7E/rUVKon5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4926.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8jeoOmTF7IoH7mBRRwXD2vfUNE4VmmmadcBX1tQpJRKBJaLYWvsjbL2iijxI?=
 =?us-ascii?Q?DeMwyZnbZITozL4J5LYbIHiDPJxZ3wtyBUCWsGs5/BwA8o6Mjv8oifO9/9+4?=
 =?us-ascii?Q?IGoTrH1CVlr2oossPD7rCWA1HIH/YB4qP/tj/7OtKX6/J+ftpQh0yNzUixDE?=
 =?us-ascii?Q?gXw8XNgHeivhlDWpnGOJnxY2mL5DKo0XB/J4nGfVtDQAVCt5ttvQbv8Dq/Wp?=
 =?us-ascii?Q?Xo13hQmcvORJBueptGxVEXLL1uuDPzRPsaxXFIDJXXdH/cmZn+4MswX1lO1a?=
 =?us-ascii?Q?NKz3zHKYGjvU1Ue+GC8HWz2rtG+Ymo5Zw6CzaT84Dx2BOMdEdsk0S3xKwl5X?=
 =?us-ascii?Q?b2QivNLeW/lTU48Ht3j+T+Car45CRSSjBDkyxZ/sirLOcTU0g70a1sWdWcKs?=
 =?us-ascii?Q?7ZutsIA2i5xJDLrQEKvujhe5ONj6aN3HNFF0e6VT2KkuW38whqqLLI4LqEMw?=
 =?us-ascii?Q?0VogVD2T39H+F74+dq9kyBLUco3KKGlwYSKZkAUUHmK8XYT8Hng+y+PrNZfC?=
 =?us-ascii?Q?rBxzgsw2IWo2o3pvCEjVQ2/xYLvP2ldU6oL6SM8O48aCgPEvsN4GpxwQx/U3?=
 =?us-ascii?Q?01aymQoLQlMjp0VpOUQk1swnqL48S0kcAVCwepBKkeKoGa7I8Hhq+GlJFwvU?=
 =?us-ascii?Q?ZSpkaswp8GcLKuQWbthEnXJDqGnMq/2y79beInTEOXKcB7FY2DOcQ1DYATCj?=
 =?us-ascii?Q?ug+JU5a4DGEe39dWGoU455ABWTxAef60i2TzpMJPtlevEP6gzlht35swycOg?=
 =?us-ascii?Q?p4SOJU95OlPokcjdKL/mUHWCaOL+4SgQI6Y/dm9kNeHYnbKU4FrO/pzoACdO?=
 =?us-ascii?Q?tdRJgm0qjifO893/9o4y9GWLeDaDQjj++gkcYAOQmrkN8dD2lhii12yNUilI?=
 =?us-ascii?Q?WczkVqqts+Pl0tp7vDuewd19MTiDbVtSuTxk3bqcqS4yVOA3fGr72qSW21Y4?=
 =?us-ascii?Q?of1/J+X94aksMVp/A7p51E9VaaMCDB7luB9aILgpMx2K23qjRf1EJZWGFUjR?=
 =?us-ascii?Q?s5aU83nWJhX/DRhwIOwSmyOWqd2vNEjqqk9mUQgD0vFg9KLijauOIL1nrBGI?=
 =?us-ascii?Q?c9s4BYpp81oJJvJDXczPu6AXRCH1hzs4bKV5Y4S37e9QcPQznjST0RnY3Lhr?=
 =?us-ascii?Q?jgjUpIuFUcoVw1eRV+9jyjiZjfLnyWk5MmBiZrbg4JrZfm2yUmMfeEVzoR1L?=
 =?us-ascii?Q?lVCbFXJp/Aw9gUGCn+XPISrLQBq5rBOZvg55OiLT/nJHtxgt1boiBFuQwsiP?=
 =?us-ascii?Q?+BoeKZGyv0Qk9McioQrZu3uHd1mycNcX6+h7tqMGThiFUcdj1NG9u2A5aYSG?=
 =?us-ascii?Q?ntsl2KFrcWUyMZKWZcJ2U+1J7r9FDc0U7YX2OhnY/Phsm3SYjNihF6QY/kaA?=
 =?us-ascii?Q?N6Nwo1iCe5iBVECNZ6fxH+W9jPCoJX1R5QRgs+vgVJ539BxGBdnrs0waltvm?=
 =?us-ascii?Q?LfjxOymAP/6nl4uokE4rkLdbMk36YgDEfSghrW2NMXRs/6VZBAuprL63p/ly?=
 =?us-ascii?Q?8dO+o+ek426l3dxUhJedBeQcgBsCENlYs2jJOam40cvQVXWEzbQrDr+zcHvC?=
 =?us-ascii?Q?UGeT2gPIdtxhZTuba0aQ875X/YKVKW6kiUnOQQp925ppXlFy+coeTrsmtVC5?=
 =?us-ascii?Q?1ASnaevwDWielLwtSBvuP9FGmIwtwmuSKpkWh3wiR8shOjjxDOSa8VA3SmPS?=
 =?us-ascii?Q?OUTtesphtSu6k+T7ntCrGO7dOrim09MPFcJTkjfBnVLQ0M1srhKcgVLTV3nv?=
 =?us-ascii?Q?+rRQIrJ6NTtXUvYnjilV6oiRYrpI+ro=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qUhyW3V+8JKMZCsZJnHyL/vYsck6RvQJGF7HnHn/KTTjVTS+WUfwq9/iV3cURRcF/wfqLsLzQGaJv4CfF04Ur9e159vAi+el8TxrzmaAsnKneu/stcA9vFslvmdg2jyfV+x3bz7dPj95CsTcmrJRaGPe8AEtCuk9yEfLyY8vTS02HsZFb4+m5XY5s9DJnFYyHteXMwro/+Z+u10h+9iGUuJteFtvhzhobSEJUICdxBS6JEYSgjR2iPWASDJL3ypWRg2yxfPuks45nBpxgLi5yjUzITfxlsLhnlftl7wwCl7Rd0yJ9DCvGhIbBRoG+yLveSRXlImsHwIQuve5xdvtKA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4926.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cbbdf46-77b7-4e43-2363-08dec6dbf32e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2026 10:35:11.2983 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sz+nxUA3/Dmu/6n3RQQTCriqUeFyGBcppAOvtg881L18lF8b53+hmx4XUnKwAA3gVLW5uFAi+0hm/kNLxlFT0NA9ZUPFPTDqUBu15UTC4Pc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8441
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



-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Naladala=
 Ramanaidu
Sent: 10 June 2026 03:02 PM
To: igt-dev@lists.freedesktop.org
Cc: Hogander, Jouni <jouni.hogander@intel.com>; B, Jeevan <jeevan.b@intel.c=
om>; Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1] tests/intel/kms_psr2_sf: Restrict ET validation t=
o eDP only

The current driver supports Early Transport (ET) only for eDP Panel Replay.=
 Running this check on other connector types can lead to invalid results. R=
estrict the validation to eDP to keep the test aligned with current behavio=
r and avoid unnecessary failures.

Link: https://patchwork.freedesktop.org/patch/msgid/20240619062131.4021196-=
5-jouni.hogander@intel.com

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
LGTM:
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_psr2_sf.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c index 1c=
c57ad35..66166f3b1 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -238,6 +238,14 @@ typedef struct {
=20
 static bool is_et_check_needed(data_t *data)  {
+	/*
+	 * FIXME: Restrict ET validation to eDP until DP Panel Replay +
+	 * ALPM is stable.
+	 */
+	if (data->output->config.connector->connector_type !=3D
+	    DRM_MODE_CONNECTOR_eDP)
+		return false;
+
 	switch (data->psr_mode) {
 	case PR_MODE_SEL_FETCH:
 	case PR_MODE_SEL_FETCH_ET:
--
2.43.0

