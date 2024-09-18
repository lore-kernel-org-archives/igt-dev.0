Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DADCCD19A
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 10:54:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E1010E0E1;
	Wed, 18 Sep 2024 10:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RmEzotzF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDF410E0E1
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 10:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726656866; x=1758192866;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6xjOJ59zrHu+qNwD7YXWuVENiLK/kNt5sd7mtZ6I78E=;
 b=RmEzotzFhNAxLSe/rTgWSgvbr0smJr9ZvUa+E5YvLS1Ed+GqWks6omVO
 JcVO8bdTHWgHLCUegGQZeRuXktlP9TaIPk4BornfFuy831GJDY76IrANC
 /7re2ikIERnmgcaIyq7u8X58Xa1/D12vYn9xq/ObagKwk0OPkHEWuIMa/
 9pX4FDi0n/3bN7cnbwtVfxq/T0kBWqVnKRdHl/oOpJ25EL3ASmgs8SPAT
 A2oEdsXIjVsc9pfA4th9pHcv2E6jatW2ajxdYCNzjtlL8jHDOwQ6vhhFZ
 A3wM9s8v4QRjyAKsXE4PN2FG4kKWmnglHQk6E3+aGrCGbsbKRlF4HJ4Gr A==;
X-CSE-ConnectionGUID: gGB+YKnQTvCogj/8YDAVFA==
X-CSE-MsgGUID: 9WedKAIuSS+uk+LNo0CyUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="29452852"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="29452852"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 03:54:26 -0700
X-CSE-ConnectionGUID: Rb9IzMzKR3i/J68o0Jy7xg==
X-CSE-MsgGUID: t88GOudZSWKnr/5ql0dvew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69389607"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 03:54:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 03:54:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 03:54:25 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 03:54:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O3lOb204EHakIG6U0nidSCpGYw4MkmW3k2q7ZCOTTIXaP34vGyOE/lCPiJQphLmBVKj8XbtUHMrLVLLOTv1k3ZIoRMDm5RlTHLKSS8ir88JQb5iSfmAxYd7aQY5+tBzybhJaVOkkprF1+f7hjc0ndAevbs/oJIw9TUvf0bgIpVYPtsnXTFylOyMmzhQnqfACvELJgQnICVG0AgNBVmKljQaAyEO65HTZCAgqxmbSYfZmqPHkPdwfOBtCWgygZb8saHme7WfCaFhez+/GNCoLojwKAdUaQMGGoUn7vNNGjXHuPUWBlBfqWUyOPlFv4xNZhtV66qxk4vBX205+5I6jTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dX0z8iSxrXdZiRD4TZ2sLaZOwtBXzh32AlBiQNImgE=;
 b=hRFTxxEoK9RrCUSHeZcDZQy25LNFh0ijY6fiv8rQBrxirwGIjJI1s8GyEMWHiQs61FrqTwdlQV+uoWqxQS+sf9FZ7i4nP0kHuIa9cJZmGnDxvrvB9oz2yODOqqvc/buAsXzDVpFrT87v2hvptDfaoiBm3nG1g84dF4C9Jr6n0w4fP8wYX0hq1T4Z7AVWfFvqV6nyUeudxiVn718TZhiAoJTJSJVjSml7yVd2dY9K6jDmkSOIuJpZ/3y7wi2zLCcKdQIz5kyQm2DvvoSQS/yRckJKrY1q5SNb7wnCTGUJR1wQsmLfYDNC3XCy0rtAzfHwNWIKc3y6Py2c92cCWvx5Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by BN9PR11MB5307.namprd11.prod.outlook.com (2603:10b6:408:118::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.25; Wed, 18 Sep
 2024 10:54:17 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%6]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 10:54:17 +0000
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t v3 2/3] lib/kms: Update force joiner helpers to
 accomodate ultrajoiner
Thread-Topic: [PATCH i-g-t v3 2/3] lib/kms: Update force joiner helpers to
 accomodate ultrajoiner
Thread-Index: AQHbCaCiPjU9qEvnVU+006/F9qs6jLJdXtvA
Date: Wed, 18 Sep 2024 10:54:17 +0000
Message-ID: <SN6PR11MB2704F4EFF5C5E55D454FF987DB622@SN6PR11MB2704.namprd11.prod.outlook.com>
References: <20240918073413.28598-1-karthik.b.s@intel.com>
 <20240918073413.28598-3-karthik.b.s@intel.com>
In-Reply-To: <20240918073413.28598-3-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2704:EE_|BN9PR11MB5307:EE_
x-ms-office365-filtering-correlation-id: 6650f0d3-75f0-4766-7f01-08dcd7d03de1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?bo3qqIZ/Qv+oXOA5+1A8HJ5Js8dZgzpVjYkRIWvDuVS4kaMZChV2ttKPQD5E?=
 =?us-ascii?Q?FQC+VNQVYY/nwd+XR4SHJZt1ZhfQyk3Y/Rr/zdyeRA73U1RIvWJlAgW6/u05?=
 =?us-ascii?Q?2HOfmaXoM8pq+bUDVoxinnwcmaFlTXyd+rqXNES7YmCTRXndYX0I4Tj2sBxt?=
 =?us-ascii?Q?ifs4jRidcNSS8RPAOkBLQFQizr/rh/5lbxCGoFoLuZEcVg3wLxBS522GxfPl?=
 =?us-ascii?Q?rPTP9L3rMTCuW8cIDwEn4Qp8mIasxPiMRy+gL0+07PfexKUFy1M4qncpAtfh?=
 =?us-ascii?Q?j9pADVB+92Yck7R9Xeg/1ekfUSybtC0K08PXqPe66OuKONTLHOk/iN8rrkw9?=
 =?us-ascii?Q?2m3DkI3nfgC3PvdMUvzKZY6MM11xXZO+WkyTEWBWFSqaOT0Z2BSzCkmGN3Q+?=
 =?us-ascii?Q?7fHAoUCy5KhmzUwGUnm6+C+xgZT4/lwzQw4senVnCp7vQIA9A3Y/weZtbAEX?=
 =?us-ascii?Q?X0nJMDUxS6XuGeBw7obUnI5dVpPeujk8IePDOs5mwEHHBOsxp6+lurJDZZGL?=
 =?us-ascii?Q?cR8PrfPqMpfBftwA+KkxedIj+6PhQVHXsp6tRA4FuWASm1wIvrriWoPQJVHM?=
 =?us-ascii?Q?YnWdGNTsyEi+KJ+ZI3cvXk7XJ3PZuzQgXiNIf2gvpFoXH2HE0VnTEbVBA7VB?=
 =?us-ascii?Q?JYNac1NRY3DC/3GrSv7IIOWVlDo52O+XIN8kwiIc3dMFD53kpWh7toRG70b0?=
 =?us-ascii?Q?GhTD9XGbLv7tdW0+JICf8LmnRUEu7B5CvNyj7yQghI7G46kN0ZQQ3RE8UDoS?=
 =?us-ascii?Q?jEHFffgbskcfGn3KlYcbTg18kJ8rcO1UuICumQMNR2ofm1tniBHm0RGqPo4U?=
 =?us-ascii?Q?BgiRgCP9V6yAsOwRvu9KJhMo6UhMnP4y1gbR5hRfasJMKC60xa7yqRzJZz8p?=
 =?us-ascii?Q?/KLaV+CO7Ue8+Jpq4GnFNGANpHnMxfK/ahaXS18gjtCJOvOcEnkp+CHAtF7k?=
 =?us-ascii?Q?7SmjPk8QtZtqai1MAmG3oFbf6sdjDhyE/TfpDP1yJVEaHhIjJiv4gzDk+0rk?=
 =?us-ascii?Q?D+5+F+UgLqEO6aNYwDTs0smsHKuBNw4gbUx83xXykCmaKASPZhGWIg9AT1Ek?=
 =?us-ascii?Q?kiMBtqMSObFLifJTDjITv8sVKdFsTlWlbDxIr8oIhJ6K0+DPfpR0hbVNIJKo?=
 =?us-ascii?Q?nYJJMnMi4QnfIIDKWX3J6cYZhNrbsV9GgtJs7E/XzsjYL4ThnOoYFgqOmlPx?=
 =?us-ascii?Q?lY5DIqoCslOalm6diVc128TpwJafJH9oJP1g87fdOCVDcCyPA20lPETOu+4c?=
 =?us-ascii?Q?4Z4BQ1pGUlO0W+eca4CP7rTInwEL/AMWm7sm5JwsqSxNvF/VXCwmRCuuhQw7?=
 =?us-ascii?Q?fEG5x8o3NKaPSCoztU41BvnB+uzXvjbmR9crBX5BhPHulA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?f67TnNLAfVZHOSgvl7UYSFF94KdsCDift/qwiZdL1xXl0Jy1Kfnz2rhQOXrv?=
 =?us-ascii?Q?6YU0K2don/R1TiUvVvcLYdY/HRFGfdC1WOGoAwxgy/+xxiainJJ+0+KVatg+?=
 =?us-ascii?Q?AfIV4o5g6PzvhU97lyKePfWbtYf6H9x9K9QWpAZd0oIWSM07KXGHbAUIFxO9?=
 =?us-ascii?Q?YpMZsH357/ye+KoTIWS/GQ9ksIQjr0jIknhhe9twwrK9Wf96uX4EMqCaE9hQ?=
 =?us-ascii?Q?5cDMtJ077QiBAcB8kzHu+O5aFHK3tmNkE9tUrcD3Ju2QmNZk52Ak4SG7Bi1h?=
 =?us-ascii?Q?SRcbV4ww/BKlibQsgOx09vhFKATEaGG+pbG0t1F7eQ7WT+7695YujoVTXWrP?=
 =?us-ascii?Q?Z8BIwHooYXZpaLo7wFwpX6Y44zY00s8AtziV+O8+qgYIXlHpHWM739/UcpiV?=
 =?us-ascii?Q?bbmU36vx6/a9WmfrQRflN79gmpMuUgqw4azr6ppuJae+s/PDsGnevqRYGIR8?=
 =?us-ascii?Q?qupCG58YZM4By2MIGxzofAMdamc6T56jy5BJFgy7JLHxZuMEWI0GLOufJGpf?=
 =?us-ascii?Q?iHYoe1d7LwAa9MzUkS8oOzGVKwLKh9kb3GMQ00F/bwTpMeQuetqRwdGCVv/R?=
 =?us-ascii?Q?eePKN9kLZbo9aTC43iuiHAGjmtjSHx0CvdVui5v48m+4O7JMRPkAt5jJquSz?=
 =?us-ascii?Q?AGLXAo9rwJCgzXBZ+oLSNvOSPRJytwZUoXmpAUQn+TJTJhbiK0SGl3xVMiqK?=
 =?us-ascii?Q?1Ib0OLf/PmKLf2369JS3ByWpv0UGHYxa1NSCbxU/v5PYQA94HsUmnm4fd+EN?=
 =?us-ascii?Q?Pbws4xb7jKkyp1To6WBFBVkxdM4t1uAx8L3V5Bjs9pgYD6iSjZf1RSjvC2Dt?=
 =?us-ascii?Q?xdpBHHJYzLsSg8MmWjpMnIOFSsP69UXU/NS70tD/zy1wwqwYWrnTYwCvwi22?=
 =?us-ascii?Q?E4ZFuoPbkZvfLRN952YxkvqCTBmoIQ0yL6EfHpiwCPJqH7C7HyxRYOg48Sr/?=
 =?us-ascii?Q?rHJv6Cm1yOllbz485HpwWYtCDRXLXC2RKrhrd5jvJD45xlv+nM8D9l/zniUw?=
 =?us-ascii?Q?JXZGHG0gucuEuntKB3dM302H9RX88lJiMN9PzJSkE+GixFf2SIz3bKKjJjUj?=
 =?us-ascii?Q?li+pORTO30hn8m9pwDZbc053P5btFkk0eY4xEm84RKVe1tp+ZAutI4QS+roN?=
 =?us-ascii?Q?9gYGjT7p14Zt1sx0PbisuzazYt51aVWbhzQ0qZwYI+/JzFv3DadfQTa7LNhZ?=
 =?us-ascii?Q?5+dZvmAQytHum43PQEHZO8Wo58eSifE38eHyiIRPjcq7ZZUcXzZad2FTeP2E?=
 =?us-ascii?Q?PWm4VgCmbwunulzsX8mSoH+EAZAUuwg7xaE8ntBLQGi2ynLSMGUMpzS9iViR?=
 =?us-ascii?Q?8RgMJukJ2A6Z8cj6teq8tvWqSp0PDKxq3vvf5qxg720XlsSwDpWt5dftGn/I?=
 =?us-ascii?Q?lrgFnop24y6B92Qz0YAyvdvdgIde1wQbrPhaEWCHr+PV4JhPHQwXFGo/JFCE?=
 =?us-ascii?Q?0jDpDp0QnbB0M3JsgKVOUqgby5njQgsL91UbAwRlq2EobOgpPNlBln/1rtNE?=
 =?us-ascii?Q?QGY7wjFjp6HO1+NFYUgfHvF0UK5Ya9XmNC/kBPG3FGm+2oHJV4If9uw6x+5W?=
 =?us-ascii?Q?LcYMD9o9UJvqJMgKtK/dVs4dszO7KGPnEwHU/5qxtZXeIgujgQHOKWJmiFhU?=
 =?us-ascii?Q?FQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6650f0d3-75f0-4766-7f01-08dcd7d03de1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2024 10:54:17.1011 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OHe1Wly1G3Q9hYNff1vfuWLRGegKdhIL1kTYobs5vWMWzT4ojRl5ZRTF3hnEXvAdbN3Za/tx2xT2ctdEWFFbROvTvyNF0Po5gFm97iMY4RZhZ/UVwkhjYQVbsZEK7DpL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5307
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

LGTM
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

-----Original Message-----
From: B S, Karthik <karthik.b.s@intel.com>=20
Sent: Wednesday, September 18, 2024 1:04 PM
To: igt-dev@lists.freedesktop.org
Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Reddy Guddati, Santhosh=
 <santhosh.reddy.guddati@intel.com>; Joshi, Kunal1 <kunal1.joshi@intel.com>=
; B S, Karthik <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v3 2/3] lib/kms: Update force joiner helpers to accom=
odate ultrajoiner

v2: Split the lib updates to separate patch (Ankit)

v3: Use enum for joined pipes (Santhosh)

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 lib/igt_kms.c            | 33 +++++++++++++++++++++++++--------
 lib/igt_kms.h            | 16 +++++++++++++++-
 tests/intel/kms_joiner.c |  2 +-
 3 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c index cf453dcfc..a39d1176f 10064=
4
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1720,34 +1720,51 @@ bool kmstest_force_connector(int drm_fd, drmModeCon=
nector *connector,
 	return true;
 }
=20
-static bool force_connector_bigjoiner(int drm_fd,
+static bool force_connector_joiner(int drm_fd,
 				      drmModeConnector *connector,
 				      const char *value)
 {
 	return connector_attr_set_debugfs(drm_fd, connector,
-					  "i915_bigjoiner_force_enable",
+					  "i915_joiner_force_enable",
 					  value, "0");
 }
=20
 /**
- * kmstest_force_connector_bigjoiner:
+ * kmstest_force_connector_joiner:
  * @fd: drm file descriptor
  * @connector: connector
  *
- * Enable force bigjoiner state on the specified connector
+ * Enable force joiner state on the specified connector
  * and install exit handler for resetting
  *
  * Returns: True on success
  */
-bool kmstest_force_connector_bigjoiner(int drm_fd, drmModeConnector *conne=
ctor)
+bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector=20
+*connector, int joined_pipes)
 {
-	const char *value =3D "1";
+	const char *value;
 	drmModeConnector *temp;
=20
+	switch (joined_pipes) {
+	case JOINED_PIPES_DEFAULT:
+		value =3D "0";
+		break;
+	case JOINED_PIPES_NONE:
+		value =3D "1";
+		break;
+	case JOINED_PIPES_BIG_JOINER:
+		value =3D "2";
+		break;
+	case JOINED_PIPES_ULTRA_JOINER:
+		value =3D "4";
+		break;
+	default:
+		igt_assert(0);
+	}
+
 	if (!is_intel_device(drm_fd))
 		return false;
=20
-	if (!force_connector_bigjoiner(drm_fd, connector, value))
+	if (!force_connector_joiner(drm_fd, connector, value))
 		return false;
=20
 	dump_connector_attrs();
@@ -6420,7 +6437,7 @@ bool igt_has_force_joiner_debugfs(int drmfd, char *co=
nn_name)
 	if (debugfs_fd < 0)
 		return false;
=20
-	ret =3D igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable"=
, buf, sizeof(buf));
+	ret =3D igt_debugfs_simple_read(debugfs_fd, "i915_joiner_force_enable",=20
+buf, sizeof(buf));
 	close(debugfs_fd);
=20
 	return ret >=3D 0;
diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 4455632f4..2461fa47c 10064=
4
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -260,9 +260,23 @@ enum intel_broadcast_rgb_mode {
=20
 struct edid;
=20
+/**
+ * joined_pipes:
+ * @JOINED_PIPES_DEFAULT: Default setting with no force joiner
+ * @JOINED_PIPES_NONE: Force to exactly one pipe
+ * @JOINED_PIPES_BIG_JOINER: Join two pipes big joiner
+ * @JOINED_PIPES_ULTRA_JOINER: Join four pipes for ultra joiner  */=20
+enum joined_pipes {
+	JOINED_PIPES_DEFAULT,
+	JOINED_PIPES_NONE,
+	JOINED_PIPES_BIG_JOINER,
+	JOINED_PIPES_ULTRA_JOINER =3D 4
+};
+
 bool kmstest_force_connector(int fd, drmModeConnector *connector,
 			     enum kmstest_force_connector_state state); -bool kmstest_force_con=
nector_bigjoiner(int drm_fd, drmModeConnector *connector);
+bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector=20
+*connector, int joined_pipes);
 void kmstest_force_edid(int drm_fd, drmModeConnector *connector,
 			const struct edid *edid);
=20
diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c index 633b=
f51c7..e193f9071 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -106,7 +106,7 @@ static void enable_force_joiner_on_all_non_big_joiner_o=
utputs(data_t *data)
=20
 	for (i =3D 0; i < data->non_big_joiner_output_count; i++) {
 		output =3D data->non_big_joiner_output[i];
-		status =3D kmstest_force_connector_bigjoiner(data->drm_fd, output->confi=
g.connector);
+		status =3D kmstest_force_connector_joiner(data->drm_fd,=20
+output->config.connector, JOINED_PIPES_BIG_JOINER);
 		igt_assert_f(status, "Failed to toggle force joiner\n");
 	}
 }
--
2.39.1

