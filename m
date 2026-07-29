Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E986C53200
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:03:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E63110E053;
	Wed, 29 Jul 2026 11:03:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VTL0PF20";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B91310E4B4
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785322972; x=1816858972;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=/1PvKt1WasXK/MyMO9bJtE1FVJf2ngepT/JPkm+GJRM=;
 b=VTL0PF20afpgWz04SP2Mh2/kParWigdt+UQMYVdcQFf2pm1KmfX5tkD6
 0NYjxF24MLWr6yRp9oahL1SJOanspeqkGVgGakpyhe7UoG292I4I1c296
 ZwOBd/PwcDTRXOTodKMNkMcBcozMmmG3xeuBCQRBo9RvCs+FTEtZ1yzH+
 4g4WH8Ar3PNEkNLtFVAGq2oRDlp7KHQ0ngafHinxAjZnwixiDxnvgHsOi
 af9EESOfUNnzL7/dgl9rIv5x+++hhO3ZU0iUn0edbyktnleUgSDQWltzH
 2CQ0vjGFU5sS7btWQuDM6lfoOQkXy/TCxZzh45RPVS+Ny37U7MR7octvL Q==;
X-CSE-ConnectionGUID: 3k5l0xErQKW0jM6G/XO9vw==
X-CSE-MsgGUID: mcFzoRavR4WpggvYHcBKGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85797542"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="85797542"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:02:51 -0700
X-CSE-ConnectionGUID: 7l58LhQMTL2Vrt5aEh43Zg==
X-CSE-MsgGUID: A0/qNJbjRVSd274Pqy7A1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="264264014"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:02:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:02:50 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:02:50 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:02:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DH39zmoiOI499cIUzexz5FvkfHEAX3qddklkzjNRq3lnvHbCDDIQIuLAM1b450SotLk9qiK096h1fptXBojXdpcCuYeNHJxL3OxKFSd0C16XVeOFlsXPsMsWxv05q1Z9/J57arQY5XX7ydwgLutavW40eEO8nyIUx1wEhLqeZMF8OLtfEx3sMis+Bnt/onhdairT/11xsLIgXExQmLHjK/d8ZzJ5jcGunkhzHPs9eKDmZWGTwvvUrJzoGNC4oJ705K4dTz+p376H4Dv/+DBSjM132jvcMlJdVK/nCGZ0tngrdlbsubXhEJnmiGmA4ujxvqC/sFRwLnZEnsttl6GgsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dtNUJuReTg+hNgIwyGHf23GvM3m22Y8CE3mB/nybRfI=;
 b=JXQTqOS7wcRVJ9DEBvmkZWcSuUWeU58zVPm+nXaTdnQhM+IMJmXzJ2GrO7YmHn29yxdeM8PhhbspqxhF6prW405eU1pPEoymcmjpo5FunAGbOlSIBN6TbFZ3KPlievXb/ghXAUxyp8CBRe/Xqu2bjoHojsmDf6sVLPzCt/flIyL6geWpU0t8lFs4jXv2SthmYMH8VRKZHR69eYOis/ZZ6qK0ylrGSI4zccUpKHKW5QkMN9NOXIb8xs1BcWnsjhXcnt/ea2TG2/Sljhd+/thWZ7v5OkBfCNf4EGOkmz2zgRfb2UY7kENuHOG+pbVU0+vt5ITW9nEFSxizTjiM667Qew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MW4PR11MB7104.namprd11.prod.outlook.com (2603:10b6:303:22e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 29 Jul
 2026 11:02:44 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:02:43 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH RESEND i-g-t v4 00/31] tools: remove unnecessary shared
 library dependencies from standalone tools
Date: Wed, 29 Jul 2026 13:03:17 +0200
Message-ID: <cover.1785152675.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DB8P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::21) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|MW4PR11MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: 299b6fdd-1c6d-492e-813f-08deed60ea55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|10067099003|6133799003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: Kg5jWn5FckFlkeVjdNHghfeHEHiXMga4weyloKulTLAdPQ/KRHxut/WaGxRSgLaJ4WjAyXVTEyeBjPgrX8l4J1C7XhaViwdzkNAtKXN3WmUBMrAYuy4EodknM7ATe6ycoGxHRXN+8iU5VPh1bggfuHWVFgxwl8a1LQHAhhcb6DCAPBJ00zFLGSUpsVaODObndskqpPgVRZ0TH2JCJWu+nzmDuEwe7NQfKrCWbcGFEDBRIuvgkxgNI7+uIG74ao2fmzIF2dW6rJkwtLMvtQ+3r6cOw+dr3v38ri+qH54mCjinfKUbe1Rs3G347gwHJL+t/YMfAaMyHRD+0+Ny3bSgRbQdAuaKAo1Ejy6Af7Pw9wsQdpYPXYcu2MCeA57jJlYPIFXTmLS7m4MKKL283tMhX9ESkS8mUPmr+bil+8fl6/tGoa8tG+gLvbR4zCMhQZ67viuOQ6MqtkBlZFQnNIfMYS2z8R5S2HX/ISXbpeC3yR35cKhHnYxduyDDsmdjP7YSx3uorAdXHR//Nm+BWlwzR4eKau4AGDs3J3BmhHtxFLnS0XqmGJSjtsOvUdIGsWBK8kPnAxczLkSRKbv0LA1PWNRgc8etgFWH+totmVvNRw2EuXxqWFGUDicz9RQwECxO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(10067099003)(6133799003)(56012099006)(11063799006)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XXDWwEdZyxLVN1i5mU1QD4OJQYH640TsBsC+C76IrAFkQ5TaRrmVeW3hDmJY?=
 =?us-ascii?Q?JdFzDGFLwleXo74+55QiK8nn7RmegQoOuNIGOHEnNOpO1VpuKanPfnfaqPww?=
 =?us-ascii?Q?ND3raC29rmjpPANJ0dn8Zp72fmnUTmCQE2kB1vTMLjINU3TNG0CxrzM3R7oC?=
 =?us-ascii?Q?MgA90b9eHKiGbFC+SCtaxUoiBblfGW6dCIQsMEsYZkrdOzEy6UcFpXC2ALrL?=
 =?us-ascii?Q?6c4Rj81+uesC9lxHXIySYXpY53hEM3ijpWb7Z29gdiPW10aWQbgR1AbcfKzW?=
 =?us-ascii?Q?ek/qO3wRfLeL5uZXFJkR0WfcLyBOa1P3FkNhr9agbIaRa75s6Y77YLdZ8FI/?=
 =?us-ascii?Q?Z9v+TJJj8v6/l35rqy25KbTKww2uZGN2V8nNeIhP8wMTvsT+gY2XM38YCOvx?=
 =?us-ascii?Q?5U7Bd8nYYrVXYPgGBUyuwc+8KSVQy9ZqtPs0LB/PfFcFpyAYwSIT7zyMHEJn?=
 =?us-ascii?Q?A4+Qmc0GUU8DDwBH2+VLK4yGrbsAZmPzXVWqZNoC4uVAODZ+woJu8BPnBuCQ?=
 =?us-ascii?Q?T1vUps1CQWwae5zQqxS6kN7777cUdD+kB9AZufaLDds4YSWSce0rFWlh15Wv?=
 =?us-ascii?Q?kORfxzNBg0mdsr7a6WDmsNGheE7nZ7usvRsd+My1QoSaQH9KMz+J4U/p9APJ?=
 =?us-ascii?Q?tD3KYOYolcfU4euro3+GGMV6S0m9QWexeJ31F4Bh4RIPK3FqJiD4V4BF+Vmd?=
 =?us-ascii?Q?9bx7ourK2wM1rF03ByZR3oei/9EkHSrVe6pf8PiYmCQMDOHl3naL0bXivfT7?=
 =?us-ascii?Q?h9mukugYtRc/qUz4vMqBNFe+K4SVrsCeSaTLzSn/ie2aBy5aR+ubrEVR+liH?=
 =?us-ascii?Q?Kzudt3xW+aHTrTUDKZBIRq1vomRB9q4+2q/L+AhDJasHmw+rCqRPJJ6dhYn9?=
 =?us-ascii?Q?wQ7Cjg5IzvmGS/46b+elictfBwGT9yTKWCKdQRW7tizBx/wfOl71eDxdp9Ye?=
 =?us-ascii?Q?yzUkqaajkJmrQwoVMoO04KERoynDnScn7RtexsWvtZvqTJubmFQ1rdNlYObe?=
 =?us-ascii?Q?l6wvh0HdpDUxn4s3DHNsccrOpHDvwBBqrT7ed8eSjPel6SVk42g/7ar0+Ra5?=
 =?us-ascii?Q?0D34Fe3+Hp167KufdgHl3Vs3slpkgIFMhiuRpoHcCybKRQmYacHUyQnW4w24?=
 =?us-ascii?Q?uPKeG2tKUFXkL3B2iSWah/PEjyDDyDksHPqkxpTTMltEw8KAZpl+ZOsJo5He?=
 =?us-ascii?Q?uGzytDCoH+ji/A+ocdWeDzjFfwbJoaWLCt0dceSaFb3Ufxr2limiXNdTLNrp?=
 =?us-ascii?Q?XknH/5/MHZavSXA8o3lPKarzYi9kD3bwg060bpcetcX/bQX7NLwZK8LA1DMZ?=
 =?us-ascii?Q?MOdxHzvYbRSTX/xY45ouLrIArx3nPmo/l9nEteeypZ2yG1mNtRTjeuSPH1Wh?=
 =?us-ascii?Q?dLJjluIxg983ziceVB1a+cD9dJqMqBmnYG0TsPbMtmwLuJ8d3OfozrxiwCtc?=
 =?us-ascii?Q?KJzRa0NmE3Q+C/JuXKNMYrvxSINDTyV/QEkEw0iJ2Zid3RKKk/U/Zpdx7Beu?=
 =?us-ascii?Q?qoLsr97mde4jZA/jptmk23CZwEPnHioi9zAh9z11Ezq0a1jcu3b6Svb3QzCX?=
 =?us-ascii?Q?hTfWPOR/wjevvEK32FCdv556APJz9e3cey1KgvUbG80n5nSAgHzNZBls3HLV?=
 =?us-ascii?Q?PZCaJVtio7V0/BYCybzCeqc/HjXf6QUvn5yQ8WsX4PUuubiKlGoktTmBr0Yi?=
 =?us-ascii?Q?fnQXeEyb7LklxrAbm17lIZjHklnOdZvncXnYe7fcTaj2JvjQcstAuT0HG4gj?=
 =?us-ascii?Q?IGNv+vbQ+3u1M06FcULYNzS4CYUILyc=3D?=
X-Exchange-RoutingPolicyChecked: qCX8vd9oZbM/ApDndOyD6alKBnHucRM7uLnVBJl7xrDE0LMXCURTqPlqkJfn2vkbVh8XnLaBkxzw2sJET/IIOxiX8TtmZdKb8te5DPCJAl+omEkGaWWGCIQaSRSpmsm/0aoTgApNsiA2khoIBlPQIHR4WNn71KbyC1aisadWqzVKKfLvnM2qEgyiPYdZRV3H15EBpUO1fN0xyXk/DdHL9qbkza5PxCLxwC7Nv2vze7mmloz2jRuNWsDpwLiogNYlbTaeuEfQzNsGbFCtMWm2itSlHpcqJO35VwYf4e0yaqqJ/CXFs8tWr9D4OQcTLem75573C7qbpTajug7Oj2snHg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 299b6fdd-1c6d-492e-813f-08deed60ea55
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:02:43.8945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yr47T9g48LZBr97s4ltHnguRNhggfGIdT5xA1JO8hAVA2GhTXows/jpxb+J8Rb1O8wXqiMOHh8Kgb/NZ8B8ToAvU0r+e9go3cigaJHB5KdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7104
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

This issue was raised by the community back in 2019:
https://bugs.freedesktop.org/show_bug.cgi?id=110249

Standalone tools linked libigt.so as a side effect, pulling in cairo,
pixman and libX11 even without framebuffer use.

Following intel_gpu_top's approach, each tool now links only the static
sub-libraries it needs. Five new ones are introduced:

lib_igt_tools_stub, lib_igt_drm_stub, lib_igt_halffloat,
lib_i915_decode, lib_igt_reg_tools.

igt_load_igtrc() is moved to igt_rc.c so lsgpu can use
lib_igt_device_scan without pulling in libigt.so.

All 20 tools: 35 shared libs -> 3-8.

Behavioural differences vs original binaries (no-hardware runs):

intel_backlight, intel_lid, intel_gpu_time, intel_audio_dump,
intel_infoframes, intel_panel_fitter, intel_firmware_decode:
assertion failure format: IGT CRITICAL block -> single-line message;
exit code: 98 (IGT_EXIT_FAILURE) -> 1.

intel_gtt, intel_display_poller, intel_watermark:
same as above; additionally print an extra "Test requirement passed:
pci_dev" line on stderr (previously suppressed by IGT log layer).

intel_guc_logger:
same exit code change (98->1); --help drops IGT framework options
(--list-subtests, --run-subtest, --device, etc.) which had no effect
on guc_logger since it opens debugfs directly, not via IGT device
selection; --version, --debug, --hook also removed.
Unknown option exit code: 79 (IGT_EXIT_INVALID) -> 1.

intel_gvtg_test:
skip message: IGT skip block -> single-line; exit code unchanged (77).

Tested on Intel Meteor Lake-P (device 0x7d45) with the series applied:
lsgpu                enumerates card0/renderD128
intel_gpu_frequency  reads cur/min/max/RP1 frequencies
intel_stepping       reports device 0x7d45 rev 0x04
intel_error_decode   parses empty error state
igt_stats            computes median from stdin
intel_backlight      reads current backlight value: 0%
intel_gtt            dumps GTT linear mappings
intel_gpu_time       user: 0.000322s, GPU: 0.0%
intel_infoframes     runs, reports hardware not yet supported
intel_panel_fitter   shows usage with -l/-p/-x/-y options
intel_audio_dump     dumps meteorlake audio registers
intel_watermark      dumps WM_LINETIME and plane watermarks
intel_display_poller shows usage (requires --test option)
intel_lid            polls lid state: open (loops by design)
intel_forcewaked     locks forcewake, restarts daemon on gpu reset
intel_gvtg_test      exits 77, no GVT-g hardware
intel_guc_logger     --help prints usage correctly
intel_vbt_decode     --help prints usage correctly
intel_firmware_decode runs, fails on missing CSR file as expected
intel_dump_decode    runs, rejects unknown options as expected
---
v3 -> v4:
 - lib/igt_core: move igt_load_igtrc() into a new lib/igt_rc.c instead
   of igt_device_scan.c, keeping the declaration in the preexisting
   lib/igt_rc.h next to igt_key_file, avoids mixing generic igtrc
   config handling into the device scan module (Kamil Konieczny)

v2 -> v3:
 - lib/igt_tools_stub: replace magic exit code 77 with IGT_EXIT_SKIP
   (+ comment), fix missing blank line after if block, unify
   multi line comment style
 - lib/igt_drm_stub: replace long MIT license text with SPDX
   identifier, document which libigt files this reimplements, name
   the "16" magic constant IGT_DRM_STUB_MAX_CARDS
 - runner/executor: add missing igt_device_scan.h include so
   igt_load_igtrc() has a visible prototype under HAVE_OPING builds
 - lib/i915/intel_decode: reorder so "replace igt.h with minimal
   headers" lands right before "introduce static sub-library for
   tools" - previously the sub-library patch tried to build
   intel_decode.c while it still pulled in igt.h (and transitively
   cairo.h), breaking bisectability

v1 -> v2:
 - Rename all patch subjects
 - Split  tools/intel_gtt  into two patches:  tools/intel_gtt  and  tools/intel_dump_decode
 - Split  tools/lsgpu  into  lib/igt_core: move igt_load_igtrc to igt_device_scan  +  tools/lsgpu
 - Shorten  tools/intel_gpu_top  subject (was over 72 chars)

Sebastian Brzezinka (31):
  lib/igt_tools_stub: introduce static sub-library for tools
  lib/igt_stats: introduce static sub-library for tools
  tools/igt_stats: link with minimal sub-libraries
  tools/intel_firmware_decode: link with minimal sub-libraries
  lib/igt_tools_stub: add stubs needed by tools
  lib/igt_drm_stub: introduce for tools needing driver detection
  lib/igt_device_scan: wire to use static sub-libraries
  tools/intel_gpu_top: add explicit drm/tools-stub deps
  lib/igt_halffloat: introduce static sub-library for tools
  lib/i915/intel_decode: replace igt.h with minimal headers
  lib/i915/intel_decode: introduce static sub-library for tools
  lib/intel_mmio: introduce lib_igt_reg_tools static sub-library for
    tools
  tools/intel_gpu_frequency: link with minimal sub-libraries
  tools/intel_stepping: link with minimal sub-libraries
  tools/intel_gtt: link with minimal sub-libraries
  tools/intel_dump_decode: link with minimal sub-libraries
  tools/intel_error_decode: link with minimal sub-libraries
  tools/intel_vbt_decode: link with minimal sub-libraries
  tools/intel_backlight: link with minimal sub-libraries
  tools/intel_lid: link with minimal sub-libraries
  tools/intel_gpu_time: link with minimal sub-libraries
  tools/intel_audio_dump: link with minimal sub-libraries
  tools/intel_forcewaked: link with minimal sub-libraries
  tools/intel_guc_logger: link with minimal sub-libraries
  tools/intel_infoframes: link with minimal sub-libraries
  tools/intel_panel_fitter: link with minimal sub-libraries
  tools/intel_watermark: link with minimal sub-libraries
  tools/intel_display_poller: link with minimal sub-libraries
  tools/intel_gvtg_test: link with minimal sub-libraries
  lib/igt_core: move igt_load_igtrc to igt_rc
  tools/lsgpu: link with minimal sub-libraries

 lib/i915/intel_decode.c  |   3 +-
 lib/igt_core.c           |  47 ---------------
 lib/igt_core.h           |   2 -
 lib/igt_drm_stub.c       | 125 ++++++++++++++++++++++++++++++++++++++
 lib/igt_rc.c             |  62 +++++++++++++++++++
 lib/igt_rc.h             |   2 +
 lib/igt_tools_stub.c     |  83 +++++++++++++++++++++++---
 lib/meson.build          |  68 ++++++++++++++++++++-
 runner/executor.c        |   1 +
 tools/intel_guc_logger.c |  21 ++++++-
 tools/intel_gvtg_test.c  |   2 +-
 tools/lsgpu.c            |   3 +-
 tools/meson.build        | 126 ++++++++++++++++++++++++++++++++-------
 13 files changed, 460 insertions(+), 85 deletions(-)
 create mode 100644 lib/igt_drm_stub.c
 create mode 100644 lib/igt_rc.c

-- 
2.53.0

