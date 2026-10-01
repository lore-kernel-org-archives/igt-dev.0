Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B81CA5FB3
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 11:14:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4947810E029;
	Thu,  1 Oct 2026 11:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IayzXDO1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B3410E21A
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 11:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790853241; x=1822389241;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=t0UZNj5R2kUSCaCxmgG2EAjPZL8oZcmkbY1sdcWrFWQ=;
 b=IayzXDO199PF9GkuBndTyQvSiUGqdffcTgpEUZCy9PO58fbWrQi9NvQF
 Pw7eTnF1I+PztCZdS9zKt8zcfC/Bq3R1Y5GATZtYdN1T3m4R9hy2kowOx
 A0f3ThKaTM2EQCiVTZ1bR9pTDn9k6Be6YEbMFG9Vco10Wi+e8uwO6smVZ
 Dzg8TbObZGchZ139ZKOhYj/prI3sd+0ajPELyly8RxUSDrYnH5VvRO5Or
 7GEjH3V5JF6gzwaEVoLjmUfGqeeJSGjHTS2r7cIC0DD8x63kryZ0gnHqJ
 o7fQ9G5u8cVD4jO55OAF4NKYZw8TNKFy83YRCYLd1iS1mXohWjglcbFXJ Q==;
X-CSE-ConnectionGUID: 1V+LgeQBQSKZmYEXKqlPHA==
X-CSE-MsgGUID: pmfGYSr8T4yT5NHDhkBA2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="102278769"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="102278769"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:14:01 -0700
X-CSE-ConnectionGUID: wR84XWkdR1WPDK2gZj1QwQ==
X-CSE-MsgGUID: JxC+APgiTsK06F5Eb2qg7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="302211358"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:14:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:14:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 04:14:01 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:14:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xpAv62Sem05Y2vmp7T5RWGMJlfu0w34N3XTD35LTaVxND2y5RPPfPjaOxkV8Dv4DYE/OIhtHohJWDabOnxduKPLBn+XdQNhVB1lFL6h2d+OynvSBKi7B1hS3EJcH91iOZ335oCdiUrl/Huc70NEij+mVOsMHnOKvAlU3VftUXvQoH67GyzpuUXV3xw/lB5bsTkBjD/c30AB/X6W/ITg0DUTLqzacvgIy5brU5vksqn4aFXXvref7Rw4m1Tk/Wf+vpJdQiA/8Z2Qk0mZTj3xwrzJSOsSjduBeNzuS/izSCISyt6FooA34ygPB+IgY6B5v75WKogOtf90EUB0vcOlpaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ruJ4H7S1UdGiu7gJt1jWcIB9Y6ppr+FSxfngKxiz/IE=;
 b=hXeo2+CZoCsDh4n3UiaAPu9fD5qOsMY2FJswMIK9GUiEQZh9mtBGghyKnTH1K8GmEOAUKc+HNlBZStk14vEJRCGTcy8Jrgvmk7gTnieQuJ17UTjpIaEfb106ii2fKwfdS9wniF+gxwGW5oIasGNQBmMA5tPZ6PpDY+aPCYmjQrchxdH7UR3HcLsHJGCyxOvaNKCUYobysHFx7pBnS6rzazJH+XDP5oVXwmeT6isr8yNjgjQrCPsHA4ej3gRG52qjeJK/M+Ijlejn7QAn2tjF6PQG7kP3r7xHF0/77ul1ApUVnzbxYhCOPJUhn2l80mXIz8r/4BFTuIwedULsPjeNNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by SJ2PR11MB8588.namprd11.prod.outlook.com (2603:10b6:a03:56c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 11:13:58 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 11:13:57 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v2 0/8] tools/gputop: add i915 PMU engine monitoring
Date: Thu, 1 Oct 2026 13:13:53 +0200
Message-ID: <cover.1790853076.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To SN7PR11MB6897.namprd11.prod.outlook.com
 (2603:10b6:806:2a5::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|SJ2PR11MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: 398e7392-98ec-4f05-7563-08df1fad15e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|10067099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: v9RGSQAeWTBy8Z4hrKYU3ATnwcwgjIy70WJ/paRfdlCkNtDDCr5t9C1/tO6bwMpnfnqTrLOOh07WbSzGk6L3ZWWwWLpzrqqIbyX1NB9layq/Y97uH/dFp2JhHiF7Xnzes7/kvtaQRwPvz3qIIYtyKC10YzKONWxH/JdUb2C4frgoZYYjYHMTIhGaZIgaxeiF/4urocVxCL/iqcDImCi08JdhAT4RpCFaSf0QLxOizu3xelOTXMD8nT4IFu0F7Jklds9+5xW2nzJeJkSXU615v3AW2WQm1VlRLuWcG8uLM3Lo4pst/9BMlOlpDqDwSZkOs7AljPGNqhj08HRrA6JdYc1foFWGPMw6rC5JlC3pxBeqGRvHav4zFMR3z4Bvg0B5f+Ec9UPEMh9pB4BS9b8HdMkW96dx4d5ujqSokaqoDgQXIahRiikIqSdjn7OYm4Cz5dn/t3gNHJs14O5xbeoO2SXgE+qttpUs768UbIjpNkYJodBOLo0tkmZcFaYAGwig+f/sTIBr3UijeOIdu/lznShk6wxVm3IdJbo65bS1V+rmGpT2AATeYcKumdOkaSGmFxUau+1L3er22yFWrMWI5wk8bV8iRgmJCCO+V1pYdkoQG8SW7v9KNK4HuMueZN5n0RKrFiAJ83YFx0ZtXsAQlvL7NTcH6SUxtPTWszXpFVs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8hOv15t2L0nfmHJfw5G71m3KbKQOT741ZFxEobk/IJtuF9aOubn18iCSebN5?=
 =?us-ascii?Q?qm0oTkJ6MVv4iVA4jdxPewB0OlsVkmghC7jj52ELuy02YKz7CBxolEob9/Xg?=
 =?us-ascii?Q?fxflIYQMLXpY/fO825Xned53S2itABHcl/Md939C9j+ujhcQegDXPH/HQRPA?=
 =?us-ascii?Q?g2YvjuXSULVBNOELYQ49Jh42zplQgPQjcxYROLxHeAYz7B3Hr3XNjolzgUEi?=
 =?us-ascii?Q?ETf8dpODVwrbRKry2XnX7mYSww6dIZI9oVSO05MRc7siAwKWR25O7Oe95k96?=
 =?us-ascii?Q?O/1/nvFeaEV/NqrBgA/Aa/sX/hVEJD6RwMggGQJWsjIZa1t7KCam8Cmo6rve?=
 =?us-ascii?Q?dH7nuCUxk3WcWo5J2AI7Y3SVYPPq0T3BZceU7X+gurYf6LGMLk6b670P+f20?=
 =?us-ascii?Q?Vf1EHfSSZpliM1uC0XykhGpRS39PeZU49Jo9UAIjviyNkSVs948hMAL7KPAv?=
 =?us-ascii?Q?53Nee+pYSi/71NBZDxuBRb17oySAM0Wny/6KC/pWxiorMe9YP2ntphgk7JhD?=
 =?us-ascii?Q?f0J1OrgiyyAj3kTNrWXClLy3h9ZgKqxN6pkGiPH5DsYgNsvv2Tf88RmOsu3w?=
 =?us-ascii?Q?yTKDlJ/XdKAXxf+TMJcLZwDg8VUlCQhP4f4/cA25PSMp8K0wtsMmxerYanKx?=
 =?us-ascii?Q?pcFcVM5I7kzu8q/VlMLIRAHzArLCqB5P9sT2iGExm3GCdD4yVqvxScDSAHTF?=
 =?us-ascii?Q?/g2EYQxsBtMPVoWf2rKhcocaWZl8WCSPo73+vdc0g7I1r4KqyiSv1alQLcpO?=
 =?us-ascii?Q?Xg0PgoiqhsKTAHaRSaLS87UcHe4DYlF0xZQP1SsuI91XUDW1gGMu/Z9UsRFs?=
 =?us-ascii?Q?OCPSCLD3KuJkY4LG94Uq0JU2Q20jq1p0pUDPUNDiALKo3xXlAic6pptDfcp2?=
 =?us-ascii?Q?MXbTpdDcbOy0z66oZhtIzQYt+5WM9od2oKCitpps+55UiCLpNIHnKBlhqbCE?=
 =?us-ascii?Q?ZJtwsvDSg9kty7t2tzZng/QAzyeC9eI6SZ628vNtCcsR2fPuHQ9WPs5rT2r4?=
 =?us-ascii?Q?HEoHQz/MnZTLsV5inuSTuqVw6k4Qmoig2mawbGb1uxBuM3X/QdpRqcRIFapN?=
 =?us-ascii?Q?BkA+xwI62KXsLUs8Zi+vyvAxJItrOEk4o7h1e2Ae5Af93jJyUvNKjBGvhLAe?=
 =?us-ascii?Q?xJuKWPHgBPiF7k5OpYC0Tmg6Wxm9VUI1yped8hsGuAAsBMiZ+UcHcjkBeZGP?=
 =?us-ascii?Q?P+7xuEL2vuKvASsP74NLVW9zRfivO4C1j6YkSSAKsmJIGfo3NrpoTX+ozSlu?=
 =?us-ascii?Q?SxVlazFmTtF9WjZMw9nlFVpBXPd+NSpK5PbJBGDw4XZtTTIHnYHgnBZC2ib2?=
 =?us-ascii?Q?2/fNAlm0nb7k71YlT1Oa2l2bju015wMjtWYcM3ZiaYgZ3hpxZFeMPFSDp1L9?=
 =?us-ascii?Q?LDCUQ4G/rQOepJQyP+nMuJh2nZQ7K8QppDUsqAtE3Mo5/WIIRWrS0nG4kw8D?=
 =?us-ascii?Q?BJbmNUTj/rYkF8rq41qSLmdNrhLO+79w3d8xYzYdFSDwudrGehXE5KvmYju/?=
 =?us-ascii?Q?TjzDWmBwE0XFpWeRw8PW6oHu/nn66E/ec5sMRXFkwZxOtiz4xL6BuJcMou1i?=
 =?us-ascii?Q?lXhg/1CArkndXGPSDLWTzWETkMrmBVlSuxa7xTEuAm++Zmm9jpE7sAlhkdFC?=
 =?us-ascii?Q?Uz09VPlMmY0iyxXl2YdCUSHTzWBw2O/Ptki2hzbw6PX3+9bGumMf3N3tXxRN?=
 =?us-ascii?Q?IE/okmwd40q/7I5jGmqva+2LM8Hmj50sE7zA1/L0fZy7yz3EtPuvs5pE8c+E?=
 =?us-ascii?Q?vSpTG2sh42UymSgrdny/j4oNoxCY6sg=3D?=
X-Exchange-RoutingPolicyChecked: aTZr2Lrg/HOqvZxciAqoJmVOs7dRsfLE33vATSj66eT/536oV+UTe9IPZSYKcAgH22A7HmEcNK5ujIGIMJO/sQoKVfc0UOrxRiCv0rTf6VrBQrGcjQ1uJA7TzouFAT//AVZ9T/VW4JIX5034BxCPL1Y+FqUSBnIEcILFcH//tfkAPAfS95XtlxuHmSaclBzKZM6AiiBFf329YrkcPcwzSCokEGJgpqfHEbwuzzFnb01jP9rwHu26iyw4pQQjsriMHEEzgBHmTzANPKNapXZc/b6Us8cqumEO0MxpmHbiX/dtz2n+22Jw6C0Odb5NSZ/CS3r5MhhftG9X/dPbNxbIVw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 398e7392-98ec-4f05-7563-08df1fad15e4
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 11:13:57.8247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7BhaP7pSYvBD820Q709MumDzN8N6nBUwtA6P/MP+cnHYfRxwB2MX6BmM7+P0C+bSNXmOhvo6n3mBE3BC5ws7hZzdUpds3AVXdgP/L0c1QSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8588
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

This series fixes the existing (currently disabled/broken) xe PMU
backend for gputop, adds an equivalent i915 PMU backend, and wires
both into the main gputop display loop so that per-engine busyness
is shown for whichever Intel GPU driver is bound. It also adds
tools_test subtests covering engine discovery, graceful handling of
denied PMU access, and PMU sampling correctness.

v2:
  - pmu_read_multi() stays void for xe: its percentage calculation
    doesn't need the time value, unlike i915.
  - Simplified the commit message.
  - gputop_no_crash_unprivileged now uses igt_system_quiet() instead
    of igt_system_cmd()

Sebastian Brzezinka (8):
  tools/gputop/xe_gputop: fix struct layout and PMU read
  tools/gputop/xe_gputop: fix missing igt_aux.h include for clamp()
  tools/gputop/xe_gputop: fix return logic, cleanup and div by zero bugs
  tools/gputop/i915_gputop: add i915 PMU engine monitoring
  tools/meson: build gputop PMU backends as part of gputop
  tools/gputop/utils: guard ANSI macros against redefinition
  tools/gputop: integrate i915 and xe PMU engine monitoring
  tests/tools_test: add gputop PMU engine monitoring subtests

 tests/tools_test.c         |  77 ++++++
 tools/gputop.c             | 222 ++++++++++++-----
 tools/gputop/i915_gputop.c | 474 +++++++++++++++++++++++++++++++++++++
 tools/gputop/i915_gputop.h |  56 +++++
 tools/gputop/utils.h       |   4 +
 tools/gputop/xe_gputop.c   |  48 +++-
 tools/gputop/xe_gputop.h   |   2 +-
 tools/meson.build          |  11 +-
 8 files changed, 820 insertions(+), 74 deletions(-)
 create mode 100644 tools/gputop/i915_gputop.c
 create mode 100644 tools/gputop/i915_gputop.h

-- 
2.55.0

