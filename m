Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B2ACDB479
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 08:48:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1EF10E070;
	Wed, 24 Jun 2026 08:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YJGpPSWr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DECB10E070
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 08:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782290848; x=1813826848;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5bDW8q3EBia7fCctZwGA7SLf9nMo5CtYPKItk6JNmB8=;
 b=YJGpPSWrgucNc14Yu/u/W0XLHsuXISMwjVZctbEbiwtQoyHtV/GUs2Wz
 6ZFNlUymbxjezAj6Ne+60QToT7us8rW+X8yw3tiXpQuNHNKLhNu/qJrkK
 tIzlgu/wEo1S+Dqq9RDPRPTjl5ggZ0ve+aIaI381H9WPZvPL6zzemLKF+
 rLrsNRMmmP0uZM21yITu+4/rC70yGuiy6KygAgMt/TShH9g4FPSJc1KP+
 u6rOg2lor7mK6T6CU3ck1GxfmoiNNaIan0CNUSlDEMQNLkTyCtftKQLKK
 3IrmAP1Bf5sGizbz+1Z3KH999ocCxnYuFf/qAHGdXK3nqfGbHWyCZ0I7A A==;
X-CSE-ConnectionGUID: JfvMNxtJQcKpWDHzEB87dw==
X-CSE-MsgGUID: 5Wfg2o+fTKSFLxi2uAYyuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83142218"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="83142218"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:27 -0700
X-CSE-ConnectionGUID: 4p7mMoZETzmRqgNu6OsfTg==
X-CSE-MsgGUID: Tpf2wksvRPq2AW9cjUqJoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="254865303"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:27 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:26 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 01:47:26 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q1o47VuFKS8/zYtzpMEzobWPCMTavUlMkIKkNYDwSSuauE6vb9098reSX2lapmstlgqLDHHEMMFinAoesMzQYS1tjbsjIZXUXOX1QXJQYxZAah5/a4/r81bxQGX5mCU6h11wLdbqmyHeL9MdmodPu1Rh4JgtZvQGw6Mi8hkc0kss8Br5uNKJa7LcFtDV8MYK9MElbrNZpynS1/fJjaJkv/5bFNaB/9ksHK1/EnlKxLsiP49mPtvWSo3L2h+x3QfapHMseMA1QzmmIyDwZnjuQrELdgLSED5nRUMOZOVk6c8KNDq6rsAvORP/M37JJvj8V0t3SkweCLpGsEmz75ye/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhzrST8/pm3iJ6wXHJNvrrImpFVjdUOS5YGaPLmxGcM=;
 b=d3NjSp+Ap4xDlaMvqmyWJ9apRgJtiPlqGsDvTblmvM0aqqkxeflkKmYDxArUvYIJvBHymNtoPOYx10JnUBXXfDM7iHE/sJKFOH8yvOXW6NVAwmsNfqCHwrWxAIM+Kwcsw9X0qPN2qS7NfA5mXusWlbwdIIIvLQVrBMfvM4EqjcMBHv7BczLSd3nAcTeM1T6+MCrhP3nj/jvVqBfi9kjkEbdUj1cjr5Wy4E97MohBn9BaAjvFledfbpn85lyXWX+O7x8rrebvs2OD8lYal4UMpatrynJ4yArjiq+IB0BPwOJu840lTsmtQMVymtH+R8s46Ngdg5rxyn8d7+n2JBvscg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by CH3PR11MB8776.namprd11.prod.outlook.com (2603:10b6:610:1c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 08:47:24 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Wed, 24 Jun 2026
 08:47:24 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 04/25] lib: introduce lib_igt_drm_stub for tools needing
 driver detection
Date: Wed, 24 Jun 2026 10:47:11 +0200
Message-ID: <bd9ca1ae2bb6d8fc062b86c2d51df36e4d5e0740.1782288071.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1782288071.git.sebastian.brzezinka@intel.com>
References: <cover.1782288071.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB9PR05CA0023.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::28) To MW4SPRMB0067.namprd11.prod.outlook.com
 (2603:10b6:303:221::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|CH3PR11MB8776:EE_
X-MS-Office365-Filtering-Correlation-Id: cd8f87c0-dddc-4bb5-fee3-08ded1cd3659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|18002099003|22082099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: WPTwimp3uYOHlsXRdbGdvAPJwRJGD5KpkutPEUhkOv72buGvVGRUXTjRpWSrXJojDwtgY0xbYP8EGhciOTjuurcoVQzyIsMt3Fson9uiucQibVw0WQX5kL7KsXiK6/6Coh23ZI3GDPT5t2YFY48NdT3Lg23tLWRvkvH0sVAeazagWdgOeU+NN2eAI+Ue8fogsiXHrr/308d7K0+WG7hmiw9AMWqN08h98VV1TvpaX96HKOLeS6d98vmEblWD+nSEHMd5qor7n1kGL3HYEN+Y9BQM8ivUjPTQwW2MJhW6naAQIB3koSAo/yEa+naUF+lA+i/qzBnYphQP0ozPnwuQKEGKH8AcX2m50i4tlPEfRKWhcLuVnF7GRZ9QJyhOGsdP32PteuBlXKOufKnUw++HpVfoKvXPf6NL/vhgpR8uJBibX8PwTwCgQ97W3uwkeA7mrsj6z6WbRUmcDJyj1VIhGYcP8Y8zqi/MLcxe8iBtrt7yyT8MiPDEOVp3pBV4tcBrxsnxfoBQXKwTKseu924XUQgYEKLDBhqjS/HliQGSoPRpPuyzNwRiEUjoqNvDhKtyOHiTzM7r+JcubONBzL2AUOT0YrM9Li2Au3jiVg7OpjMK3IDgfKhI02PknlbTqBYUiVpFh1sVGSs/41Iv/EYHfvtQijagrUvwSdqqWOu+Mzk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFVCTzRtL21IanlEQ1NmOWlnZ3lwMS93V3cybDlIbUpHalczYXFEOHhrLzVs?=
 =?utf-8?B?Y0ZvNy9aZWJHaXNqQnY0N0tzK0RXbEtLTFVScUhES2xnWGRKTE5XaDV3L25Y?=
 =?utf-8?B?MTI1cDlmaGNMekNzZlgwR3d3YWNKaU5DNnUvUkhrdDR1SkFjeFdBbnBLTWNX?=
 =?utf-8?B?V3pMQk1NUS96eURzU00xaUQwZkwwWDU0Y0lJUnhVeUlyaHovaHEzNGFETkRY?=
 =?utf-8?B?NzNhQWlWWmZ4WmlhTFBrbTJlQ1NUL21XeVpJeTBpU3VNVlpKNERsTXJwSEd3?=
 =?utf-8?B?S0p4aE9HeEFId3FpRDBTMERIMXBXSHhjWmJmV3pLdkwyVis3bUx4V3NORENi?=
 =?utf-8?B?SUdJVGtZS1pSR09uWSs1eHArbHpCL1ZDN3k4c1FRWDhFM2J3NG1sdkVzTXhk?=
 =?utf-8?B?b0NkelJINytoL1hDdXZqN3F3cFVPZTVlZXA4VDhRbUowbG1QNjRNZlRCT2NZ?=
 =?utf-8?B?eWFiM2VLUHhnNVYyUVZxRzdUakNSTnY5d3RNOXNFdlh6NHdOclJ0T3NZRFJu?=
 =?utf-8?B?aUxHRVdhbjlLS0R5VFR4QWx4eFdFTzdMd3JMV2FOSTVFVC9hbEJHckN6R1cx?=
 =?utf-8?B?NlJMUmpzRmJMZXltazgzSndJTzZGVmhBQ2YrVUx2ay84MzZQc1N4ejJhcmI5?=
 =?utf-8?B?Umc2UXhPTktEMXlYeExRdk45bEdaNFpOK1ZEWkEwZ0w5aUNucS9MNHJ1Zm5p?=
 =?utf-8?B?ZWt0QW4zWnNGS3VUSDhCL1hDRkxISnVPTDVEWFU0ZXl2S2Z2VlhDVE9KVmJ2?=
 =?utf-8?B?NGxwbm43empCaWh1U3hwOUNwcWJIb3U2RDVFbGpUdnB0OUQvekY4TjFMUU1T?=
 =?utf-8?B?NE5Kc3kvbW5Bbk8rQVdMRk5sV0R1NXpxMmlvbVdqbmdicmxocnVXcmREdElo?=
 =?utf-8?B?RVQ2MHpLUE1qbzNXZGRJdmd3dWlxb0l6Tm8yTG5SYjVkRlhEZEhxVmhyemdG?=
 =?utf-8?B?TXBPaFZTYkY4cU9idDNsRXN2aDhIZWlnTWR2U2FqMitENU91WFoxenQwT0Jw?=
 =?utf-8?B?cGRrN1p3NWprekhiWk1tSzA2UFhhd0FLejc5Vk14U0hsQnZjUnZ6WmNWRTRR?=
 =?utf-8?B?dUlMMHBzdVRRcmZaeVVydmcrRkVTVUFObllLM0ZBdzJrN0ZwV3hLK0xiU2pT?=
 =?utf-8?B?eVRvVDJSdGhQOWdsTmpGaEhVVnU2MkxGZ2FEZXpUTzdEMkxTTlB0Zk9iaFgz?=
 =?utf-8?B?QzFZdzREY1A4VlpWc1JLRDUvRWVhRXMyamxVNytlYjQxNE53TXNIMkhBVU5E?=
 =?utf-8?B?REdKMExBQmVsK3dDengwS2Juc24vVEl0cFltRitqTHYwa2o1WGI1RlZXQ1Ra?=
 =?utf-8?B?dDd1eWZiaWpJZUlGRS9TMTc5RFJmRTE0VWk1Mzl6MFEwTTA2bzhrRFZIN3l2?=
 =?utf-8?B?RHNCSUFFbk5DbWovdm04V2RERVZaZm1mWlhpR2t4eWVjNWdITVkzeHVTTVNL?=
 =?utf-8?B?UjJ3dk10UXFsdDhEcml3UThjN3dpOC9KUWhhL2Nwa3ZKalVET0s1UmQzTE5m?=
 =?utf-8?B?bE5IVzdCWnVxcUw4VnNhY09OU3JhNWdETmdNRlhiNXFBYnBoU0xtQXVEL05o?=
 =?utf-8?B?b3ZkSlVudVViUTBVMXdUbWV2dVBhRDNZZ1lVRnh1NEJDTkpTdUZiYVg4OTNK?=
 =?utf-8?B?R0FFM0U1NTVOaXhYZEdJcCs3am02U2hPd0tUK3pjT0M3SHhCSWNlak0yVndN?=
 =?utf-8?B?MlZUT1VFM3FESjEvcElTWXN0MjI3Z25TTzV2VHJzayswbnczWWRNMnE3MHNE?=
 =?utf-8?B?SDh5cTNzMkdISW1BWnJ6MEF2KzNGMnorUjJ6dWV6cWJ3NHNOL0lEMm1haTYy?=
 =?utf-8?B?OVJSL1hXNGlTVVExTTFpZzJheW1KRm5BYTA2MSs2Zk5Cc2JwZWhDR2JWcmZO?=
 =?utf-8?B?bHh2NHE5SlNKaEdXVUhyMW5xYzYrSTk0UFBDWUUxU3BaUGRPd3Y0S1c4VGpP?=
 =?utf-8?B?K0l5dzZVVnpqZlFBb1JINkp4TS9kaHBaS3RGcFRrRzkzSlphWkFUM2Y5LzU4?=
 =?utf-8?B?UENoT0kxaGhtL1l0RXc2NjJaS3pTVTh0WjZ5MzFYODBBSVBWS0llcnVNaVVj?=
 =?utf-8?B?TGYyeVNIRnBtRlF2T0pjb0dpOE9HeHRLQjkrUU1DeFNjSGdIQ3I0NDJXaUoy?=
 =?utf-8?B?cDd0RlpES0xSdyszdzRwdWsrZEp4SE9OM0luMitOMDJYTFp5UnowWXdrVVlz?=
 =?utf-8?B?SGg3ejRheUFwdjJnekZSVENKaTBxQ1RMZUQ1S0tVTXkzZGhsWGJ3OGhUbTRU?=
 =?utf-8?B?MlYreVN3dDhYbHVzUjdoMXNvQ1dPZFU0Z3FtelBjSzVZN2FROUFlelRDSFdi?=
 =?utf-8?B?ZFdGcHgvd2JQYitrOUFKMWVZT3hDcFhCM1VNVEFvVFU0cmNrUXBzNkdSMkRn?=
 =?utf-8?Q?YzLJWRVguQWGc+3E=3D?=
X-Exchange-RoutingPolicyChecked: AJ559pEjQj47iUugDQzM98BB+UIpOxyJleIJDEgq4oQR+5jQF9fMY53I4dju4QRRewwsyBKkqYU5Jx24KKyyu78H9iYeV9k10QUS1XIWhejOuqBZPk5vJm4SDYaEYAXt7fH4O7nkxTWyjVUvvLQwD0wS92sQcgTR5r47H1m6LjJUv9BbBJh3BftEvWR3BCBQI9hNWt5mTHbqteXnHXhqqp+4vrMkLKI74yiX/Q0SvefjXvrbrgjw+KOl0Wgboqx4+zpM9oTHwYNp7EJDJ2uc1iM1xD6HZeoyLjoeaFBNyq03uDYy7WfsAxpneqrtD6HggW8hAGS+dg1+sReRKZ1+RA==
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8f87c0-dddc-4bb5-fee3-08ded1cd3659
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:47:24.5806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DxaJbHraN+cLVdNRtTgiUybbPQO5AOEZp7ojwuy1qPH15M7WTBk480JqDN8yVI6VZPzHt5G0JWJBtlNKWUVSaJ3alB6++d7q2hXQLoqvUco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8776
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

Split drm/pciaccess-dependent stubs out of igt_tools_stub.c into a
new igt_drm_stub.c.  This avoids pulling libdrm into tools that only
need dep-free logging and exit stubs.

The new lib_igt_drm_stub static sub-library provides:
igt_pci_system_init, is_i915_device, is_intel_device, xe_dev_id and
__drm_open_driver.  It is also compiled into lib_igt_device_scan which
already needs libdrm and pciaccess.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 lib/igt_drm_stub.c | 129 +++++++++++++++++++++++++++++++++++++++++++++
 lib/meson.build    |  29 ++++++----
 tools/meson.build  |   3 +-
 3 files changed, 151 insertions(+), 10 deletions(-)
 create mode 100644 lib/igt_drm_stub.c

diff --git a/lib/igt_drm_stub.c b/lib/igt_drm_stub.c
new file mode 100644
index 000000000..871d8bd38
--- /dev/null
+++ b/lib/igt_drm_stub.c
@@ -0,0 +1,129 @@
+/*
+ * Copyright © 2020 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ */
+
+/*
+ * Minimal DRM/PCI stubs for tools that need driver detection and device
+ * opening but do not link the full libigt.so.  Requires libdrm and pciaccess.
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <limits.h>
+#include <pciaccess.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/stat.h>
+#include <sys/sysmacros.h>
+#include <unistd.h>
+#include <xf86drm.h>
+
+#include "drmtest.h"
+
+int igt_pci_system_init(void)
+{
+	return pci_system_init();
+}
+
+static bool driver_name_matches(int fd, const char *name)
+{
+	drmVersionPtr version;
+	bool match = false;
+
+	version = drmGetVersion(fd);
+	if (!version)
+		return false;
+
+	match = version->name_len > 0 && !strcmp(version->name, name);
+	drmFreeVersion(version);
+
+	return match;
+}
+
+bool is_i915_device(int fd)
+{
+	return driver_name_matches(fd, "i915");
+}
+
+bool is_intel_device(int fd)
+{
+	return is_i915_device(fd) || driver_name_matches(fd, "xe");
+}
+
+static uint16_t read_pci_device_id(int fd)
+{
+	char path[PATH_MAX], buf[32];
+	struct stat st;
+	int sysfs, len;
+	unsigned int devid;
+
+	if (fstat(fd, &st) || !S_ISCHR(st.st_mode))
+		return 0;
+
+	snprintf(path, sizeof(path), "/sys/dev/char/%d:%d/device/device",
+		 major(st.st_rdev), minor(st.st_rdev));
+	sysfs = open(path, O_RDONLY);
+	if (sysfs < 0)
+		return 0;
+
+	len = read(sysfs, buf, sizeof(buf) - 1);
+	close(sysfs);
+	if (len <= 0)
+		return 0;
+
+	buf[len] = '\0';
+	if (sscanf(buf, "0x%x", &devid) != 1)
+		return 0;
+
+	return devid;
+}
+
+uint16_t xe_dev_id(int fd);
+uint16_t xe_dev_id(int fd)
+{
+	return read_pci_device_id(fd);
+}
+
+int __drm_open_driver(int chipset)
+{
+	char path[PATH_MAX];
+	int fd;
+
+	for (int i = 0; i < 16; i++) {
+		snprintf(path, sizeof(path), "/dev/dri/card%d", i);
+		fd = open(path, O_RDWR | O_CLOEXEC);
+		if (fd < 0)
+			continue;
+
+		if ((chipset == DRIVER_INTEL && is_i915_device(fd)) ||
+		    (chipset == DRIVER_XE && driver_name_matches(fd, "xe")) ||
+		    (chipset == DRIVER_ANY && is_intel_device(fd)))
+			return fd;
+
+		close(fd);
+	}
+
+	errno = ENODEV;
+	return -1;
+}
diff --git a/lib/meson.build b/lib/meson.build
index 96903d06f..0fcbee230 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -348,24 +348,42 @@ lib_igt_perf_build = static_library('igt_perf',
 lib_igt_perf = declare_dependency(link_with : lib_igt_perf_build,
 				  include_directories : inc)
 
+lib_igt_tools_stub_build = static_library('igt_tools_stub',
+	['igt_tools_stub.c'],
+	include_directories : inc)
+
+lib_igt_tools_stub = declare_dependency(link_with : lib_igt_tools_stub_build,
+					include_directories : inc)
+
+lib_igt_drm_stub_build = static_library('igt_drm_stub',
+	['igt_drm_stub.c'],
+	dependencies : [libdrm, pciaccess],
+	include_directories : inc)
+
+lib_igt_drm_stub = declare_dependency(link_with : lib_igt_drm_stub_build,
+				      dependencies : [libdrm, pciaccess],
+				      include_directories : inc)
+
 scan_dep = [
 	glib,
+	libdrm,
 	libpci,
 	libudev,
+	pciaccess,
 ]
 
 lib_igt_device_scan_build = static_library('igt_device_scan',
 	['igt_device_scan.c',
 	'igt_list.c',
 	'igt_map.c',
-	'igt_tools_stub.c',
 	'intel_device_info.c',
 	'intel_cmds_info.c',
 	],
-	dependencies : scan_dep,
+	dependencies : [scan_dep, lib_igt_drm_stub, lib_igt_tools_stub],
 	include_directories : inc)
 
 lib_igt_device_scan = declare_dependency(link_with : lib_igt_device_scan_build,
+				  dependencies : [libdrm, pciaccess],
 				  include_directories : inc)
 
 lib_igt_drm_clients_build = static_library('igt_drm_clients',
@@ -389,13 +407,6 @@ lib_igt_profiling_build = static_library('igt_profiling',
 lib_igt_profiling = declare_dependency(link_with : lib_igt_profiling_build,
 				        include_directories : inc)
 
-lib_igt_tools_stub_build = static_library('igt_tools_stub',
-	['igt_tools_stub.c'],
-	include_directories : inc)
-
-lib_igt_tools_stub = declare_dependency(link_with : lib_igt_tools_stub_build,
-					include_directories : inc)
-
 lib_igt_stats_build = static_library('igt_stats_tools',
 	['igt_stats.c'],
 	include_directories : inc)
diff --git a/tools/meson.build b/tools/meson.build
index 4c67dde4f..53aa31056 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -105,7 +105,8 @@ install_subdir('registers', install_dir : datadir)
 executable('intel_gpu_top', 'intel_gpu_top.c',
 	   install : true,
 	   install_rpath : bindir_rpathdir,
-	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,math])
+	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,
+	                   lib_igt_drm_stub, lib_igt_tools_stub, math])
 
 executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
 	   dependencies : [tool_deps],
-- 
2.53.0

