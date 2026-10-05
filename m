Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB591CA5FF0
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 16:53:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613BF10E27C;
	Mon,  5 Oct 2026 16:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="POW5TyZz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E278210E27C
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Oct 2026 16:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791219142; x=1822755142;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6LvwJhHAmptIpfWqkqgXOr01nN4Xh83MBcF+Z+AbVH8=;
 b=POW5TyZztDfhx6WBIvLIycsTjtVXjrrKyzOJKIZP9mLrwkd8kRBnhOBb
 3nF/rjS8I+DqgRey+0mVAxAiTcN2fV9VrBU9BhMLjnfRJf5cXVyEmPC6+
 9msDmjmKrW26fsKjU5U6ExuGDyy+LFT5zAus683k/HPZU8+D672/oI0xz
 JSramAyK9iGjjK4I1xv6cIcIBs8GcOBgnEs2L1I/OdRvyvGg8/865DemE
 RQb82PhuH9J/7sSREheQ9E5+tx/4ZJdr0XuIBPvrAoATMfa8Yk2Dj7Whj
 8qIS0unXwjfSj9IWvRQJxznrICN3VHt4WGWgqLrksYE6xh//Ri5+Af6oE Q==;
X-CSE-ConnectionGUID: LDU1PUtoR967ja4pmlVr0g==
X-CSE-MsgGUID: 3xbu8eFaQsqRl4SskH3Rtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="91106358"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="91106358"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 09:52:22 -0700
X-CSE-ConnectionGUID: yrI2Qsf2SLWtT552JuGGTg==
X-CSE-MsgGUID: MeTGDnWMT3+QmN1CYm7sYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="275982667"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 09:52:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 09:52:21 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 09:52:21 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.42) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 09:52:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wEDH8/y2TAloYX1hsXLvrWuxTBg7mIfEn3xUdSddRB5ewuQQYAXq9iVlmMFb3TygPcCWFTmFPOo+luTICWvDRtpfCp1/K9qIxReQW9Wx1uhJQLVY0erav+xBm5YgOvWx9XoYXTYP8D3KWXomb9T4hIFJOdaQNKn7NHL9K7nsjFdPZyKE4J32qKnnzB3X1S5FdzStvbvTe0uv8v4yIQ7O1otEXXddlbbzjCV12DpQ+wIVOhym0khINIO9zReBgChPVeoB6SWVO/z2k3iUgBn3V4pSNvavRC3lnBzPmeWOsj2t59fK47RJOKHM5LreTrosM7eF1v7c0fQoDdT45o8MAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LvwJhHAmptIpfWqkqgXOr01nN4Xh83MBcF+Z+AbVH8=;
 b=RWW3kq3KupaZWLnYyO28DUWZLpZv/wfaoQiayzWUbGDaByO7pc2isP31gvjoH95B/LXZItzpZC2djxTAogXZjVofNI8fVdqSUI5Z2mGpr1xfD+WwSdFG3GRNb3+TgLOBNngMeOAARniEOlpjpjEPBYbj0l6B4WwbdZpopIL5Wt8N2RlqlK79GUARlDxIDBm9D/qq6nWMMdC5h8aau1fMILDrNpe2NGND24uhTfF3XVHUYkk0kl5Ax5khFDzWct68tfE+qPOSkn1U9QAo0fSSnMQJKKJ8RlSFAdunkjk/2/WyagvOt1o8XNW2ZV4qx89TsOFHPtyoK9IhDtC8nczGHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5776.namprd11.prod.outlook.com (2603:10b6:303:183::9)
 by DS7PR11MB6128.namprd11.prod.outlook.com (2603:10b6:8:9c::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.18; Mon, 5 Oct 2026 16:52:18 +0000
Received: from MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::b568:69e9:7abf:180e]) by MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::b568:69e9:7abf:180e%4]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 16:52:17 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: Re: [PATCH i-g-t v1 1/5] tests/intel/kms_alpm: add ALPM test structure
Thread-Topic: [PATCH i-g-t v1 1/5] tests/intel/kms_alpm: add ALPM test
 structure
Thread-Index: AQHdT/GrgMu0dsz8eEGco55NKQYGlbbup7Pv
Date: Mon, 5 Oct 2026 16:52:17 +0000
Message-ID: <MW4PR11MB577685F3F4209B3EB6039972DA962@MW4PR11MB5776.namprd11.prod.outlook.com>
References: <20260929090454.2796967-1-sowmiya.s@intel.com>
 <20260929090454.2796967-2-sowmiya.s@intel.com>
In-Reply-To: <20260929090454.2796967-2-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5776:EE_|DS7PR11MB6128:EE_
x-ms-office365-filtering-correlation-id: 004dcaa9-905e-497d-2e32-08df23010406
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|38070700021|5023799004|11063799006|4143699003|6133799003|10067099003|56012099006|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: BJBfqlyldrfy4Z73Xcp2Me32FQEB27F8Nw+IBo70RMQCVVSn0iy/SxlsCRByeqSDjDR8W/NnBdxH8BHGIiZtOi6oOwdTcYBFTx33Cet8j4FJVmAAP3cZ4N8Z9NxG6kXl1aNmPUBO9nC4VqMJJ/AsaLFI5v3Rlp10ISZwO+Y8WCEsdkSvxNSuUsJ3IItp02i4+ajwXIoewyTf+Y3caJwsYu2XQLb2PQjpuNfM74UosOUpqsKKJBR+RCP2Rjiixa/KYZCdR+GwQZBGWql0GSm5SLfsImX1rNM1YyoHhvTRzbuiV8cm+wJWLwB3kssE33CtSjq+BbiKdLdMSEDeCWiRk6WHGGfdf0A1son/BTLMI8JrmKHUgJOs/SPGMLGqYvn360IpC8Fm4KdSlikHfT0FRdM1qh7Vzj07hlBPp4hv6aSBdeiHA/7KVrPQBU7XuPsAYrSnRLJ5t7FNwtZGH4KqxJ+lFq+FCy/sZ2qMBkKB4G/QBqw/Aq1U2suzQ4K/r54qjRWHDdB9ESShFAAu0AIJnOMxSF/qj7y0+DzRH5+XDov6yp2ro8Gqro8C04h64UgumGVvJZrxFLquCnXGqUd3gjxqLdEaGa6dXZhCmOiROkgiuSEUrAaXD+IO02LgJnXvCnN0bd8hYJgmA4bHW3NyXva9rNzpk0DieU6udgWkqOeyGQKg2ujNlIWShIkw8kMSMiMIP+mGdAIkMTTNCqCKyhwuC/l8ZzjZXGZWDQIvRpk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5776.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(5023799004)(11063799006)(4143699003)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?SzsCdugFeJm5NEbkcTtavco54ccfbI1qgShBlkLZsGclssHGXdww9H370q?=
 =?iso-8859-1?Q?6x8Vi/2Ec+UReY0jAOpTXP2QdwICZ/U5vWtZA89yApeVSO/CeAksf0T1v9?=
 =?iso-8859-1?Q?t1WeGyh+hbPJ8znctZaRnJjaPMeSAQl2rzEn9Yi3uahrz2LCssYeb0YQzl?=
 =?iso-8859-1?Q?J2+Zi5de9UXbl3UkKnNoCetE07aY67Ca76XpV3FBqqLo7mkb3aa1oYsm1W?=
 =?iso-8859-1?Q?Fyg/6OA+PdrEVSl5+pUvyHlLCiSPM9EoebybF3c26c+GzcNDwGH8Sjj5CK?=
 =?iso-8859-1?Q?IlbMEfGEn6q+tBaKn1hmXsd9V3GFKzEoNesEabO4MjFVw6Ckxd3qCvO93j?=
 =?iso-8859-1?Q?7NSBxy5+6asYmb6kUerp9VbXVbtvZ3uQPJRUtaK80ZygW6hJMBwVVIf9kU?=
 =?iso-8859-1?Q?dIkaBBUwi0g9v7Jmzz+advt9dVgtPseQ4/IBoud+VaGOYOiWl69sWb48oJ?=
 =?iso-8859-1?Q?wT8u4vIwJVzPQ9oXfGg+c63krWqbOFfJtZidu1fTtj/eICLBSqCCB9l33p?=
 =?iso-8859-1?Q?LFoMCWM1PW32IwXqb/nVZYISSdY0lnq2ZtWmpx8cGkUSFqsHP4X9LkRRSw?=
 =?iso-8859-1?Q?94nwF8reILvrtX6ms6FycsyJabXZ2/5Mc8tv6NuPo0B8h7ws7jLqo28V4K?=
 =?iso-8859-1?Q?6hZYNmiRbPjW6bbU4uEtl+12JhXxPX9wA3swjmH1yqYwFSTJ6S1lDMasaw?=
 =?iso-8859-1?Q?nSiOKOWPuKed9JGjE2dupmJKViSxpLYWIj6aq7wamTUIZVcIsxSW/tA/Vx?=
 =?iso-8859-1?Q?W1/HMDoqnwVnkKkHhO1eGKG3EBto6b45yGn3ATJN2RtPcptVbGHOOMmNz7?=
 =?iso-8859-1?Q?OJdt1l+hhM3+Yzy/jXuEFvj8ONc4TX51pePe1yHSatFrTC95rpWG8RJT/L?=
 =?iso-8859-1?Q?Dxezv6J7tQXygcJ/uNSjQtyczFK6NBmRta2jwNjUFnxsmFOsL0+5R9USee?=
 =?iso-8859-1?Q?TNlfaIbqOHfEC3cJmrPMxj0QSJquVnWzaAmXN+2ec/uhKnGlX2jZGxaWcY?=
 =?iso-8859-1?Q?Jktt8iGiLbobfPlmiLcrmUEoSBVuqeU0m1jCZn+sXxT+k7CuigDSbfupSF?=
 =?iso-8859-1?Q?QddL2DNwkifO6psDe+xmiMANY9u9SIhOFpyyz7GAk95uk0yTG0oNqWE14R?=
 =?iso-8859-1?Q?7WaZzPAy8pJeNv/cf3LC8sUGWpwCVXONCpkrqCXFIpaKPWpSG1IA5bOmcL?=
 =?iso-8859-1?Q?COuCKt/DCawBVvWBg06cuqnLfHBy7qHuuxKnJWKvJJ+hqQdR76ODsdJC4B?=
 =?iso-8859-1?Q?vrqQwAFNf1yBOAaXaCT7RNSJJGV57ZNxIgxlJaSEYlzDIhHpnX0fdRpB6a?=
 =?iso-8859-1?Q?+PzQp+XwHA2bo2h7Ru7v3HGT3W3RjEhNbq5DMR0JYfzrA/Anw76Yg8P401?=
 =?iso-8859-1?Q?1lGe6PdQ1chpOhryCZV1wBpEqKwGNFhUvUkXejqlUAXHquWQFWfAPxfoHB?=
 =?iso-8859-1?Q?votUIAaz4zPVpobyX3gCsrV19k+Y7cQZMYMGVXu9ftJ2Rp4DJQv935yqJI?=
 =?iso-8859-1?Q?cl7hVMn6lZIBON4zpMSllzEV0exd+YhhDPFO28ruHyj2Vz+b9pKeagb/po?=
 =?iso-8859-1?Q?nXWKokPNY8i56MNnqhkSryc4W1nuexcVp3vbYGKKIN6tA07m7U5b/lg0Nw?=
 =?iso-8859-1?Q?JqRUbi6EoeiNNOc1KGeuNlTVJcKyRm5vhcZRJ+VGMGksQzBDXbDZbHdOSY?=
 =?iso-8859-1?Q?GjsCIIcw/TEPfMvbBE8L4/g/u7NZa+8mnCpjrl24so4naQM9fdwMI0yQ0U?=
 =?iso-8859-1?Q?vEXMgnxbfoasJ7Gy2VHkK4QqSvjy9j0hBDGu5meB5D4oA4S35RZFj53dC2?=
 =?iso-8859-1?Q?MsX0HWi4Tg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: puaiptQEKJBiD5gpHkOaLWqrKxcCKtK8ujZQUEin6ZtlxJC7jXLw5Ye5BRf0XNzqApXTA6NQVBLiOBeJ0BZGgraBcSPV35yHJCxdx45jikBWfgxo1wyrmPaMMcpyuiLjCWEuOnvEGL1ajfK9GjqokGGsBt8OjKImnpwZXFlN3iE4+lFGgSwNGsv2z12t6ECm/TmrAQ4pjo1QfiXl/7YOPdWM6sAez7y+VIJpWuibU+HRr3Vdg+yNTo5yM//wYQrT8RMCkvV2UBn46bEhHG73n7cSWqtXbjwZHYMqH5tD4tKYvCH+95+63aL073XcvQj5qN2E29iXJhPea7yq5e6FJg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5776.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 004dcaa9-905e-497d-2e32-08df23010406
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 16:52:17.9330 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OuJD10kus3+nA3TBoa6Jch5Qt0I2GaV5QvzR8OUZbC+GwiqH6bUNfJe8fG9bbVYSH9TMh6nyOuDqRCpcYFRQtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6128
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


Hello Sowmiya,

________________________________________
From: S, Sowmiya <sowmiya.s@intel.com>
Sent: Tuesday, September 29, 2026 2:34 PM
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>; Joshi, Kunal1 <kuna=
l1.joshi@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 1/5] tests/intel/kms_alpm: add ALPM test structure
=A0
Add the kms_alpm test scaffolding covering ALPM (Advanced Link Power
Management) on eDP and DP 2.1 outputs: the shared alpm_status/data_t
types and the igt_main() fixture that opens the driver, requires an
atomic display and enumerates outputs.

Could you please squash this into a single patch?
Any lib/ changes can stay in a separate patch.=20

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Assisted-by: Gnai_Claude:sonnet-5
---
=A0tests/intel/kms_alpm.c | 96 ++++++++++++++++++++++++++++++++++++++++++
=A0tests/meson.build=A0=A0=A0=A0=A0 |=A0 1 +
=A02 files changed, 97 insertions(+)
=A0create mode 100644 tests/intel/kms_alpm.c

diff --git a/tests/intel/kms_alpm.c b/tests/intel/kms_alpm.c
new file mode 100644
index 000000000..8bd71a981
--- /dev/null
+++ b/tests/intel/kms_alpm.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright =C2=A9 2026 Intel Corporation
+ */
+
+/**
+ * TEST: kms alpm
+ * Category: Display
+ * Description: Test ALPM (Advanced Link Power Management) on eDP and DP2.=
1
+ *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 outputs
+ * Driver requirement: i915, xe
+ * Mega feature: Panel Replay
+ */

alpm-lobf only works with Panel Replay off, so "Panel Replay" isn't
the right mega feature for it

+
+#include <fcntl.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "igt.h"
+#include "igt_edid.h"
+#include "igt_psr.h"
+#include "igt_sysfs.h"
+#include "intel_chipset.h"
+
+#define ALPM_INFO_FILE=A0=A0=A0=A0=A0=A0=A0=A0 "i915_edp_lobf_info"
+#define ALPM_INFO_MAX_LEN=A0=A0=A0=A0=A0 512
+#define ALPM_TIMEOUT_MS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 100
+
+/*
+ * The kernel gates creation of the ALPM debugfs files on
+ * intel_alpm_source_supported(): external DisplayPort needs display ver 3=
5,
+ * eDP needs display ver 20.
+ */
+#define ALPM_DP_MIN_DISPLAY_VER=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 35
+#define ALPM_EDP_MIN_DISPLAY_VER=A0=A0=A0=A0=A0=A0 20

intel_alpm_source_supported() doesn't exist in drm-tip,
please specify if tests are based against any floated patches which aren't =
merged yet. (in cover-letter)

+
+/**
+ * struct alpm_status - parsed contents of the ALPM info debugfs
+ * @lobf: ALPM_CTL_LOBF_ENABLE is set
+ * @aux_less: ALPM_CTL_ALPM_AUX_LESS_ENABLE is set
+ * @aux_wake: the aux-wake line as printed by the kernel
+ *
+ * The kernel dumps three lines derived from ALPM_CTL. Note that it never
+ * prints ALPM_CTL_ALPM_ENABLE directly, which constrains what can be
+ * asserted; see alpm_is_enabled().
+ *
+ * @aux_wake's meaning is connector-type dependent. Per the HAS, DP only e=
ver
+ * uses AUX-Less ALPM flows - AUX-Wake is not supported by this feature on=
 DP
+ * at all - so on a DP link @aux_wake is just the observed complement of
+ * @aux_less and carries no independent information (confirmed on a NovaLa=
ke
+ * DP link: "LOBF disabled, Aux-wake disabled, Aux-less enabled"). eDP is
+ * different: classic PSR2 genuinely runs over AUX-Wake ALPM (distinct fro=
m
+ * Panel Replay's AUX-Less), so there @aux_wake is real, independent evide=
nce
+ * that ALPM is up. alpm_is_enabled() branches on connector type for exact=
ly
+ * this reason - never read @aux_wake on its own, go through it (or
+ * alpm_mode_str(), which resolves the mode only once ALPM is known to be =
up).
+ */
+struct alpm_status {
+=A0=A0=A0=A0=A0=A0 bool lobf;
+=A0=A0=A0=A0=A0=A0 bool aux_less;
+=A0=A0=A0=A0=A0=A0 bool aux_wake;

aux_wake is just !aux_less, so it reads "enabled" when ALPM is off. It carr=
ies no signal, so remove it.

Thanks and Regards
Kunal Joshi

+};
+
+typedef struct {
+=A0=A0=A0=A0=A0=A0 int drm_fd;
+=A0=A0=A0=A0=A0=A0 int debugfs_fd;
+=A0=A0=A0=A0=A0=A0 uint32_t devid;
+=A0=A0=A0=A0=A0=A0 igt_display_t display;
+=A0=A0=A0=A0=A0=A0 igt_output_t *output;
+=A0=A0=A0=A0=A0=A0 igt_crtc_t *crtc;
+=A0=A0=A0=A0=A0=A0 struct igt_fb fb;
+} data_t;
+
+int igt_main()
+{
+=A0=A0=A0=A0=A0=A0 data_t data =3D {};
+
+=A0=A0=A0=A0=A0=A0 igt_fixture() {
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 data.drm_fd =3D drm_open_driver=
_master(DRIVER_INTEL | DRIVER_XE);
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 data.debugfs_fd =3D igt_debugfs=
_dir(data.drm_fd);
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 data.devid =3D intel_get_drm_de=
vid(data.drm_fd);
+
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 kmstest_set_vt_graphics_mode();
+
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 igt_display_require(&data.displ=
ay, data.drm_fd);
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 igt_require(data.display.is_ato=
mic);
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 igt_display_require_output(&dat=
a.display);
+=A0=A0=A0=A0=A0=A0 }
+
+=A0=A0=A0=A0=A0=A0 igt_fixture() {
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 close(data.debugfs_fd);
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 igt_display_fini(&data.display)=
;
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 drm_close_driver(data.drm_fd);
+=A0=A0=A0=A0=A0=A0 }
+}
diff --git a/tests/meson.build b/tests/meson.build
index 1ac89bab7..8ad4d096f 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -246,6 +246,7 @@ intel_i915_progs =3D [
=A0]
=A0
=A0intel_kms_progs =3D [
+=A0=A0=A0=A0=A0=A0 'kms_alpm',
=A0=A0=A0=A0=A0=A0=A0=A0 'kms_big_fb',
=A0=A0=A0=A0=A0=A0=A0=A0 'kms_busy',
=A0=A0=A0=A0=A0=A0=A0=A0 'kms_ccs',
--
2.43.0
