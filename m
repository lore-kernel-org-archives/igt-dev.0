Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3B6CEACEF
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 08:11:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E08410E19D;
	Mon, 17 Nov 2025 08:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nJYo70Na";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194EB10E19D
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 08:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763367096; x=1794903096;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6Kqu+TvQPtTkv2rSaFqYw68zHgralyRzGiJZ3+A1lXU=;
 b=nJYo70Na7Lm386Aas6DQq9MS+LetlURbRg7wb9Px8XS6F5P1Hun9Dwkd
 dYJOocNJEWDHFo65+eLZ5VoOgy9Rt0bpJ4vYc7nWkvscC2l8SwPkTYaE3
 oFK7BQBO6lASSNik+e/PRPwRG/ZPL62fqjSPecGBkJ3eafcKV0gBEJ+xQ
 T7+lp4NxLJnbEUy1W6R2n1KS39A0rECfJbvZ9qOSQG1S79L+Tahuz7BT8
 567WVUldipsXWb9jiiraWKJAKmlpoWAmuGqawNLCA1OiN+TlJv1dE3JXt
 KAj+5rDhWe0ijegzCCvbPbv6mcJ/F+W0cLlHlyNILLHddh8m0JKhBllIT Q==;
X-CSE-ConnectionGUID: cOWOmHiwRM+nKB5R51otSQ==
X-CSE-MsgGUID: IoHb5lHzRbyiilp77bRNgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="76040186"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="76040186"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 00:11:35 -0800
X-CSE-ConnectionGUID: r8j/rX94RUWH4EWHwkJmDQ==
X-CSE-MsgGUID: qRrz4jl3SdiZpt513Jailw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="195517739"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 00:11:36 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 00:11:35 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 00:11:35 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.12) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 00:11:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wlnPMhNoZv3uKfaUMRrA+3kQWqx1hA3BPgr2AjbJO8+pDAYResv8xx+gKC9772gZJUG5RLFI17byhPFXcuN5eo0bm3v+QatSXbtCF+xfNDG0S7SG7NPFqE5OJJfyuj8f1EdMY47OzYCJ84esoGYMVHwokaXuhh1F/COFe+//YCHkfT4y3jyT0aHi9qxTX5nlZ7mp1FFlwDkyrUhQSYtvGA1axMd50bkWuD8fPPyAuTw8pz7FrzGofHydsCqDXjg+wrPlZuxp9B/0xpIlggpYHMBbROaFtwHI1LxS2M+Bud6ISDsqLiSChwu2qzKTGPLRTbC4rV8+x64V0rln0zyDgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bLYJJCOUbtH2YPdRGPzn9qbJQm8TT282BMl5xuVhoE=;
 b=ubcCs3WUE0QfKseQwdankVFeNI4yWZH0AXp1VVLpWgMnUR+Xp3pyV3O4kC3y8VAd0QYgjqAnhrXlVTXi4lVZ5BFRQ9NOG9FOx6XDM1qhiaJOKWa4Ahy8pF/MFRYMmzQTABlb0zrdk30iPQB1rBHnUIzMqKaAHrZLtoCgeiPzT5//4wJ8FeI7QgHM3+FVybebBGXjoBZrW1VMe9BZL5KSjKU+XvLpOL8HYx5DHb/x0lYgEGmPG6uD4YuDOCVpqpRAKS4mMIKOGlWgnq644ZGIl5a4yoP1H+Aw0O7Qu44AVhtH3xkOCSsCbaSjVJNx7L9cCXYXBwypzgeI7odiwevQJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by MW3PR11MB4697.namprd11.prod.outlook.com (2603:10b6:303:2c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 08:11:31 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c%3]) with mapi id 15.20.9298.015; Mon, 17 Nov 2025
 08:11:31 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH] tests/intel/kms_dp_linktrain_fallback: log before assert
Thread-Topic: [PATCH] tests/intel/kms_dp_linktrain_fallback: log before assert
Thread-Index: AQHcV5bY+4Bxu2MOoUaDon+V35+i87T2hDEA
Date: Mon, 17 Nov 2025 08:11:31 +0000
Message-ID: <PH0PR11MB48062494F3C644FE7B205ECFE4C9A@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20251117080552.471414-1-kunal1.joshi@intel.com>
In-Reply-To: <20251117080552.471414-1-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4806:EE_|MW3PR11MB4697:EE_
x-ms-office365-filtering-correlation-id: 19000393-7f2b-4a4a-bebb-08de25b0eae4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?p62ocrwe4HBxgZuL4yGLGhTYJ+zdUI11yJeBuxoYp46cDygA1v3zVTrPNrzW?=
 =?us-ascii?Q?dks+kfvhyM6ZmFjlrBMZeN0/Mo/HthZ1rZETgs1NBOJqplObBGZyCTlUMns1?=
 =?us-ascii?Q?M5wG02eJdyq8PjIfdoILdsoJ26ghTJR8siyrQMigXNEiog9rkJPuSnGbObuD?=
 =?us-ascii?Q?kApRxctWnSCW5OUvYuhca3zYJmCvu1n2aLcWnhXfKmXobRGO7l2vOOLeviCV?=
 =?us-ascii?Q?VuxUTp15fSMIEMQs2DnQYSCAmerXBdbP43TCxlVYT218XyMoV3Yi8XXa+MoZ?=
 =?us-ascii?Q?wKojMkEpIKRZC24pIy3UYnMK1qg0nMEGK4opiceNOF1PNWtZdRLMI6HOoGuu?=
 =?us-ascii?Q?3ACvj8qLrYSrcs9T66aj8ABp6YhG1RLHtikLgvspVIs/dX7jXTCyjOoqtOuG?=
 =?us-ascii?Q?wqTzQdZEYjDR/cU75jNv968EA3kMqcqDHyT5PYgy4AkPA71Ag8cG1z8p2rBw?=
 =?us-ascii?Q?PTAsAfStDldSsNfgGtMn4lYmEHdi7ATB9sIanFacvwztCAXhbTfPZhF7o9pK?=
 =?us-ascii?Q?LsBX2xGppQHuvEGuaxab0d8juUI2yThrJlunck20ZhpSEneINQfLtLg8nECY?=
 =?us-ascii?Q?VWWVueSqTGG1RVvQCj2wuCJqKBGGYPJ9R7g0NV4LI3Cwa4IXkJj19geqDV1t?=
 =?us-ascii?Q?yda9lcRIlPgui29y2XiiOKrhpReL/FnDo0sRfWN3v1L8vCgqlLXuX+GVcj7E?=
 =?us-ascii?Q?k3A8d4ktg/P0Txo8i/f2VzRRamY83GbO4FOc4QHB8XOwHlR9k7AeY6bOXj+K?=
 =?us-ascii?Q?I5sfTgpRizGPDLwmD/Fd32n+TvyHj07BxBby7nEf1omQnncEv7JPupMS6P7j?=
 =?us-ascii?Q?/GNU6StvV1Kwib/Idf/MZ69rIH1+x8cz6QeQTDESxnC29TTksUyfjqunKx3j?=
 =?us-ascii?Q?sJY5iT+0L+7purd4r2HdthdFxEOobNkBO7sASW3sNtk3TdBCib3rjBCpVx0+?=
 =?us-ascii?Q?bZKy7xo0YBy3hAx+WFeooCwwujKXHnn45e8KHky6GooX6brEPrenVsWZ9wdP?=
 =?us-ascii?Q?Hgi57wNjXrPHJ+dhWzNCudqj5xQh1mgb51SwRxdtJ0NZMdI+ouGfnkNQ/VAr?=
 =?us-ascii?Q?M0oSSl7SO3oExwRjDdr73vdhoSNETOoKgVDkS9Spu7xipbun1MlCY+f9NHwm?=
 =?us-ascii?Q?0xW4+bHaJAdIQaCBUCjAAMCGAgT104Ms0W1o4v+5fzchfpYARd6rXSkTwUn0?=
 =?us-ascii?Q?Andd6kKjOkHkPOEps7v6QoIlqQxOA1wbzpVZZ2xKYACEvetMPeZKnFreuJGd?=
 =?us-ascii?Q?9rjsvw8QMmvmmS4B/6UBYmdd1o82bFHB7nD7AE4YnH96AeNAY39pURPjIp+t?=
 =?us-ascii?Q?MyYsx1kcjhz1Hwl4UY8WPtdNsxBmFXHtzs/ddEzg0kINsGSZOkD62E/buyTN?=
 =?us-ascii?Q?LUb2ZN1E7+LjC7+JQSgsI7QhWyVW4eJdjRWCv9UOdWC/A5V7Y31Q4AZKZznk?=
 =?us-ascii?Q?7a3XHRyfAjGWq3Nza+5g3cwbXKzetfIA10zc5Vyc81FIcgbjYYJ1fAIMZe3m?=
 =?us-ascii?Q?TLEBB8iy28crv63PWRh7dJvVUFnZfdLbm7dG?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mVe3UFzIruvMrYXQJZR/y3lhT7eoOedDAZhzsjgZo10muVN1GxSd6SaSFCji?=
 =?us-ascii?Q?JpIsHUdR+KRqogA9z88HiXW+ZbL2sQXW6+NDzxEtIDSk2GM6Q5ErUSSY0+bf?=
 =?us-ascii?Q?pgm0tqbWP1plMfltus/rC4GdzDrC32bGlRDPmRmsECApFIl1Fo3j34HMcCUN?=
 =?us-ascii?Q?rSnQbD3l59EKEtIj+66PdjJIHOBVk62Uyhh7KINgY2WDp5Wct8lx8jxtrYU+?=
 =?us-ascii?Q?qsp2dG9at5scSR7/Sqnjqm5f6XCdRZAjJUW+owl9wYOPXzg4hcn7eij3aOgz?=
 =?us-ascii?Q?jCSLm6UcbCjeRrF2433eJWn6boMO2Z7UWn49Zno9YR09Otp8PFHPxGL0oikC?=
 =?us-ascii?Q?gho7X3Rdshlkw7bmlq6pO9Af+GnmJRVgpeg9nJ2cRcA83BE5cFrhAd52sehm?=
 =?us-ascii?Q?YkF6Nry1SQ1tpMmDGgMkEQFC4QXJ0S7dJ+LEMXXIPxmRqK4aucf/6SO19E/q?=
 =?us-ascii?Q?tYVVg2Av7B8R5CNOQyTmerZ0sVxIV+s1VOzGvdzLtFy7v0ZaEShhkOCVxdF9?=
 =?us-ascii?Q?A37y90MQ53zQTewjuXE6NUGhMdgjNkgM+EAK5+41fM4UvlfsZYqAPRtojQ3h?=
 =?us-ascii?Q?aAesdmVeYkgIIjxw6QucmE274r1RNBaPeupzRVRNqU63vpsqhrYs6y7VOwGW?=
 =?us-ascii?Q?9jD+8WH2GKLkG1zN0QyJs0s5XzfPOUlt8gAMy+e2FYfW4TtF7vy+EIgiqNkM?=
 =?us-ascii?Q?yK0v94Z6qw+Ol8vJXpWF0ONHGd3XksAcoVk9EUKUu90/yW0lg5BabI5ZaLpc?=
 =?us-ascii?Q?ywGGZ9H8JWHnWNlA399/SkSURqc9PVJ9rAJGaO3TRC0Rh7bvpVfdoiKF34/I?=
 =?us-ascii?Q?v1wiKqBiwuRoQUv3u4J++BFvt7dSS2gFE5yl1YYL7CjX/g+OogzO9u2+TYex?=
 =?us-ascii?Q?gjSd5gQdRzNmTEmEt/RMCo5UnMxpBMjd3NLmLfMotmj30R8pe2/v6ORq8MW/?=
 =?us-ascii?Q?47UiEy1W/13xsOEFrCMhzH4S9BPdkrf8beusnayfSiX+xs9hOigNyUS1T1UK?=
 =?us-ascii?Q?ahcLbWRoragIiTfcSkCa4t2e8cLsEo5FzhsYd5lymqDdffRW3nQvUK5o6BIi?=
 =?us-ascii?Q?W9oDk3fsliQsU7pPnb5VV4ilXWs1VzgWb9hctGyds0kF8zMbT6oBKqSNN6A1?=
 =?us-ascii?Q?93ZwCHVtgq0sKgF7Ovbq3rmb8m/6v/VJhPOByhHcfsMpp2GuPxtIOO9Ksj6O?=
 =?us-ascii?Q?c9HmvBKukmtW0gYL1zdxBbQaqW9TY+giSgMXrqqANzfIx13ST1PGCLJlmnnN?=
 =?us-ascii?Q?xDpC3/Q4ll3ZrjYmJqHUuBO4GAYlLnOacqUDMDdueqxa53tcn0QkSY15awWf?=
 =?us-ascii?Q?RxkaYHeC+2qWuPtpDPn7UfrlVGuxWSVlfEk8TicnloZM9fOsXKmWc5dHzhjF?=
 =?us-ascii?Q?eS7E7C2dVpRIxwGGsqCNKy3lS/kX3heBVkga03Yy9KDp/sj/jawfAy7wbTVP?=
 =?us-ascii?Q?nQDgadXC80+Y4ZGTRhF/ViArgR5CLERGqKC9zWMvVAWKamt3Qi6BN7lQS+d8?=
 =?us-ascii?Q?Kax0jdSssLfGC/NPNsk8mgv/Gr7dJEMoWxShxicjBCdNnuS7orblyHFLi/xB?=
 =?us-ascii?Q?XqoHRGBaMRfrMUXePMVGCMUQ4aG6Y+XtjovsuFgxCYKksvxsyxgy1CgYxZEG?=
 =?us-ascii?Q?UFJkJnky+523/ZARmxE3K8PqNEzGNfJsUSqVbMJviLfBj+M8Rvih6bkaa+8V?=
 =?us-ascii?Q?X2uwKw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19000393-7f2b-4a4a-bebb-08de25b0eae4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 08:11:31.8381 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W2BuI1Jb03KMnXQGnQQwc24FMpMQ7Cc6CjvcNqZhvaifNwTNa+R3jcTsDMOfOPAeabsprmeua1+iPYBnxCTi3qsZ4RFKGh5Dk7m6tk9t7xg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4697
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal Jo=
shi
Sent: 17 November 2025 01:36 PM
To: igt-dev@lists.freedesktop.org
Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
Subject: [PATCH] tests/intel/kms_dp_linktrain_fallback: log before assert

Improve logging in fallback test to reveal the real reason behind the asser=
t

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
LGTM.
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_l=
inktrain_fallback.c
index fa58999e8..4d6740883 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -400,6 +400,11 @@ static void test_fallback(data_t *data, bool is_mst)
 		curr_link_rate =3D igt_get_current_link_rate(data->drm_fd, data->output)=
;
 		curr_lane_count =3D igt_get_current_lane_count(data->drm_fd, data->outpu=
t);
=20
+		igt_debug("Fallback state: prev %dx%d, curr %dx%d, max %dx%d, retries=3D=
%u\n",
+			  prev_link_rate, prev_lane_count,
+			  curr_link_rate, curr_lane_count,
+			  max_link_rate,  max_lane_count,
+			  retries);
 		igt_assert_f((curr_link_rate < prev_link_rate ||
 			     curr_lane_count < prev_lane_count) ||
 			     ((curr_link_rate =3D=3D max_link_rate && curr_lane_count =3D=3D ma=
x_lane_count) && --retries),
--
2.25.1

