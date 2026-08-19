Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF233C5DF81
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 17:01:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D41610E230;
	Wed, 19 Aug 2026 17:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fxfGtxC7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3FD10EE7F
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 17:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787158856; x=1818694856;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ibU2RMd7Wc2SxfOIdrqKHB+lcQeVCAcf7tLo5W1lSCw=;
 b=fxfGtxC75U2ITmaVwmNZyReNEjbcmDKyEBu5JTXmXhzoBGsSS2nxgKO1
 Ok2LGXJ1gFmRXWtXiI0l9yjdF9UkWwp/L18Lkg31xZQTJeFN2R2QT8aKT
 9sr/4XE91hI48lYKfnICsubAwVJ33ui490A6oX/mGjQhsmh6FAdIriet8
 DbZHscGL7ZA6tRevY39kQ++wDr4j3+vl1m+MFJchAkGndPjgL2Bhx/R7h
 MYpihuu99TldQDyUf+FNpV4Sk1aY6eV3uOe603RZwed7VQn+c9mkp0Q2Q
 Ub44eke3eOrEHO8FiySrFDskztfCflmkzCJQXDj+neRiI6kbUWMVIKm+e g==;
X-CSE-ConnectionGUID: mV9wNyTqSie9u0a5hp9sMw==
X-CSE-MsgGUID: z7uDDZ0rSf2cNfwf7WgO5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87553230"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="87553230"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 10:00:55 -0700
X-CSE-ConnectionGUID: 1kky69h7SzuWmZ1eeVQiYg==
X-CSE-MsgGUID: LMlmTBkwT1ucuHJg1xKV+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="269465432"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 10:00:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 10:00:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 10:00:55 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.44)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 10:00:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lT+juJGzSTaVjTftpyIIl7VHQz8JrxXnWl48UG9J8At4/zaT+49yiyfdGT3UgdV9bZ+yd5ZSeDm1gNSRghRU0wyekvlk9C/WQK83J23THVFBvh05a0JnfG62uAhBWdaYgSvRHCouuypishCg1SyQm1JPLpMIr8eSA+CabUafjD366nJr/WQgR50kYIhLoJO9Le52mDOCXpXKkswYJWvWtDmo2UxeQUblj4Hz6xu7G5AY+ksdtinairs0E2/OOpP/D9KGJt9poyBb9xr2X8fOZhZViOkgCSFttBQpcw+UrgAVSCxmnmhXXUbAXUYIR1pnPyeFpGNGDZlDwxgGzjrWDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rO4+W6zzt7Wx514YvSMlsWFHbgjO7G/xHGQ9iWBSnb4=;
 b=SviKTzbJ0RQ3ciejRn5I6E4XQCKuCK8JU0SAp4j86yVknfngIP6pTIbopvGEqCVISGoylEbx7Ys+YaE2Kwa7gqJYZHKc+PDaN+H02MnHEZjEfCoDTwEwgABlGWATTXLfTLJL+YhSz1sHHdqeB/gZBlNXImyFfKqcIuwM3CXgziRsaKEMS8de5W5dAkO4nXtBvJiZ97OkQVSY97+YGl9IWgDYWnHsyMZpVs6B3QOt5jrKTt9ZjT4TQ/Ixa6cPWk54zAn4omwssfGlfu4M3VRza8FKjZm1NB20SROlgq8SrOjqZxOd2AKKBu12N9ciCDfK0pcpRei926syKkzLMOYTPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by LVUPR11MB9811.namprd11.prod.outlook.com (2603:10b6:408:39c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 17:00:46 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31%7]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 17:00:46 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Subject: RE: [PATCH i-g-t v4 2/2] tests/kms_vrr: add CMRR fixed and video mode
 subtests
Thread-Topic: [PATCH i-g-t v4 2/2] tests/kms_vrr: add CMRR fixed and video
 mode subtests
Thread-Index: AQHdKluSTdA93LeizEqIVfn0YgPKN7almccw
Date: Wed, 19 Aug 2026 17:00:46 +0000
Message-ID: <IA1PR11MB63486F731CF5A3EF585F3170B2A52@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20260812130738.1242659-1-ramanaidu.naladala@intel.com>
 <20260812130738.1242659-3-ramanaidu.naladala@intel.com>
In-Reply-To: <20260812130738.1242659-3-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|LVUPR11MB9811:EE_
x-ms-office365-filtering-correlation-id: e5683fe9-ebe8-4c5c-f213-08defe13698e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|18092099006|18002099003|3023799007|22082099003|56012099006|38070700021|6133799003|11063799006|10067099003|4143699003;
x-microsoft-antispam-message-info: cHJ8b3UAFYatC1iSi+s+u/Ks+DeqrAd2v5Z6A3A7QeoHEo0EQrcUtUSYHyigTgXpI1R5I6Z2WWgRrJHTanaSfINqQ8F//DaqSfYti2ziWmspQDnZVhshruKBXgoSzmRpxmBGxT1Sz48GL6THW364QnJgUxUkBly19IL+sj57a6Benx+ozQq3JCyrqvvtXFDAygOW7k332ANFSaRyyrSzRz39jPmsW67DwGs09bHBxePv/ZrinHVjJHCV6MQBtE4Td94btJUPjmz4RuTIT9O3h+M+I31RgtYdxCf+qfKTHVqPd5OYVrsFUvLhRX3CmCN67HGYCDNtzXUwg0NYBQW+byCYIKdhrH2u/cxbrLRKRmyUjpNB4tbzm4gdhXihZsxUTwEQt3qJTlyaPWuC1fmnnzTBwKB/tZ1S2TW2zv/zPykDsndylfh7nz3qb2PpbmCeRmktIWplLE6yiCGZE6j6QpizqbRGC1UC0TKZZWJY7QWt3AcbzyuwuE93OLjp1mMSIqAEj8QuS0D2jd2/8AAQGSZa5peMBywboF78WggtdRdq8wBsxSMKkn2hvyP+RVbBP//4KALrHyLp5rpP/tx6LHwAZnfqREOUpSjkD/XYiap5rNiaube7EuyMtP1UF270UGRhKXbA2Ct0sF7L/DUQdhEO7v3X4VbtfP8Z5RLwvWyIRoVlC4Zw/MSceMAl4DFTkgD+Hl3xRQHamIyJrTb5btKYEr5Irp1Uf4q7a7lMnnU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18092099006)(18002099003)(3023799007)(22082099003)(56012099006)(38070700021)(6133799003)(11063799006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jXCLETgmFBjfCw/AfmJAq6DMF7W7w485EcjjpY31j1pebzfnqx2TDOKd3BAf?=
 =?us-ascii?Q?4fAvrjLcALdbJoE/ADtuESru1i6XPD5vwgv83tWLgiffYZ68CFaPdHVcjh1i?=
 =?us-ascii?Q?bJB+O66LcdjIG9fb2cwaHnGw3Sq3Hbb1FuPIKmB4kfFvNB/0sSKokYfsq2dm?=
 =?us-ascii?Q?bp5J5FMRqW0pyF1zU02/wDeBKKORbaMbiTY+fD4Q8Y11KyMSDEMSGUigEVFJ?=
 =?us-ascii?Q?EOJ1YT9IL3sq45eG6DzA0xohc/XcaJxT4gpe+ULdP4mBMlNrZ9yOcu9B2Tkf?=
 =?us-ascii?Q?6f5voG+N9ZkKeq3uuHyn3RNwrXJGXf2QdT0y5MOKxcxw3UWZfQUm971IqfVm?=
 =?us-ascii?Q?XzzDmPcKGPutgFhict1hXgQQWxHIOjUGw+p5Y4rH5AUmhmBR0TWYnl9hxwc/?=
 =?us-ascii?Q?PUsgmn0kJIecO5L0NdY3J4L3Y5S6M62PFsXXhHNCIESWb5RN6FmLQ66bQR3u?=
 =?us-ascii?Q?O349no/iYezoe0H7OGk6weawlkYla+ogDUIWFMHi3M1N4THfMU+qdxxEACXK?=
 =?us-ascii?Q?f/JX+k7FhiCq1lMjgwQ7LioONqmUo8xp/k/oH1iLv8Gz+cuO+vyb+9WTN6Pt?=
 =?us-ascii?Q?vA4TNJmeCBLfcq3HR2Z7pszLg/5LOMXvaQJ63L7JsXX2qCCOqzDQv4YeG53U?=
 =?us-ascii?Q?2/3qvds7zhLbCHSRWA86rNARa38C1lttemT0zsTl/J9fJOMdUp6DPmKU0gXw?=
 =?us-ascii?Q?OZlEfFrCnNU79WvrmuG/ES54D8iXgeD0g1kCNItwvywglB2Uurg7gJmKwWak?=
 =?us-ascii?Q?RZq292QcAPItu5b63I5sMyy+otCRX/vuRy8KB1Q0xlqUyXWIMRd23eFnyt1T?=
 =?us-ascii?Q?aisvRuH9AHUFr3isekhzfz/FS6a4A1foLc254EuGTeG1VZNxLWDmu/4vQL3G?=
 =?us-ascii?Q?6dTLVyqMeumjkjULWGSqQYN8/LWP+t4mug2tRMbEWt+40J7tRnQF3KCD8Tip?=
 =?us-ascii?Q?+TtSPuiBW89CghgBaRN+02o1+ddiEG37Pkmq3RwALZwIgFPGkQouax3ouuaT?=
 =?us-ascii?Q?0AR5YgQwP+ujKk5dDIu6YpRd77tbqosx6iCooL2zom0q2qriJCBY/YOhi0yP?=
 =?us-ascii?Q?RazFv74WAlH/jpaaD38IRbIUpF+RBvlBchtTRs4VwJpMho4p2mK7URLpQBCW?=
 =?us-ascii?Q?+mC1JoVQLBWX/i/dMMvDW4QyAp3T2bWlo6B8g1etapyu3/VUIMEJXnvmzqVA?=
 =?us-ascii?Q?qDu60AcY/+UvJQuoFxnI0u82IgnS/GGfjsxwSlsgL1pDaR04mMXrxV4wk9vI?=
 =?us-ascii?Q?cZ6iEismXUww91NhghNbXkYck21bTayC1GG1gJMwfgvk5iyGp62KkM0QD4Cs?=
 =?us-ascii?Q?BKEEt51sTpnCQOHD1Y575CTM6vsz40DzG9iCA4IXjwgRpl5qjZBMcDpdXxwy?=
 =?us-ascii?Q?hp1LMDtwQdJRJTbi1hGmvMrVCFDBww5/ca8gusTJmX/sLV4j0tSTDJZR3xNX?=
 =?us-ascii?Q?ctJWejw5/olMo9fn+jsk0v+xRCOoVn7veu6R37/gLzUtJm7swKfOvZI9d78u?=
 =?us-ascii?Q?nQRupe6tfOxT9hRknBJNQ6o1lgz3kVUjmK3oYUIKB9hH4g8aUvdRmobpVVjl?=
 =?us-ascii?Q?zy4qB33U8wNt4S2oN8CD+zrX3KcQVK/dqrPxwWBFik2H5MeW+oCli87ukr4f?=
 =?us-ascii?Q?zk14r9ivUquupJaE3KzmqtA+1g3ufH2LmHJUjgYA0fNANFYfzFRjr4hWk/gB?=
 =?us-ascii?Q?rtiELUTpaHvDeO5y+W1RNo1HVIPPlmDlSVdmbQ0DrJrmzJIVGQLrJTsJ4zeZ?=
 =?us-ascii?Q?qV1StkcygZfXiFZ+JxTxhvKFX5fv+CI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: PTqV+omDniHR+hWHBFm4N3tS+HqRrSXsjn3vxP1Ba9yrDGG0xrAuA7UM0df410HyVWrGim5jJofn2y9ctuXv0Sng31A5j156jQ+PaTd9xoInUqZQzK/2zSCWrOmWdGEzUoCsQ4cNtUySGNs1SmSisF0FwJqChLziC8wYkWUw7t0ggrCf2U4omKSQ3OY2WIHlGK3FeXL54KaeKTyaeNXSXBqvVR/gtCw6GyWEp60ru39a+Ts35EAiCc/x52xvj1q2sh4EFi6Q8KLNHLPySssY+GP6cFjmpO+d9Cdnb1kksZIDt35zA8lk6JUlclyp+/dMBOIgwnwfndM74tzkSqjQPA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5683fe9-ebe8-4c5c-f213-08defe13698e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 17:00:46.1981 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zYRaExalAXITyOz7hEPJEaFlOyBs9Mh5Pn67QxK8elRCqw46O37Uvwkinyz8bHh4o7UqC+VPq9uSxmzNmlVD435Xob3jZ9vVKrmga913PIq+Z8kxfscp7RjtnTqvWSIZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9811
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
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: 12 August 2026 18:38
> To: igt-dev@lists.freedesktop.org
> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Golani,
> Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>; Naladala,
> Ramanaidu <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v4 2/2] tests/kms_vrr: add CMRR fixed and video mod=
e
> subtests
>=20
> Add test coverage to validate Content Match Refresh Rate (CMRR) behavior
> across both fixed and video timing display modes.
>=20
> This introduces a shared helper library to support refresh-rate mode sele=
ction
> and parsing, along with two new test cases covering fixed-mode and video-
> mode scenarios.
>=20
> The new tests measure actual display refresh timing during CMRR operation
> and compare it against the expected target rate to verify correctness. Vi=
deo
> mode coverage validates behavior across standard video timing rates, whil=
e
> fixed mode coverage targets display modes that fall outside the standard
> video timing set.
>=20
> Each test cycles through the relevant refresh configurations, applying an=
d
> resetting the appropriate settings between measurement passes to ensure
> consistent and isolated test results.
>=20
> v2: Fix test issue.
> v3: Address review comments. (Mitul)
> v4: Fix test issue.
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_vrr.c | 204
> ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 204 insertions(+)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 27f18e8d0..ab6bc66d9
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -32,6 +32,7 @@
>  #include "igt_pm.h"
>  #include "igt_psr.h"
>  #include "i915/intel_drrs.h"
> +#include "igt_vrr.h"
>  #include "sw_sync.h"
>  #include <fcntl.h>
>  #include <signal.h>
> @@ -80,6 +81,14 @@
>   *
>   * SUBTEST: lobf-dc3co
>   * Description: Test DC3CO entry during LOBF.
> + *
> + * SUBTEST: cmrr-fixed-mode
> + * Description: Test to set a fixed CMRR target refresh rate and verify =
it
> + *              is correctly applied.
> + *
> + * SUBTEST: cmrr-video-mode
> + * Description: Test to set standard video timing refresh rates via CMRR
> + *              and verify each target rate is correctly applied.
>   */
>=20
>  #define NSECS_PER_SEC (1000000000ull)
> @@ -103,6 +112,8 @@ enum {
>  	TEST_LINK_OFF =3D 1 << 10,
>  	TEST_NEGATIVE =3D 1 << 11,
>  	TEST_FORCE_RR =3D 1 << 12,
> +	TEST_CMRR_FIXED_MODE =3D 1 << 13,
> +	TEST_CMRR_VIDEO_MODE =3D 1 << 14,
>  };
>=20
>  enum {
> @@ -580,6 +591,184 @@ flip_and_measure(data_t *data, igt_output_t
> *output,
>  	return 0;
>  }
>=20
> +static
> +uint64_t wait_next_vblank_ts_ns(data_t *data, igt_crtc_t *crtc) {
> +	union drm_wait_vblank vbl =3D {};
> +
> +	vbl.request.type =3D DRM_VBLANK_RELATIVE |
> igt_crtc_get_vbl_flag(crtc);
> +	vbl.request.sequence =3D 1;
> +	do_or_die(igt_ioctl(data->drm_fd, DRM_IOCTL_WAIT_VBLANK,
> &vbl));
> +
> +	return vbl.reply.tval_sec * NSECS_PER_SEC + vbl.reply.tval_usec *
> +1000ull; }
> +
> +static void
> +flip_and_measure_target_rr(data_t *data, igt_crtc_t *crtc,
> +			   double vrefresh, uint32_t cmrr_mode) {
> +	uint32_t i;
> +	bool front =3D false;
> +	uint64_t last_vblank_ns, vblank_ns;
> +	uint32_t err_frames =3D 0;
> +	uint64_t frame_times_ns[TARGET_RR_SAMP_COUNT];
> +	uint64_t exp_time_ns;
> +	uint64_t total_frame_time_ns =3D 0;
> +	uint64_t avg_frame_time_ns;
> +	double  avg_refresh_rate;
> +	double  expected_rr;
> +	uint32_t valid_frames =3D 0;
> +
> +	exp_time_ns =3D igt_kms_frame_time_from_vrefresh(vrefresh);
> +
> +	do_flip(data, &data->fb[0]);
> +	(void)get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
> +	last_vblank_ns =3D wait_next_vblank_ts_ns(data, crtc);
> +
> +	for (i =3D 0; i < TARGET_RR_SAMP_COUNT; i++) {
> +		front =3D !front;
> +
> +		do_flip(data, front ? &data->fb[1] : &data->fb[0]);
> +		vblank_ns =3D wait_next_vblank_ts_ns(data, crtc);
> +		(void)get_kernel_event_ns(data,
> DRM_EVENT_FLIP_COMPLETE);
> +
> +		frame_times_ns[i] =3D vblank_ns - last_vblank_ns;
> +
> +		if (frame_times_ns[i] > (exp_time_ns + (exp_time_ns / 2))) {
> +			err_frames++;
> +			last_vblank_ns =3D vblank_ns;
> +			continue;
> +		}
> +
> +		last_vblank_ns =3D vblank_ns;
> +		total_frame_time_ns +=3D frame_times_ns[i];
> +	}
> +
> +	valid_frames =3D TARGET_RR_SAMP_COUNT - err_frames;
> +	igt_assert_f(valid_frames > 0,
> +		     "No valid frame samples collected\n");
> +
> +	avg_frame_time_ns =3D total_frame_time_ns / valid_frames;
> +	avg_refresh_rate =3D (double)NSECS_PER_SEC /
> (double)avg_frame_time_ns;
> +
> +	if (cmrr_mode =3D=3D CMRR_VIDEO_MODE) {
> +		expected_rr =3D (double)(vrefresh * CMRR_NUMERATOR) /
> +			      (double)CMRR_VIDEO_MODE_DENOMINATOR;
> +		igt_assert_f(fabs(avg_refresh_rate - expected_rr) <=3D 0.02,

Please confirm this bound holds on real hardware, or justify it.

> +			     "CMRR refresh rate mismatch: "
> +			     "measured avg_rr =3D %.3f Hz, "
> +			     "expected_rr =3D %.3f Hz\n",
> +			     avg_refresh_rate, expected_rr);
> +	}
> +
> +	if (cmrr_mode =3D=3D CMRR_NON_VIDEO_MODE) {
> +		expected_rr =3D (double)(vrefresh * CMRR_NUMERATOR) /
> +			      (double)CMRR_DENOMINATOR;
> +		igt_assert_f(fabs(avg_refresh_rate - expected_rr) <=3D 0.02,
> +			     "CMRR refresh rate mismatch: "
> +			     "measured avg_rr =3D %.3f Hz, "
> +			     "expected_rr =3D %.3f Hz\n",
> +			     avg_refresh_rate, expected_rr);
> +	}
> +
> +	if (cmrr_mode =3D=3D CMRR_DISABLE) {
> +		expected_rr =3D vrefresh;
> +		igt_assert_f(fabs(avg_refresh_rate - expected_rr) <=3D 0.02,
> +			     "CMRR refresh rate mismatch: "
> +			     "measured avg_rr =3D %.3f Hz, "
> +			     "expected_rr =3D %.3f Hz\n",
> +			     avg_refresh_rate, expected_rr);
> +	}
> +
> +	igt_info("Average RR (Hz): %.2f , Expected RR (Hz): %.2f, error frames
> =3D %d\n",
> +		 avg_refresh_rate, expected_rr, err_frames); }
> +
> +static
> +void test_cmrr(data_t *data, igt_crtc_t *crtc,
> +	       igt_output_t *output, uint32_t flags) {
> +	uint32_t found;
> +	double rr_from_mode;
> +	drmModeModeInfo mode;
> +	drmModeConnectorPtr connector;
> +	int j;
> +
> +	igt_require_f(cmrr_supported(data->drm_fd, crtc->crtc_index),
> +		      "CMRR not supported\n");
> +	prepare_test(data, output, crtc);
> +	set_vrr_on_crtc(data, crtc, true, false);
> +
> +	if (flags & TEST_CMRR_VIDEO_MODE) {
> +		for (j =3D 0; j < igt_vrr_standard_video_timing_fps_count; j++) {

compares int against size_t, Use size_t j (or unsigned).

> +			found =3D
> igt_vrr_get_mode_with_video_timing(output,
> +
> 	igt_vrr_standard_video_timing_fps[j],
> +							&mode);
> +			if (found) {
> +				rr_from_mode =3D
> igt_vrr_mode_line_refresh_hz(&mode);
> +				igt_output_override_mode(output, &mode);
> +				igt_info("Override mode:");
> +				kmstest_dump_mode(&mode);
> +				igt_display_commit2(&data->display,
> COMMIT_ATOMIC);
> +				igt_target_rr_debugfs_write(data->drm_fd,
> +							    crtc->crtc_index,
> +							    mode.vrefresh,
> +
> CMRR_NUMERATOR,
> +
> CMRR_VIDEO_MODE_DENOMINATOR);
> +
> +				flip_and_measure_target_rr(data, crtc,
> +							   mode.vrefresh,
> +
> CMRR_VIDEO_MODE);
> +
> +				igt_target_rr_debugfs_write(data->drm_fd,
> +							    crtc->crtc_index,
> +							    mode.vrefresh,
> +							    0, 0);
> +
> +				flip_and_measure_target_rr(data, crtc,
> +							   rr_from_mode,
> +							   CMRR_DISABLE);
> +			}
> +		}
> +	}

The TEST_CMRR_VIDEO_MODE loop reassigns found every iteration, so after the=
 loop it only reflects the last fps in the array,
which typically has no matching mode.

Two issues:=20
1. there is no post-loop guard, so on a panel with no standard-timing mode =
the
subtest passes without testing anything, it should igt_require a skip inste=
ad;
2. you can't reuse found like below fixed-mode branch does, because here it=
's overwritten rather than latched,
requiring on it would falsely skip even when earlier rates were tested.

Please add a dedicated "bool tested" latch set inside if (found) and igt_re=
quire_f(tested, "No standard video-timing mode found.\n") after the loop.

"bool tested =3D false;
...
    if (found) {
        tested =3D true;
        ...
    }
...
igt_require_f(tested, "No standard video-timing mode found.\n");"

> +
> +	if (flags & TEST_CMRR_FIXED_MODE) {
> +		found =3D 0;
> +		connector =3D output->config.connector;
> +		for (j =3D 0; j < connector->count_modes; j++) {
> +			mode =3D connector->modes[j];
> +			rr_from_mode =3D
> igt_vrr_mode_line_refresh_hz(&mode);
> +
> +			if (rr_from_mode - mode.vrefresh > 0.04) {
> +				found =3D 1;
> +				igt_output_override_mode(output, &mode);
> +				igt_info("Override mode:");
> +				kmstest_dump_mode(&mode);
> +				igt_display_commit2(&data->display,
> COMMIT_ATOMIC);
> +				igt_target_rr_debugfs_write(data->drm_fd,
> +							    crtc->crtc_index,
> +							    mode.vrefresh,
> +
> CMRR_NUMERATOR,
> +
> CMRR_DENOMINATOR);
> +
> +				flip_and_measure_target_rr(data, crtc,
> +							   mode.vrefresh,
> +
> CMRR_NON_VIDEO_MODE);
> +
> +				igt_target_rr_debugfs_write(data->drm_fd,
> +							    crtc->crtc_index,
> +							    mode.vrefresh,
> +							    0, 0);
> +
> +				flip_and_measure_target_rr(data, crtc,
> +							   rr_from_mode,
> +							   CMRR_DISABLE);
> +			}
> +		}
> +		igt_require_f(found, "No non-video-timing mode found.\n");
> +	}
> +}
> +
>  /* Basic VRR flip functionality test - enable, measure, disable, measure=
 */
> static void  test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t *out=
put, @@
> -591,6 +780,7 @@ test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t
> *output,
>  	uint64_t rate[] =3D {0};
>=20
>  	prepare_test(data, output, crtc);
> +

	Please remove extra line.

>  	range =3D data->range;
>  	vtest_ns =3D data->vtest_ns;
>  	rate[0] =3D vtest_ns.rate_ns;
> @@ -1147,6 +1337,20 @@ int igt_main_args("drs:", long_opts, help_str,
> opt_handler, &data)
>  		}
>  	}
>=20
> +	igt_subtest_group() {
> +		igt_fixture()
> +			igt_require_intel(data.drm_fd);
> +
> +		igt_describe("Test to validate CMRR in fixed mode.");
> +		igt_subtest_with_dynamic("cmrr-fixed-mode") {
> +			run_vrr_test(&data, test_cmrr,
> TEST_CMRR_FIXED_MODE);
> +		}
> +
> +		igt_describe("Test to validate CMRR in video mode.");
> +		igt_subtest_with_dynamic("cmrr-video-mode") {
> +			run_vrr_test(&data, test_cmrr,
> TEST_CMRR_VIDEO_MODE);
> +		}
> +	}
>  	igt_fixture() {
>  		close(data.debugfs_fd);
>  		igt_display_fini(&data.display);
> --
> 2.43.0

