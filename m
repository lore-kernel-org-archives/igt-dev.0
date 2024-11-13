Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64D0D637D1
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 23:07:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A94510E763;
	Wed, 13 Nov 2024 23:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O9XkatER";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B7210E763
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 23:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731539256; x=1763075256;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=f6oiW4PmsCTtFVPQkPFfqZKLcV6YpZryIFsJrD37/go=;
 b=O9XkatERjZA1TPgti/3TjuRgFf9rr0w51e8gqabgcnY7+6jPDmHeFWfG
 9gu+PHP3yVV8DIbAm+FpiwC1x6kAMW3xyZlTThaQ/wAA9duzxsuqdHdJu
 yfSSQSqC9i2MDLdtpzMGkB7+rEbWdhJE04p3kFhyrfJrFVV/0sq3S3/Kn
 qZ8T5M5PZaLOzJTTKRMVoeMrcLnwjCF+pkbTOTbZYYoPTshCiDOuwQg7o
 k+A/RsLGNeq0aDQvlFXFput4XS7aG20g0rcpHkZmaRka4A/N2NHiFFtbS
 vhJYwF6DhOCX9OQbRFIyn/Mhcl/6kaSOG7ab/ROno26wTWapvVgF/YTEK Q==;
X-CSE-ConnectionGUID: htMu71/mRCmbaiIO6GLWDQ==
X-CSE-MsgGUID: Xt0naBhUTDeepYq1Anc0Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="42872032"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="42872032"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 15:07:35 -0800
X-CSE-ConnectionGUID: WS0ZwBcfToa0FTH1IA23Lg==
X-CSE-MsgGUID: gcsmWgSxRZWPdyX5E/a+xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="88434139"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2024 15:07:35 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 15:07:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 15:07:34 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 15:07:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eClDC8jhDO33MZObDDfbUX91Ow9wOQspfglAj7Ex/0up52H+FiUP19ebqVWAPJ4Y24zoBAr1mNrR/uBAhab7csH2oymCpBUBm9p0YpcmDecPt7MEo/22Bf0pQFcW3BlDbLUMRUyAqsbsDapATGIIAvCDbzeUnBfZE/PjOaW9yvtJKsp6UErzA2QwMr6RvCiuNX1XU4tHNBuadRJyzs48Ph+W46j+GlkuZbi18MugNovmg3ppSKHjHdOffCZDPv/34nMa7u91Qp/pjsvE7wj0j4aCN2HapYVkky0qw77Jsop1s3DKrNjxQ37B/5ucRk9hM5m2fBRLVN2I1CtwugbCWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHQN+n1WUxp73gm5jmHiGYYkd6a50ewzLDLwxcRlotA=;
 b=mcrgVQKnsPFxvtXJBdxJ+GAFrDpYclgUTK3UjbutNVCWK2cs5gCJfzPBTFTBY5Xsk8XaeivbtLHGJlCS/zlhXqRtOPCpZh6a352+3hQFkPpRU67AR5ND939AICVrG3642pkX1x+b8J7pBQw0pOoARSFisZw2V8AjpCFfhyU3Ai1tfJ2CNhE28+1MGxSTo8F6sJHAMaJXE4tvmJx37WMwIJgdUmSpi7m0xFZ8/fT6jmAfF/hZf2ltg/BB18TM2kYz23AhL0Na6EJM/yKLXszulNoF4S0XNrF0jPZnVq6xLkbSFJWGVxn6Bj4iQB1csUsk+dsRrlqlyPV/un9cQOTh0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5711.namprd11.prod.outlook.com (2603:10b6:408:167::22)
 by PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Wed, 13 Nov
 2024 23:07:31 +0000
Received: from BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::4137:d45e:2206:50aa]) by BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::4137:d45e:2206:50aa%5]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 23:07:31 +0000
From: "Taylor, Clinton A" <clinton.a.taylor@intel.com>
To: "Taylor, Clinton A" <clinton.a.taylor@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] lib: Sync pci ids with kernel
Thread-Topic: [PATCH] lib: Sync pci ids with kernel
Thread-Index: AQHbNiBTPlHWIU+oKEOvISPtAAEMrrK11UDg
Date: Wed, 13 Nov 2024 23:07:31 +0000
Message-ID: <BN0PR11MB57111CBC5926BCE0C8887CA9CE5A2@BN0PR11MB5711.namprd11.prod.outlook.com>
References: <20241113230301.655499-1-clinton.a.taylor@intel.com>
 <20241113230301.655499-2-clinton.a.taylor@intel.com>
In-Reply-To: <20241113230301.655499-2-clinton.a.taylor@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5711:EE_|PH7PR11MB8252:EE_
x-ms-office365-filtering-correlation-id: b9b0ff88-8b80-467d-3eae-08dd0437f39b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Pj4LmxwJljKlTz7EqyggU5Zwc1sH462uLDLpvGl3hZNsMCMWOzs6kkdKOE38?=
 =?us-ascii?Q?53Suatfp4Cb5owtL4JDFJbcPII/UwjhlYIsYI9pBX6xXQEd4+n7Ivg8BQ9p7?=
 =?us-ascii?Q?sTsWvrG7bD6ZSCjJYryC60QSz4ZldyZ9A1lwVj66P7lWBrjX6RvBEtZe1OzE?=
 =?us-ascii?Q?uFRIqLm74zlL0EcGzWSWj35rgKeV8q/vEM/aVSo9jB+anIfwNGX6rQgMs2gg?=
 =?us-ascii?Q?JyG4fXLoMTOBh2zrf6gbIN0kiF2jXOj0RHUAS3OYbnuhUWa224/2tk7sV6VL?=
 =?us-ascii?Q?EL1JiEEb8/In076fnluGHndN+mbPyorUKVFRwXydEHSnoI94HxidDknhHlkk?=
 =?us-ascii?Q?B1EamumuP4c4aCeU8j9OKhPPMrsReTgTJx44K2/KHl1VGEp+raK0pG0KFV9p?=
 =?us-ascii?Q?6p3IlOqcA3NeLQa/0q9/bAIP2VHw8ddBkqmLjSEH/UWFpGLhDT9ialpVSkRP?=
 =?us-ascii?Q?vCT/oylWNHuGdgM/Fngq2e8VVEuCNTv68/EUxa6jVC1Vj8/3A1ZabeNPTNQY?=
 =?us-ascii?Q?gGf0nU0FWV2dmsNL3W47Img5NMf4vOwNY8zXUTcr61GMbt481Kz3Sz8N7/JE?=
 =?us-ascii?Q?mQpzN5vNbNLT6ggGsUQmXMaomF1hLrEeNSrpCMtLwfsFItIorPtkSGQfsWZ7?=
 =?us-ascii?Q?XaJOHG036cNz6+rTn4u2iFp18BwO5D2O53UK9StE486thM99O4AtMUzI/6v7?=
 =?us-ascii?Q?rH8SwAWKwPr8ERwNcNyTejACR0xklnCp5on17Fu+0ibrSGAncKmgFyBiPh9u?=
 =?us-ascii?Q?ngf64CXqomrTTPVlWfVUAEm9UJr50c1WKprun3+hzZIhGlCGqOB3qglkfHCi?=
 =?us-ascii?Q?yCuqKjAVJoX93H339cBKezX5I+FgDb/KwQUAE9APx5XA8vCKgCVgHeMMcw1L?=
 =?us-ascii?Q?iDOR5tLGyK6bMqgP99sv1HfHU4T+4gYJnpdBkOgvRV0WQvdPG0MCzyZfhcaA?=
 =?us-ascii?Q?WoWtona6t/FNZliyY60f0DDuoE2AVhl7hepl3rNWY36TBaObMOFHlqfWnOmK?=
 =?us-ascii?Q?owND9D67yNl10FUqTE2Yiw2MJgEhLlmG+inhRTOOUtK56YJOdWvQcGcZo6BM?=
 =?us-ascii?Q?hB12R81sooZjtRXTFfv3m7uNzHKfsV89NLXJtVx/97rTb7Br8njQ5/C9bJN7?=
 =?us-ascii?Q?X70AKz1AdQeXqdMWKwDU4xxEj74ugjZlXyN5MRS9D4b0ROPddyXeqcw4bB61?=
 =?us-ascii?Q?kE/IIGl2C0KbZRqTqMaxY6akcN2cau0dME9yIHuRXl+TfAFJWHcjODLzUqc8?=
 =?us-ascii?Q?NuMRXq/k6Xzqf7sbzCwpxo9FzVXOsXreP6RcRLlto7ab2tXiumT9vEa4hBwq?=
 =?us-ascii?Q?C04vm5YfqNhJXgsyMwKYuK8ad+vCP1/mWCIqFxzFR5nCv+6Tj+yRIy/sW/dU?=
 =?us-ascii?Q?00CiVaM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?O6QvcDMQRDY+n8+68q5KB0xLYEJJ6Tb48pt1XeY99Nyb6BxQDVdOGnHuMgn1?=
 =?us-ascii?Q?UomTlPy/Ilv2QGqUWGhugKKFqxnAFIhoBydNsgazjlGiPgOe69bakpn54+lF?=
 =?us-ascii?Q?Rgk8XG9uRYMulhS8t/z41e+qiYK4sHhr5G0He6dtjMrKgn3Crisr5ujAEVYN?=
 =?us-ascii?Q?rF0T89GxJGmmR+yVfCpZeOfBY+q0wEAk4M0kyEatJuI1IaHEYAzPRnrmSK1C?=
 =?us-ascii?Q?bzFRCG6md9WY0uBfwdg/SZq4XHcHetwkTkG4vSo9oPFFEYQiXtOVQZFD4qoC?=
 =?us-ascii?Q?5BRyOPK0gcvSAJhzTL7rEDPVhOjJS1vg4ZvkKc1CZ9psxYKH8fqh2dRHgOpJ?=
 =?us-ascii?Q?zbENndDIJiOvfRYqbwweFnICkaYRQYokkUGwLQ8h/SCRE/lPx/8XtfNpb+Ck?=
 =?us-ascii?Q?dW1pJVNqV82HanniiIZn1n+5rLRQuZmb4+XR1LRdbSMySUxVoDyfr6DpJ3lY?=
 =?us-ascii?Q?DyapzHzc/mgVKe6ybVq/zMvFu9EhP0CpujQGb2bgR5jQYCwNdN3sun2vjHX0?=
 =?us-ascii?Q?aDyJo2M8efWJtFL4YWK8vIZ3IN4qB9y7w1x+m0ODEytbfZkbo/Kyl5TVDWu1?=
 =?us-ascii?Q?RTBxdGCT9gPfN56b6VrtAbGis+xtWYZ4286lUgsiM70sZVKmVGBOdWPdw+7y?=
 =?us-ascii?Q?j7cKQ2z9dHSvTUKVraYk86AbsmYWIdyLsWznEntnY3WLEWsTA4xrEMOSE/pO?=
 =?us-ascii?Q?GjmHN5mNZt81kyRw1gmy3E5rEg5jcMRQkbhA3sSCmgkVZgrqZ2kcaak0oHim?=
 =?us-ascii?Q?CyuV9xSnYANFzVtJt0CM8INtW5TnXwyd00d4LcvVEg4yrdM1yr2ARvh2OrwX?=
 =?us-ascii?Q?p25JuYe7UIlfjYzWGppdTpXCHPYlOu00M/FzuWzFdb+nSc/8oXKEQT/B0vKq?=
 =?us-ascii?Q?gzXag158tWTj2tjVXwRNSkhDeJlXBVXjg8v/G26VsETYBahEdwOnYK82T5xC?=
 =?us-ascii?Q?XlrRTuD7gDsWcRoJzAwgp21X0wTNe2x+nKXOJ8G7RacLrfrsKz8ofD8nb+zl?=
 =?us-ascii?Q?WG3aBVbpHSPE/rVo3G4IePOwcVhrlKF4GuWYKeU525kJJl1JZtKp/PdkaLsa?=
 =?us-ascii?Q?hiev7Q/ZGmERlrnP4Kmg7yq6pmxx+LXCWSioGXjYWFb1ZCWnnxY50s3y27ha?=
 =?us-ascii?Q?M9EEtWZ8vQPZvn+aDzmAJmuOET9j0OQyk467G6pxZmpXmUs8E+Hqy29vruZ2?=
 =?us-ascii?Q?OkZ1RW+xgukj8PeBC8hyg8IctaxvcG+YRq5xzMsBmfGjuqCETN3VXjbq6bd5?=
 =?us-ascii?Q?ys8hmGwpArKYPKqWBu1qspoZxpVnzjpOYq5wM7XBeaclx/a3N3MnR6Qaal/X?=
 =?us-ascii?Q?lMTLb1SCha8Yr4qODv+lt76m1AdHbDdjM/paguTq1FmxR8FJWO5Z4MO1QQXw?=
 =?us-ascii?Q?bE8iiddZacUkAO21snL7zZYlBG/BS5EvAQl448Z9jheaPvpWqALKjdLAS/Qj?=
 =?us-ascii?Q?ZUCNI3TGka5QYi1QGDBmHsZUwfhjjF35BJxKTIBMTy7ZlTHw0TVm57Fdr7ob?=
 =?us-ascii?Q?eEsuxbZkxJhPfVsJ5EyAY/FGNP4+srI/bCfhSjVXvmqU+ySf3PwJfkjMlieR?=
 =?us-ascii?Q?/rhfmQHsK4xA/tZ9tqNl49IR9U+lpUd6RF7SE+8VIOy1tzyZfoOPFt2W+7vF?=
 =?us-ascii?Q?gQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b0ff88-8b80-467d-3eae-08dd0437f39b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2024 23:07:31.3174 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VDYocajCSrCawyuoEN/7nEOEqxnW5p04cwd4fSpt6Fe/ZbU+ad155O4b+PN9T24PM7IOtq74QAV1KRtoYmCHuti3kBVNNKnZGoF3POBEhbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8252
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

Please ignore this patch as it was included by mistake.

-Clint


-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Clint Ta=
ylor
Sent: Wednesday, November 13, 2024 3:03 PM
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] lib: Sync pci ids with kernel

Syncronize pciids from kernel

Signed-off-by: Clint Taylor <clinton.a.taylor@intel.com>
---
 lib/i915_pciids.h | 73 +++++++++++++++++++++++++++++++----------------
 lib/xe_pciids.h   | 30 ++++++++++++++-----
 2 files changed, 71 insertions(+), 32 deletions(-)

diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h index 3e39d644e..6b92f8c=
37 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -25,27 +25,20 @@
 #ifndef _I915_PCIIDS_H
 #define _I915_PCIIDS_H
=20
-/*
- * A pci_device_id struct {
- *	__u32 vendor, device;
- *      __u32 subvendor, subdevice;
- *	__u32 class, class_mask;
- *	kernel_ulong_t driver_data;
- * };
- * Don't use C99 here because "class" is reserved and we want to
- * give userspace flexibility.
- */
-#define INTEL_VGA_DEVICE(id, info) { \
-	0x8086,	id, \
-	~0, ~0, \
-	0x030000, 0xff0000, \
-	(unsigned long) info }
-
-#define INTEL_QUANTA_VGA_DEVICE(info) { \
-	0x8086,	0x16a, \
-	0x152d,	0x8990, \
-	0x030000, 0xff0000, \
-	(unsigned long) info }
+#ifdef __KERNEL__
+#define INTEL_VGA_DEVICE(_id, _info) { \
+	PCI_DEVICE(PCI_VENDOR_ID_INTEL, (_id)), \
+	.class =3D PCI_BASE_CLASS_DISPLAY << 16, .class_mask =3D 0xff << 16, \
+	.driver_data =3D (kernel_ulong_t)(_info), \ }
+
+#define INTEL_QUANTA_VGA_DEVICE(_info) { \
+	.vendor =3D PCI_VENDOR_ID_INTEL, .device =3D 0x16a, \
+	.subvendor =3D 0x152d, .subdevice =3D 0x8990, \
+	.class =3D PCI_BASE_CLASS_DISPLAY << 16, .class_mask =3D 0xff << 16, \
+	.driver_data =3D (kernel_ulong_t)(_info), \ } #endif
=20
 #define INTEL_I810_IDS(MACRO__, ...) \
 	MACRO__(0x7121, ## __VA_ARGS__), /* I810 */ \ @@ -771,16 +764,46 @@
 	INTEL_ATS_M150_IDS(MACRO__, ## __VA_ARGS__), \
 	INTEL_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
=20
+/* ARL */
+#define INTEL_ARL_IDS(MACRO__, ...) \
+	MACRO__(0x7D41, ## __VA_ARGS__), \
+	MACRO__(0x7D51, ## __VA_ARGS__), \
+	MACRO__(0x7D67, ## __VA_ARGS__), \
+	MACRO__(0x7DD1, ## __VA_ARGS__), \
+	MACRO__(0xB640, ## __VA_ARGS__)
+
 /* MTL */
 #define INTEL_MTL_IDS(MACRO__, ...) \
 	MACRO__(0x7D40, ## __VA_ARGS__), \
-	MACRO__(0x7D41, ## __VA_ARGS__), \
 	MACRO__(0x7D45, ## __VA_ARGS__), \
-	MACRO__(0x7D51, ## __VA_ARGS__), \
 	MACRO__(0x7D55, ## __VA_ARGS__), \
 	MACRO__(0x7D60, ## __VA_ARGS__), \
-	MACRO__(0x7D67, ## __VA_ARGS__), \
-	MACRO__(0x7DD1, ## __VA_ARGS__), \
 	MACRO__(0x7DD5, ## __VA_ARGS__)
=20
+/* LNL */
+#define INTEL_LNL_IDS(MACRO__, ...) \
+	MACRO__(0x6420, ## __VA_ARGS__), \
+	MACRO__(0x64A0, ## __VA_ARGS__), \
+	MACRO__(0x64B0, ## __VA_ARGS__)
+
+/* BMG */
+#define INTEL_BMG_IDS(MACRO__, ...) \
+	MACRO__(0xE202, ## __VA_ARGS__), \
+	MACRO__(0xE20B, ## __VA_ARGS__), \
+	MACRO__(0xE20C, ## __VA_ARGS__), \
+	MACRO__(0xE20D, ## __VA_ARGS__), \
+	MACRO__(0xE212, ## __VA_ARGS__)
+
+/* PTL */
+#define INTEL_PTL_IDS(MACRO__, ...) \
+	MACRO__(0xB080, ## __VA_ARGS__), \
+	MACRO__(0xB081, ## __VA_ARGS__), \
+	MACRO__(0xB082, ## __VA_ARGS__), \
+	MACRO__(0xB090, ## __VA_ARGS__), \
+	MACRO__(0xB091, ## __VA_ARGS__), \
+	MACRO__(0xB092, ## __VA_ARGS__), \
+	MACRO__(0xB0A0, ## __VA_ARGS__), \
+	MACRO__(0xB0A1, ## __VA_ARGS__), \
+	MACRO__(0xB0A2, ## __VA_ARGS__)
+
 #endif /* _I915_PCIIDS_H */
diff --git a/lib/xe_pciids.h b/lib/xe_pciids.h index 73d972a8a..6d8d013f7 1=
00644
--- a/lib/xe_pciids.h
+++ b/lib/xe_pciids.h
@@ -97,7 +97,9 @@
 #define XE_ADLN_IDS(MACRO__, ...)		\
 	MACRO__(0x46D0, ## __VA_ARGS__),	\
 	MACRO__(0x46D1, ## __VA_ARGS__),	\
-	MACRO__(0x46D2, ## __VA_ARGS__)
+	MACRO__(0x46D2, ## __VA_ARGS__),	\
+	MACRO__(0x46D3, ## __VA_ARGS__),	\
+	MACRO__(0x46D4, ## __VA_ARGS__)
=20
 /* RPL-S */
 #define XE_RPLS_IDS(MACRO__, ...)		\
@@ -120,7 +122,6 @@
=20
 /* RPL-P */
 #define XE_RPLP_IDS(MACRO__, ...)		\
-	XE_RPLU_IDS(MACRO__, ## __VA_ARGS__),	\
 	MACRO__(0xA720, ## __VA_ARGS__),	\
 	MACRO__(0xA7A0, ## __VA_ARGS__),	\
 	MACRO__(0xA7A8, ## __VA_ARGS__),	\
@@ -175,16 +176,20 @@
 	XE_ATS_M150_IDS(MACRO__, ## __VA_ARGS__),\
 	XE_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
=20
-/* MTL / ARL */
+/* ARL */
+#define XE_ARL_IDS(MACRO__, ...)		\
+	MACRO__(0x7D41, ## __VA_ARGS__),	\
+	MACRO__(0x7D51, ## __VA_ARGS__),        \
+	MACRO__(0x7D67, ## __VA_ARGS__),	\
+	MACRO__(0x7DD1, ## __VA_ARGS__),	\
+	MACRO__(0xB640, ## __VA_ARGS__)
+
+/* MTL */
 #define XE_MTL_IDS(MACRO__, ...)		\
 	MACRO__(0x7D40, ## __VA_ARGS__),	\
-	MACRO__(0x7D41, ## __VA_ARGS__),	\
 	MACRO__(0x7D45, ## __VA_ARGS__),	\
-	MACRO__(0x7D51, ## __VA_ARGS__),        \
 	MACRO__(0x7D55, ## __VA_ARGS__),	\
 	MACRO__(0x7D60, ## __VA_ARGS__),	\
-	MACRO__(0x7D67, ## __VA_ARGS__),	\
-	MACRO__(0x7DD1, ## __VA_ARGS__),        \
 	MACRO__(0x7DD5, ## __VA_ARGS__)
=20
 /* PVC */
@@ -215,4 +220,15 @@
 	MACRO__(0xE20D, ## __VA_ARGS__), \
 	MACRO__(0xE212, ## __VA_ARGS__)
=20
+#define XE_PTL_IDS(MACRO__, ...) \
+	MACRO__(0xB080, ## __VA_ARGS__), \
+	MACRO__(0xB081, ## __VA_ARGS__), \
+	MACRO__(0xB082, ## __VA_ARGS__), \
+	MACRO__(0xB090, ## __VA_ARGS__), \
+	MACRO__(0xB091, ## __VA_ARGS__), \
+	MACRO__(0xB092, ## __VA_ARGS__), \
+	MACRO__(0xB0A0, ## __VA_ARGS__), \
+	MACRO__(0xB0A1, ## __VA_ARGS__), \
+	MACRO__(0xB0A2, ## __VA_ARGS__)
+
 #endif
--
2.25.1

