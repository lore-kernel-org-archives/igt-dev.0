Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6138CDB479
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 08:47:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B86510EE15;
	Wed, 24 Jun 2026 08:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E/q/pLBI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E01D10E070
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 08:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782290844; x=1813826844;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=jGTZ7UUP85aDm6jNyecIeARNPDuoQJW8fMempeDg9Oo=;
 b=E/q/pLBI0DIPKOFQuD5+415SFskwChFuef+smBidYYsPbkmwIVUSU9xd
 Lne4/yVimfj2kwtowZUA28mKzghKU0B2x9NAPVAlrzUYGo9/k3s7S/SeY
 aDMQNrCrmsBt6wlOkZS9f9DOZUZitAisgGV3BSp77hTLapaCeomUuIIFK
 isi1QhYK2cJBXf9HzXKeO2YLxLxmkRyzNA3srWlT5D/ldc+kIU2ABePM4
 RVMSTilxFKhkFKhnxpAWiRUksNrm0+ubYv8aV7hUolrm49RHGe3HHxBTo
 qz+P7dZhpM2gndLCFa/8FAEYPfU5wo9ErPW2kPA4kNm5hVh8vYWDXuphc Q==;
X-CSE-ConnectionGUID: KQ/U2tXSRr6Z1TAY0Ax0nQ==
X-CSE-MsgGUID: xyvbu4KkRBud13tjGhsC0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83142207"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="83142207"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:23 -0700
X-CSE-ConnectionGUID: OWeHXWIVSu2yOlzjuT0qAg==
X-CSE-MsgGUID: 0uv7h5sFTxaqeSb5H0ayJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="245432064"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:23 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 01:47:22 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rs99comxw9St7bwGjaIlpKBkPhv+SglIYauM1cMc4AW1Ibh0bNMCu2/1uy3ysB27Vq/ArVDFDbeg6q2x3kYZmMwFi2n1pjooiAWmV2XYAdLGt4sHIT8aAyVG/oh3D4nt0/b8U0cDzzXsWmwVMOPROhbL8sLnaD/Si15uiFRzfmZJuFTa2ADGQXcprswaDBeq9x7f+oE72usVKjMV5MCxbyUNbRQ2bhGSERxC+KnulKtHJUy+B18pOLJcVPALxTAdz4cu6uMf+sAIGh+wVg1WuRy9+rcwzpDZtZMQfGXcJncveEtEvaka/SOpq0JQUCvxBZOid45CqKble1XjQFWjSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IB/IqtzU/R8NL80Ps38QACK8wkzXdRZvWIX5i+ygzBg=;
 b=dqk0/6QDt9df+8KfsjG2hgmyGTKpQU8E7zVISzvcWWpc/E8miQiK5WJf8by8k/onykG05PBFSC2uYYdgIxVx15M0L0l6Z5OOD/Ru/2Xap8qIMRioP3AaqDWDn8xMJCfPSlKo4qaBJ0/84qckyrkzInDMomfIV9DLXF862ptC1dmTfmQFdiv3W5FH5m23t+M04lgf9m6CP2MyEZhRuviKs6OnGpyWjboKk2XH13TmtBbVzv59p/l2IQ/nrUg7Kr1JSSf67H8pxJN4TkS19ucSG1bKQHjgemMbr64/pUET3aNNy6ZD34d9l+ioc6a+P9xg8Vc6/6rEPe15LoaEcJAXTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by CH3PR11MB8776.namprd11.prod.outlook.com (2603:10b6:610:1c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 08:47:15 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Wed, 24 Jun 2026
 08:47:15 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 00/25] tools: remove unnecessary shared library
Date: Wed, 24 Jun 2026 10:47:07 +0200
Message-ID: <cover.1782288071.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DB9PR05CA0023.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::28) To MW4SPRMB0067.namprd11.prod.outlook.com
 (2603:10b6:303:221::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|CH3PR11MB8776:EE_
X-MS-Office365-Filtering-Correlation-Id: c8a7eedb-a6d4-4211-6d19-08ded1cd309e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|18002099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 25KtCjHh+51tZdA5+ghrLZnFFPY8MqsVHbh39eq+gD9hL2bYIcBn32pPXaXnEFW5ETIq0kjFlESq8QGWccGSUTyeDDeZQqDdn2pgBWbe9BeIIIwqzJ5LEl120dWrykVqwaNKSL+ogT9yffnMk7VZJnu/N39syS/7Ogb3KHDIKXJxdV+lwqEANw6QA3834cKzFTHd+89j7Dkze01HyCj3nyDPHH96qGptVb/EP0aaZ0NSH0NBoCJCKe12Rj4MWi/Uj3ocll4lrdlSumavkbJLwW+gcGQNpx1qWq/VulPsiZ7pNASklDh3lzfjUQDq4KfsiGrzapm/SNzyjVuP59cvMuIs+AndzgGkN5hjM7VIEI1/DTadzD8rVCtdOzSTZGNb5oLylRYcLp5I2Wu5QHLR3Oq8TbzJmX338xFUTcAzLSJ6girUzXddPb9z/HdHl371dZZhshofWRDXn+JS7Hiu8Y7KuFmfwJS/+80fM25K+evKMtRlodEjmrwXAsSiyeOgtblOxkzVV65HRjc3hwgg7QMTTalxX/9KVmR1MCV7ztyFyZTZgdlJv8DPztUk1ArEPWKUyc1Nxox+dcyly9UFA4DBXNaNPpByJacGRmyoJmuELLeqwCxKsg9gaUWhtVY7AcPhpGfT6P/LT9+6TM5cHy3AnlBoVhtfo9NvOhoJ9zQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(3023799007)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TS56d4++jSjBNm9mfLguiJ7+/1ymXXj+zfhGHlWl9skvJMR9OWywtqppkxXY?=
 =?us-ascii?Q?UOBwGZTdvj9BGTuDfYmo4463xK0QLojogwwFd64E1R+F40uX/+Ka5ySE4go8?=
 =?us-ascii?Q?51+OUDRvONqL0l5I1ItQntxab7CZfa2DgR6ZY3mIUL8P+zPYJVuTOBQpYZwf?=
 =?us-ascii?Q?ZUkEkduJZHhw+SGW0DtM41dknbHixdrInt2SEOzJulB3mOc7peQ/LjyvMe7Z?=
 =?us-ascii?Q?IBhLzUACj1/3HzzmwL9VOtEBkSnUKmlOCJMtsj6RFHx6mosVztl6GSI++6DC?=
 =?us-ascii?Q?bMKGi9RKwXNBSRqRZMY83DNnrDCUlqIsC0YCcxGAZL1cA4X1dff2Q2ju/qWA?=
 =?us-ascii?Q?qB1+6GuV+MHF8mbr3r7WI8nuMaLBrJVn1DGs2CTZ2x/5BR8t6GDd3b6ie2ln?=
 =?us-ascii?Q?maHIqPrlKrzX7u9pbf853vr/BX9bPmkTzFHuB6IgdxFJh9npCasqUJ4vtYl8?=
 =?us-ascii?Q?MmXQFYPUPjroH6V2VuoQ8YM+j42Bttfok+PpGeMYcHsOLJ1stloirzqp9BFQ?=
 =?us-ascii?Q?MvQ2cIanExOFzN5b4iU5AeWaafqI7Bug+MliCa0hUuuX3kRDT94pUveZWYe9?=
 =?us-ascii?Q?x4wKWcD+O/25V61wMv5wq+nSWHGi7NnRBmtPfFdIZHe3lesGIhtkq6FBuwd1?=
 =?us-ascii?Q?55BogZ1aCHw4GfyeE77v+kBIgmRS2wQdom2zSeonzZbr6Iu9F7ZUVNrEgeM3?=
 =?us-ascii?Q?OpbnK878aZ2U0gpiTy2QIsj7YYlkJrZAjGzymCXWtGQC9aZsWx+795Nhvkl2?=
 =?us-ascii?Q?hgzcw4t/R5eETcEbb2yKWkyj4sxMFztB3ELavMyzG+oaE6vyIf3zqWH/zZ/X?=
 =?us-ascii?Q?CabkkdmUIlGencOzAhCtmxeLZTLy/UnRyue8Kqr9xxU727I0ax22XeAGsdvp?=
 =?us-ascii?Q?6caE4OBdLaT9k/qZKHDfbMoRpW0BqqlY5iV0llCMMPrrb6jZ7LKwiuhT258X?=
 =?us-ascii?Q?tDDYsuQ2+qM124WhvceozESXDSoWq5wQmmbIYtBCE9pKOHOOieV+Zz1Ou8Vo?=
 =?us-ascii?Q?n3vnVlDm3wAD3A6biK7leE4typq2+GEBs76cX5evqDC5sWs6EJTdTG02amjj?=
 =?us-ascii?Q?vp99wqbRMPQ1RrdD/SECRWFiSuwMwNkKRRwSX6ZMx7ej6vO4uoNgBHrtlAHW?=
 =?us-ascii?Q?PvHU+z2kuXDvbAVmZvrY6IaSX1twbP1b/Vc+6nkj3lONYGm4FOCuoumBE7tO?=
 =?us-ascii?Q?X4HztEa9SB+/5Fgv5B9M479LJTBPshXKMqtR04QZn1vhy3RyW5tjRpyJQW+n?=
 =?us-ascii?Q?1BtPlwpuqLU4Vy84cc045Xl/+rtPk5Ndw7Mc5ngLtxB/+H3rorTwOEBbI2el?=
 =?us-ascii?Q?X6HaEW8pO0UiHlT2W0hgKsPePEhD04iao7epgYkWZ6aL1l9WbL3kTaD5dPhN?=
 =?us-ascii?Q?D6dck/xX0jEWOQOEvIUSp1B61GfI0ECzNX9BjQfGtPCpB8oUswTz/E01r+rR?=
 =?us-ascii?Q?eVDNTTd8tRkwALXWFNoC8zCiyHIrPHOPWv+pUiVwCVKthAxWj2cjtQLvHu6v?=
 =?us-ascii?Q?aGJPgjIEvwH6PiQ0K9BNAoSapgSmY1VXBRqqnFg543zCvViaZtTACYD4XACC?=
 =?us-ascii?Q?JAg8U3veulnyhprYBEVV4cvAe7drzrr/04+mhtufgufw/8+RWGujKSxWzMFX?=
 =?us-ascii?Q?Unm/8qinxTCEp6xuQ0/we0WhIEjp4QuZEZ1eY6N9E/Ggom1/A8ru7w5ds/jD?=
 =?us-ascii?Q?AwtqWPQhgfSrrFpeocQPf475OYimhL3h7oxCRNX/gXFnpkoHilfvK6mP2KCn?=
 =?us-ascii?Q?Xmch5zY5dXGFevwwxTYPBSBsx0Iy9TA=3D?=
X-Exchange-RoutingPolicyChecked: MGbgeSpVOO0aoKUEhFx8W+JXApgmkh42egFQrCkMnMAiMsCear09UeWzVRz9lwfP4+extrUBec3ABRj1wBlQC+hBuYMU8y5eOGOgZWFTew8qw/zEjRo+G4z4/gk4f0vcuLl6tST8OfNCRjP0+O7ZJORTcfC3Zv5sYF5GflzleDCu8yBnV8WefeTFAI+x6ZNZ//4Ok7ZT0W+Enc+jAPJFbZ57gMdkckIN+KmvDUjgVJKwMjNAjSy5FdiSSrxw4de0qfsn2rQKWS7hcRT9q3dj3HtDv18+USmS6fx51+KwaZyaDkB4gC+btLxzYdD65H/41RFD0GCJl+ALLjQe0AzQww==
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a7eedb-a6d4-4211-6d19-08ded1cd309e
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:47:14.9893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Av0SvCoXKHh/JJTtjTvd9aFbpjUk3DbqEk7PddMph5PjoqpwF47yXi1Egw2n/0Fa+RFMcH20zTY22UaTMUzaNyYR1hdUd9uHWVnd45/1+qk=
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

Sebastian Brzezinka (25):
  tools: igt_stats: drop libigt.so, link against minimal sub-libraries
  tools: intel_firmware_decode: drop libigt.so, link against minimal
    sub-libraries
  lib: extend igt_tools_stub with additional stubs needed by tools
  lib: introduce lib_igt_drm_stub for tools needing driver detection
  lib: introduce lib_igt_halffloat static sub-library for tools
  lib: introduce lib_i915_decode static sub-library for tools
  lib: introduce lib_igt_reg_tools static sub-library for tools
  tools: intel_gpu_frequency: drop libigt.so, link against minimal
    sub-libraries
  lib/i915: intel_decode: replace igt.h with minimal headers
  tools: intel_stepping: drop libigt.so, link against minimal
    sub-libraries
  tools: intel_gtt: drop libigt.so, link against minimal sub-libraries
  tools: intel_error_decode: drop libigt.so, link against minimal
    sub-libraries
  tools: intel_vbt_decode: drop libigt.so, link against minimal
    sub-libraries
  tools: intel_backlight: drop libigt.so, link against minimal
    sub-libraries
  tools: intel_lid: drop libigt.so, link against minimal sub-libraries
  tools: intel_gpu_time: drop libigt.so, link against minimal
    sub-libraries
  tools: intel_audio_dump: drop libigt.so, link against minimal
    sub-libraries
  tools: intel_forcewaked: drop libigt.so, link against minimal
    sub-libraries
  tools: intel_guc_logger: drop libigt.so, link against minimal
    sub-libraries
  tools: intel_infoframes: drop libigt.so, link against minimal
    sub-libraries
  tools: intel_panel_fitter: drop libigt.so, link against minimal
    sub-libraries
  tools: intel_watermark: drop libigt.so, link against minimal
    sub-libraries
  tools: intel_display_poller: drop libigt.so, link against minimal
    sub-libraries
  tools: intel_gvtg_test: drop libigt.so, link against minimal
    sub-libraries
  tools: lsgpu: drop libigt.so, link against minimal sub-libraries

 lib/i915/intel_decode.c  |   4 +-
 lib/igt_core.c           |  47 --------------
 lib/igt_device_scan.c    |  48 +++++++++++++++
 lib/igt_drm_stub.c       | 129 +++++++++++++++++++++++++++++++++++++++
 lib/igt_tools_stub.c     |  67 ++++++++++++++++++++
 lib/meson.build          |  65 +++++++++++++++++++-
 tools/intel_guc_logger.c |  21 ++++++-
 tools/intel_gvtg_test.c  |   2 +-
 tools/lsgpu.c            |   2 +-
 tools/meson.build        | 126 +++++++++++++++++++++++++++++++-------
 10 files changed, 434 insertions(+), 77 deletions(-)
 create mode 100644 lib/igt_drm_stub.c

-- 
2.53.0

