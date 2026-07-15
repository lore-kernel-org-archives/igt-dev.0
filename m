Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D91C44501
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:15:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A39A10F021;
	Wed, 15 Jul 2026 12:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EGTMHG2M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F4C10F021
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117697; x=1815653697;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=SNEAiCMrJyhkBjNd0GfDM/8YA7n13d8pQJ4CEUoBXkw=;
 b=EGTMHG2M6HSVJH6CjYkoM8wF30tSljCVW+ct+zFaLAuoCHwEHh12ZQEj
 AQAVpigfiz/zL50SA2zo9cjS8lVNtv5Q6qUpWphsoLnuyg0TDdlFZO2Ox
 vPaQN+VuNnIW+wa983K+3Eu+ucWG2A+8vmSF2EvUPlebIW0x9Jf+eD1N8
 ctjdx2bqfOUgBAYxD36P9ClZUppr9IK0xxXKtppDz1g2U7BDNDZBlMnvh
 zaEvv/WqLilocaV7+Z8sBRaSHs2R0cDUD1n2VSoxyUmU4ttKCvyhAvVD5
 EEP7ATtqu4JMulC7maejmhGxu0gEBKZDrlSUSRdr+dhGKK9JN2OfFeYyQ g==;
X-CSE-ConnectionGUID: CqEz5osISpuz43deb7aGZA==
X-CSE-MsgGUID: 67BvHShjSu60G4g7DdFK1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95107971"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="95107971"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:14:57 -0700
X-CSE-ConnectionGUID: Jd4g+Au9RmSjnG8fcon0dQ==
X-CSE-MsgGUID: RPKj2ECDQCCfM+Ebjx+u6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="252209660"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:14:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:14:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:14:57 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.9) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:14:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YEyDAQZ/2b1fmLVSNNy982siEzye94p9SzWgW3NdKNEQDHkoRkqN0uQ8CpcLBVxs+9deDPhqVJko0oW9boG1cOARdTWVOvZOoP3lhQ3DcrnfftsLhI0BoaEG6sBqp04OfO0Hy2ilLFmNrBJOpfL6pVVEbR91Wtjhbpe5XIfFEUh4uB0cmWXnBDYb+imM2OCSCN8fPQGAXEN6sNPMlI6Doh1K6LA+WS+n/r7yOK3KYtKNSuuujBofnXOs1lNy/SEetF0+1HNrwQgO8PKZc3AFtP5/I28Zqz+2f3lKJW93C7wqRdLyimF53RNRBktVVC0tXNHWOeqeSV0qNzafNUfsEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0pnTMRmO8Rfrzb0V4UHf9+zuGY/zmJvGEzMxf8X46g=;
 b=qaJsC79Dy3CEpkFmQRseCQsfwCnpNindYJ+kwbEdwSEff7iuARjKgSbnU3iRoTObAZ18JiKR2cXvlgogzq1P8vIsjkDCQEkulmg835puvS0U2lSTGPC2T8nWilxJrfwqF/uo8t3CHUX3dBsCDKB2CkIx95sLf/lXsFkeOM0/htMnpuSGmbWqviKUEdprhjq1zXws0QaFf2wRuofMVQS6NWPw8K7Zr/6hgktmc83v0+jLDayKbRSBLzLjcM5UQ59XLt+nUQhBNlgJwvsRLz2ewAamvncj/WN0S8Iw9cmVgkRbzy05CpOSxBh9FVChKkGFjZzrDRHaZgYK+6WUzeT3gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS3PR11MB9867.namprd11.prod.outlook.com (2603:10b6:8:366::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 12:14:53 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:14:53 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v3 00/31] tools: remove unnecessary shared library
 dependencies from standalone tools
Date: Wed, 15 Jul 2026 14:15:10 +0200
Message-ID: <cover.1784117512.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::13) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DS3PR11MB9867:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aa62171-4f56-4ebe-37bb-08dee26aad17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|3023799007|11063799006|10067099003|6133799003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: EVq5Xw+3PNVpNdA7FKwcbzn3+Q9RYRwb8D2dYJdu4VBmxS3tR3lyYEv9bk6lNmegSN6J4s2pSGY4vsrgu/4SRAYTmOk63QAbb1CTeQFdkgP2HsfSm6X4h4wA1Tz/HWJiweZ6P/OUi55BiTKEEN4S67hM96WMtRUUKiCiQ0Vk1L8xoFl+lI49d7UKT187AwgGrDYNQloml1Dx8dgD0lTeGnoIddcX0mmfPk8ipeiKFA9n5EHkxA6YdTkxYKL9V4s2ZQ7URNDXdkFP6P5R56B1LB5tMCbT5K5aGr4uSqglw9e7rxuqIvp7SLgYEhatow+1lNW3HJQmE8s7pMNW5tM6AvnVqt0nN4VPgz/aBWZloF4Td9vf5+YQ4Kdqi0Kc+i59dOvhd2TT8ACimVk469su5Jnsf8GKyI2S8se+9p8tvdXWGO4Y9nF5ucAk/I4M/lENmdaX12ZGP79RHJyyrilihWzAS7MkDeQminT2+NLe0U74edqqDcUj3D5xHgqPWcqHWoRcBj/A7UKVqQwKs7c++ZwDpTxQnygdpLkzj3JLx2YRP/Ps21N8jcHc2RApTCI8NU1A5Lj0nnTYa6qxaprMSZBHt88NioGUS5DG21Fl4oo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(3023799007)(11063799006)(10067099003)(6133799003)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S9JKW0sAPXCyML7T8DaVBa3ZfPodzxjSvyP4VwQwjRX//odhKyHWZnUPO3S1?=
 =?us-ascii?Q?yrRt5Mz8ClvUd6sdYa5pjrJ5D3Eu9AAdA0ZrhL06DoGEZ2BNVeIsm9Hs7OOr?=
 =?us-ascii?Q?DYIXm8sd9e6thqgf9CuCQdQ+GHumKjHuYvplL2uKuVNIJ7DTNKwO7AiI77Zg?=
 =?us-ascii?Q?fMlrORYtyXoWtc+2VGYjPqTi4OnSnit9v2a9/UH870+OtfchrUPD4LC7+hEz?=
 =?us-ascii?Q?ZAamAz5Mu2hS6XDeT3uSGVoi56CwOYGb4FjLmj0+dcYQeAjtXl+qpmcvud1M?=
 =?us-ascii?Q?eXDHdiFbsLy0kgXXxq1jbMwEGgHv7FvIvk7csU9cxYm3t2jN3u3JEBXJT4ws?=
 =?us-ascii?Q?hSVAShbJ73oe/MJuC9O27gjl9eNu3Dy23LcLOskB0o4TpgSksyYr+fVs2LAV?=
 =?us-ascii?Q?/6sTE1+XxFd4tmNKJ//jAayhjByVEOcgf+YOUkm2txRBZ47v+NEBn+GW3tjw?=
 =?us-ascii?Q?Id1cPbNkKVkxSaagCGQU9LxQ1B9p5R8zdAfwvHHjajtJpizT6XKO4iX44PHs?=
 =?us-ascii?Q?qm1B1B1DxBlQjFla9Oe6h2uFb0SvJgs6j+tCB8jPq0QDE7cj03KgAcSFD00W?=
 =?us-ascii?Q?0lmZKwgnlYMmkf9doDDV9vJXkt6HmbHvOzvU1o48MD1GFAyJvMFuq0eUnJiu?=
 =?us-ascii?Q?aDUXElcYCWurzQcCzEwImXnu2Lrht7EQ4O2d0cpT83zxJIUqbRr0zwR1mkXr?=
 =?us-ascii?Q?JSkpanIsfQE1WveXfIl7TTdJG1DO7QklopOA0y+cl6zR8CZ7hVlyDT3BeV0I?=
 =?us-ascii?Q?yrw5/92R2VXmtxavFit2/cEJQUNG4KmZb7+zDEVp3ZRBqeaXaVOSak7b+9Iz?=
 =?us-ascii?Q?jZEJgcnTmGa7NNdxeW2BQbOJ2+6F98zbv7IX9JzEAtd7uSAIQXnFcEsqxYeD?=
 =?us-ascii?Q?s5O7D3sLmWcTgtyz6qhPbFlSJo6KyigNy7A5F+mZEuC4wNvFk8UhvZqiQ4JE?=
 =?us-ascii?Q?TA9Ma9161xeUe3v4z4mnyaj4+g4AcX2x2QuH3RNjq3/CP0mLQ4josIdf8SFe?=
 =?us-ascii?Q?1Ztu618MzQ7sckbxUtu4QmNUSEUWjdXGSSp5Mohf9LzP4vRJfO0omtugHpPK?=
 =?us-ascii?Q?KGby1ABRN/w7pGcxNuJPiifMEcXtBk1PsTtygAog671I39Jr1yOcOYNxkzZN?=
 =?us-ascii?Q?oBftWp8betZcGgLMC53mmuzP1//jxcUVZDXgh/JcXmGSSMVtz8yuEq4VsT3P?=
 =?us-ascii?Q?0RbY3L4zh9+GfCk4a8WVAI6hVnxYBAbmcM1vwIzfPepC6jsL3t8/XYtnGPBW?=
 =?us-ascii?Q?8t9UiJfeLgmIttpOadgaaKNFtJI+UOmWZx4gnQxViq+yZlG5H+Y9jcD2455I?=
 =?us-ascii?Q?2IkqZSmnpPVYsO999XhK4vSa0mHQTcopfEobYFPYgu5LIDQ2M9EsJcFcPU2T?=
 =?us-ascii?Q?Xv93Nqi3fV5U0geBMz/XNR1gmAd327mnd+2BDnlX4EZem3A/E20qJaJRHaVP?=
 =?us-ascii?Q?P8okKmdkfPEhS1aRuIwNBkF5cED8wMasa/UF1l/enzklkobvVDJ2ixe/sF03?=
 =?us-ascii?Q?5Rmm3y7fJ+POfEdHhmID1nZcloYdpj+sHd6OpOWYyiatO9NY/m7DP7R37bGW?=
 =?us-ascii?Q?13KpDi33RG9VTZ4Ld5hbbTgUh4Km9PY83+PkiB5eXx0Jpk5QtVof3qQWVFu1?=
 =?us-ascii?Q?p1hvCMIzaODsnYYeMXS4D3JrL1qocM/soviT8VHOb5vu+qWA21mU5qd9cXft?=
 =?us-ascii?Q?me+KfFczTtv2YegHVGRmvGraQv0J/KVktLjKJfOojtXvbgNCogEpfk6qVfQ7?=
 =?us-ascii?Q?uI/dI7okT7jelu8EMcDdyKhaJCa5Knw=3D?=
X-Exchange-RoutingPolicyChecked: J6jLQ9hb5BFj1C8ndGPuiJDIBMaV8EeEz4lBwX+2BKJTNphnuV03nMaXd6esCwAv5J4WK1GWWiRk7+4/wxBhMKegtFdlDJlLrD9vV/KxhWIcw+KMk4VnmhHM6ZiFP1P6ySv3wXC6JHxv2iuTDpr7nm4DwsYqn8RyIux6HWqbjVFzOrnu8tnvg6esTeEKSymW455i8LDnRnYHdu8tCnQhwhFns/Xh9e7A6pYgsE1BzVR3gFqkL/5X0jKuTrrcVvRzcA9dK2FS8hngZTx+yD7ChxLzJuJ59FFOZDvbLt2K6itTrcB2hM+fcbqS+Bm4DCpV1EtRH4ikITapAKJeuMx4Tg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa62171-4f56-4ebe-37bb-08dee26aad17
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:14:53.2827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VtE+f5mevlK5YTirV+DXbY2KRD5OXEmYvDQoiv9O7TtI8Syeo2JhoOBT+pMxbeRsUubkqxQQDgCgnOf8RgYUzgfLVHg9DR4p9NCelDtCz9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9867
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

igt_load_igtrc() is moved to igt_device_scan.c so lsgpu can use
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
  lib/igt_core: move igt_load_igtrc to igt_device_scan
  tools/lsgpu: link with minimal sub-libraries

 lib/i915/intel_decode.c  |   3 +-
 lib/igt_core.c           |  47 ---------------
 lib/igt_core.h           |   2 -
 lib/igt_device_scan.c    |  48 +++++++++++++++
 lib/igt_device_scan.h    |   2 +
 lib/igt_drm_stub.c       | 125 ++++++++++++++++++++++++++++++++++++++
 lib/igt_tools_stub.c     |  83 +++++++++++++++++++++++---
 lib/meson.build          |  66 +++++++++++++++++++-
 runner/executor.c        |   1 +
 tools/intel_guc_logger.c |  21 ++++++-
 tools/intel_gvtg_test.c  |   2 +-
 tools/lsgpu.c            |   2 +-
 tools/meson.build        | 126 ++++++++++++++++++++++++++++++++-------
 13 files changed, 443 insertions(+), 85 deletions(-)
 create mode 100644 lib/igt_drm_stub.c

-- 
2.53.0

