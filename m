Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B03EEB593
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 11:18:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B7A10EB47;
	Thu, 12 Sep 2024 11:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cc97kzTq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246D710EB47
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 11:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726139920; x=1757675920;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bwy/w9x8OFNehV/tNvCBzcbtiO63Hk+KEAp+k5xTjQw=;
 b=Cc97kzTqXWKvGlPIypyefzAl0EARWjb/2uo8qaQK3f3Jr1a2OwDNSzyL
 xqYZ41KWV78Kmma/if3ovVOgJW9JoHVE8XBJHl4Vrb/tZp8AExllkEYYC
 g3lYl4vPE3DlpLIxVgQkBGX+Jng1MZ7GErZbVMM6uLMBVWyIwU+qnQ6Nm
 alWJlZ65vmtGJdOz6+NdL5C2b9ICb3Jxc5yCArtlDLaQdd0/WJWKs0F53
 VRH5ZtYlKvJrKL6dqIgFAE9niEKK88j4ouPhZxt3auLKKMEwydbPSQEZJ
 oSl4KGCTk55DApGhC8vPJkUiaRCv3B01DQNjzP07/BwKLjdNZloZHhYnt Q==;
X-CSE-ConnectionGUID: 6cE8C8yHTwikgydAZfkPhA==
X-CSE-MsgGUID: lnCs0Rv3QzKjP6Yf0vFC3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="27900057"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="27900057"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 04:18:39 -0700
X-CSE-ConnectionGUID: JTlcfPlGQbWu/PTBupGrng==
X-CSE-MsgGUID: XYDiZUBWSkaBuJZFnohxmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="105126205"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 04:18:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 04:18:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 04:18:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 04:18:38 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 04:18:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzOTnAQNKQx9eSwd8RcPxZkYsuzd8v9+KQL5rkNZNhyFkdUnrGkvodWEYdmIxX64Su5zeLTggta6iNan0gJGMrKCGxA3WmGAdeFa0m9MmJU96Wjstl4NdzPWL/vJJBt7OMDodgGHWNOqQsIfs+b1wGF+FhtZQWE8YHXRC8iCxhgeW/s13rbL/A6FjyyUv08N+swDFZKMTVF3Zyxus4FgBcw0Ty1sRcfOvGnXpwQ6lAsEiCddaz1a91WQYaAjQN0n/BpWveFhxc8fAj//qhmn6EMLfvMhjprhTvYP+7UYfqjYVSI6ORbKNlumTQbnHLQS1tQXlOuh0fXYRpqsFmO3fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFsKQPt8yjtvLvgkq5P5eG2N2pmIY+dx5kTDCEG3PKw=;
 b=E8gcPjsHS3VrcJRWdpAWUHAaYOV0ikFQnJdH+LOJAQUfk7CNFxgMpO0ejl4I+QN+XQfOViRKnes69w8Gt9VRcsHVpxvTqmc3BwfZDG7JG4bugxb6nxEjxCYQOcmSZ37i3XNPmiQ/o0+8+YRoWN+0wiJof6X1kRPiifDu6n50dZeJ2xawBCB/3AdahHCHTP9N6QPDBMb9hd2qI0hZBmEypTGJVMHnIAPKV423TtJw4ohfMZ/6Xg6FDUD2lSwqVr7LdCN5XoR2qIfkybCybTk0krWsifT5pbFAcCP40n0nRL6I7RGnkoHaudpg5TF5ds5KUp+uykbrCBQUWk9Jph07tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by DS7PR11MB6152.namprd11.prod.outlook.com (2603:10b6:8:9b::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.17; Thu, 12 Sep 2024 11:18:34 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c%5]) with mapi id 15.20.7918.024; Thu, 12 Sep 2024
 11:18:33 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t 3/3] test/kms_content_protection: Move color change
 code.
Thread-Topic: [PATCH i-g-t 3/3] test/kms_content_protection: Move color change
 code.
Thread-Index: AQHbBOmK7CJfeBb2MEalNtwOaR3R9rJT/hRA
Date: Thu, 12 Sep 2024 11:18:33 +0000
Message-ID: <PH0PR11MB480667151B149B501E95D21BE4642@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20240912075536.710350-1-suraj.kandpal@intel.com>
 <20240912075536.710350-4-suraj.kandpal@intel.com>
In-Reply-To: <20240912075536.710350-4-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4806:EE_|DS7PR11MB6152:EE_
x-ms-office365-filtering-correlation-id: 0f373afd-67b9-4d9c-107c-08dcd31ca342
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?KGJfvwQUb0E6XdWavNuUztDNvc0PV5pQVdggZh1ELE0mPqhIDZZ7QHhOm5Gm?=
 =?us-ascii?Q?/ltZutFYoosaF4puottKSw+dp5gKVRlNPLRaSRoa/OX/lCY6W5HtGcwhKT4I?=
 =?us-ascii?Q?NV1N2csacALFmqxzD1il7n61EJCxxLlMVCRbjUstZRUrcaxb9x5SO6BRQGM4?=
 =?us-ascii?Q?NtxRQv8SCVDr5PDRv0w804qUO0bOSWQvb46hQlc7aK65JCM/nZk1DzWTaNHZ?=
 =?us-ascii?Q?A7SNrx/zrjWDSgzE12KIEjs68/ZqaykATdyJkcyzk4aU4ACI8tEQa+n/2ymC?=
 =?us-ascii?Q?NNLP+sTIEMVDOBacdClSmI+WnGzLIlZF6i4oZJp0YPcF8Nci6+oVpVLeuP25?=
 =?us-ascii?Q?xZIEHhYT6I71i/k+8hHAI2r6zWiwFWr5oKO62mdw5X2onTVcGdj0MaWIT00V?=
 =?us-ascii?Q?vLl9synogo2zHbG4csa6a4F1eYfIsEVAy+E5Mdf61aJI258obVKLdb5AcdmA?=
 =?us-ascii?Q?71IIsACs4EoXBjVKum8OYpEdP1dqF6SnYp6FAUmXRppa7bzWXyFfBP7pZ/HI?=
 =?us-ascii?Q?EYi28iZdox3dJHk1DDoYK6nr3HesWfBedRZSGuiSXObU/fotj8SUuhXTbcfx?=
 =?us-ascii?Q?zC0Vq1UarJrQ3wqAA/K2cOdpa7aUJpJVrKOIkenyXPMdm97ufbXZGURQCynm?=
 =?us-ascii?Q?zoZKgnKwZzHD87ARjHMcCo+xgvHTTe7ct3wRhbPbJ+jJOLWhTdOtAiXueygh?=
 =?us-ascii?Q?BsmGyJnY4taxnudCJhXXzkfM7LxSe29F3o97t7Tu13veh5PyoOKlj96sK4ar?=
 =?us-ascii?Q?7syNrWCcwlEDzO1snxKFRCRbX5Mgz4y4OJNiRw6VJ6/CaFdkc5cMI4YIaXnG?=
 =?us-ascii?Q?03oWh54GXXdwmidLemPVvfCxP5mFJBWqa368JHEM8+6Q9QUc86M1S0PaUZdH?=
 =?us-ascii?Q?jx9+1IMEbAOH52zMbrZXci2IEUA1ALVRM0xobDGPh7hs98yUC1diw8a6QipW?=
 =?us-ascii?Q?R3ji7MSG04JCMctcpcskJJueAtwDajpDxXygDwmI6lR0Z/+XZKU7bMClFDs8?=
 =?us-ascii?Q?ehUuXicKF1+7qjgTp5RbzUdGVBlk3O+7rWZQ6EMTXEtrs4ol/Po41Wa0Kf3x?=
 =?us-ascii?Q?JImk1NwmlPinDFXPs8jx2JwBDN5nxb0hdYOIebbpPNeIFzyd4eG0rRUH7ZXE?=
 =?us-ascii?Q?9jcmjN8TWLGChAo3NI+rQ1stIMxh/J2Sr+8+TR7dbuGG1MDuNVrclgrilZdu?=
 =?us-ascii?Q?bYNiPQlH8c2t/JZ5Mz2DGBouiMF4Jr38KCjaB8Rd5ONphiiOIC+U25o51D5/?=
 =?us-ascii?Q?9tTpxGtSX6ND7zct8Bq9hbPUMZrMgf6nOCG8TMEs9ap/hHGVAWspQaUnefLa?=
 =?us-ascii?Q?M5xsvx5vHPgnNU3HN21k6bUiYyVegcSgE154kcZyqD99RGzoWi9FXAGW+W6A?=
 =?us-ascii?Q?8Qe4M3X5rQEOC7/+/t05272QYaVDX45xFXeILfjQmbazaKWRlg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6U0IIBw4K5eIX+tG7rWEHX96rtN5tbkmKOv3d679gcQRgEOr2WvpGLDebjB3?=
 =?us-ascii?Q?PcrIp/SxmXmFCfW1Bi/bXbgOqvu5VusnJrMqORBh3y+srrCq9oCBXzj7bbl8?=
 =?us-ascii?Q?jWBDMXsTmL+YCnvddSs5mEOF7Kxmrv3JKhtMyIE3ODQ553y3v6qb14/CVSGn?=
 =?us-ascii?Q?5cRQwG12mS44Vz9KP9uOuHZyly5KrJd/GDGTaMTFZdNORZZ1GAWQWeXhoIJq?=
 =?us-ascii?Q?41gKyT0X6/HbMgMidSxdvPjnaNpr+AOmI6z8L58sQDMxO6vvjKkOQH2wjEib?=
 =?us-ascii?Q?+PUfiMBbhggdhoPv7rxphsMO5a87earfN2yZE6iauDpj0q6c1aCUYzWQilc/?=
 =?us-ascii?Q?pwsxQJ11V0DsT1ibsyEI3k3mnm3WnMy08BbcATG0ri3jA+Dm8NdXT854CPQU?=
 =?us-ascii?Q?Pv5+8H+RwAsgvq3z0/wiVQO1OWB+cPK2VfJvYW3RZvKxv5T1iu2szUCFtpC9?=
 =?us-ascii?Q?CNN9qTaMzsqBBI0e8WOM8UZMA//Kyityw1pDFTrXlXqiDbOzBMGcSuZ3c5IM?=
 =?us-ascii?Q?lCuS8QgTvzVtAJ3LVwHOR3ipesJgVhERZN/I3W06OyTn5gdcPLQdRKgp38ts?=
 =?us-ascii?Q?2xe8lLv3hqbjjCdz+EGypQtWSfNiMGLmdwcfH05lz6ZNhCHBIvf0ZvEjsBz+?=
 =?us-ascii?Q?lFRW0j95FlXf1AaGm0URAhoLf79/Kn0LhgWhW1md70esWp1zXz6Mlb0LkcQt?=
 =?us-ascii?Q?2Ts59Ycv0OSHCT6RNmvBkgH32H/ZNysm7Yu84IuHOaKGaIlN+5GVK4AjrfrG?=
 =?us-ascii?Q?77eh6ZVWnEsnrMUT0mzy8G2W2z3gAqyL3uFUwfDKzbTLD+L5rjtwdnP1uj/X?=
 =?us-ascii?Q?ZBKxYm4/xLtO79tVAoXSSLmDrMf/rQvb9mQmJMcSQ2k4b5SJHXf51nixn04D?=
 =?us-ascii?Q?xzN60r6yAqfn4Nt5zEyGM+v/mXo0O//ufrvouJDOm+6d8rn/Wo4hunM5g4gk?=
 =?us-ascii?Q?d6pJnuXz2Dv0snYG2UCrT6DMjl3KsNYN0cZoZY0a18u/MRDlZ6G2KmntTzbT?=
 =?us-ascii?Q?3vjE/V64e2TpMOfYu5ub8a/PRm20ruzu8KkaevRjpVNM08NKlmDVIfmECeSq?=
 =?us-ascii?Q?0dZu49wRTFlwFOrx04zg6KXx76CGAMdHTcOZGIgo023HTsZoQPqRhgwZvNs1?=
 =?us-ascii?Q?yQgfPKgJfGxcp9ANupTw+l1wQAWJGnfuB++3LJu7f3wf26XiQIU73LzRGE+u?=
 =?us-ascii?Q?MhxqfaXO81sNXIKLw3T5sH8ja7NfgINDgXAdRkv4g/HFyrY+zf0d8Tm5g+04?=
 =?us-ascii?Q?z58F2+z/AvbrvmsaY6ayP+zEzLg5OMuUIB+QoPzH571Pvxz40ddWwf6q+nED?=
 =?us-ascii?Q?639xbHdRWQ5B6bn63xfFoQwQE65GqOLudh8TdfWLt38gniWSX96l7W1ZUSqz?=
 =?us-ascii?Q?Z3/nbZvxb/EfMwpO/79YIMEy4hQvOYOkN1GRNbTnQQ+3EyRBaAi0rHBAUylD?=
 =?us-ascii?Q?pTm/S2CRZxBdn115uCvZ9JNayGipApa1TOiUbqg5H/CkWJetW7CuSsR2U3T0?=
 =?us-ascii?Q?3M08e4ZNIUmgKRldlzLcNjwQ7sZ9EV/7txuk1Ri61CptON1UU9hakAIzqNpn?=
 =?us-ascii?Q?2PJ/cTMf3Pz5PcA0e50S6Y0ywkrW7m52vysV3d8Nm9Q6nsat+RA0Xv28hV13?=
 =?us-ascii?Q?Mg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f373afd-67b9-4d9c-107c-08dcd31ca342
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2024 11:18:33.0946 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hKMnNcvY7ex5Li1oTbg82OSqp/5IEmuHhNWC6SA7nvoQxVHeidJEcyhnFouk7uWu83ZZKIuPb7i6vqmhQ0vI8WSm1ifFR8j/9ay9BxiblAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6152
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
From: Kandpal, Suraj <suraj.kandpal@intel.com>=20
Sent: Thursday, September 12, 2024 1:26 PM
To: igt-dev@lists.freedesktop.org
Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>; B S, Karthik <karthik=
.b.s@intel.com>; B, Jeevan <jeevan.b@intel.com>; Kandpal, Suraj <suraj.kand=
pal@intel.com>
Subject: [PATCH i-g-t 3/3] test/kms_content_protection: Move color change c=
ode.
-->Remove "." from subject
Move before screen color change to in the mst_cp_enable_retry to make sure =
we display the correct color after every retry and to make sure one of the =
monitors does not go to sleep in between get_property waits.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_content_protection.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.=
c index c3771fad8..f17d9f2e8 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -667,7 +667,7 @@ test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_ou=
tput[], int valid_outputs
 			      int retries, int content_type)  {
 	igt_display_t *display =3D &data.display;
-	int retry_orig =3D retries, count;
+	int retry_orig =3D retries, count, i;
 	bool ret;
=20
 	do {
@@ -693,8 +693,14 @@ test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_o=
utput[], int valid_outputs
 						  KERNEL_AUTH_TIME_ADDITIONAL_MSEC);
=20
 		retries -=3D 1;
+
 		if (!ret || retries)
 			igt_debug("Retry %d/3\n", 3 - retries);
+
+		for (i =3D 0; i < valid_outputs; i++)
+			prepare_modeset_on_mst_output(hdcp_mst_output[i], ret);
+
+		igt_display_commit2(display, COMMIT_ATOMIC);
 	} while (retries && !ret);
=20
 	igt_assert_f(ret, "Content Protection not enabled on MST outputs\n"); @@ =
-760,13 +766,6 @@ test_content_protection_mst(int content_type)
=20
 	ret =3D test_mst_cp_enable_with_retry(hdcp_mst_output, valid_outputs, 2, =
content_type);
	-->this function returns bool but we are storing at int...
 	--> we are not using this ret value further .... please check..
=09
-	if (ret) {
-		for (i =3D 0; i < valid_outputs; i++)
-			prepare_modeset_on_mst_output(hdcp_mst_output[i], true);
-
-		igt_display_commit2(display, COMMIT_ATOMIC);
-	}
-
 	if (data.cp_tests & CP_LIC)
 		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 0);
=20
--
2.43.2

