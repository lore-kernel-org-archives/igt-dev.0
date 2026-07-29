Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7491CC53200
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1A910E82A;
	Wed, 29 Jul 2026 11:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDoYpB/s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B3210E4B4
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785323033; x=1816859033;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ErwDCCnwIW74kO4DLwxF5pjIE6JTL/TGQ0Ifq4XUa+I=;
 b=aDoYpB/sqCqjIOW24dofYbFeElIUaCARuj6vuzj04NrLirV0JDRzapRZ
 wQskR/XNGPnYpnZ/XsiV25X+mGHEmBXBAzs3cx9yEdREWKnnA+fQxh1NC
 mzZR3yCJqLNZWKWRfsPFDc0+QyFjeY4u0bHyWsMjykRff2WJMbbnPvkYo
 lZwBP84kfdiIDFKZWqUevzuAaMT1N0isVJrcpbVfSQrQEl2P9iELOImGJ
 2x/EWRFNmTFcp/AYy2xEO6XH8lzbN7RnKcLMyBNOvEGpdHR0mFvdl/q2w
 vcclqqQFY2LkNOjvjDWTYA1ZO+IeUexmkEmfCD4lp6GHdUNzviHcgFpTI A==;
X-CSE-ConnectionGUID: kya7ALq7TOqUFX7HI5qZWw==
X-CSE-MsgGUID: lpXFHTlHQUu7HAyNoypXWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108719029"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="108719029"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:52 -0700
X-CSE-ConnectionGUID: On2Q4A4cRXWu5u7GypYLcA==
X-CSE-MsgGUID: uyWaWwc7Qxa79gsYQeVz8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="258204823"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:03:51 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.26) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kBLu7JQK03sJnufgfRnS7M1RO+yZzjUhyOzC6zM3r8fZfJXf603pWu5Yu6MLeBMi4LkOTa0L3S1m6kudktkrz4+Za4Pgm6rpq3ewngsBPe7ELcSJsO49tCc1l84ahk+U6hqU8I7K/nSyQ25IzVurZeGXmM/srnM+NqACvEQwek91agEiAAsTNWYH0iIJC27oAwTZTV45nfB6RalNPiy3bE6PmWSi6ugDHfEzYsOf9T6+id2ytU4WsLaTi1yNUyqvGgN7FpI9EvTtR3++r6CIX8av0aw2EaxCahD2NeHQH0nljCui5yqFze2LdrRs0fDTbDbYx3dG+l6QQjLzNdpleg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ur7w35QIhR8JVpegYvFRnoSWGIRiHGdHOzpmutyAuQ=;
 b=jKkRtuolFXsJiwu8QmB51oF4VW0Hp8e+FNeAyVDQ3SRY6gK8Kg1f6/iubqygdneoSbbIr2ex4uDmsAADbUc9AZ+KaTkQeGOdXfIPwe4JeuFJ5K/oOEBCPc5r1REw4gf8yjkA02tneLCwmvgequ3q5SL1IyZKjfOR8vY5VPrNThaPnhZSOFgUv7SXhlPAL+QJyXy5l6H0hvJVVsxk8v6vbiVgnvN2hviWrDTz8hRKxVG6i8auKynWfAZPWhkLPh5sC0PcJQRZ7T1sPTtldGg4480GdYgBa1w3Sw7sGbz7xlU2apdnjUyJLJMyia8RUOVMmbvskSRgXq3gR+/qvNqRXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MN0PR11MB6302.namprd11.prod.outlook.com (2603:10b6:208:3c2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:03:49 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:03:49 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH RESEND i-g-t v4 30/31] lib/igt_core: move igt_load_igtrc to
 igt_rc
Date: Wed, 29 Jul 2026 13:03:47 +0200
Message-ID: <dc06fc3a7bbec6314046d0cc9f2294853beef539.1785152675.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|MN0PR11MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: f6ce800f-ec29-4949-02dd-08deed611147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|10067099003|6133799003|18002099003|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info: 06kYEyY+xnRyvOrJQ9c8ouigifTEVyCW3R/VkmveTtz4HzFIz7jUmhd2KxA9NgrjL8J+wVkq/pifDwbIwpONPJVn694g/J3Y90Ox5aQ7hQZ41q8h+URCO4t1ul5zgFBT1fzIyLty4KnZQfSZ/mfXCBMvMFHc2uD82trCakf87JQaqELBr5cCBb6ucyYL8qtGpkhONPLZYMFWAbgh5IyN+OM9K4+68Fuveeguow/AFVW4gWl7vGJ6EbpxVmkLKmokoxSoK+RpoGhBZXAd+pw2rsmF9KcsgoGrz6p3zKFa1IOTxTvav+ORR0X+phTALLZ2+0VODZvTtpAhlLCf4bjmnjJhHVf0BrAVMXZcTvgN9jHqrwjKFh3Xlcvc6B2urdU1hN1+aMx+5tYC1LnnBqq9cG6Tl3B2FLrWbglEp/p9oSDZ2BhMGvPnI73bEMEPvPBDmdiXRGOWP66YAS6cagGLBfCCDp707Ph+N222uQoJGDxW6hLsxL2Xzsmyo4GOked340OXk7fczHp0WQP5k9M7hoRywqWYU8yjGtsMGvw44LkkGCg0uIwU6nZIA309zB5QYrTvsBPEEBsb/ngKurWqOAynfPKxJUFQBwRvEkFBS0XXhmLbW+8Lwi0TLo3cganTTtAN++Aap8KTsRZV23doJ7uOD7VipStUTlSynE+bQ9c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(3023799007)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVlaYXJ2QlNpMlFzQXRySmdxOUI1ME1UdEdtSGNoYmk2RytkZVVFU2drbG5L?=
 =?utf-8?B?azhULzdtMDBkMXB5RjA4UWdnbi9UQ0FQTlE0SWNCd0VINks1Rk5hZUVJNUU3?=
 =?utf-8?B?OUFPeHBRQ3U1SHc3Nk9sRzY1M0RqYXNkbk1MdFNmclI4YlVCU0tzckQyaVZP?=
 =?utf-8?B?MHdnaldGNDFUT2NCV0lwM0VVZnZsR0tqNGdtbStwTzVkTitlYllITE1vbEhY?=
 =?utf-8?B?UVVaWEVDblBTQjlvVXpaSlhjZjFtRFlTbHF4U3p1ZzBZVDdpeE0wQ2NmNnIx?=
 =?utf-8?B?RzBJSHVnaEU2azhrWUJUdFlROUx1ODFsYU1QeVFjaXZKWlB3Mnc5MERrRG9n?=
 =?utf-8?B?SDE0UzVUaUMvZkluWkhVSzQvMC9OWXVDdzV0aUliWU5mb293ejhKNkFTUXNU?=
 =?utf-8?B?NFNoaUF1NTcwS3pabDJ3YmxScTRmSEhCK0FlZEdTS2NGV0pFNDVnS2NsQy9v?=
 =?utf-8?B?dllTRkhVK3FvU3l3bEhheVJ3THcyV3Ird1A1OGgvY3NxbkdseHE3R3p4TG5u?=
 =?utf-8?B?Y2pWSnB2MldCQ09SZExDTmw3V3VUd1JtUXRwMmVXK1lUV2ZFNnNIdzM0eWFr?=
 =?utf-8?B?N3czbmJZbnlLazdoeGJWOEU3cFJCaEpSMk1IMHNTV2NmUHNlZVlIM3ZXa2tY?=
 =?utf-8?B?NzllVVFYMmhpbldyci9uK3ZhaHV3TVRVOUNoRHBnb2pzTXhrVDlPVTBMaW1s?=
 =?utf-8?B?VU93a05MRnlCK1VzcVNocTVBNUpwU25vSUJmZjBOMTFwZVR6bGl1dDZSc0cy?=
 =?utf-8?B?UDRzc1VYbDhxTnk1WEV4SXU2elpIc20xUXo4czFGWk5oTVRmQzQxZVVVM29G?=
 =?utf-8?B?SE93U3BKdzBWcnpxeldVMUt4eEhNTCtOQWxQN3phWDZBWGdCSmM3MklScWw1?=
 =?utf-8?B?RXRONHhIdjBBNncvOUppSTdsU3k3ZWZOOVVkMlZWUkl0TkU0K0NIYXE3eXpC?=
 =?utf-8?B?QWRkWVY3UHMzdkN5Mlk3d1pwbFh4NzRwdlhHOE5ZZ2FQR2ljMEEyNlFYTm1T?=
 =?utf-8?B?OWtiNXArM3VhNjk5ekdNcDB5Y2ZQTVpJUE1JdEk0cE96U3R6OERycm00Wi9G?=
 =?utf-8?B?MDNmOXpQTEJQNmNsV3IrWDgyRk1PTStpeU02czR2djRjR2V2Q3k3eGp1cTdp?=
 =?utf-8?B?OFJOQWtYeFd4a0JOY3NtQ2k5MGM1d2lTd0NMY3ZaZ2JQUTFXL250dTFUL0FU?=
 =?utf-8?B?WDgrOS9yRlZZeThKdVg5bVlQOXV4M1JHL2JaOFZoQmlnQnlUYWVXNWxobisz?=
 =?utf-8?B?bGxycFVTMFZBOXV3Nlk3NkI5ekU3S21xejVVeDBGRHJxKzJZZUpNZHdLcmhE?=
 =?utf-8?B?Z3hOVlYvTHg3ZjhDcXJ3QUtIaHlqd1YxSlp5dEVRR1k3aDlMVzhtbUlqK2Ja?=
 =?utf-8?B?M0wzSVlUVGxRcUcrNHNMblBQZ2FEWEd3aVh1MjVmVFZrVEF6S3ptNUNXMFNU?=
 =?utf-8?B?TjZkNlpnWEt0aEdoMTJsWEVuNVJTekxUWFlxeTFPU0lrWkZseXhSQUhRMW1Y?=
 =?utf-8?B?R0JNVkhtVUtodnFGejEyMEZWazVvMERQQlVHelpFNVE3RFZiTWF6czFvV3hN?=
 =?utf-8?B?RkpncDNhK1BxcU9ZSG1mL3BDeHBHRzJEZGNtdCs0aDhDL0wrK3NrcUdhQ2tu?=
 =?utf-8?B?dEp3Qkpuc1N5OEovSG5sdE1qNktqdXRBUndmUG1zaElJYWtoNUtvT3BNbUd0?=
 =?utf-8?B?a2tKWVBXMnlGdzFiMTJpQ29zbzZPVHBxbVZpa0RyckNiTzZ2Q0RGak1QUXEv?=
 =?utf-8?B?UFpESlpZcEt2OHJmL0ttcm1iMEEvc25OemRhVFNCbERwQUNEdzBWc0VHMjRF?=
 =?utf-8?B?c3dGVVVGR3NqZXRaeTczeWdPU2lVTkEreS9YeGVUUmxsM2ovb0dseTlPRmoz?=
 =?utf-8?B?ZXhNR0QxZng4SzkvTDZrcHRFdlVGOXNSZTJmTTFZZllpazAvLzF3K0NuTE5m?=
 =?utf-8?B?dzJ4eFlMNHB6VzhyQ0NwblJ2Y2VvU1FPVHJqK21maWc2UnU3cllEbysxcUpa?=
 =?utf-8?B?UHNhSDRmc3A3bXpTN2c3MjFrUTBiUmM2WXlHNzlkdEltdG9xVkVmZlV4L2Nt?=
 =?utf-8?B?UW1CcUhpcmlQL2YzUW5wSHFpbDEzV1ZmR1M0WmtyWm82bnRhcVJuZFg4UTZz?=
 =?utf-8?B?aWIvM0RydHBBZHRLa0E4b3gveHF4Vk9GZ25ydGVDT1NPZzBEaFY2R3RXbGxK?=
 =?utf-8?B?UkFDQmgxRm45SzYwSTlYNEhXRWQvWFN5bTFINXZUTUxlTmpXcXBSeE1QSzhR?=
 =?utf-8?B?VE9mdzNkMk9QNmRraVVPTjR1cDF5TFlFUmdNUEJRWW1BclB5YmU4dmo1SktD?=
 =?utf-8?B?RnpFN2hUSHRNcDYrR0JNamkzRDZ1TW1MYkFIdDNhdmxvcVBuNDlFaktuMjVP?=
 =?utf-8?Q?PpwfkA2WbMDSN7TQ=3D?=
X-Exchange-RoutingPolicyChecked: s4Jc+4ei71611Ih9eaIXtcijXgXD6/5ZXrBjgK5SIeMU/xs2UZA4AF6yXhWtapf66pHBuGYDxcPGC7AI+kZ44VwCIY6zfSSPYfsB4yFZudv15fs4ZkNhD7xmk0tmxTYNJ/zq/SqXkOSOFyMbp0nT6C4tSgGYe4jIKHAHmm8RGXDJSjOOvDe/iinfUWihfsjh0HYLVwxQp0vaAlTIdW8pcBiXHtd895AZlS8jGaKU/Df2/ZASzs6p3mHaEd4oJe4eUzEHo3cYzWQDMC0NNGO+Az9DMHtL39gZdmflOrGTRmUzttqk4nyy71L56+QulvpecXDymjUkdNUv68Zkfdk1UQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ce800f-ec29-4949-02dd-08deed611147
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:03:49.2285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OPbXEdVg5xCgCIf2LnDUAfTLPdV7oUaon+XjMjbobu2oUbX+ZP/LQ+AaUFDPG8lhs8Xtm2gOxmyMNI1Y3rdlX+kK5FiShPU/N19FrBMmh38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6302
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

igt_load_igtrc() reads device configuration from the igtrc file and
is used by igt_core, igt_chamelium(_stream), the runner and lsgpu.
The associated global, igt_key_file, is already declared in lib/igt_rc.h,
so move the loader implementation there too instead of igt_core.c.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 lib/igt_core.c    | 47 -----------------------------------
 lib/igt_core.h    |  2 --
 lib/igt_rc.c      | 62 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_rc.h      |  2 ++
 lib/meson.build   |  4 ++-
 runner/executor.c |  1 +
 6 files changed, 68 insertions(+), 50 deletions(-)
 create mode 100644 lib/igt_rc.c

diff --git a/lib/igt_core.c b/lib/igt_core.c
index a7c097d9e..2f737b01a 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -972,53 +972,6 @@ static void oom_adjust_for_doom(void)
 
 }
 
-/**
- * load_igtrc:
- *
- * Load .igtrc from the path pointed to by #IGT_CONFIG_PATH or from
- * home directory if that is not set. The returned keyfile needs to be
- * deallocated using g_key_file_free().
- *
- * Returns: Pointer to the keyfile, NULL on error.
- */
-GKeyFile *igt_load_igtrc(void)
-{
-	char *key_file_env = NULL;
-	char *key_file_loc = NULL;
-	GError *error = NULL;
-	GKeyFile *file;
-	int ret;
-
-	/* Determine igt config path */
-	key_file_env = getenv("IGT_CONFIG_PATH");
-	if (key_file_env) {
-		key_file_loc = key_file_env;
-	} else {
-		key_file_loc = malloc(100);
-		snprintf(key_file_loc, 100, "%s/.igtrc", g_get_home_dir());
-	}
-
-	/* Load igt config file */
-	file = g_key_file_new();
-	ret = g_key_file_load_from_file(file, key_file_loc,
-					G_KEY_FILE_NONE, &error);
-	if (!ret) {
-		g_error_free(error);
-		g_key_file_free(file);
-		file = NULL;
-
-		goto out;
-	}
-
-	g_clear_error(&error);
-
- out:
-	if (!key_file_env && key_file_loc)
-		free(key_file_loc);
-
-	return file;
-}
-
 static void common_init_config(void)
 {
 	GError *error = NULL;
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 3337293bc..afaf35aa8 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -95,8 +95,6 @@ extern const char* __igt_test_description __attribute__((weak));
 extern bool __igt_plain_output;
 extern char *igt_frame_dump_path;
 
-struct _GKeyFile *igt_load_igtrc(void);
-
 /**
  * IGT_TEST_DESCRIPTION:
  * @str: description string
diff --git a/lib/igt_rc.c b/lib/igt_rc.c
new file mode 100644
index 000000000..b7f1731fe
--- /dev/null
+++ b/lib/igt_rc.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+
+#ifndef ANDROID
+#include <glib.h>
+#else
+#include "android/glib.h"
+#endif
+
+#include "igt_rc.h"
+
+/**
+ * igt_load_igtrc:
+ *
+ * Load .igtrc from the path pointed to by #IGT_CONFIG_PATH or from
+ * home directory if that is not set. The returned keyfile needs to be
+ * deallocated using g_key_file_free().
+ *
+ * Returns: Pointer to the keyfile, NULL on error.
+ */
+GKeyFile *igt_load_igtrc(void)
+{
+	char *key_file_env = NULL;
+	char *key_file_loc = NULL;
+	GError *error = NULL;
+	GKeyFile *file;
+	int ret;
+
+	/* Determine igt config path */
+	key_file_env = getenv("IGT_CONFIG_PATH");
+	if (key_file_env) {
+		key_file_loc = key_file_env;
+	} else {
+		key_file_loc = malloc(100);
+		snprintf(key_file_loc, 100, "%s/.igtrc", g_get_home_dir());
+	}
+
+	/* Load igt config file */
+	file = g_key_file_new();
+	ret = g_key_file_load_from_file(file, key_file_loc,
+					G_KEY_FILE_NONE, &error);
+	if (!ret) {
+		g_error_free(error);
+		g_key_file_free(file);
+		file = NULL;
+
+		goto out;
+	}
+
+	g_clear_error(&error);
+
+ out:
+	if (!key_file_env && key_file_loc)
+		free(key_file_loc);
+
+	return file;
+}
diff --git a/lib/igt_rc.h b/lib/igt_rc.h
index d871b3b26..3b7179808 100644
--- a/lib/igt_rc.h
+++ b/lib/igt_rc.h
@@ -33,4 +33,6 @@
 
 extern GKeyFile *igt_key_file;
 
+struct _GKeyFile *igt_load_igtrc(void);
+
 #endif /* IGT_RC_H */
diff --git a/lib/meson.build b/lib/meson.build
index aa8eae68b..9bd484c98 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -37,6 +37,7 @@ lib_sources = [
 	'igt_os.c',
 	'igt_params.c',
 	'igt_perf.c',
+	'igt_rc.c',
 	'igt_pipe_crc.c',
 	'igt_power.c',
 	'igt_primes.c',
@@ -379,8 +380,9 @@ lib_igt_device_scan_build = static_library('igt_device_scan',
 	'igt_map.c',
 	'intel_device_info.c',
 	'intel_cmds_info.c',
+	'igt_rc.c',
 	],
-	dependencies : [scan_dep, lib_igt_drm_stub, lib_igt_tools_stub],
+	dependencies : [scan_dep, lib_igt_drm_stub, lib_igt_tools_stub, glib],
 	include_directories : inc)
 
 lib_igt_device_scan = declare_dependency(link_with : lib_igt_device_scan_build,
diff --git a/runner/executor.c b/runner/executor.c
index a8907c575..1592feee2 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -36,6 +36,7 @@
 #include "igt_aux.h"
 #include "igt_core.h"
 #include "igt_facts.h"
+#include "igt_rc.h"
 #include "igt_taints.h"
 #include "igt_vec.h"
 #include "executor.h"
-- 
2.53.0

