Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11210C54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:09:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62AA10E64E;
	Wed, 29 Jul 2026 11:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nukvjbYq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCBD10E793
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785322986; x=1816858986;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jSgYsNNE5r7IXbdKLRWSNLbt1p0LQllXy8gW/UNPqz4=;
 b=nukvjbYq1zVk9oT8DwNtSEQuXxdiR+ax6EXnzBhuLAmwsXKTgxG3v2LF
 OOkh3QbkFregAtdlbFWiuDfjpy7QtC4mcymE4vzO/dziZizZ1JFLfancn
 /hqFmwUzylY/M6ghYUefqTiD9yEXJWVHZox3IU1dhMRAZHRbl+ROKO2f0
 H1CSzip2OhRpkBgJbvtfkVKyiYQPdsJNU0Ez4wzuIQ4eeqzIxHvIabq5G
 19lc6EAmRo2q6SIK/Ey3x4mwnmkRNWFj9z/P90toly4jpBXj+DBI6udNU
 aNO9Ah1PWdtEnirXmoSCXQF7wGdgSGc1mhRne/4w33h+Za1c3wh9LGfle g==;
X-CSE-ConnectionGUID: E+Gy246eRGScky67A+FnBA==
X-CSE-MsgGUID: oMRXiT+aTo6F2wktlttPVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89743469"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="89743469"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:06 -0700
X-CSE-ConnectionGUID: /qqmZ6U1QNauUMRZCV1TyQ==
X-CSE-MsgGUID: m5FKTI3fR1O4Fa3guEtGew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="256652584"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:06 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:05 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:03:05 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.61) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U0u6c/osbi232XX1QDM4Rdbr6yprIc44apN6kRRNdeP1fsB7kjLPpWcU+7klv4fwRkAXyJTIZhChd7cFAqoksXreJh0kbh2Z0nkudn5+jIx4YT97F7tnJ64loEiz8d6t6vMer5H9ALXAK0nbe+N4zed2dXeLIt520cqcr3H/vFbke6TLRGX/dTIc49TZbXBiXYi2ygGzmerrGraGkDQTQLREjISCONKn3Ofcq9irkXWHSwkAQ4zUIUOVYFVHxSmYdlycLzryhDnonzmRgM9LBs1Zl8VWAh8JiU0KM3LJ3Zm8n+uK1NX/O0XdLxhHBIvRUCiaAMg8h8h6uKYI0UTGrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8v1NsGDoJ1NyzQjDlCes2BpQezyQgFitEwU0E+2+4Mc=;
 b=Q1+94Saz0pAjzuFaBTQDASFxnZPtvlbDBSK5CHae2KwGBV8CVZHUwvjXid43LGBL5bABcoUnFs4KTaB8WV9FOXqtbd0k5oSEzA74hNRToGoyBgS6b2QGcRq8ALL0t03iqOX46NqQWpgGgfDrLmPzyi/Qp5xvwOUmcBHoiv40kgofQioQRxAhmbxrjdPxKE5d/HdjfeGkkuU8aHMvUIh151Raf6mMkdionjPgQQylgcr3IRN/BCI4etqWeTY3GWiXPiXvVFez0ZMRX26l3nc4qsN2PjqGMRWZLJJ3U863QV3zscRRtdjKO6WZyi2zWl34UwhAC4sJHNPxIKFNF4AAqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS7PR11MB6246.namprd11.prod.outlook.com (2603:10b6:8:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:02:57 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:02:57 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 06/31] lib/igt_drm_stub: introduce for tools
 needing driver detection
Date: Wed, 29 Jul 2026 13:03:23 +0200
Message-ID: <6167a19ae32bdab2fd964433f22967470ea55eae.1785152675.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1785152675.git.sebastian.brzezinka@intel.com>
References: <cover.1785152675.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB8P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::21) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DS7PR11MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: c35d0832-61db-49c2-f6b7-08deed60f241
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|3023799007|10067099003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 6zARqdmdZvlFdxNiIsOre7hzgDsa9kz4/GjQ3ZYpWXP4EpQMmRcgUw0pAkPJmQLyowUjOumO2HAccBrrTQkjmHAynxEPNpAJCIEaRdOFPu3Z1vA2Fsk1hUHreZLjoaFBNgH0Zdc54+Eih7P310oamFpZ+tJ3UffX7IxU2IHIqKcAHmra1D9fM4PpWypKuYYxVmMAyqpQ05hl3pcFvJpf1yWJqVLGwxqMLXLk2mEiG2gVxfjlgt44gOTqaw0CBPH5SsQynMMdyMrPYmunMjFeOsds2TKjx+gHW2DJU8Kv7rsMD9RjsSPzRcIyZptk5oYG+jqCx74gRF+0a0Io8B+nAKSRm1qpDGupXC1nmFqcFsVP8tRmzhVi6MNgRu628+Dgn75Ds7sUrNDvI7kTXz4fRjJgUaiVeWokV0VqeV4742EDjFldti+SWqUTHuC4jXhX5tkOGFJN08J/D4Ylv3PbPTi5qWQbVesX69JoocEI+WnWt5FqAMahGnPyRIGNRdegplPfejmkTekMPQad4qPBQVIExWcer4V3ixP3oZvyIf0hkKz9V/XeSh4ef5Jq2BO1T1r7bzP4Le1gTI4Zb5zeNH2AzUz1sQ3E7Ops2bXB/JVsN5BWggphr+1yJA47wMUueosTiLrEkQjIp1ktPBDoPUrsNiVGZf8mFqB9CXoZ0b0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(3023799007)(10067099003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUVMZWZVOHYxNzA4NjI1NW1nZWhGQmV1RkVxMGJYVGczQ0dlL3N5UGVuV3pv?=
 =?utf-8?B?U2hXRTFlQ1g4M0lNY0pleU1GMjlDd1k1akZGT24wV1UrNXdjSldwNTM3eWxx?=
 =?utf-8?B?WStIY25yNHMvdldHWVRXVU9CVEVtdENHS0JyQXd5djgrS1NmWUM1bXlLZHpW?=
 =?utf-8?B?N0RGL25EczRMMnoxSm1QYXNLNG9uQTNrekloeTJFbG5qdk5nK1NwZHpoVytt?=
 =?utf-8?B?MVkzbTR0b1VJeVZBZ2tOTWVKdWxMckJkaWhaVGw0eDNjeGF4V1JxN283NGdO?=
 =?utf-8?B?bkJJLzUrSWwxOTZzR1RIZmhpempUclRHeFZ0TSttckhvSUk4VXZ0S2RLMVJO?=
 =?utf-8?B?VGJhVndZeW5sQVlCVVlqVFhqV3kzZVlLaFl2TDFhOEdyZC9LZ2ZCcGJRSUF3?=
 =?utf-8?B?VjFIWFQ3QTV5aVFmVHk4WTduVzBtdWh6b3FFQTV3UEhvM1ZnNHNoMW1QQmVE?=
 =?utf-8?B?aWxsZnlmMTNFdFc5Snh2U2RjemdERmt3bHAzUlRjblI4Wm5zN2FlL3RvNkZu?=
 =?utf-8?B?NHZJbzE3cXZ2RVN5R1FLUkVtaVlPQmVqSXNJZTI1cE1aY21wc0IxVm5sQ3lZ?=
 =?utf-8?B?TnkwQ2tLTTRERzBOdk9FZHNyK29ScFVRdVRYRE1KamlHWUJnRll6SHEzTDh6?=
 =?utf-8?B?TVg5bWVHZ3hnNEFVSjQ4WTh5dnFuSWR5NVhlam11M0tlRitEL0s1NWQ5YmEv?=
 =?utf-8?B?MEozODNDUll0cnUvMk1BUmc2NVBMbXRlRTllaFBaQWJDOGZ2dWxSNGNoWDhD?=
 =?utf-8?B?QlJlL3BCajRzUWZCK3NZSVVaWEpCcXF6MWNCREJ6VUdZeUdna0VJZmwzeVdO?=
 =?utf-8?B?TE1iZythMVhYbHpzUHdOUmpZUFphOWxFODJxcEN0WjFyaGJxcFF1Y0FlZHJN?=
 =?utf-8?B?ODc0T1dydmdzaG52VldSeGU2cEJybDAxd2VTRGdKR0hCY0IvTStwbExzdVhs?=
 =?utf-8?B?SVByeTh3Q1RRSVJsWEFoc0pKZStXY0d3cGpyVjRjNFA1TEwwMXlDeUkrbkxh?=
 =?utf-8?B?bG5WQnZxNmx0TDUvUmVPU3BKOXdoYTkyZEdDcS9JN0FVeDVyeTBpa0RXcVp4?=
 =?utf-8?B?UzkvTVJiQlFmZC9IOUxrL1RmWUtLQVRBVUplejQyS2VBVmMxSzRleDE0S21s?=
 =?utf-8?B?VGVPTVVhY0MweUJ2Szhsb2FYQ2IzNTRFcHl4S0owdzliM0J5dVhnRXJ3WnB5?=
 =?utf-8?B?TlBiSXhUeG1FSTVCckMxcHFEeUFoTTJSQ2FkZHhhNExXQm5KWU1kM1lGS25L?=
 =?utf-8?B?Q015Qk9lbzVvd2p4QWpOQTd1ZVQ0MXlTbDFwUVdmelo0VkMyRk9SSDdkeGpB?=
 =?utf-8?B?N0pjSmpFWXRBUG5ldlF0cFBqZGFDbCs2NjFFMFdOYk1HdDkwUHVtVHV5UUdD?=
 =?utf-8?B?T2N2ZkRvdlcvM2wvOVlBL2FsSlBKVnhudlNPMzY3L29TUzBwZnFKR1lDOEo1?=
 =?utf-8?B?dTdlaStMakdqVXFuSC9FaWxvWVpIc0poQ1pHMlZNeFR5SjhDMTAvS3Y1dGk3?=
 =?utf-8?B?cVZ2N2k1a1FsNEVENEJvVjZGM0VXanozMlNOcGhZc01CVStzNG9VR1p2SEVt?=
 =?utf-8?B?RmNwdVRWbFBCNUlHZWxBNko5WGdLeisxMXNGTnl6K3VlWGFDY3JvckZoSEZy?=
 =?utf-8?B?ZWp4TWJMN21GSWk2ZE1PQ2hnWVdITU9DMHFVUnY3KzRNM2xSSVFyVmpJWFd6?=
 =?utf-8?B?MWJUdDBCakRac0s2bHBxTkNuSXlDb1R3QXVJNCtrZFlnMWRlZHBJYWFzMUVU?=
 =?utf-8?B?K0IwRFJMOVhIWm9rVVJwZzZ0b2NSZ1JhelhjMHVLc1VSTDZwV0tNV3hKckxO?=
 =?utf-8?B?Q3E2OFJDT3NoVTA5TzZ5WTJvWHlhSE8yRjVlU1NJcFUvdnFwRW82YkpjY3Fa?=
 =?utf-8?B?QTJ1VlVkNHBkZkNFNVp1TkZNeXF4VXR2M1htM1IrN1YzQ0ZTS2QxMmZaWGNm?=
 =?utf-8?B?cmZVZTRDejUxdkxOUnh6azVwekV2TnIrNk41R0wvYkRBekRZZlZyMUtXT3lL?=
 =?utf-8?B?Wkt2bmZ1aHhaK3dtdCtWS01UNW9wSWRPdTNtQk9mTkJ2cDVHVkd5RlZ3Z0hx?=
 =?utf-8?B?clgrczBENXJLZUVKTk1kajVMNk03VU45NDgvc3Z2ejlxRUs4TDA5cVZTT09X?=
 =?utf-8?B?enkyeVN5cjA1MTRLdmQ2Y1RmYTZGUlJDenBSdFJPZzR6cGc0OVJiMVVNanpx?=
 =?utf-8?B?NGFPTU53UTAxcTdZU2ZmajZPdmNFZHRnMG1xbWFidVNDNTNSQVQ4bjd6Rys0?=
 =?utf-8?B?V1JldENNeFEwaGtKZ1hsWEQ0T1lYU3EzeVpWaE1DVXlpRWVROVdWMTk1ZkRi?=
 =?utf-8?B?SWVLbXJPbjQyWm91NS9IS0NncWIxNHZIbk9SVHZiKzhuVDlhNU1scUg4NXUr?=
 =?utf-8?Q?0goTJVq0+2Tf2UTY=3D?=
X-Exchange-RoutingPolicyChecked: me3ax++5vO8aMcQ/p4EkXGbYVX4A6xsbt5+kJPMG3rbfcBxkQdsx4KVWaZGXYSYVXwhl39Najs9NEOeXYoFp8WMa31Txmv2da7qmZd0BlZwsE0fZB0Rk1qyf63frfd2EiBytF9/mQR0hRakNCsPDDmXDaMLfL462HcG8lvVFMeSA97QrjysFMnXq/1lRqrW4BpNpzH6UwODEUozH2yjOFl6cow5KTlkXccOMbSndTXTV9atR0srAb55Qq0Kir58nQG/IQhLJj+Pn9eLuqRjwvXsnfK0mFZvQmNwV+UQcgekznOsWn5+EgaLd2e4L8oPkEHiWATTp/1n/vs1cIzHr+A==
X-MS-Exchange-CrossTenant-Network-Message-Id: c35d0832-61db-49c2-f6b7-08deed60f241
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:02:57.1825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2IBzMyFDUrSynQxPo7IH4TpZjlbxZIi4s6AyNJ8BOCTC8JrpwR9LryzcBchcc7I0upPOzO0/RgWaIZDtYkrSqNamdi4HekDNVeeo4tyIIWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6246
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

Add drm/pciaccess-dependent stubs into a new igt_drm_stub.c.  This avoids
pulling libdrm into tools that only need dep-free logging and exit stubs.

The new lib_igt_drm_stub static sub-library provides: igt_pci_system_init,
is_i915_device, is_intel_device, xe_dev_id and __drm_open_driver.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 lib/igt_drm_stub.c | 125 +++++++++++++++++++++++++++++++++++++++++++++
 lib/meson.build    |   9 ++++
 2 files changed, 134 insertions(+)
 create mode 100644 lib/igt_drm_stub.c

diff --git a/lib/igt_drm_stub.c b/lib/igt_drm_stub.c
new file mode 100644
index 000000000..58395b329
--- /dev/null
+++ b/lib/igt_drm_stub.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/*
+ * Minimal DRM/PCI stubs for tools that need driver detection and device
+ * opening but do not link the full libigt.so. Requires libdrm and pciaccess.
+ *
+ * This reimplements a small subset of lib/drmtest.c (__drm_open_driver()),
+ * lib/igt_device.c (is_i915_device(), is_intel_device()) and
+ * lib/xe/xe_query.c (xe_dev_id()) so that tools can pull in just this
+ * static sub-library instead of the whole libigt.so stack.
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
+/*
+ * Forward declaration required: xe_dev_id() is declared in the (heavy)
+ * lib/xe/xe_query.h, which this file intentionally does not include. The
+ * declaration below keeps -Wmissing-prototypes happy for the definition
+ * that follows.
+ */
+uint16_t xe_dev_id(int fd);
+uint16_t xe_dev_id(int fd)
+{
+	return read_pci_device_id(fd);
+}
+
+/* Maximum /dev/dri/card<N> minor number probed by __drm_open_driver(). */
+#define IGT_DRM_STUB_MAX_CARDS 16
+
+int __drm_open_driver(int chipset)
+{
+	char path[PATH_MAX];
+	int fd;
+
+	for (int i = 0; i < IGT_DRM_STUB_MAX_CARDS; i++) {
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
index a57c1eb8d..484a912d7 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -356,6 +356,15 @@ lib_igt_tools_stub_build = static_library('igt_tools_stub',
 lib_igt_tools_stub = declare_dependency(link_with : lib_igt_tools_stub_build,
 					include_directories : inc)
 
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
 	libpci,
-- 
2.53.0

