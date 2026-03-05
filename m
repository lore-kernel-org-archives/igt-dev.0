Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF10BEFCE57
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 02:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4324D10EAE2;
	Thu,  5 Mar 2026 02:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ATtdMPva";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2172210EAE2
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 02:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772677698; x=1804213698;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N62TpY2y1s8DqeZUfqnJrjsbR+ydEwv4cT6TUQPRftQ=;
 b=ATtdMPva1oQ+M6QUEy5wR7UhdtmJ2f5IDQdeTIk9Tjz8IMTgBOaUPyBN
 Q92tMosCBwLVWIcoTvTsEbqPUWIBJnGHEP3Gji/nL+2Rz1vTK4wLmPI66
 jRpmnl/PgIb11v7vC73vPU3/uuNpOMRxUbqUbTVg0PY8dqG1tBpA0tzWD
 RjeYRS5HbruYnx97So5sKHGYMV0kyGbHnNDTkAQ+xOIk8chto64R602UW
 EbUX3J/8ggUBxUgvks1mctftUxguNkJ8VjK/SyuZ2CdXZhQHrz5ZwjpCw
 uLWiqaPATlW3WpZqmoQHUtLHho8y6eC1SGCCjMKQHG0gQ37MM4hj0PTbK A==;
X-CSE-ConnectionGUID: XAMmZ9JbRy6+Y1i/14n6Xw==
X-CSE-MsgGUID: AV/mQo+RTaumYzq03vxSag==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73724658"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="73724658"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 18:28:17 -0800
X-CSE-ConnectionGUID: hG8uUt8zRgCscQSJmBPfzw==
X-CSE-MsgGUID: D1rQyKwrQJGMzYJUcFVQGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="223209410"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 18:28:17 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 18:27:45 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 18:27:45 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.40) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 18:27:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bt28gjKJaq715HGg0vgWa7VvNukLN7Cq6sq7OpbayC6MCNXxyiTzX5Zz9MxIxiHCs9h4Gneq5taXjnSkHqh+Md1rN/SLhFkaUJLh/WbZnUgz/GxGpQFLpkG0tUGlxgK8jrHEf8T0Z1QhdJdFNYXnVRcTo7A3LLMmKqBENfkoOFqpzk/t5QQwYv2qGBUCTuGsFWSkkPRB8hWxix61UmjszYJysVIIVxFZsNxsl5cZSHO2ucrMwgxs86Ju7bTVnu1aAaS1pV5rHgrfrjB/BxFPwBMK1QWS3DLUSYhZ4DFxHiglds4/mY+3DTFjpDqUCtdRk2qSBti+WjtH2/t/kszrcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fu3k+mrFDJvEK59Rx7UbQxPtuMeGK3hAZhLRM6sjpxw=;
 b=OmLGcbWBMAC4Gus/HTaLlr2OWfJkpEDBTY1BTznNisqDJZj/xaOxQo8o2Ubbc6oUz4/4Va5B+WAV1SgVTfW1s1GfNwvpozA7/f/EEHWa+dee1jx4fnEXAVFx8Eno3H0LvADwA6Lp9pGCXb/VMdG5zU5ZRer4kublSHz6fOyoTOygAqS1hj0vJRHlW2SjB69tB98hdslU54RY6+8HK9q/aurHtVivI1za21pForZc4DKFOqRAkn8+atYYP7eqj9PGWz8thWE7sjoJcia1vDi9IZO2L3GfNreNsJrXErcV3wZQA4HEA1f1aQxDtklB8O0GbfsLtJCradAA2aa9qblVaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by CH8PR11MB9457.namprd11.prod.outlook.com (2603:10b6:610:2c3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 02:27:44 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 02:27:43 +0000
From: "Sharma, Nishit" <nishit.sharma@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Girotra, Himanshu" <himanshu.girotra@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: RE: [PATCH i-g-t] Revert "lib/intel_pat: use kernel debugfs as
 authoritative PAT source for Xe"
Thread-Topic: [PATCH i-g-t] Revert "lib/intel_pat: use kernel debugfs as
 authoritative PAT source for Xe"
Thread-Index: AQHcrDdcELz06FWzTEWFZjmRDikyNbWfNY8A
Date: Thu, 5 Mar 2026 02:27:43 +0000
Message-ID: <MW4PR11MB71513EA99A9655ED36977DD5E47DA@MW4PR11MB7151.namprd11.prod.outlook.com>
References: <20260305003047.2290389-1-ashutosh.dixit@intel.com>
In-Reply-To: <20260305003047.2290389-1-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7151:EE_|CH8PR11MB9457:EE_
x-ms-office365-filtering-correlation-id: b8e3e38b-fbb9-4694-f449-08de7a5ec84f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: 5mJenYBMuP/py147r0RDOL/6uqTtzAc6HJUy6tajV9rzmhodFTxQprYOhFen06jKSVC0ZJgUIUqx+N41ixuLj0p8J1Q0kjM584bNrPL384ners9LM8nm51D6qGwSFILXlHfwn1LGziSVJGrXK2wVtQwcktyxmrT7pGCMgxMFn+I0ZXG6e8gD5dqVoe5HmD0j3f/Gpa667w8IM8XjD/7/LC3njTAkZyaW4Vtbaqb+u0KKbh3wzJnk4jvp/B5ryRTpfamBnwz5DOru2l0dxMJUi6pS2WlyGJ295gjpNhapbrfawuHQywiUoIHtu+zRbdRvEWtmMdfegeoS5qF0Vwk7XjqPc07dmYnLCCcRg5pYQJdn3UwiOFbKQOLcGy9WK4rmtDJe5JPopiD1NN+7rDumodX+uMcRFts6K0WEGSJfBL4I2cM956lswqhfkhxdcNnVPgL8D+ALUzFCREEdPX4+PaLI7uJ2Yt5FqvGCnFHwxxsy8pE4+qTEBxfg9yE5asaG9CqyFECCXUGB9/JNNsFitERQrD9ZmMA+R3qu4ObVuzSGHADGbQf6J7zS6gKqoQlKfw6Fkw+9w+fxH4ClwgcrTgAUDvHQXq7z8Odf1ZL2kOs8/1dV1q1PbEBXl5JRwUuk3f+bYAVMd0exttVMFuucWc78+n8N7FkE45H/afe7EYqCjU+N6RF8StNidXPDihweIGy6uXMEl2VLqcfMW65RQsBoSDq6L2+7I7H/+dssHdI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KheFd8sDHx+k6z0Jjwlvy781E7lkR9rQbnVJ/D3J7wfupdlfkQeoktAOBEF5?=
 =?us-ascii?Q?ezQQFkNuolar1JG/WOBDChGAmllfa8EYQ+kG3C8GQ00M8t5XlbXl5tOKiT3B?=
 =?us-ascii?Q?yS+Zp0GLL0oK44k3kgavnOa2U4vQj6j0Pw7WYI1LrZDOMzZnB2oFDaXMH4yu?=
 =?us-ascii?Q?PlJzqkmq3CG01/A7Wzp5PP7ZsCu5cyysFe/XAsU0cFU92hsDLm62Azs5tdS6?=
 =?us-ascii?Q?d43aTGfcKCh3y1XGvRx7IUuYF60GeoXTWSY1bQO8zoL12UzhILZ2KkDNJRcf?=
 =?us-ascii?Q?uvdczxmjfTVm1XZ8H72qC9fFNK2OW2GoBIE4kT//6qu98Y5xAa3HOLGkm4TV?=
 =?us-ascii?Q?EgbfaIjwrXXMGssLvi1g+jd50HTZkTvI29lTegMN61Oa2E1n6aVyzv0NJ3Va?=
 =?us-ascii?Q?12YilYWtSe1rJpOyO5CaDV8OnXlKbfDLh8m8eKbIfmkopCbCnyhZkkdtc4Wz?=
 =?us-ascii?Q?Iy2F1mFxOLUA958IdxiASJ0ArOykm/eOIDc1mYNDgQYI+zpsjjytj0NHo+6R?=
 =?us-ascii?Q?sFlD5nN9axeR9iUMBwAQh8Tzu4n1ayrMpxQ5ZBNIHZMELhgCu49KC0mt50tq?=
 =?us-ascii?Q?sAlAUiWzvNZohliOUDWEgphC5AgWY4CVD5GGtoGO43XR3iz654sRv8jhmg++?=
 =?us-ascii?Q?kCkqggqCCFRrKzHt90car0YuKJ/SrvRkAsiJiF7JC5sXXk51WdXEvKq+kSoC?=
 =?us-ascii?Q?CxFxs/bRjfGkwsrbBKEKW3ruOLF6Cmsh3qanleZ84RgesmbC0XLJHn+wFfQF?=
 =?us-ascii?Q?t0JDl2N1DrdkA6ipeMCe054/kusJnWU5JMVYu3Whp2BH8cR65i8HsfIEJbJP?=
 =?us-ascii?Q?HqwAY67pd0OEyWj20wwou6/bGxFrDfXL5DlNh5txEM7RGp9VhrpUpHEztnEU?=
 =?us-ascii?Q?0BDfKd09bzRWvbQEzN9p+MkKE8G05O7lzQnEO+XdDOC+prOnm7CBpsApb+y3?=
 =?us-ascii?Q?JYP3eXWhhIkDQMxFfl3eqhIFAjtTSb8rbDhVYBVNDsUrKTEBjRqvWfiuHOMg?=
 =?us-ascii?Q?UpAU4T2LGrhLapmzUFChZPl+Dn/B1qDZIqrVKG6McGopKIbjKUmpTpX+yaQ1?=
 =?us-ascii?Q?iDprrJAbY9tuDxRYrAamnjcFeqvgAnkSQlwdXt3BanEG4Dc908d0S38xt4VG?=
 =?us-ascii?Q?hec6jsZwcaFD3g0LhGz2DshUivGftlZxa0VR64hXLQSeh5pknnHOM+0IGR9q?=
 =?us-ascii?Q?MHHT2CcE3xwJbI1ee9LDpMY5rkGJrzaVlxrTgVe8dF5lEhZLDIB3SNxJZlNv?=
 =?us-ascii?Q?+4TG/O4PQEnQH7t1zlQA74hfXfxn3ms/YUTTz+mac7rdPpWCt5J1GXi7G7+x?=
 =?us-ascii?Q?labI4X+cXaqixdg3CVt8mKzLbhNkAHZnp3nzmB6Kwfi69iNcHRIBHUoQYpXo?=
 =?us-ascii?Q?MpCOlDA+xbid3+YifBE0c6fhINjcQTInumRSpKErSL5lgOSG4wqBA/ayeMcx?=
 =?us-ascii?Q?LE36y7W1wX14Yv9kdm5Oa3pqt1sHmvIB82snjEdPcaE8rrkKAIVDMDklvshS?=
 =?us-ascii?Q?/Ebxp1ODKkiS+d4WsK0vsmfRQtAOEsEnwuO0cL5Pok8pGGM0L2fdg9PfAUmY?=
 =?us-ascii?Q?ZaGRFoubxlyvGkKfgisItMHvJsQQj4x8iwsVksIqjoS57wS5cE9dEvXjp6XB?=
 =?us-ascii?Q?kInlTrENtASjDY8cnoFSdGU88rmoe1Yg5Akm0sfjV2ghGQ9JTwfuwH1fDUEB?=
 =?us-ascii?Q?0Vgw8VfdBhYqka32uhhLj1CX2WOzfhCpRbCBkmeOypvv63Bwv+Ppl3UIzPc4?=
 =?us-ascii?Q?uVy9U4C22w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e3e38b-fbb9-4694-f449-08de7a5ec84f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 02:27:43.8861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jz7WnHMqzrQIRnQdQmzsmxtJuJFkVnKrErPVdHi+GzRbSXOLdLVASJlml0AegKbUcD13/ClJsB+ieHUNChfWDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9457
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

Hi Ashutosh,

I understand the concern but the xe_pat patch was reviewed and +1 given by =
MattR and with reasoning regarding xe_oa https://patchwork.freedesktop.org/=
patch/706754/?series=3D161927&rev=3D2
Hence, we went ahead with the merge. In case if you feel it's major regress=
ion a partial revert of lib changes can be done.

Regards
Nishit

-----Original Message-----
From: Dixit, Ashutosh <ashutosh.dixit@intel.com>=20
Sent: Thursday, March 5, 2026 6:01 AM
To: igt-dev@lists.freedesktop.org
Cc: Girotra, Himanshu <himanshu.girotra@intel.com>; Sharma, Nishit <nishit.=
sharma@intel.com>
Subject: [PATCH i-g-t] Revert "lib/intel_pat: use kernel debugfs as authori=
tative PAT source for Xe"

This reverts commit 4e59b8e7779b04ba982cd5b17c023511ee2f0ed7.

This patch caused a major regression in xe_oa tests and should not have bee=
n merged. Revert for now and re-merge after the regression is fixed.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/intel_pat.c      | 37 ++++++++++----------
 tests/intel/xe_pat.c | 80 ++++----------------------------------------
 2 files changed, 24 insertions(+), 93 deletions(-)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c index 8660a25153..9815efc187=
 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -96,27 +96,24 @@ int32_t xe_get_pat_sw_config(int drm_fd, struct intel_p=
at_cache *xe_pat_cache)
=20
 static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)  {
-	uint16_t dev_id;
-
-	/*
-	 * For Xe driver, query the kernel's PAT software configuration
-	 * via debugfs. The kernel is the authoritative source for PAT
-	 * indices, accounting for platform-specific workarounds
-	 * (e.g. Wa_16023588340) at runtime.
-	 */
-	if (is_xe_device(fd)) {
-		int32_t parsed =3D xe_get_pat_sw_config(fd, pat);
-
-		igt_assert_f(parsed > 0,
-			     "Failed to get PAT sw_config from debugfs (parsed=3D%d)\n",
-			     parsed);
-		return;
-	}
-
-	/* i915 fallback: hardcoded PAT indices */
-	dev_id =3D intel_get_drm_devid(fd);
+	uint16_t dev_id =3D intel_get_drm_devid(fd);
=20
-	if (IS_METEORLAKE(dev_id)) {
+	if (intel_graphics_ver(dev_id) =3D=3D IP_VER(35, 11)) {
+		pat->uc =3D 3;
+		pat->wb =3D 2;
+		pat->max_index =3D 31;
+	} else if (intel_get_device_info(dev_id)->graphics_ver =3D=3D 30 ||
+		   intel_get_device_info(dev_id)->graphics_ver =3D=3D 20) {
+		pat->uc =3D 3;
+		pat->wt =3D 15; /* Compressed + WB-transient */
+		pat->wb =3D 2;
+		pat->uc_comp =3D 12; /* Compressed + UC, XE2 and later */
+		pat->max_index =3D 31;
+
+		/* Wa_16023588340: CLOS3 entries at end of table are unusable */
+		if (intel_graphics_ver(dev_id) =3D=3D IP_VER(20, 1))
+			pat->max_index -=3D 4;
+	} else if (IS_METEORLAKE(dev_id)) {
 		pat->uc =3D 2;
 		pat->wt =3D 1;
 		pat->wb =3D 3;
diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c index ab519aab0f..=
21547c84e7 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -103,55 +103,6 @@ static void userptr_coh_none(int fd)
 #define COH_MODE_1WAY		2
 #define COH_MODE_2WAY		3
=20
-/* Pre-Xe2 PAT bit fields (from kernel xe_pat.c) */
-#define XELP_MEM_TYPE_MASK	GENMASK(1, 0)
-
-static bool pat_entry_is_uc(unsigned int gfx_ver, uint32_t pat) -{
-	if (gfx_ver >=3D IP_VER(20, 0))
-		return REG_FIELD_GET(XE2_L3_POLICY, pat) =3D=3D L3_CACHE_POLICY_UC &&
-		       REG_FIELD_GET(XE2_L4_POLICY, pat) =3D=3D L4_CACHE_POLICY_UC;
-
-	if (gfx_ver >=3D IP_VER(12, 70))
-		return REG_FIELD_GET(XE2_L4_POLICY, pat) =3D=3D L4_CACHE_POLICY_UC;
-
-	return REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat) =3D=3D 0;
-}
-
-static bool pat_entry_is_wb(unsigned int gfx_ver, uint32_t pat) -{
-	if (gfx_ver >=3D IP_VER(20, 0)) {
-		uint32_t l3 =3D REG_FIELD_GET(XE2_L3_POLICY, pat);
-
-		return l3 =3D=3D L3_CACHE_POLICY_WB || l3 =3D=3D L3_CACHE_POLICY_XD;
-	}
-
-	if (gfx_ver >=3D IP_VER(12, 70))
-		return REG_FIELD_GET(XE2_L4_POLICY, pat) =3D=3D L4_CACHE_POLICY_WB;
-
-	return REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat) =3D=3D 3;
-}
-
-static bool pat_entry_is_wt(unsigned int gfx_ver, uint32_t pat) -{
-	if (gfx_ver >=3D IP_VER(20, 0))
-		return REG_FIELD_GET(XE2_L3_POLICY, pat) =3D=3D L3_CACHE_POLICY_XD &&
-		       REG_FIELD_GET(XE2_L4_POLICY, pat) =3D=3D L4_CACHE_POLICY_WT;
-
-	if (gfx_ver >=3D IP_VER(12, 70))
-		return REG_FIELD_GET(XE2_L4_POLICY, pat) =3D=3D L4_CACHE_POLICY_WT;
-
-	return REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat) =3D=3D 2;
-}
-
-static bool pat_entry_is_compressed(unsigned int gfx_ver, uint32_t pat) -{
-	if (gfx_ver < IP_VER(20, 0))
-		return false;
-
-	return !!(pat & XE2_COMP_EN);
-}
-
 static int xe_fetch_pat_sw_config(int fd, struct intel_pat_cache *pat_sw_c=
onfig)  {
 	int32_t parsed =3D xe_get_pat_sw_config(fd, pat_sw_config); @@ -169,14 +1=
20,13 @@ static int xe_fetch_pat_sw_config(int fd, struct intel_pat_cache *=
pat_sw_config)  static void pat_sanity(int fd)  {
 	uint16_t dev_id =3D intel_get_drm_devid(fd);
-	unsigned int gfx_ver =3D intel_graphics_ver(dev_id);
 	struct intel_pat_cache pat_sw_config =3D {};
 	int32_t parsed;
 	bool has_uc_comp =3D false, has_wt =3D false;
=20
 	parsed =3D xe_fetch_pat_sw_config(fd, &pat_sw_config);
=20
-	if (gfx_ver >=3D IP_VER(20, 0)) {
+	if (intel_graphics_ver(dev_id) >=3D IP_VER(20, 0)) {
 		for (int i =3D 0; i < parsed; i++) {
 			uint32_t pat =3D pat_sw_config.entries[i].pat;
 			if (pat_sw_config.entries[i].rsvd)
@@ -194,29 +144,13 @@ static void pat_sanity(int fd)
 	} else {
 		has_wt =3D true;
 	}
-
-	/*
-	 * Validate that the selected PAT indices actually have the expected
-	 * cache types rather than comparing against hardcoded values.
-	 */
-	igt_assert_f(pat_entry_is_uc(gfx_ver, pat_sw_config.entries[pat_sw_config=
.uc].pat),
-		     "UC index %d does not point to an uncached entry (pat=3D%#x)\n",
-		     pat_sw_config.uc, pat_sw_config.entries[pat_sw_config.uc].pat);
-	igt_assert_f(pat_entry_is_wb(gfx_ver, pat_sw_config.entries[pat_sw_config=
.wb].pat),
-		     "WB index %d does not point to a WB/XA/XD entry (pat=3D%#x)\n",
-		     pat_sw_config.wb, pat_sw_config.entries[pat_sw_config.wb].pat);
+	igt_assert_eq(pat_sw_config.max_index, intel_get_max_pat_index(fd));
+	igt_assert_eq(pat_sw_config.uc, intel_get_pat_idx_uc(fd));
+	igt_assert_eq(pat_sw_config.wb, intel_get_pat_idx_wb(fd));
 	if (has_wt)
-		igt_assert_f(pat_entry_is_wt(gfx_ver, pat_sw_config.entries[pat_sw_confi=
g.wt].pat),
-			     "WT index %d does not point to a WT entry (pat=3D%#x)\n",
-			     pat_sw_config.wt, pat_sw_config.entries[pat_sw_config.wt].pat);
-	if (has_uc_comp) {
-		uint32_t uc_comp_pat =3D pat_sw_config.entries[pat_sw_config.uc_comp].pa=
t;
-
-		igt_assert_f(pat_entry_is_compressed(gfx_ver, uc_comp_pat) &&
-			     pat_entry_is_uc(gfx_ver, uc_comp_pat),
-			     "UC_COMP index %d does not point to a compressed UC entry (pat=3D%=
#x)\n",
-			     pat_sw_config.uc_comp, uc_comp_pat);
-	}
+		igt_assert_eq(pat_sw_config.wt, intel_get_pat_idx_wt(fd));
+	if (has_uc_comp)
+		igt_assert_eq(pat_sw_config.uc_comp, intel_get_pat_idx_uc_comp(fd));
 }
=20
 /**
--
2.48.1

