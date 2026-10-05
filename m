Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF02CA5FFC
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 17:43:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C008E10E27D;
	Mon,  5 Oct 2026 17:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g53RzsSS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4638C10E097
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Oct 2026 17:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791222183; x=1822758183;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=izAw8eaIoVlXtQdXc0+zortzaDeLdlXnnLy582FQMfc=;
 b=g53RzsSSOmcsBGaBgn/PuSSeck08s3J3Zf6+t2CWzjVsrnRW1Da1RahP
 Q4Y14eEoZIECIiaMcdGL19IdMaA7KNmKuGqMmU1JJCgiiPw6YlpIZgyQx
 DAcf+EBTfDYc7MPSz3qcl1jwJ+wOJ/rx9Oo0xq2wYY+HAEDYRbX0XZU6u
 Zm18uW24s35AIObto4Wmfd3xIEASytdPzqRtoToZ+todzNM02ouAWo/5b
 ze0og2dIpm5bjpLBrVL+lpoP1qzGa3jrgOJSRtqg/m7hXoMNGkUqPDQgn
 7LUJMWsemNa07ESpdZoqJ4+Hykd8vI+LIp6GP3TiNCKR7CvOM9nX9BbB6 A==;
X-CSE-ConnectionGUID: Pqrt+ZhbSkC9sIVXC908TA==
X-CSE-MsgGUID: MKGtHGyIRna3gcvUfaH0iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="94390796"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="94390796"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 10:43:02 -0700
X-CSE-ConnectionGUID: nUqPsApGTieMqHhX4HOgvQ==
X-CSE-MsgGUID: zWYNq4ivRPaOMRcxrZzMHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="314881384"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 10:43:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 10:43:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 10:43:02 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 10:43:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZZfVwKWgG7BalSKHJ9ohprD49xpPaVJ5cJ9P7LZbwJjvA1ZzlacUh3FYsAexs447/ubD1ckYFxvF+CywOqMbqc6P75GyVlYzzMHFu644pMTj09vjNl8sGtCGyMVQmn8EjikA5m53cUialusNWEwPMkrI7rrKgv9WIasz8zwMmeqbsPz4xu2pf0yXanp495Ot5WIpZlAjo33ItkkeYMzBm0ebvPrIlPI9ogz0Ln8zBeFMX8s2QDGSa3FBpH7c/hU8FONncCIm7HNt+vufAvsMMYaf0+i1wSTLXE6EwCiIAe3Y3XBt/aOfbqjDjPqsTZ2daoa+pDxSv1C6iqSpE3C8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNoxtXlInmEXEDVeLmcgyTaLvPZJaHJ4kdZkF9x3WAo=;
 b=wwTj03AnVegM4/DEqym7qKYY9gY2YlbyBgGFLzVWbndgeJxIOWBtO7jNBnIXXlzl0eKpZw+DU9gZAL6m4SgVJzKlbaS1w2iKwaB0htF7mEG1Nc35gLeDtFkkxFwK9cBmbC7GdDWKOD/a8p7tSzF7cKotAmju5vMZqgL+g3lcICAXJUdbuPVeQPTaDuJN79WBB8jhruSzI+XdoDXx49M4PVOJ+V7ZsSKb6xJrPn2Cdir0U8yM9JnKMjWZnyYr2j4DmtKUo0kR9FGciNIEzzf/+oqAwyQf/w3076rV/mBc1vwiGdaQrHDhf3kgZWLsSccxqkXyiqrEPoXw9Vt6F/Bu7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5776.namprd11.prod.outlook.com (2603:10b6:303:183::9)
 by BL1PR11MB5269.namprd11.prod.outlook.com (2603:10b6:208:310::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Mon, 5 Oct
 2026 17:42:51 +0000
Received: from MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::b568:69e9:7abf:180e]) by MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::b568:69e9:7abf:180e%4]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 17:42:51 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v1 4/5] tests/intel/kms_alpm: add ALPM Panel Replay
 subtest
Thread-Topic: [PATCH i-g-t v1 4/5] tests/intel/kms_alpm: add ALPM Panel Replay
 subtest
Thread-Index: AQHdT/GqZbVyVvZsQECq/iLnV5VHBrbvPnnA
Date: Mon, 5 Oct 2026 17:42:51 +0000
Message-ID: <MW4PR11MB57766CFB83FB6998AE24CAF4DA962@MW4PR11MB5776.namprd11.prod.outlook.com>
References: <20260929090454.2796967-1-sowmiya.s@intel.com>
 <20260929090454.2796967-5-sowmiya.s@intel.com>
In-Reply-To: <20260929090454.2796967-5-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5776:EE_|BL1PR11MB5269:EE_
x-ms-office365-filtering-correlation-id: e9a65c21-fb27-41b9-0125-08df23081429
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|56012099006|5023799004|4143699003|6133799003|3023799007|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: nfy4op++npMYt86kuk3b1zgGULI08OfINyyP526QACau4ZBD9H/ZCQWSBg/tMIgylrEWFtqxQeSNVytKaG+pxLwV3viNQmeEO4V30gvn/e/nCAdX4oUnaJqV+8aN5sIB/fqCES2Eyz9qmRBpKuR9Dri2hVjUxAoBhKZKWQEW+qCIiqhtL57uiJ7W5i2MjAKcqRmhwZXTUpccD1HhG1mUZ+yF7Eos2Z9QWxeOVGKDxC0mecdZw8nOZmj1bqYsO5PzuWvBUQa+AeJPDFMW+jyYn9MzSTrliR6dWOTTd4bS8CkJOH6PhFjCiTVqojyn/HXb8HXjUxAL9CMJ8vnhPC0F5Vd8rnPB1it27mQ1THM7lXtLtYULsDmZU5g0PgfqBFhpq4eIW/zD7c2PDdTZt2gholBIDmneNTqgVQ7a8V93z8H9LCJUu3DSShlFTwSFl0ZCGanQXHjVmj5ZJA8cF8AloLaV2Lw6GxF3bLTqT/FGN9wka8LNBNe2z/vvq0CgOsfXdNuDn2132gcfG74OJ950KYT7RFZ6wjSrlDuV1igc8ZY773VyvqOmlbzvMa9gVXd1GCPJcK7jy7lvbYrvVJpRh/PVK0WedoolZENNFyAGYETTg6D4HXErGpBi4K57FD4gDFtHHHJCwMk1GpN2Jrcn2PhlEAK+qASfwbDn0ruNjLPlyeW1amC/RBrc3mIPbL7dpgfD1XoYIrRFG+9gUJPxL6rknX0bIF9SMZdQB3vzRlo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5776.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(5023799004)(4143699003)(6133799003)(3023799007)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cUTogsqArq+t7fFjahL2dVvP4Zx3Lgsre2A01HuT89Y37aDgknIUnRU10jb/?=
 =?us-ascii?Q?E0j5IdVz1E1Thfuy3qY+R8X1VzwKe/KyWPxAkMpJ2LZeTHRg1cGVZjuYBqIf?=
 =?us-ascii?Q?y3X2yZCZ65NRCTw+xvHw94DAbpAyfAJgjqEDAUtrcK11V7lRn0BqhgiNL2Zp?=
 =?us-ascii?Q?yGMcJV+NtfwF5LiCdG7WKh0RXu22ShMti8ohu++BbKaHXSh4O+z2sAYooKtp?=
 =?us-ascii?Q?IkS0mX3nH8cyyqMYSzjSfsE+WQZ9iQPNPCHE9kRghe/Z83EKXOGl8lo72gl9?=
 =?us-ascii?Q?yrKKazEDmT0+IIWmO8b92nqhSoJ5bbxruJ9OITvDCozj/TCrP9nbwzgPAfrG?=
 =?us-ascii?Q?Wja29/h4251YatQ+fAz7D7TuUjNrwmGZSgpBlnJXhgY0A9oAP17ckXSaraOS?=
 =?us-ascii?Q?WoGyEj+mTVyu7hKoOu3clEr/pB+BNWFu/u7lV3gAJixfSBXeprREDveHmgj7?=
 =?us-ascii?Q?m1la57uI+KaenK7u+kFW72l5SQYVP1EeD0PZgYhO5cfTZrjdWnL6T/yyG8eQ?=
 =?us-ascii?Q?GvOnFEOKx2ehqqIEOSFCudcS6o1i7OjR/Hj9sl7hvAi/H6FNYFvkCEswKi34?=
 =?us-ascii?Q?CNXcqpIsTY0LP3OU7uCS88DMYHFu1XTJWvj+5TA3mI7DoBDCnbh4pSBpkHmk?=
 =?us-ascii?Q?ACrWUrdJn+z0CFXukypTo9YLclVGdGOJ1V1UWrgXFUWFyGQSuPDuhDPXYWIs?=
 =?us-ascii?Q?6burP89lncr/cOwVNgmqegIaw97kYEBo4t/REMBXejEj8MT2Bn+Qc38rK+au?=
 =?us-ascii?Q?RMl1Tl+CUynq5ngyeeHlzConbBGtuEQzfOkumGeQcPLKWbMFHdahljiU3VkV?=
 =?us-ascii?Q?gZAyVPP2ZxJTySau2y5GT7/5pn4Fr/4yRds2t/nOqRnqEyuMuEcYEc0loie7?=
 =?us-ascii?Q?VLcE3XKM3tiHRchjzaeVLCB5IdhP1Khdp0FLBUEZCOlZWiOtkJDM9JioZ+0Y?=
 =?us-ascii?Q?OOfyxqB/8wPYRcKk9V423UE9C0F2PgAXTGFU2UMc/GtdzXqVkPkuXKU/nv5z?=
 =?us-ascii?Q?oKyjkZmgi14bp10atmQ6I0CbDQ4vp9g8/z87hJVCzA9JMm09scC32w9g4aG4?=
 =?us-ascii?Q?irrHGtP0WIykE4WmKKfngj2gJofytzOKeOvF2i3m779QVKpVtAvvauVqeCva?=
 =?us-ascii?Q?hLmm1iT+iZb/kuvux9eUZbI62R5oyy//5pvRmNTS14bej6bwVjyOoh0Cxzup?=
 =?us-ascii?Q?z/wlV1SuS0IsMPFBLkXniZ4KsMXJ7Gl67VxbWXXlKih5JJj+fW8tr/s+9016?=
 =?us-ascii?Q?hTqLGQ0WquOkZJNm4B12J5/jQi3rbabwPiWi8W/KLT1CkXLxDLKR1mJFi7fJ?=
 =?us-ascii?Q?aoC2KfNw6Yokj1YkFcqjIX94vh/p1Y+CmVguqIZqRioXqEl5t5JgwS3Hlzma?=
 =?us-ascii?Q?pA89UlBCYEJRO7BG2xPmyXQ2Mv6VpvCoq/Je38t6yJKjGk2TREyYIpnYEs31?=
 =?us-ascii?Q?u6v/DpAWMzldPdFpUZzfRZea67wL8iOsocvmhp6ytpyR/0jhN0DVx6XIgQ8L?=
 =?us-ascii?Q?fKpRCByj+JO6BxEaweCqrqpJOS1/Pw1ZTVtPyeIATZ1U4c2S5e7/dm+k/7Cj?=
 =?us-ascii?Q?shPc4ExbuAymor+lV8iM2vajHorX+eNQdIXC5le4Y6OK9AXCT4pr+XXAvCLk?=
 =?us-ascii?Q?CFd4OcTTEbr8Z+6cpWfbdG29aLNZqAylHq6mB/bR5av0UuIQWqwEtJqn/4wA?=
 =?us-ascii?Q?ZsVFRNnjmmkNbmIDxlasDJzpeFrvgEiNPS6KkBf7aTPQP0ap1h/l0myGehe4?=
 =?us-ascii?Q?ykNkoV0Hiw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bhz5x1zKZ+rDjUKHiRrYIqp0wciDF+NHd06rR5zUDnbgGglAp0cLFnGSAfJeg0TC3+XJmWWOOdlCWwicBO+3igeIOVcmA9gHBsNa4wRwwtv89bJPhdrM8DzLgJ7oRARQOzmd9cCFeN1zjuLeRXY6ZBhq+5eZLaFUnBkuhK2XQksmDoyL7KUk83ci/nGILYhuTkMh/zfgYHDajxa55eTrqtzcKLRhgW3y/Hp1sGVffHwqw6zB4fAnFue5r29Iyufe+O9BzwURrS0pIlXTJbg4QYpYmVZs8EsvxnFMEhaq+HKxAwsJdqMY4yu6mu+Nfszw09GpW3R9WbZ43s23TAXxcQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5776.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a65c21-fb27-41b9-0125-08df23081429
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 17:42:51.4788 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jJDjRSMQtziVLjoCR4AI2SEbK9cIojIvMqY7s0Rgg0yl3BDBlcUJW4Y1oLWxAmPHjBxDEbLh97kJVXUl5cgbqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5269
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

> -----Original Message-----
> From: S, Sowmiya <sowmiya.s@intel.com>
> Sent: Tuesday, September 29, 2026 2:35 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>; Joshi, Kunal1
> <kunal1.joshi@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: [PATCH i-g-t v1 4/5] tests/intel/kms_alpm: add ALPM Panel Replay
> subtest
>=20
> Add a new kms_alpm test covering ALPM (Advanced Link Power
> Management) on eDP and DP 2.1 outputs, with the alpm-panel-replay
> subtest: verifies ALPM is reached via Panel Replay after a modeset, using=
 aux-
> less ALPM on DP and either aux-wake or aux-less on eDP, with LOBF staying
> off while Panel Replay is active.
>=20
> alpm_dump_status(), require_no_audio(), test_setup() and run_test() are a=
ll
> called for the first time here (directly or via
> test_alpm_panel_replay() and its igt_main() wiring), so their
> __maybe_unused markers from the previous patches are dropped.
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> Assisted-by: Gnai_Claude:sonnet-5
> ---
>  tests/intel/kms_alpm.c | 85
> ++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 81 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/intel/kms_alpm.c b/tests/intel/kms_alpm.c index
> b38e7f8ce..700d5fb50 100644
> --- a/tests/intel/kms_alpm.c
> +++ b/tests/intel/kms_alpm.c
> @@ -23,6 +23,15 @@
>  #include "igt_sysfs.h"
>  #include "intel_chipset.h"
>=20
> +/**
> + * SUBTEST: alpm-panel-replay
> + * Description: Verify ALPM is reached via Panel Replay after a modeset.
> + *              DP 2.1: Panel Replay must use aux-less ALPM.
> + *              eDP: Panel Replay may use either aux-wake or aux-less AL=
PM.
> + *              On both connector types, LOBF must stay off while Panel
> + *              Replay is active.

This is wrong for eDP. In the kernel, eDP Panel Replay always uses
AUX-less ALPM: PR is refused on eDP when the sink lacks AUX-less
capability, and the configure path then enables AUX-less. AUX-wake ALPM
on eDP is PSR2, not PR.

Please fix the description and the commit message accordingly.

As written, on eDP this only checks "PR on" and "LOBF off". The kernel
guarantees the second whenever PR is on, so nothing about ALPM is
verified. Please assert aux_less on eDP as well.


> + */
> +
>  #define ALPM_INFO_FILE		"i915_edp_lobf_info"
>  #define ALPM_INFO_MAX_LEN	512
>  #define ALPM_TIMEOUT_MS		100
> @@ -287,7 +296,34 @@ static bool alpm_read_status(int drm_fd,
> igt_output_t *output,
>  	return true;
>  }
>=20
> -__maybe_unused
> +/*
> + * psr_get_mode(fd, output) reads "<connector>/i915_psr_status" under
> +the
> + * device debugfs dir. Some kernels only ever expose the legacy
> +single-eDP
> + * "i915_edp_psr_status" at the top level instead (no connector
> + * subdirectory) - confirmed on a NovaLake box where the
> +connector-scoped
> + * path 404s but /sys/kernel/debug/dri/0/i915_edp_psr_status has the
> +real
> + * "PSR mode: Panel Replay ... enabled" line. Fall back to that legacy
> +path
> + * (psr_get_mode(fd, NULL)) whenever the connector-scoped read comes
> +back
> + * disabled, so this works on both layouts.
> + */
> +static bool psr_panel_replay_enabled(int debugfs_fd, igt_output_t
> +*output) {
> +	enum psr_mode mode =3D psr_get_mode(debugfs_fd, output);
> +
> +	if (mode =3D=3D PSR_DISABLED)
> +		mode =3D psr_get_mode(debugfs_fd, NULL);

Please drop this fallback. The top-level i915_edp_psr_status reports
the first PSR-capable encoder, not the output under test. With eDP and
DP both connected, a DP run can pick up eDP state and vice versa: a
false pass here, and a false failure in the
!psr_panel_replay_enabled() check in 5/5.

drm-tip creates <conn>/i915_psr_status for both eDP and DP whenever
HAS_PSR || HAS_DP20. If it's missing somewhere, that's a kernel bug to
report (which kernel and platform?), not something for the test to
work around.

> +
> +	return mode =3D=3D PR_MODE || mode =3D=3D PR_MODE_SEL_FETCH ||
> +	       mode =3D=3D PR_MODE_SEL_FETCH_ET;
> +}
> +
> +static bool psr_wait_panel_replay_enabled(int debugfs_fd, igt_output_t
> *output,
> +					  bool enabled)
> +{
> +	return igt_wait(psr_panel_replay_enabled(debugfs_fd, output) =3D=3D
> enabled,
> +			ALPM_TIMEOUT_MS, 1);
> +}
> +
>  static void alpm_dump_status(int drm_fd, igt_output_t *output)  {
>  	struct alpm_status status;
> @@ -312,7 +348,6 @@ static void alpm_dump_status(int drm_fd,
> igt_output_t *output)
>   * committed without ever setting VRR_ENABLED; the driver still runs the
> VRR
>   * timing generator on the platforms that support ALPM.
>   */
> -__maybe_unused
>  static void test_setup(data_t *data)
>  {
>  	igt_output_t *output =3D data->output;
> @@ -390,7 +425,6 @@ static void require_alpm_capable(data_t *data,
> igt_output_t *output)
>   * subtests would report a failure on the large majority of real Display=
Port
>   * monitors.
>   */
> -__maybe_unused
>  static void require_no_audio(data_t *data, igt_output_t *output)  {
>  	igt_require_f(!sink_supports_audio(data->drm_fd, output), @@ -
> 398,7 +432,45 @@ static void require_no_audio(data_t *data, igt_output_t
> *output)
>  		      output->name);
>  }
>=20
> -__maybe_unused
> +/*
> + * Covers "alpm_init() for DP2.1", "Replace is_edp() with alpm_is_possib=
le()"
> + * and "Introduce has_alpm to decouple from pr/psr2/lobf": on an
> +external DP

Test comments shouldn't track kernel patch titles.
Please describe only the expected behaviour here.

> + * link none of the ALPM programming happens at all before those patches=
.
> + *
> + * DP only has one legal ALPM mechanism (Panel Replay, aux-less); eDP
> +may
> + * reach ALPM via Panel Replay (either aux flavor) or via LOBF, but
> +never
> + * both, so this subtest only cares that Panel Replay is what came up
> +and
> + * that LOBF stayed off while it did.
> + */
> +static void test_alpm_panel_replay(data_t *data) {
> +	igt_output_t *output =3D data->output;
> +	struct alpm_status status;
> +
> +	require_no_audio(data, output);
> +
> +	test_setup(data);
> +
> +	alpm_dump_status(data->drm_fd, output);
> +
> +	igt_require_f(psr_wait_panel_replay_enabled(data->debugfs_fd,
> output, true),
> +		      "%s: Panel Replay not enabled after modeset\n", output-
> >name);

This is the check the subtest exists for, but as an igt_require a PR
regression (or an ALPM regression within PR) turns into a SKIP and CI
stays green. The LOBF-off assert that follows can't fail either:
intel_alpm_lobf_compute_config_late() drops LOBF whenever has_psr is set.

Please require the preconditions before the modeset: display version,
sink PR support ("Panel Replay =3D yes" in i915_psr_status), PR not
disabled via i915_edp_psr_debug, and for DP the sink ALPM caps
Then igt_assert_f() that PR is enabled after the commit.


> +
> +	igt_require(alpm_read_status(data->drm_fd, output, &status));

The file's presence was already required and the output is lit, so a
failed read here is an error: use igt_assert


Thanks and Regards
Kunal Joshi

> +
> +	igt_assert_f(!status.lobf,
> +		     "%s: LOBF must not be enabled while Panel Replay is
> active\n",
> +		     output->name);
> +
> +	if (output_is_dp(output))
> +		igt_assert_f(status.aux_less,
> +			     "%s: DP must use aux-less ALPM under Panel
> Replay\n",
> +			     output->name);
> +
> +	igt_info("%s: Panel Replay active, ALPM mode %s\n",
> +		 output->name, alpm_mode_str(output, &status)); }
> +
>  static void run_test(data_t *data, void (*test)(data_t *))  {
>  	igt_output_t *output;
> @@ -449,6 +521,11 @@ int igt_main()
>  		igt_display_require_output(&data.display);
>  	}
>=20
> +	igt_describe("Verify ALPM is reached via Panel Replay after a
> modeset, "
> +		     "with LOBF staying off while it is active.");
> +	igt_subtest_with_dynamic("alpm-panel-replay")
> +		run_test(&data, test_alpm_panel_replay);
> +
>  	igt_fixture() {
>  		close(data.debugfs_fd);
>  		igt_display_fini(&data.display);
> --
> 2.43.0

