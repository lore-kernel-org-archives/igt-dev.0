Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CFFCD98EE
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 05:21:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C8510E097;
	Wed, 17 Jun 2026 05:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WBBZaV4w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251BA10E097
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 05:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781673652; x=1813209652;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Gp374sI9oTPZFrafZzn5jZohVYx3Y3F45dGjYlKbJqA=;
 b=WBBZaV4w0OAL28jtWcQitIBfOHzEZa48StU5bZid9cgWvyYs4cPsktX/
 83XppgRIEuM6g4AHkmYtWbYP+jedtSq6SWn9VBvWTMVCu1STJ1xDTHcoG
 ro0uoub9i6TRSYXjXOJ0ggxSpmH+O7s7001G+bhsr6sGA7J0CgK8eEzc3
 NevmSYfpmMBW3JqIuqU7frZwxZ9Y5vDFqg02BpP2LygcVlcFzky2fyc7M
 oz80zCNwlMd9EL4IjPZfGz2Y+X4R3iSA3ALla8XUrc4pgg1EGV4b49b/k
 I595TG256vSCWUqb/5IpkbLEcYU2JwZoEKSSJOybUNi4voxm2WNAS+pYH w==;
X-CSE-ConnectionGUID: ObtzcHYPRISE260vI3rnpg==
X-CSE-MsgGUID: IYp9nDiaQH+GoMd1vZaxbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="99870232"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="99870232"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 22:20:51 -0700
X-CSE-ConnectionGUID: TxhOCtmQTfyWltzaEpqtuw==
X-CSE-MsgGUID: bSVlULxlTJeqesWyFfLXaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="253078777"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 22:20:51 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 22:20:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 22:20:51 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 22:20:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uYvBqgyFC3bh3s07WHVrW5TCoFWKAeCZkCnGHKECBjw4+VLwL+IuL0ciPuOuotTG2qkXxiZ02iYLmUa1ZhYYrg/RptFcIIvQrUdZI6N63zQ9ykGhqyKETL1hNfnSZTzUDLSADeuuz1ICgQaHhXpB49Kdm+Y+B45tB8ITEoTB2ZoW0RIgboT2RtULEb3Yk6Gk8ID5D4WWTVAXIh0Ti6P7RtMhatuJXvfOQqE2zVV1Xx1oI+bXv7EriRPnHZ164bzg1cnrd4thmecHZTvYX7SqmGf2lMgm3d5Jw2mi7TUvCAbPDVfJUuCZsFWgnADvEp1wT+9RdXPPLIza2szxt7EZQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45O62kv2s95VA/VhQHOaNE1KxObiCU1TFTtVwfgNhoE=;
 b=p/ra2dBzRBQfCrFMEgm/lX+8LPFFNtHKR5d6th1r5mAYyrjZG/7AvyzoeBNCLmr8RK2JiKvH7EgFrQN95IS7D9fmtieCxJCSDXaUzknyhr9Sq4onmlQ4iD8/vO87cIazbVDej9NG7NKfYE+SSwGPH7SnO57ZtoKXSq+8g711aUu/zTbsRtGdLGO2m7oCsKbkNW3C4LEgCtJZE3xfDpzYswkg0bR9Y1BwX/eNmPW9dNyz2PvDEYhoCL0YeIlrpAjAvG+RDiyMKbId0m278AAzgLmUUybOTD35McssF5s1jHhylEnAmHgV0vBCBYR4yLyLldI7gcq7SR24gYcjGMdRug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8483.namprd11.prod.outlook.com (2603:10b6:408:1b0::7)
 by DS0PR11MB9501.namprd11.prod.outlook.com (2603:10b6:8:28e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 05:20:48 +0000
Received: from LV3PR11MB8483.namprd11.prod.outlook.com
 ([fe80::1b9c:4b:c780:82bf]) by LV3PR11MB8483.namprd11.prod.outlook.com
 ([fe80::1b9c:4b:c780:82bf%3]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 05:20:48 +0000
From: "Muppidi, Venkateswara Rao" <venkateswara.rao.muppidi@intel.com>
To: "Dugast, Francois" <francois.dugast@intel.com>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Dandamudi,
 Priyanka" <priyanka.dandamudi@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v4] intel-ci: Add SVM, multi_queue tests to Xe
 fastfeedback
Thread-Topic: [PATCH i-g-t v4] intel-ci: Add SVM, multi_queue tests to Xe
 fastfeedback
Thread-Index: AQHc/auyrHfyx4CQSUupShiNw4jdZ7ZCNEgA
Date: Wed, 17 Jun 2026 05:20:48 +0000
Message-ID: <LV3PR11MB8483F279C2716CDFA3F199A6DFE42@LV3PR11MB8483.namprd11.prod.outlook.com>
References: <20260616161815.3120-1-venkateswara.rao.muppidi@intel.com>
In-Reply-To: <20260616161815.3120-1-venkateswara.rao.muppidi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8483:EE_|DS0PR11MB9501:EE_
x-ms-office365-filtering-correlation-id: 3d63fed8-d814-46cd-239d-08decc3030d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|11063799006|38070700021|6133799003|56012099006|3023799007|18002099003|22082099003;
x-microsoft-antispam-message-info: LvxaGVa4YAPHl6KYvCr/yRFwGAR4YH0auNxhni4teVeENjTFNU2B8m7VWiZb3y/jaSrCkFacuq3KJ35KlKB5bmBnoXc//ZR6ibbieUvnfw0k2qEhJOq1wBrEw+s4XF2LsgIgzaMu3NIMbqfpjnAmeZdX4jdQEK68YNUd2fvU3ciGzpjftM9NXQvdBaeJ6wV0UScWjDJxMI+pUlPcsbUhVESq9jImhtdjnzPzVbkZJCJ4z7FV5NxIDg3Uxqa4NHfV6wNoq8kBf3rK6FhXBixl+bRS5DXDaW26rQm7EZfg1kHg+UFoyaKToEmeHG7kTSN23iP1tcCXgf0QjbAzWOIBYSv6HEGloqpzh4pz9UwahnWrWg0JkDwNcKHqv3+XAuiGx7wiK8dLj6zszMxTjagnv2mmgPzUXTlBmd8iJ8V/HDOlE5hNtvgpgTVm0vSM//N31Ylvo7dEYKW6BswdR9DTmLh+7iwJcxSTeW8MZunDgMBVjyi+FKnwA+PhTAo/N0j2hfTqgAW69B854n7A0fUHQx6tKez9CgnVt7TOZPk/ltKQ2rWQem6o6T7A776N+xrOngVoaPHQI54SstP0f3mm2vX+xf15Q0Y7oQXEl5HEf+tpMx7QVw6CMtJaIYtlRnwYSRAfu7HKiZ5hi0FAnDREO+m8o3gZc9MjhaWj2kYP2wvXLFih7kfjT+7dG3XMOaDuGazIfTGbk3iJaOHGnySNnQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8483.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(11063799006)(38070700021)(6133799003)(56012099006)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z8vsOljouoJS3x3Ha5q+iV5/zuQBYzDupMy3IVJfHDgCD0P7AcGBTq/G7RDp?=
 =?us-ascii?Q?ZIR91LflrCCbgDg0SPDpA+RJWCEcyt2Vw2WxsgSsccM1QxQ973SRPIulN+y+?=
 =?us-ascii?Q?2qm1t+xoPW00oWhLjYvWnUgzbPIl8DqhifwbsJow3DoO4No9hJdPRrQTbO2L?=
 =?us-ascii?Q?0Km6K1Ga0UkoKbonWbzGIKI7cT//hXY+WbZaA2qkVgU7NSjiN+QWeM13+Faj?=
 =?us-ascii?Q?mew6GR56AqopRH4UBKYUKO259K93XKwFtxIIlitf4gNP0UlUxCOIWPBIm/aG?=
 =?us-ascii?Q?3i69E0zDIxATGp1drL5HEZy0kkqmP1ffDLbDt517RENJmy0V4vyNfXDbPCUi?=
 =?us-ascii?Q?UrmU9PQXfeg64qRJdnA/q0JfdRnbYlPWul2psPPy5zNJu8TkvS1i4hoB0oyr?=
 =?us-ascii?Q?Y9Zcuy05/a6f3w4/32dCrrlNoqWl1Ty0Z1ZU/t/rItX83+ON0jA2TvChj3Yz?=
 =?us-ascii?Q?xUA6BbQjYWnTcR0CWgbx9HSfCYvf5TUwjs31+cvHcaTJLejznIYyZEFt2/k8?=
 =?us-ascii?Q?AEHlE3J4TJUtghMKL44VNdz6Nyl03oIcIaQKnmmPaN/qynLlNjepbG4d7+hX?=
 =?us-ascii?Q?GHsp1SdxJh6Kco0pQLaaM0jexGEemI+phEk5vm1eUl2hDO5N/6Xm7ekEgtnt?=
 =?us-ascii?Q?w8M9Ds36ts+/Ma4nQ9ZN4oWW1qW2iwRE+2IcKT+p2x9p2YYDaIdDg5vnFhBH?=
 =?us-ascii?Q?RnIYH+rIAie0muv0Gw5L7IWlizsLFXq/sBrCAgfGkvvq5r/UWb+ud4zOo2gg?=
 =?us-ascii?Q?TLvMWbPQD55Q+uo3pNBTgICe+8QKqFjbO2DSKzFGvMWO96ark6jeMXRTNp9R?=
 =?us-ascii?Q?+CRn6EfMr5aSl14gxpeLTziivTO0DtkoVZBje3tKyRAWdfhgWcWOxrkgup63?=
 =?us-ascii?Q?Hxh62Mwfl1tUhqbOUdKfv4nODdM7CEbo+YAXSoj8um4j7ouvdZ32+bA5kVj6?=
 =?us-ascii?Q?8y+FrK4DQ5vNfy9kCElYIybrGePnlfkYsL8xytqb0tRmRHn40RaRFpjb0Abj?=
 =?us-ascii?Q?bFymnFAu44l4juZUIrfXqZ+30LuwyFuWg2++KgdMI9koyaxJOLN2HkCmGoSX?=
 =?us-ascii?Q?IJut5tCYAImNKaCmX7Y89v+1qGaw2+CcrMOccv6aY/G42qq0tZNI0U54sYOy?=
 =?us-ascii?Q?jC+YHdI7YagVC6OYdEFXJIOQHJw/mbX8PP/zd36WlBmPS0fsDeln1J0ws6Ei?=
 =?us-ascii?Q?rieEG/ohdcgrCeAFjHc3YbfEpjfvoY6w5BoQB2VcsNKnCoC+pzpMUpffLyXE?=
 =?us-ascii?Q?LY1r5Md17KG3N2KYuoDcaz7igSIzprN1Bfsk8Nx7c6CVYdkkVubLATov0x1G?=
 =?us-ascii?Q?ZdlNlrLoJTs6S/M+Z8jwbGTIY+MKAMLgIR0CVhYFHS3ty0+yYJkpCoRutr5M?=
 =?us-ascii?Q?+gN0SY/HZYEAakUChs8QE3GLiu7iFqYaCtZCardCa9zh5BfLxpRlsAUvCWzx?=
 =?us-ascii?Q?DSoIQtUpRZoy4fh89UR63aJkP0ykb4U5EpJYbcGFK+id6fvq6Y3iglpjSK8D?=
 =?us-ascii?Q?X4mI+xlyLdSUgo71XfS5h4Y5YP1v27LRe/P9OGS/MqUdweqb5dC44hJok+G8?=
 =?us-ascii?Q?6AT+MfUoDy/WJtLR3gYeSt8pjuP/ethnsHoD6PViNybQIAQvELk7BQSgZHG3?=
 =?us-ascii?Q?Alz1FGRq5M7OU9OsTGh8ip9OOCNb/7+hY9DnfJOXx8kWg6ahRVms/V4csE1Z?=
 =?us-ascii?Q?r8Ux1T92Ss4vS2vXa9TlMRgo5ae5Q/GySKjJYX2vTgQx2RaltB+wo3n+MG5e?=
 =?us-ascii?Q?heAJ/dmcSu0rrjicCyRZyCDwBodR4JY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: mP/pbpEB8e5XpONssPyoSka58oEfxbJd41YaooO/6OwfMDLn7SRnMgux1x2WLyqfCeDxvHRt3oSpmGxsSpG2T2DILHmSpEGqmCkwtwiu6RJ/dQQkZ98vAkv5FJKe+UIEG5DT+t8MwjOriLdBKwV16+1r5f4WeXLXjM7Hla3bUJ6B3dNYauBH0xK0IE96MdsA9y3QISoJQPAkZr/CzBaeb8qMDRL8d+SkFuPBY+QCvdYlw1qeuNFGxX8zxEQltLKaR0K2GiGfKZu3x8cVd3nVK7pcCsOMvVHN9tIMi1Qwh68Cbc56egCth/ZBxXrD9nctcfXIuxUG0S0RbbMGtlJnAA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8483.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d63fed8-d814-46cd-239d-08decc3030d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2026 05:20:48.2345 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e+HYGfHsIyeump1mRP92CEeXyM38lnyBMaB0AnUkzE4pVcc53uoH8UuTH7A5IQyEI0jq+aYAXljg0By0Drd7/05ONIEZUFulLRgJCTtpsKzKEL+i+IlzmUoTX3CxnerX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9501
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

Hi @Dugast, Francois,

In the earlier version (V2), I had mistakenly included SVM race tests. This=
 has now been corrected-race tests have been removed, and the original SVM =
tests have been restored along with the addition of the eu-fault-2m-range-d=
evice-host test.
All tests have been placed in the appropriate positions within the existing=
 test list to maintain alphabetical order.

Could you please review the updated patch using the link below and let me k=
now if any further modifications are required?
https://patchwork.freedesktop.org/patch/733342/?series=3D168562&rev=3D4

Thanks in advance for your feedback.

Regards,
Venkat


-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Venkates=
wara Rao Muppidi
Sent: Tuesday, June 16, 2026 9:48 PM
To: igt-dev@lists.freedesktop.org
Cc: Dugast, Francois <francois.dugast@intel.com>; Kempczynski, Zbigniew <zb=
igniew.kempczynski@intel.com>; Dandamudi, Priyanka <priyanka.dandamudi@inte=
l.com>; Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
Subject: [PATCH i-g-t v4] intel-ci: Add SVM, multi_queue tests to Xe fastfe=
edback

Add  SVM, render copy,ccs,compute_preempt,exercise_blt,exec_mix_modes,
access_counter, fault_mode,multi_queue tests to fastfeedback list

v2: add eu-fault-2m-range-device-host test (Francois)
v3: corrected s-o-b and From
v4: Refine SVM tests by removing the race test, adding remaining SVM tests,=
 and organizing all entries in alphabetical order.

Signed-off-by: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com=
>
---
 tests/intel-ci/xe.fast-feedback.testlist | 37 ++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.f=
ast-feedback.testlist
index acff025fa..7d74f2ab6 100644
--- a/tests/intel-ci/xe.fast-feedback.testlist
+++ b/tests/intel-ci/xe.fast-feedback.testlist
@@ -69,7 +69,11 @@ igt@kms_psr@psr-cursor-plane-move  igt@kms_psr@psr-sprit=
e-plane-onoff
 igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all
 igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1
+igt@xe_ccs@block-copy-compressed
+igt@xe_ccs@ctrl-surf-copy
 igt@xe_compute@compute-square
+igt@xe_compute_preempt@compute-preempt
+igt@xe_compute_preempt@compute-threadgroup-preempt
 igt@xe_create@create-execqueues-noleak
 igt@xe_create@create-execqueues-leak
 igt@xe_create@create-invalid-mbz
@@ -129,11 +133,42 @@ igt@xe_exec_compute_mode@twice-bindexecqueue-userptr
 igt@xe_exec_compute_mode@twice-bindexecqueue-rebind
 igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind
 igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate
+igt@xe_exec_fault_mode@invalid-va
+igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence
+igt@xe_exec_mix_modes@exec-simple-batch-store-lr
+igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence
+igt@xe_exec_mix_modes@exec-spinner-interrupted-lr
+igt@xe_exec_multi_queue@sanity
+igt@xe_exec_multi_queue@exec-sanity
+igt@xe_exec_multi_queue@few-execs-dyn-priority
+igt@xe_exec_multi_queue@many-queues-basic
+igt@xe_exec_multi_queue@many-queues-basic-smem
+igt@xe_exec_multi_queue@many-queues-userptr
+igt@xe_exec_multi_queue@many-queues-userptr-invalidate
+igt@xe_exec_multi_queue@many-queues-priority
+igt@xe_exec_multi_queue@many-queues-close-fd
+igt@xe_exec_multi_queue@many-queues-preempt-mode-basic
+igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr
+igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd
+igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic
+igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalida
+te
 igt@xe_exec_queue_property@invalid-property
 igt@xe_exec_reset@close-fd-no-exec
 igt@xe_exec_reset@cm-close-fd-no-exec
 igt@xe_exec_reset@virtual-close-fd-no-exec
 igt@xe_exec_store@basic-store
+igt@xe_exec_system_allocator@eu-fault-2m-range-device-host
+igt@xe_exec_system_allocator@many-execqueues-free
+igt@xe_exec_system_allocator@twice-free
+igt@xe_exec_system_allocator@twice-malloc-fork-read
+igt@xe_exec_system_allocator@twice-malloc-mlock
+igt@xe_exec_system_allocator@twice-malloc-prefetch
+igt@xe_exec_system_allocator@twice-mmap-new-nomemset
+igt@xe_exec_system_allocator@twice-mmap-remap-dontunmap-eocheck
+igt@xe_exec_system_allocator@twice-mmap-shared-remap-dontunmap-eochec
+igt@xe_exec_system_allocator@twice-mmap-free-madvise
+igt@xe_exec_system_allocator@twice-new-bo-map-nomemset
+igt@xe_exercise_blt@fast-copy
 igt@xe_gpgpu_fill@basic
 igt@xe_gt_freq@freq_basic_api
 igt@xe_gt_freq@freq_fixed_idle
@@ -176,6 +211,7 @@ igt@xe_query@query-topology  igt@xe_query@query-invalid=
-extension
 igt@xe_query@query-invalid-query
 igt@xe_query@query-invalid-size
+igt@xe_render_copy@render-square
 igt@xe_spin_batch@spin-basic
 igt@xe_spin_batch@spin-batch
 igt@xe_sriov_flr@flr-vf1-clear
@@ -215,6 +251,7 @@ igt@xe_waitfence@abstime  igt@xe_waitfence@engine  igt@=
xe_waitfence@reltime
=20
+
 # All tests that do module unloading and reloading are executed last.
 # They will sometimes reveal issues of earlier tests leaving the  # driver=
 in a broken state that is not otherwise noticed in that test.
--
2.43.0

