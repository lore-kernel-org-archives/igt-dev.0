Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C028C982ED
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 14:38:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D131E10E815;
	Mon, 21 Sep 2026 14:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bVTAU8Xm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09FC010E898
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 14:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790001454; x=1821537454;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5EXxG3qJf3ZSBAmIIixsU/Wo5BPsrhRaC7WhVtwA+WA=;
 b=bVTAU8Xm7HDnA3PXn7KRDTiqPwPpsOmNAe1ScwCP7TjBmwEtN5O/MbI3
 2DiN0b7sXKjRCVB/Zg40mfTykGDdXQ66dc5DgqyHkD3XVKgGuSn4GgGI6
 +uDuQmcC3NzCgm0oKXlS8L8vk1EBLha5D7ymswNXUA6AoINQ6A/qNITxg
 OoxPT3CjuZyphdVrTstVl/98+oDH/Z4XtD51L+kQO4O/5vX29PQqTiz5U
 bYsKvzfYN03z2wv4IFOvSgHHqD7WLq1woIdybc4zbEwHSmwhuq+++eA71
 2SUkvKo8KAHGULDDUZyishWHxEUFewR1MEiA4eoK0pZUfTZg+4oj1qi1U Q==;
X-CSE-ConnectionGUID: ruKaCcmvT8ytfF0QkdzoXQ==
X-CSE-MsgGUID: bqgmYLPtT5CnYSq2T78FKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="101868189"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="101868189"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 07:37:34 -0700
X-CSE-ConnectionGUID: JMANJvUDQkODndkYOOAOEw==
X-CSE-MsgGUID: hseaNF2ZTPqMOaJBeHh2TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="3659113"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 07:37:34 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 07:37:33 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 07:37:33 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 07:37:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pkhO87rTUsjAjgbarhqj7dXdLR+eWVfCvKSXENNLJWM25R56rekopBSkQ+jC4QdeXCP7C6OQGdY/wMQx1goCFBpiQrPgcSFVz/tGrEOJ9k6uQyInDUnR0ia7RS48gkNDX+C7GBE1kpge7buE5WHzFmltYAeM7N7SrysqaJd2nRnVv78jk2c4Um3DboCLW2kdEEM8Dh4RnFRAatc5cYmY9TdHex081xMgmPHUICMw1mRh1N78+xWpp+0cSGajml1d0Jh6Ff4cXjtEQfgSlZJRthZV0k2TUcRHaA+BjJCYehy6/MHT4DgCB8sI0MukrjnmMjnE4rSo9Y6+pLS+xUILIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BKX9mh5FVLv2bFiCQOuOqvaH4Gk/3G7Ulq1kCkg6Msc=;
 b=JN271jLWbjnU7Kjhb2e4cAaO60awqC56qyx+svCFo1eRcTtoKtUTKciMeQoPtRb53pw9L40ziKbwM94exdfzTH0STa2DlizdAM0Nmdc4UCyWtAA81/iQNMhMy8/zQN+8TmL6+l2RKzNGY/DQIqR4dOlAmVrfoFwz9MMcoMLWHh6/XHJzWvy0DaZzz1xbJl5D6Vd6R/hyojFn0DTWe0KXb7uTy9AgTF7im9sP9nh3i1FtkwHsCtBaqYs1VsNkZ0u45Plypa+schw80bI658y0CUoIC45nEK0HpKlA9chCsQARxQxCOguy0HGIv+BB3hKY81NxChzSZDRowAiZ8U1G7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by IA3PR11MB8919.namprd11.prod.outlook.com (2603:10b6:208:576::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 14:37:31 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 14:37:31 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 2/4] tests/sriov_pci_config: Add VF core config checks
Date: Mon, 21 Sep 2026 16:37:05 +0200
Message-ID: <20260921143707.2117970-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260921143707.2117970-1-piotr.piorkowski@intel.com>
References: <20260921143707.2117970-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0125.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::23) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|IA3PR11MB8919:EE_
X-MS-Office365-Filtering-Correlation-Id: 8680821d-6bab-42ad-a3d5-08df17edde3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: gRMGINTalpL7gAMHfG0sBIZBCcF5X/Sp9LcU/jPU5Gtux63JR1ASkO9DCwHu5kskWHAjSmVfHmlWrDDDOu1adajAsyb4Gl3X/z60wSvUiJsL2SYFs5HevQNEx85eW43bua4KQ5AhsPH3dEik79HrgtjDic3+MPil9u+vC6AhhqJWf8SqwTNFaSABDzqXUiDfm/JWtbnGhApdayr2CKnya/un8ERFdDXaH0HDPA7gzbTFYh+LhGpcCed+ccOkgCX+brZnnfO3aCzW25zc1Fw0U1V6DWH3E+cG6o2cW+8VTfnlqRh4ZSFjuHItoddB18XH3iFXa4CcEGELvKlAf5OC4l4WHH823N1QDkA7dnNabiN/8A0V4kdNv403ItVIZ9jk1bp2XVq4lBq2B2c6IJP6u6y0agaWALf+Nr9yTWIzF6eBURvjGw5QRLpTbBKL7mwsbxBw795kGS85u+YNkK6Nh8qdnu1TzhcdPVXUZ2SdZqB7LpvHqJXuIm6XAJvL81s655BnPAp8/fpViH72QhAElgibIrWTDYQtHRc+dZbhxYhQI/+e/ucPJW2wFVhJZS9Yyc4cyR8/tzz2BQK8mgeiHkfHh9mqJBWGea2+6E+WWpOwu1HyzSgoFWsTP0hkjm88CEO3mVLxPYU2N4w9LjZpdJdlahNDjwyh7w/kCm1kPRA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVQxeWRlc2plV1orSDhmM25NNThiNUhneVlvSVEyTDIrVkVUL0h0RXZoUzJN?=
 =?utf-8?B?OWhuTDRkaS9yNjhyN1hPSDBUQmUyYU9WamcyelRaQnplcGpOVWtkakZ0aWFy?=
 =?utf-8?B?WWRJajhoMTZnbHd1eVF2NWhCUlozSFBjaVZ3R1MydUFWOWt3RE9YSGNDR2Y3?=
 =?utf-8?B?SnNpMVFQZms4dUFONmUxeEF1MmNLUVVSNjNmTDkzZ2dMV2pCY3FqSzl5ejBB?=
 =?utf-8?B?MnowNUlrMWFVMm1Ic1VUT1pUMnZkcUhYYUpkTTBFc0h5TzNDeTQyeGoxUG1z?=
 =?utf-8?B?TUo0cDRIQlpQU1hQSmM5RjJjU3JSUmo0ay81T0I3eFIwdTFOREQ0cFRkYlU5?=
 =?utf-8?B?RkhodTMraFNvOHNmTlV4OHpIeXVJUDNudzV5NS9BdXNKVGdPYVNtc1VEUyth?=
 =?utf-8?B?akJ4cHArc29CYmRFcERGMHBybDVLUmJpcUdEOVl1N0V1MXQwczNmeXFVaElV?=
 =?utf-8?B?TWdGdzRXZGt3SXluaGF2ekNHZkVHMlNJc0xVWjBzMzU4cTFqZHRBSHVFT0lX?=
 =?utf-8?B?dngxaFJHTnppZ1UzdUJ2dGpxaU0rYkpEMnQ1N0JoYlBTUTBQZWU5N2c5cnRT?=
 =?utf-8?B?aDREakdLSDFPb3JabmVPOFVNcmdIS1dHNC9BMGN2ZTlFaU1NN0Q1VDI3ejVB?=
 =?utf-8?B?SlFpcDhoMzkrdGNnQ2xIK1UzZFJSY1VidUZKZGkwL0Q0VGY3Wi94b2RWakxH?=
 =?utf-8?B?aXBYSDgzUllYSGRQa3I0UXBDQ2JqWEwrVUJTTk9SaEp0ZFZwdllrZlFXWkxP?=
 =?utf-8?B?VWZnaVFzU2N3TEJKTUFQWk5wNTg2U0tyRTlUMHhXOTEwL1ptUkRtVGtzeVBl?=
 =?utf-8?B?TTNuV3p4R2hmUVVUM3p1T3o0SEl4WndsQ1l2YzVKVGVkOEpSeVRTVElRYWNC?=
 =?utf-8?B?OUhNOVhOREdza0J6Q2srN0JZcHllMmpoSE5Way9KMy9pYXUrejNJS0dNb2dY?=
 =?utf-8?B?ckg5SEd1RmlqQXBmRS9LQ3ozQkNrZlM5UHhXQ1NKMlgwOWxobFhPUGtoRnpD?=
 =?utf-8?B?TXd5dytjVHZRVTZxRU1EOWJMSmdnZGExU3k5eFI3a0FhYlFqeHFRNXFYbWRN?=
 =?utf-8?B?VUpBZkJINW5VYzdNOER2cldaVXRZOEdGTEMyLzA1U0NjZ2llaS9CYXp6Q0hZ?=
 =?utf-8?B?Zi8zYVd3UzNuUUhDVHlOM0VUZzNTTkZsRlZRTVRnK21RWnZ2VzA1ckt1WFdF?=
 =?utf-8?B?SW93SWJEa3lGTGI3dVJKU0g3NTVORjVpZEcxZm11RGdnSlAycDY1eHh6dmJX?=
 =?utf-8?B?QU1razFIMnhIOEI1c3A0WDRvdEErRXI2VnZ1RkxKYzJmWDVxbnJiOW92Tncr?=
 =?utf-8?B?M0MxQWNqR3BscTRsbEpLMXpUSW43cTNicDMvclpncU52Qk1wc2tlTkd4VGlq?=
 =?utf-8?B?aGE5WXlBVHdJWVZ1NHZIdnVINzlEd25RaVlWaUx1RkY5TitnRitmRjA1R0Z0?=
 =?utf-8?B?NHFCZWU4bEQwSGhFSExGNEpRaURUdDRkVWV2QkhtWVpCYkxYMnBGRzM5Ylha?=
 =?utf-8?B?amE0V3ovZUxmVXlRcjA5QjZ0NHhMMnRFNGFpRmtnOGlSY2dOQ2R0Q2VwMXdB?=
 =?utf-8?B?Nkg2bkhJRXVzM3I0aTBBVUVRcnJ1Q1kzZjhUN1k2RzQ3ZVpxUHE2RGlSd2Iz?=
 =?utf-8?B?TUhCMEtVdWNZZ01JdzdjazJuMnBkTld4QjJKbzI3WG5hM0YzT1pRekx2REt4?=
 =?utf-8?B?WVp3NVNHN295aU1hclg0b3ppK3pLcDh3VzVmdnN5Yzh0OGd4WGtSUlkrNFJt?=
 =?utf-8?B?bTZzWEhielJkV0k1WlFnQlY3Y1pGTTlaM1AvMkRWeTZVejlmalI5b0RIK3pW?=
 =?utf-8?B?VmFYdldRMjNTMHJxL2ZEQmdrUkR4eDhqNEZxZ3RLNTB0alNOVjN2SDZQNGdL?=
 =?utf-8?B?WjdZM1ZwN2h4SkZqRWFSaW1wZytzRG1IWGcrYWZ2cnU1cVkrM0V6MTQ3S2Jr?=
 =?utf-8?B?RVR5NjBpNmM4d3Yrd0RQcWdCeTgrUDQ5cjhoZnVPU3JVSjJBS2huaFc0OXlY?=
 =?utf-8?B?bm11ckhpS21Pb3ZTL25CMDE0QmRTbE5sQVp1d3JjV3lLQ2Q3UE85R3N0aHV2?=
 =?utf-8?B?aXZ3R2gyREZYYWF6eHBKenB6dFFjVFFUVGtSSVNnbVRTdWM4SkJiYzQzTENW?=
 =?utf-8?B?TUdhVkl5RnJkSmd0V0dvRnRZM1BtVThwa2FjbGFMN2FhYWlTRFNOYnhjb3BI?=
 =?utf-8?B?eWlMZVZrUWdFaGhSN1ozdCtva012dFVjeVVIV1lrVXVlbHJIV29PWTR3ZEJN?=
 =?utf-8?B?Mk1taDBBS2Fab0VCV0pheVA1aXRXbWgyd2h3b3RXZjhSZzcxdHZUdTI4NktD?=
 =?utf-8?B?cC8xK0t1VlliVTBRbUtBN1dNUGw2MDcwV0hxZTV4MDRoUXp1Z2xjd2hpa2pS?=
 =?utf-8?Q?g6jcrLIfOO3KlyYc=3D?=
X-Exchange-RoutingPolicyChecked: vOpyaDJJ3ny+pzuj8pEG2Nh5k92g9gLsV3PYS4Hw6DqMiGga+5lyz2VFopqi9ogrfNM9Q51302UCCk1dCgODlRz7vTg70MVLpWAH4buo7HkAxQJ7u2fZe+X5izK8u8e6jWddW5tcu1eiEPFUdthNtDBKr0dkeT5a6e8L57DBTrGdnyerF0384jGFMM6oV1BObMg5uK+OGTJusW3lQ2wAMFGiEVP3JTG/gR9Gm9g3dpAq2U2JUHL+U1l/rBg24FD9Sc7nGQaH34g9etl9XplHY6gnEjEyAN7lAq2pJytmpsTm2u+Ip2ao1oul4FVDIuwu2r6IUcGtVYhQmazpXAhNsw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8680821d-6bab-42ad-a3d5-08df17edde3e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 14:37:31.4877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: km2r10f0lozJycMbgxZyMlT3RS13h08TLseHGrhmj65bnJIqtcSO1FQVDleSEcGItAturytMucj9G9iMb1s23PMNNzlWACO3t/MPhXbTzwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8919
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Add checks for PCI configuration fields required by SR-IOV VFs.
Cover the common header, BARs, and PCI Express capability fields.

v2:
- Enable the VF and read its configuration once in the fixture.
- Restore driver autoprobe state and disable the VF during cleanup.
- Clarify test documentation and shorten runtime descriptions.
- Remove redundant informational messages.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Assisted-by: GPT-5.6 Luna
---
 tests/meson.build        |   1 +
 tests/sriov_pci_config.c | 210 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 211 insertions(+)
 create mode 100644 tests/sriov_pci_config.c

diff --git a/tests/meson.build b/tests/meson.build
index bee2b94224..51c84c99f0 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -74,6 +74,7 @@ test_progs = [
 	'meta_test',
 	'prime_vgem',
 	'sriov_basic',
+	'sriov_pci_config',
 	'syncobj_basic',
 	'syncobj_eventfd',
 	'syncobj_wait',
diff --git a/tests/sriov_pci_config.c b/tests/sriov_pci_config.c
new file mode 100644
index 0000000000..9f410ef23a
--- /dev/null
+++ b/tests/sriov_pci_config.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2026 Intel Corporation. All rights reserved.
+ */
+
+#include <linux/pci_regs.h>
+
+#include "drmtest.h"
+#include "igt.h"
+#include "igt_pci.h"
+#include "igt_sriov_device.h"
+
+#define VF_PCI_EXP_DEVSTA_EPRD		(1 << 6)
+#define VF_PCI_EXP_LNKSTA2_DEEMPHASIS	(1 << 0)
+
+/**
+ * TEST: SR-IOV PCI configuration
+ * Category: Core
+ * Mega feature: SR-IOV
+ * Sub-category: PCI configuration
+ * Functionality: SR-IOV-related PCI configuration space
+ * Description: Validate PCI configuration fields required for SR-IOV,
+ * including Virtual Functions.
+ *
+ * SUBTEST: vf-common-header
+ * Description: Validate that the VF Vendor ID and Device ID read as 0xffff,
+ * and that the I/O, Memory, and INTx Disable bits in Command, the Immediate
+ * Readiness and Interrupt Status bits in Status, the Header Layout bits in
+ * Header Type, and the BIST Completion Code are all zero.
+ *
+ * SUBTEST: vf-bars
+ * Description: Validate that VF BAR address bits read as zero. The BAR type
+ * and attribute bits are static and may remain set; the upper dword of a
+ * 64-bit BAR must read as zero.
+ *
+ * SUBTEST: vf-pcie-capabilities
+ * Description: Validate that FLR is supported, and Phantom Functions Supported,
+ * Auxiliary Power Detected, Emergency Power Reduction Detected, Current Link
+ * Speed, Negotiated Link Width, and Link Autonomous Bandwidth Status are all
+ * zero.
+ *
+ * SUBTEST: vf-pcie-capabilities-2
+ * Description: Validate that the Current De-emphasis Level field in Link
+ * Status 2 is RsvdZ and therefore reads as zero for PCIe Capability Version 2
+ * and later.
+ */
+
+IGT_TEST_DESCRIPTION("Validate PCI configuration fields required for SR-IOV, "
+		     "including Virtual Functions");
+
+static int pf_fd = -1;
+static bool autoprobe;
+static uint8_t vf_config[PCI_EXT_CFG_SPACE_SIZE];
+
+static void read_vf_config(uint8_t *config)
+{
+	char *vf_slot;
+	int ret;
+
+	vf_slot = igt_sriov_get_vf_pci_slot_alloc(pf_fd, 1);
+	igt_assert(vf_slot);
+	ret = igt_pci_config_raw_read(vf_slot, config, PCI_EXT_CFG_SPACE_SIZE);
+	free(vf_slot);
+	igt_assert_f(!ret, "Failed to read VF config space (%d)\n", ret);
+}
+
+static void check_vf_common_header(const uint8_t *config)
+{
+	uint16_t command = igt_pci_config_raw_read_u16(config, PCI_COMMAND);
+	uint16_t status = igt_pci_config_raw_read_u16(config, PCI_STATUS);
+	uint16_t vendor_id = igt_pci_config_raw_read_u16(config, PCI_VENDOR_ID);
+	uint16_t device_id = igt_pci_config_raw_read_u16(config, PCI_DEVICE_ID);
+
+	igt_assert_f(vendor_id == 0xffff, "Vendor ID: expected 0xffff, got 0x%04x\n", vendor_id);
+	igt_assert_f(device_id == 0xffff, "Device ID: expected 0xffff, got 0x%04x\n", device_id);
+	igt_assert_f(!(command & (PCI_COMMAND_IO | PCI_COMMAND_MEMORY |
+				  PCI_COMMAND_INTX_DISABLE)),
+		     "Command: expected I/O, Memory, and INTx Disable bits clear, got 0x%04x\n",
+		     command);
+	igt_assert_f(!(status & (PCI_STATUS_IMM_READY | PCI_STATUS_INTERRUPT)),
+		     "Status: expected Immediate Readiness and Interrupt Status bits clear, got 0x%04x\n",
+		     status);
+	igt_assert_f(!(config[PCI_HEADER_TYPE] & PCI_HEADER_TYPE_MASK),
+		     "Header Type: expected Header Layout 0, got 0x%02x\n",
+		     config[PCI_HEADER_TYPE]);
+	igt_assert_f(!(config[PCI_BIST] & PCI_BIST_CODE_MASK),
+		     "BIST: expected Completion Code 0, got 0x%02x\n", config[PCI_BIST]);
+}
+
+static void check_vf_bars(const uint8_t *config)
+{
+	for (int bar = 0; bar < 6; bar++) {
+		uint32_t value =
+			igt_pci_config_raw_read_u32(config,
+						    PCI_BASE_ADDRESS_0 + bar * sizeof(uint32_t));
+		bool is_mem64 = !(value & PCI_BASE_ADDRESS_SPACE) &&
+				(value & PCI_BASE_ADDRESS_MEM_TYPE_MASK) ==
+				PCI_BASE_ADDRESS_MEM_TYPE_64;
+
+		/* Only the address bits are hardwired to zero; type/attribute bits are static. */
+		igt_assert_f(!(value & ~0xfu), "BAR%d: expected address 0x00000000, got 0x%08x\n",
+			     bar, value);
+
+		/* The upper dword of a 64-bit BAR holds pure address bits, no type bits. */
+		if (is_mem64) {
+			unsigned int upper_offset = PCI_BASE_ADDRESS_0 +
+						    (bar + 1) * sizeof(uint32_t);
+			uint32_t upper =
+				igt_pci_config_raw_read_u32(config, upper_offset);
+
+			igt_assert_f(!upper, "BAR%d (upper): expected 0x00000000, got 0x%08x\n",
+				     bar + 1, upper);
+			bar++;
+		}
+	}
+}
+
+static int get_pcie_cap(const uint8_t *config)
+{
+	int pcie_cap = igt_pci_config_raw_find_cap_offset(config, PCI_CAP_ID_EXP);
+
+	igt_assert_f(pcie_cap > 0, "VF has no PCI Express capability (%d)\n", pcie_cap);
+
+	return pcie_cap;
+}
+
+static void check_vf_pcie_capabilities(const uint8_t *config)
+{
+	int pcie_cap = get_pcie_cap(config);
+	uint32_t pcie_devcap = igt_pci_config_raw_read_u32(config, pcie_cap + PCI_EXP_DEVCAP);
+	uint16_t pcie_devsta = igt_pci_config_raw_read_u16(config, pcie_cap + PCI_EXP_DEVSTA);
+	uint16_t pcie_lnksta = igt_pci_config_raw_read_u16(config, pcie_cap + PCI_EXP_LNKSTA);
+
+	igt_assert_f(pcie_devcap & PCI_EXP_DEVCAP_FLR,
+		     "Device Capabilities: FLR bit is clear (0x%08x)\n", pcie_devcap);
+	igt_assert_f(!(pcie_devcap & PCI_EXP_DEVCAP_PHANTOM),
+		     "Device Capabilities: Phantom Functions Supported must be zero (0x%08x)\n",
+		     pcie_devcap);
+	igt_assert_f(!(pcie_devsta & (PCI_EXP_DEVSTA_AUXPD |
+					  VF_PCI_EXP_DEVSTA_EPRD)),
+		     "Device Status: Aux Power Detected or Emergency Power Reduction Detected is set (0x%04x)\n",
+		     pcie_devsta);
+	igt_assert_f(!(pcie_lnksta & (PCI_EXP_LNKSTA_CLS | PCI_EXP_LNKSTA_NLW |
+					 PCI_EXP_LNKSTA_LABS)),
+		     "Link Status: Current Link Speed, Negotiated Link Width, or Link Autonomous Bandwidth Status is set (0x%04x)\n",
+		     pcie_lnksta);
+}
+
+static void check_vf_pcie_capabilities_2(const uint8_t *config)
+{
+	int pcie_cap = get_pcie_cap(config);
+	uint16_t flags = igt_pci_config_raw_read_u16(config, pcie_cap + PCI_EXP_FLAGS);
+	uint16_t lnksta2;
+
+	if ((flags & PCI_EXP_FLAGS_VERS) < 2)
+		igt_skip("PCI Express Capability Version 2 is not present\n");
+
+	lnksta2 = igt_pci_config_raw_read_u16(config, pcie_cap + PCI_EXP_LNKSTA2);
+	igt_assert_f(!(lnksta2 & VF_PCI_EXP_LNKSTA2_DEEMPHASIS),
+		     "Link Status 2: Current De-emphasis Level must be zero (0x%04x)\n",
+		     lnksta2);
+}
+
+int igt_main()
+{
+	igt_fixture() {
+		pf_fd = drm_open_driver(DRIVER_ANY);
+		igt_require(igt_sriov_is_pf(pf_fd));
+		igt_require(igt_sriov_vfs_supported(pf_fd));
+		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
+		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
+		igt_sriov_install_exit_handler(pf_fd, NULL, NULL);
+		igt_sriov_disable_driver_autoprobe(pf_fd);
+		igt_sriov_enable_vfs(pf_fd, 1);
+		igt_require_f(!igt_pci_system_reinit(), "Failed to refresh PCI state\n");
+		read_vf_config(vf_config);
+	}
+
+	igt_describe("Validate the VF PCI common header");
+	igt_subtest("vf-common-header") {
+		check_vf_common_header(vf_config);
+	}
+
+	igt_describe("Validate the VF BARs");
+	igt_subtest("vf-bars") {
+		check_vf_bars(vf_config);
+	}
+
+	igt_describe("Validate the VF PCI Express capability");
+	igt_subtest("vf-pcie-capabilities") {
+		check_vf_pcie_capabilities(vf_config);
+	}
+
+	igt_describe("Validate the VF PCI Express Capability Version 2 fields");
+	igt_subtest("vf-pcie-capabilities-2") {
+		check_vf_pcie_capabilities_2(vf_config);
+	}
+	igt_fixture() {
+		igt_abort_on_f(pf_fd < 0, "Device is not accessible\n");
+		igt_sriov_disable_vfs(pf_fd);
+		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0,
+			       "Failed to disable VF(s)\n");
+		autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
+			    igt_sriov_disable_driver_autoprobe(pf_fd);
+		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
+			       "Failed to restore sriov_drivers_autoprobe value\n");
+		igt_sriov_clear_exit_handler();
+		close(pf_fd);
+	}
+}
-- 
2.34.1

