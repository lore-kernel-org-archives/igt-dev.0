Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88D3C982ED
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 14:41:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8673C10E32D;
	Mon, 21 Sep 2026 14:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bdzIa2BZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA2410E49F
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 14:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790001443; x=1821537443;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=EGmBFmyqFsX4kJpJezepAzpKe2giFxPpuh/Ll27kdFQ=;
 b=bdzIa2BZUvuQRS8aO1Hl0L43T1CTwNH4NG8j26KQvSKZA7vgOaG2HWlQ
 ZqcrXg4gr9ildoDyheAJcZfMA4EvV1lC3nOaCHZaD5p6/Mzbo6KlYxcOG
 YKdGhBNDPT55uC6kqSXt7QGv242EgAVI7+I9Lh2cd+cYX1m8lCKfHRSEZ
 C75nRfVd0aGiguXWEeWKuJBSbXdYPWNp1lXj2gxnsYJzW49nDDRqlzETq
 7zzL7BD9bm6DY6r5hAm66fjXBS47Rueji2BO4BriJxTcKQmXFE27nvEuH
 nnCDYy6el5iNKmnof+I4Q63oF2IQAI6GjGz1UBiY1jpKuramX1AB8l678 A==;
X-CSE-ConnectionGUID: RLH3qQaRQoedwcaCYIzWKA==
X-CSE-MsgGUID: +BuREkY1SFO8JpJM6qF8Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="89652060"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="89652060"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 07:37:23 -0700
X-CSE-ConnectionGUID: lrV93PxTQ4OgnRo64F0lbQ==
X-CSE-MsgGUID: LgDQ1lu4R9+z9phv9WmPrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="271858151"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 07:37:23 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 07:37:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 07:37:22 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 07:37:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VkDCz7U38x9qFCShe55LGVoxyRhKW/Ki1sTqbsk+B4WPyYXtwIuLbBOBTldch7yEWkdOrxF6EddLoNLc1SseFbg4lPFSQWZn87bOZMkkLuJHCtKPBfImzNmv/Qe0yBbo42hrDf9SJslKTQ4uLOT+nG1w5GF44g/iOHZ77QWED/B32TjjHAbfhoHU3Co/qdXe/YBAB6YJZhmquvtuN6+GxiXhNYIeoYZAGkQ6SgDYXOTKg5wO61dKYNYDlldrns/XBq6DKaS+WxE1l33Wv9V9MYbaU4SJKT4JlmavgjZYLjhbjSpCzbrMbMmtikBm95XPA+V8vNHKG+luUm+K6jB8Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hl1MuahbjbFTr2s7hsBEP96VpdGkgMruRKrjtf18cZM=;
 b=iGTi3m/UQAvr+ybpNBPhpOBsGjfLJPlrKh0AUQKZFNjkc6I0Puq7LWYKqCD6GLOYXC3be2qYMfCUXe1s/LsBBup2azjhgDh6q4+Gf00F/LLG4nhUkQei3Euoh9e3uAKtk/SctLamRYtENHK6KIG899UMQ8h+0xzSZSjUveEQHrdBRoiZdk77jXFs4YJYLCYrQXT05NxckawKI72tiNkAijtVbQUucF874V4vKmTM5FWMF1i+1w3ePmbSAj/9FcyYnmR8lCfc1Os6VwxdTUxhIg7PkQvxCDWmhdfbCtk7/gr4uewWhWre/HKvIW/omdtv+bnVyWIXjhCsmdpqSicD5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by IA3PR11MB8919.namprd11.prod.outlook.com (2603:10b6:208:576::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 14:37:21 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 14:37:20 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 0/4] Add PCI configuration tests for SR-IOV VFs
Date: Mon, 21 Sep 2026 16:37:03 +0200
Message-ID: <20260921143707.2117970-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIXP296CA0036.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:36e::18) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|IA3PR11MB8919:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eeb024b-e8c9-41fb-3432-08df17edd7ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|10067099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: km+dBkGtIxmFZYViudrqogfof+1TTx2qL99+8r8oPPtmdBD4gANkBga0bVOkGvY/tXx1gMaGmNHydP5ujxLs6VMasmh1BvqZwy+ixRQVpo49kV495lkHRPIDDFcrXEI2R/vmyDOw6GpqNk6fdYUkgfg/uvnYC89BsEi9TRVLv7vhfh8T6t53ydn7zWD8Z03s26Wd0+t0qJu9JM2ohzdQ3jpqql/JIXY52wDWTND+r8paiCEV93F/wTaXX/TJzJLU4DOQAJJcuLJq2seITLX1lFS3uOfzSvjk0VHw9FwOKPFvRKiD9XJkQnF4wdv/s/2lupo3qAeRGFHVgdDfgO8UCvKVByzpcYyso5t4O9+rvG+ksvGXMdYs+Z0bcER/euEMv7NJW43uFxYIST+0wtvB8Bu8bWBehCDqYylpRninakAKNll5PkRe55XqeHtDMCTjmhYcnqo8myQlCbU/1MJZOavEggENehm39EOIJg/SMRzq3Qxj/2oFRFaBDqi6Z3xHb1lXR3KUDtV0RPbdGzvXw9g9eSA0HJz1ABgj4huR5q9wgUzDTlAjtK/G+lyKcnnjbBSA6yZTpe/Trtg958QT+8f3DBgdoYz3t+vWNCgiiyYcJL7aDLQm9Y0FyC/npbxaNpMm7O/19A86x7es+1/vQPIN9i/Qd0NkqJazHLkgII8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUczd2NrRkRTeHI5eS8vUTcwU050Nk9Eb1A2eUloRzQvSWVPYU9HMzdFSVZD?=
 =?utf-8?B?WkNPV2RMaEZyalMvOERFVDdOUFVBanMzT1U5NWVzd2cwc3NOcStIelROVG5B?=
 =?utf-8?B?MXg5SEd4bG9BczZkSHhVVWVWWjBaT0cwUnN5ci9rMXRza1hkMDJqUlI3aEt2?=
 =?utf-8?B?R0tHWjVob0ZHZndEb29veWZDNHlOc05ralpjeXRsaHBqTGYxZzZJWWRzNjRr?=
 =?utf-8?B?aE1YT0k0TS9XMVRUTmRYV3o1NlVBU0JQMy9vU0dhRDMzcTdoc2pxb0ZqbUVX?=
 =?utf-8?B?S2sxanNxSTc0clRYZFgwVUlqdGRDUDNWTEROb080YWFFdW0rRkNrc0c5R3dG?=
 =?utf-8?B?M1cyb3VIaFlwcXN0SStZS1dxMDlHeklTWlV5elIwdGs2RGE1YWgyRnd3UXVm?=
 =?utf-8?B?akFzZStuNkZxWWdZMFQ4UHRNbGRDWDdqeVNFcGxiQ1ZLK0VoR2EvU0luZmxk?=
 =?utf-8?B?MjZEd1N0ek5mNStiK3MwQlpKMjlFZU1YaTZGV3RWejNXZHdzMXd0bTdHRjQw?=
 =?utf-8?B?SW92Z1FjM2ZLdlNtWkRxWFVQS1RWaTdyc0dBaU5BTElUS1RlSTNDYXA1NUxG?=
 =?utf-8?B?WmlvTFpZdFpQQy9yd1hJMlFPcnJrVWplcUtCK2cvdFBCZGpxK2swcUlXL2VE?=
 =?utf-8?B?RmRxNUZZYUpXZjB1SGNlZy9qYmJZT09vN3RQOEt3VkpCL2ViQmk0MFYwcnRV?=
 =?utf-8?B?OWwrSFpUMHVvK1ZiM3JMb0dHTnc5RzRhSkdzMzZCRjdKUkpyeG1JYlhqTnhQ?=
 =?utf-8?B?T29VTldUOUFZNGt2a3dKUlVLbDUwQ0NyZCtreFRBYmZ3a0VWOHVlQ0Z3WEwz?=
 =?utf-8?B?RVlieWUyVHFNbmhGRUJOeDdwMGNyeFRBOTlMZldLRU9hV3Q1TmRpYnhGMW9S?=
 =?utf-8?B?QThPVjZVSCtxVENhenJBVEZrN2twdkNuUmNpM2xXRzdMSExJaFppNUpPM2tB?=
 =?utf-8?B?VlFCYUJMa0ZJekxIbEFSMXNpY0JVMS9HZm45cFJocmh5eHYzdVk2eWZSaWZr?=
 =?utf-8?B?WkJ6enlWS01ndzhiem43cWhLdGJObk51Q0FvZVVsS2NNVE00N1RVQ0p2bE1u?=
 =?utf-8?B?cVBveHJROXRkQk41QUxOYU83eXc1V3VRb2ViVFVuSGNYZm9WYm5mTDhxRERl?=
 =?utf-8?B?aUZGcnNDNURvZ0NyMGI3Tk5mLzdCcERpVzhOSVhTMDJaTStoMUxuUDR0YUVh?=
 =?utf-8?B?dFZRck1FRHJGaVFhNDdqZ09pQ3ZWUjVLTXMyMm9zQk16TWdrRSt0OXc5SzZ4?=
 =?utf-8?B?ZHZTc1pGSVlRTURoaldoTXE5UjhGRUsvdTBnb29CdDk3L2puejQ4ZkMybDNG?=
 =?utf-8?B?ZEVLUTNxSkJjZVJJS1dwS0EyNkxPN203Nkl6QU4vWWZnVE5UenIvejFaaFJi?=
 =?utf-8?B?TjI2YVNpS2w5VFExOUJRTWlsQWovRnFveEZpM05xVHFyL2FEQStWTTJaQm1u?=
 =?utf-8?B?aHdxTzRkNWZsMVhjYXh5V3VFNHprTk1iQnpveUhoMXdvZVhITWtSZlJmL09C?=
 =?utf-8?B?ZFJaQnlENGt1eno4R05tb3hkelJQUjhISmdyTERLS21OWXlOVkdiZEs5MThy?=
 =?utf-8?B?RG1kejJKWEtGNzlKbFlOSWl6RStxeWtUd0lIN0dOV0MwWW81VVBtUkZ5RVg1?=
 =?utf-8?B?WHBaV09pUXBwYlJrNXM3eFV3MFkzbDREUTBRMmUvU1p1VHBpcXFOOUN4RmlG?=
 =?utf-8?B?TkpyNXZDcXFaSFUzSUdyK0YxbTIzMmpNalk3dXRrcEZYR1lnY0NUNzlhbkxQ?=
 =?utf-8?B?WVc1QnAvRnZpL0dmYUQ5MWlxcWUzcnJwajFSZ0RudkNYekhLc1pPWDNrV1pp?=
 =?utf-8?B?SEplL0laMGVQNXd0VzhmRm1oMkNrN256WHhva3gyeTlIK3B0TEJXOTRHVVM2?=
 =?utf-8?B?dW04U0JCUk9SMDdYYnN1V0ZrSjZDY3djS0VRbGhETDFhdHFaNWpJUjUra3Bl?=
 =?utf-8?B?NUxkOXArdk43L3NZVkgwcHZzdEgyNWh3OElWWGxxb1o0ME5sbGlBSVZkZE1K?=
 =?utf-8?B?R1RuZmlkSHdzZWlhc2h4K1ExR0ZpYlpnWUk1VWxJMklVcVRnUzV2Sk9KZVRL?=
 =?utf-8?B?MmNDZVpWM2ZqQ1dBVHV0a016OXlXMmV1Zy9BV3BJb3hPM01ORXIvbXFtb1BO?=
 =?utf-8?B?c3o5UGR4WlBORmU3TUdKVUdoTmExVHhIK09SNFA0eGsvQU1tMFJMMW9qTTVw?=
 =?utf-8?B?NnlqSkQzanJSZzZvNDdiRExKdFM4RDgwMWVSeXB3cUFKQWZ6ekhiQXJrZ1NJ?=
 =?utf-8?B?M0NPYVBNazRIQlJSbEIrWGRVWE9IY2V6bHBTazRKUS9KbEFuL24zSkFobmhW?=
 =?utf-8?B?azB4Ulh6enVLWE50NnlmVm9HZ3hFbWRGbTVXWlB0K0pkZVNRUXgyVDA3czhG?=
 =?utf-8?Q?dzgTFz5K00Upulyw=3D?=
X-Exchange-RoutingPolicyChecked: XIKI7M1s2yWyl7NZ4Cdu+or2m6sMVcFIYmxmlloD0oyjQFubXTSxpWovzAcowJdsM4UrdKuEvNreiH3UmPeEv13ECiFStf2k+Mwy7FR+Dj9CJ//w4n8e5l8XiGJbdSVhL2Cl/WAFngOSblV62C7YDp+Sgf7z60Bs67Rh3xYHtQzDRpWr4YWYWUUUlC05ycBrsZBOHGHDrW7Qa/TdYyW8+Y0VlnWSrqAYPsedgE32xjRPFQuu4zrRgqPRcc678tPBUYjXf5tS50FYuSazwZg4f49pVJbT/3YdnFs7hiXCAh+kZgfRYfbXSYfcNsLpvmjSGi9QqkxY2lXWj3utWyKySg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eeb024b-e8c9-41fb-3432-08df17edd7ec
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 14:37:20.8550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7deM+5Jfn40npfgDEgNbIcaC6lf2f0ZvSGEEUDSqI2gZjLedqDwrRE9wgGqA1itetaEEVZvE1wXPnGyGLC4z085c+W/OhBhhoIdNshPf7xA=
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

This series introduces PCI configuration space tests for SR-IOV Virtual Functions.
It verifies the required values and read-only fields in the common PCI header, BARs,
PCI Express capabilities, and optional Power Management, AER, and ATS capabilities.
The series also adds the PCI helpers needed to read raw configuration space and find
standard and extended capabilities.

v1 -> v2:
- Dropped the unused find_pci_ext_cap_offset() helper.
- Registered sriov_pci_config in tests/meson.build.
- Enabled the VF and read its configuration space once in the fixture
  instead of repeating the setup for every subtest.
- Restored the driver autoprobe state and disabled the VF in the final
  fixture.
- Removed redundant informational messages.
- Simplified subtest descriptions while retaining detailed documentation.
- Corrected PCI register macro names for compatibility with pci_regs.h.
- Improved malformed conventional and extended capability chain handling.
- Added unit tests for valid, invalid, cyclic, and boundary capability
  chains.
- Added sriov_pci_config to the Xe CI blocklist as a separate patch,
  since it is intended for HW verification rather than recurring CI runs.

Piotr Piórkowski (4):
  lib/igt_pci: Add raw configuration space helpers
  tests/sriov_pci_config: Add VF core config checks
  tests/sriov_pci_config: Add optional capability checks
  intel-ci: Block igt@sriov_pci_config.*

 lib/igt_pci.c                   |  90 +++++++++
 lib/igt_pci.h                   |   8 +-
 lib/tests/igt_pci.c             |  66 +++++++
 lib/tests/meson.build           |   1 +
 tests/intel-ci/xe.blocklist.txt |   1 +
 tests/meson.build               |   1 +
 tests/sriov_pci_config.c        | 320 ++++++++++++++++++++++++++++++++
 7 files changed, 486 insertions(+), 1 deletion(-)
 create mode 100644 lib/tests/igt_pci.c
 create mode 100644 tests/sriov_pci_config.c

-- 
2.34.1

