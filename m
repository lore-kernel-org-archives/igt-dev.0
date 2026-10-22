Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324B8606A319
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 06:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MsrSgL5d
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D684910E0C2;
	Thu, 22 Oct 2026 06:32:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502C610E117
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 06:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792650706; x=1824186706;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=21BLFLWIYeUTErTPQEoY80wH/w/TWFsyFph/+EljNEQ=;
 b=MsrSgL5d6q4oe+8g6T53p1LgdqZ0kz35AZHSw7dm5OlTkbxVTTF7v5zV
 4UPJOqCp0IWBeYsHLJnw1iDWMFfdJNRebH16DM0F6siRiBpCiev7W3yYw
 Uu9hdv2KvuSr2yNnqGQOpnUiSOZrqISawHsYhJHVDapZ+f5i86c7pWpXx
 myZmK4jtR/IPQFHoUWf02x2SZELVsQtt+EFdFQbgCk28ECv16OumZIprC
 GgGVYPCq+vBA7NTeipyD6LkFAggAT7wa+Alg1L6D4f0wyyfSR3FLfKywE
 NQIvrFn98MGtf4/YFHW4DVoZwYP9vEMUduMbJ5QWX4A90JjlsJ7dg1/IJ Q==;
X-CSE-ConnectionGUID: 6Qmdu6zrQnax+Mq2SooCbA==
X-CSE-MsgGUID: pDMdzjZPRZyUGviUBB10jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1265478"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1265478"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 23:31:45 -0700
X-CSE-ConnectionGUID: Yt/bZBocRVGl2m851h3omA==
X-CSE-MsgGUID: pZTzVTiVRO+hqThIPZVwCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3689522"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 23:31:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 23:31:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 23:31:44 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.33) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 23:31:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=esJr8r5Zax6aEiRnCw8Yc5N6Oo1H2wt8cym1QeCC6G5GPXU3s/o/41HTmEx6bEeJHv+FqVETYVRDyIN5cXHqSniAn7JI8uqYsvMPibcdT79E0KSQS8aalVURew/+KOfZmgpXCahHftJKRhKzJchNZNkJXN/Q2eN4HZsCI1j9OfO90XWwXT+F3DF0EZ+78JldzlXoxXdN+LNCXDdri47CdvJVpquKe5D/h+Qzqo2YwnxxQpoJveHQHoSUVoBd8+8kdIBpnaClxTxQtb90NtxZtcaVzjecR3VOaWCj9m7I2An5KAUjrGnhbBRZ2NNZ0O3QgyHd0QvxNRiX/+Ot+cFSdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQvGJe1gq2cjANG/y5iaOvzgbn3GuSA6ClujqnHLQIs=;
 b=QFNHu4PtfrfMPqLYDQctCctn1P91Dus9kGsXtuUVjPkYuQSWFXABoE81quylsu2I4wTIIIXsH0AAOG8tHmBH/bhaP8oFNpBkXz8n8b9nniodvqPMSpLePxRDaSpSBAMEdvjFHwr1ZMTm4yXBhzQHUv2LcZj6ScWeYY8AbJaSeylI+a38HxqXL6Fsl9GejiGRjbhyPzwSpuAqTN3jZhj+8jSSvmpDUz7yJgw0BvpkKsLZp9N9rG//m5vcNcFeT9Wo4U10Lqg73FGIbzVrltsqSid3+mHIzgaLSljQOKFOyDE7ZOtdJujxSGcW6MqTnodl/X2R7PCvvCBu2t4Z5jDTtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN7PR11MB2595.namprd11.prod.outlook.com (2603:10b6:406:b1::24)
 by LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Thu, 22 Oct
 2026 06:31:35 +0000
Received: from BN7PR11MB2595.namprd11.prod.outlook.com
 ([fe80::b0e:2ba5:7120:cdd9]) by BN7PR11MB2595.namprd11.prod.outlook.com
 ([fe80::b0e:2ba5:7120:cdd9%5]) with mapi id 15.21.0496.021; Thu, 22 Oct 2026
 06:31:34 +0000
From: "Patil, Shivtej Eknath" <shivtej.eknath.patil@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Konieczny, Kamil" <kamil.konieczny@intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>, "Balasubramanyam, Smitha"
 <smitha.balasubramanyam@intel.com>
CC: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>, "Patil, 
 Shivtej Eknath" <shivtej.eknath.patil@intel.com>
Subject: RE: [PATCH v10 1/4] lib/igt_sysfs: add vram d3cold threshold helpers
Thread-Topic: [PATCH v10 1/4] lib/igt_sysfs: add vram d3cold threshold helpers
Thread-Index: AQHdVufWsLwmJ2jZMEqkJhFh4IC5ULcJL88A
Date: Thu, 22 Oct 2026 06:31:34 +0000
Message-ID: <BN7PR11MB2595CEF83F484B243E5514CACD652@BN7PR11MB2595.namprd11.prod.outlook.com>
References: <20261008054220.6121-1-shivtej.eknath.patil@intel.com>
In-Reply-To: <20261008054220.6121-1-shivtej.eknath.patil@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR11MB2595:EE_|LV3PR11MB8508:EE_
x-ms-office365-filtering-correlation-id: 98a89916-21e5-4b1f-74e6-08df30061e66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|261009221227099003|261009223327099003|261009220027099003|261009223027099003|10067099003|261009221727099003|56012099006|6133799003|22082099003|18002099003|38070700021|261021121427099003|11063799006;
x-microsoft-antispam-message-info: 5CFZurArgresF386iy0XDuHMdRmLmFixY9/J6BKmGlXLCojAp4DNl4XHfrQboFuP1/NtoRoBOCdJY9+kzFAerba4LZtf6pkkLnvdlmQ7D7O/VlvBF+csroVwI7MzcQ6k7VErnFRFOXjAz8wuC2ujZVykkfY/0HWEkcC7cZSXv4z7rFqLHjO3FDCsfFVpszw0rOPzOc7bJneAF9WnpfYHJEm//qTNFk99pBtIGKimIDcAMgQh5nqBJ1NrsM+3KotlTLqrDs/Z6MrCXYr3fokKD9ODiHlfUv8fEeCFyhG2kmvdOuYvTeprHosqV4mZ6rblTig9mMegDmmjvT81rD1PbB9l6/UI6auy7CodBkm1uKQg2hZfGIAxnlk86XrOFtOPsMFZaIcaG82JYXe6lul5LusB94VkdaFRN7WtWBVG4gs68KWWwKB7Io7ijNZZ2xkqyubslmznJ4Y0R4QTDhbGfkQypYp0gqwp/NEy08YAaqclxochadqO0/ObjYrxVDNmOj0msA7w/tq107XRnWT7BCAqipFjlOxUxMPSRuAaZ1wMU6v9sDCQjdiA9T8xDnPWub+KbLEmkkW8fw8gIcLfr4M6slrjHuD1H61LiAdrn5XS5jgAbW0ICs4QC4w7oNXqkl6FekLaSMfjrRnXofR5zjBmJUGn7byCaCYD6j9vSobPEwCop/8ttwNlbx1yzoPhThyMqn5EyLInRHNvuaqaKfyqc3irrs8rLksgDJU/oxg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR11MB2595.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(261009221227099003)(261009223327099003)(261009220027099003)(261009223027099003)(10067099003)(261009221727099003)(56012099006)(6133799003)(22082099003)(18002099003)(38070700021)(261021121427099003)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EMmcVEs8++qfFBwkE1LPUmhuRvRPOtWq/UkPY4xTDuqbGRxwuljUzDfOC2ZN?=
 =?us-ascii?Q?A5tMpSR8+NNOjazekTaJXXRUZNevnOXjA5iMNHe5NhWSXaRVVSOh5g88wwlu?=
 =?us-ascii?Q?qz8O5b9k5raFHD7kgLAChG6pROe21KCCi+QKMfZaJyXHQrLwl8Cl085F7Iur?=
 =?us-ascii?Q?pX3hJQGgGpYc0psUEyXRBagpBcFLXfbpbH3qAnVAClEsDuVjTqt/eFDH6mr1?=
 =?us-ascii?Q?4Vq2e+tXCYgW5E/I6kDbZBqs5HbrfovXJL67KNFmzxT/d6Pg/l8dVzTv2+ND?=
 =?us-ascii?Q?ocw5ny/NCivumuULyhXmevEwePRB6M+Se0+kNKmfrdLaHBW3J76F2qwk5Q32?=
 =?us-ascii?Q?/3wYXm+E1qW8bg9tP7roM0nlxSJunjOqjSlYX6IlEJD+9vX9/oMXewCz8YD+?=
 =?us-ascii?Q?2QOcH9/O554J6oyDDvsjHHZkR/gMhdawLUtR4yp7xpP9l4Gt7r+o3e5q9jSy?=
 =?us-ascii?Q?96UJROX9YtLirjtenn8uPngWkMxEUfDafrHro7pCSpRGNigNctKquA3Ooth1?=
 =?us-ascii?Q?wa8POSNC13FkxiXaqhY8/REFx8K0DgX+sc62N/XoxmiuifsGoJoFtt/S8WPt?=
 =?us-ascii?Q?BdEfUcwAzI/l9qLVIDihHYjyuiIrqSpZYIie8T+Az4Qg8EULTz0pNAbD7J8A?=
 =?us-ascii?Q?csiKWmpC4GlNenGW+9YNNA7pNEdTKYCNjmJoEqYHmZJEgMipBLrkLIMLBt+0?=
 =?us-ascii?Q?T7C/lQXZcTIxX1c6PF0zsjZTaBPrtLwiDHLZPcwXJ/iyfXZg8YwBRp+KSz0U?=
 =?us-ascii?Q?jKj4Sh9pdcQI/M/6kd20pWxYgRqIkcm0TMXiQP0XNqg2J7H+j2d17N5bux+r?=
 =?us-ascii?Q?gkVoXrV9P2xkm0MPuv/KDmt3kluC0Ey7tI8Z3tk7Rnz5mQk4XWed2NXVXOV0?=
 =?us-ascii?Q?bdx2cHUboYSaIXEw4sdwBC2EUhx0oLnSHHBH1IvaXG+rv93qi0sqQUrdpuj/?=
 =?us-ascii?Q?/fuxuuq3It21YSjIFYr8ckjaD1hENCWi9qtan68MMLdk+aO+GDseiZz0CLNe?=
 =?us-ascii?Q?A9V9kMzN5t7zj4ln8ZNMoRilXWGbLcoCOo75kqhYfumazrmkZpII1CkRmEKe?=
 =?us-ascii?Q?cYx0cW+ZGXzTrq3R5t8B7zerKmnwe3bYK1kOsHB3h2K8eblY3SunUR7hu412?=
 =?us-ascii?Q?13t+aPwaO5xh2suNu/ATLManG2diVEOftp7Ujuj5H60fRmhT3N1T1XDMgSnj?=
 =?us-ascii?Q?WgMfduvNlrR52sd7dokAGIgCY3ZCFcyGpV9U8cPcMJ5aIYm9fHdAUyj6ckWU?=
 =?us-ascii?Q?faGJ15s3kT5FpI2XZxpXLpX3P3g/0oaL/2oLr8LkUN5uvd649vArEo5cAVBm?=
 =?us-ascii?Q?Dw5cKUvZpTC8cqvGKOuqxCft+JrIBkiYxMzjRafyZHhRyqcsi9Y0HYj6Na4X?=
 =?us-ascii?Q?3JTSfWXzXPeMq3qIISDoKFBzxJ3RHzGqFjea9BWSMarXwGBHHFQ6dHcHXsrY?=
 =?us-ascii?Q?fMjpkR7f16pupqc66dNK7uzgXd/e5NPkgjQh8iz9HIqDOke3F92tzvJah22k?=
 =?us-ascii?Q?u0P8HRtQ2CBqtkN9R5Dm/5zikGy1Hs1r3crwOGj2K5XSbkCH8Khemt+dePeT?=
 =?us-ascii?Q?gJIgnmvq0e4NTyskhQgzuCXyTnDSI35VBbXT/aPyTv0FkE2quJ0yT3udImgT?=
 =?us-ascii?Q?7uL6HrDlKlzbOSmT+tbjqjqcOcUTLCNqbXftX0f1/S8WronicdaJ8J24aCQA?=
 =?us-ascii?Q?SrwYi71EAB5daUGCKrMtOFHkojoMeSf13KofvtjGJH5CWdB/0YvtvwS16FrA?=
 =?us-ascii?Q?CiTx9qubmzEJoTBEFlCqUu0WNatNnVE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: snBOeroUm1pTQED12dnwb7L3BFtl6aiuYImbSdFBGWxsDtS9ccZviZ6qaBk793VFYsr9PypfTlTks4SsM2MqGr8LYBYzLanU4FHjlCIc1hdBOL1OIif9NJHkPHWIWRDaOdOe5VhPrVYDXJRX/XrNUVOenr0VlBA9XFGWaTfjbiThNq6Yg97+RefdZSRzh4ZQZo6+S7Dc19DpA+rNoUFERfFxX4AVA/7ueCnlnyWtCELwRM+PAdp2Pqy9o9/JmjzN+6eUUK0w94BkeamXMa1d3v4lsRbhFVJ+e3IA+bEGCWv+TO5E9jkligqUQwKyJZp9PnnfI6tPBts76SEiI2aZ2w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2595.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a89916-21e5-4b1f-74e6-08df30061e66
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 06:31:34.7491 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s+sMNmWAenB0/nkJ6cnNAE74vlYLCc1T6lGNZw2lWYoiEzh6LGFw/cmI17fp+TernXiFCsPpRpiLyW6DtNcZl16X4ZwAONP16ZJl4weooQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8508
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Please ignore this patch.

Thanks,
Shivtej

-----Original Message-----
From: Patil, Shivtej Eknath <shivtej.eknath.patil@intel.com>=20
Sent: 08 October 2026 11:12
To: igt-dev@lists.freedesktop.org; Konieczny, Kamil <kamil.konieczny@intel.=
com>; Sharma, Nishit <nishit.sharma@intel.com>; Balasubramanyam, Smitha <sm=
itha.balasubramanyam@intel.com>
Cc: Piatkowski, Dominik Karol <dominik.karol.piatkowski@intel.com>; Patil, =
Shivtej Eknath <shivtej.eknath.patil@intel.com>
Subject: [PATCH v10 1/4] lib/igt_sysfs: add vram d3cold threshold helpers

From: Shivtej Patil <shivtej.eknath.patil@intel.com>

Add vram_d3cold_threshold helper functions

Add helper functions to read and write the vram_d3cold_threshold sysfs attr=
ibute.

Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
---
 lib/igt_sysfs.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h |  3 +++
 2 files changed, 52 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c index 3646dbacb..601e898ec 1=
00644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -1012,6 +1012,55 @@ void igt_sysfs_set_u64(int dir, const char *attr, ui=
nt64_t value)
 		     value, attr, strerror(errno));
 }
=20
+/**
+ * igt_sysfs_get_vram_d3cold_threshold:
+ * @sysfs: sysfs directory corresponding to the device
+ *
+ * Reads the value of the vram_d3cold_threshold sysfs attribute.
+ *
+ * Returns:
+ * Current vram_d3cold_threshold value.
+ */
+uint64_t igt_sysfs_get_vram_d3cold_threshold(int sysfs) {
+	uint64_t threshold;
+	char path[64];
+	int ret;
+
+	sprintf(path, "device/vram_d3cold_threshold");
+
+	igt_require_f(!faccessat(sysfs, path, R_OK, 0),
+		      "vram_d3cold_threshold is not present\n");
+
+	ret =3D igt_sysfs_scanf(sysfs, path, "%" PRIu64, &threshold);
+	igt_assert_lt(0, ret);
+
+	return threshold;
+}
+
+/**
+ * igt_sysfs_set_vram_d3cold_threshold:
+ * @sysfs: sysfs directory corresponding to the device
+ * @threshold: value to set
+ *
+ * Convenience wrapper to write a value to the
+ * vram_d3cold_threshold sysfs attribute.
+ * It asserts on failure.
+ */
+void igt_sysfs_set_vram_d3cold_threshold(int sysfs, uint64_t threshold)=20
+{
+	char path[64];
+	int ret;
+
+	sprintf(path, "device/vram_d3cold_threshold");
+
+	igt_require_f(!faccessat(sysfs, path, R_OK | W_OK, 0),
+		      "vram_d3cold_threshold is not present\n");
+
+	ret =3D igt_sysfs_printf(sysfs, path, "%" PRIu64, threshold);
+	igt_assert_lt(0, ret);
+}
+
 /**
  * __igt_sysfs_get_boolean:
  * @dir: directory corresponding to attribute diff --git a/lib/igt_sysfs.h=
 b/lib/igt_sysfs.h index 9cbd216e6..8bdf97060 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -135,6 +135,9 @@ uint64_t igt_sysfs_get_u64(int dir, const char *attr); =
 bool __igt_sysfs_set_u64(int dir, const char *attr, uint64_t value);  void=
 igt_sysfs_set_u64(int dir, const char *attr, uint64_t value);
=20
+uint64_t igt_sysfs_get_vram_d3cold_threshold(int sysfs); void=20
+igt_sysfs_set_vram_d3cold_threshold(int sysfs, uint64_t threshold);
+
 bool __igt_sysfs_get_boolean(int dir, const char *attr, bool *value);  boo=
l igt_sysfs_get_boolean(int dir, const char *attr);  bool __igt_sysfs_set_b=
oolean(int dir, const char *attr, bool value);
--
2.43.0

