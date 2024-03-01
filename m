Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964DBC5475B
	for <igt-dev@archiver.kernel.org>; Fri,  1 Mar 2024 15:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B06810EE26;
	Fri,  1 Mar 2024 15:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LDQzXuHS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8EE10EE26
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Mar 2024 15:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709306176; x=1740842176; h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=74TRJ8tyMKOhht3KgNE2kCtgUCBGMcCbyCvnPDoDcyQ=;
 b=LDQzXuHSvhjxVE4q5Ed+efHiLHaWxoJul7u1Xylm7Ufa53Op3eH6DEG9
 AVJg/7cpNkxFqDBnJZnRfOotPXiLDORl3ZczEr5eWoA8pAlWW9p5c/lc/
 wxzctYlGs/3RxvAdXB5PzCyrRJWpQ6yhQDCDtJZdq9h8Ds5dtzi4Nkj0t
 1ySkUrZWc2kTd45t1+R1nN0yr0UsXHXP6F5MRGo7bpRwqlYE1QhPn5SmV
 Xbo5YqkJLlrmn7YwuRbOj6cx7UH9yq0abkRAytAtfWq2eX0Q8qFSvkDop
 6Rg+PAaqCJkSH4XR6yud+TX4K50zow4Xn2tukDJhBQTAY4tKwROg+lexo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="3735831"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="3735831"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 07:16:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="8154019"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Mar 2024 07:16:15 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Mar 2024 07:16:14 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 1 Mar 2024 07:16:14 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 1 Mar 2024 07:16:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=anEYEFJAGzRg7hR+ZL0/1ne6HRbE6txJPuzSe6GXDW2/PgLX6W+mvVzwpEN7jtbs6+vGrsEVc1LVg11aK+HnEJCla64cwshDILQA4v3qiMdmJbkJbPF700xACiyG6rFedk03+N1Qhrpp2Q4kmlrEJ3aGhmy7Q4Tc84CqWMSOL6L7cERvL8O2N6zY84wWasGBtf70Jp0pOdzYp8B8zJRNTSpUMuSqrQoY1upyO4jcBs194Z0+X6CWy1kttKadZlpjHgArhaE73cXJAcz2K2tz4Oe2oM+zCrMgjNnuZeDLWOTMS5JTK150l52f78v3sHkOHR1nrOW4mS5RusJ63dc1bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1h6avs04qV+WPbw3fmkPFzxbqQm56yosad/XWOiPvMw=;
 b=YQe9Fyeb6bHYpu58GYjAugEtPXwFjYiAe9GX0AtiDGOIB+th66k4d9jkSHPwEKmzrdB6K2IJ9O920pihSrtbviXtgZxa9RuCxVmr+LFLSNYG/xZL2BMQk5YLqnMo/Ng5U2cLNL79uoqNNFrhj0SiXP0cYrD975rkY+NujZgfWsU74ysKZ9OTjtaf2NtpDkWrf9xp+9ENQYbYptQnP8rxMGzzv320WA1MJzqT3qv/KplDfGtuVP72M3SHkPMUg7E/Fi7czbVKVa9CkUD/8eUzd6oV0ZCfG86foZakNgM3sfJJkLu9RNhRAxLiXEX+ckNPozvW2tstRMZgf9kT3Ez0Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA1PR11MB7131.namprd11.prod.outlook.com (2603:10b6:806:2b0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Fri, 1 Mar
 2024 15:16:08 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7%7]) with mapi id 15.20.7362.013; Fri, 1 Mar 2024
 15:16:08 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [PATCH i-g-t 0/3] Adding some generic helpers for future tests
Date: Fri, 1 Mar 2024 16:15:38 +0100
Message-ID: <20240301151541.1280595-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0268.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA1PR11MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ec43990-21c3-4a91-6911-08dc3a028531
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o4nGPpGpqPA/OnXGu2UQhC7VQxTkDVRcmdvCbzLAfebjrgAWq+Pgk8XmsLq8up5dQE738gWD6njLBNZQnrJZCpbp8b20Yeh1qlnVGvtp+02cY7ZnucXuyk9XpdUUyp0joOjeCnwuyrVav9OQ3XHm6bBKC+fwygOSTByu2Fg9Priutokr7IoV89e9FWC72GOHEy5qC+YLErG0qvK1T9g8FsfEto3i1YnJffrMTcf72ZuAWZrUh86L3whplmuZDxEy0UdGEQFFb7VhgfALrrqGQmYRPd9L6ZPrBHlrDJ8b0oYMsHKcGzc44G5/4rZDE67BrK7UfzOFakLam+IUzwzOp/Ug9oUhEJjrZNvTgaKa06vSukzFBXk4OYds/OsnnRY8CtjOcQVkWlI50teDITizrVRlfG081JqXQWZz4B6dNIAq3tZUWi+e6lKFv/4uzJXoqhaZv0BkfI95jiVhu/4dLfSsH3c/sCX7eFcuS5djxs6lEEyGo4al4lO4L2CST2DMcDESwb1XRp3VstBvChNNWLrJaO2fk/I3f8SmipcyiUcf1KCJdNay5OpVjLdDAbiXWRkj5FpTVsuBc6FN42WvVCCoRJjdSImcpFLP9c5vRyorqON65whFLjAoujaHItox
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzBvSXJRRThEQkVVaDBvaDB2QW83VEpqbnczcXMrZkw5d25GMTFDWEZOVEN5?=
 =?utf-8?B?c3dydVlTTVcvTHJKR3ZwZkkrWEdUSlJhaXc2ZDZqd0daU0hGS1h2REphNzMy?=
 =?utf-8?B?MmJIUFFWZ0o0OFhkRFliL3Q3V0pqRnN3SnBISFVPdVNqWE9VTjRXd3VnN3lH?=
 =?utf-8?B?Q2luOWNmeW5UcVJiemhLUnUxTVpwaVZML29XRUJocWdhYmxvWXZyVjB1eUIv?=
 =?utf-8?B?THA4SzBvektmQmlHU0VzRG1NTXlyS2llZG1tZG9zakY2dzEwbWRrbEl3RStk?=
 =?utf-8?B?bnBtRmJVemwzNlhWYVBNZ3pKVWVrOUlrbHZ1a1pqdzRRRXdGUEtRR29YKzVr?=
 =?utf-8?B?Smw4L3ZvaTd6Z2lwbW9PV0VvR0c3VmtyVlRUNWdpQTl0azlIR2hUVmIvNG9S?=
 =?utf-8?B?cTE2T05UWG10R0Vvb0FRdW1HZU1nbE9ROUpuSWZQajE2NUZwM0dQbmxUVjVu?=
 =?utf-8?B?Ym1IM3JPN0NEMWhHdXRZeEF2Rml5SnBSbmRQcnB6a200WkFPS0poYWJOd1FD?=
 =?utf-8?B?UkxncU55a3NSSFhHK1JOaFBkb0NIdnNlNFNEMTl0YkVBalpNZG1iS2JhdnJM?=
 =?utf-8?B?Z3RyZHZzNXlKWG5Xb0UrNC91b21XTmFBc3g5UWppNlVIL0llVXZkY3FoRDdK?=
 =?utf-8?B?eDZ6NXpsdFQ1bjlCN1lpV3V0MUc4L2FsbnF2Z25ncTBQSnVRQ1J1T1dHS1Bs?=
 =?utf-8?B?QzNFRkdvL0lxUkFCWUlkY1FDVzRRRFpVUnRra1Z6QVA0dGlMOE1aUTRKZ1Vz?=
 =?utf-8?B?aGliU3h0Qko1MHlobGtyUHFnZmVZNGdnR0YyTnN0NFVRaVJmNHBlSlBiMFpN?=
 =?utf-8?B?Y0ZKbFVhYUlrMkhHUVhPT0pCekpBdzQ5RkhXczY0ajgxY1pFUGNyK0Z4UmZT?=
 =?utf-8?B?YklrblpwUk9ZWlpwUmdoL2ZsekwwZno4Q1FtbXQrSDUzTTZxWkJ4T3ZDMnRs?=
 =?utf-8?B?RDMxQWU2MlMwS2c0RjRlSWhDd2FRV1g2cFVmZFF1QWJHVkM4ekdLTjRuOXRt?=
 =?utf-8?B?NjZycXhnU0NMQnh5Mjc0ZWk3R0R3K3VyN3ZGMURLOW9LOUpyd2FOV2V2OGxY?=
 =?utf-8?B?VURKM01CWEt3dlJON05EZFg1RU9SeHRYR1dPSnRrS2VjeE84ZkVTeS9KOFNR?=
 =?utf-8?B?czBPMngzVVdzK04yVXVmK2RlU3ZGbVU0RTN4RTVUbXB5RU9sUkJEQlVZQzN1?=
 =?utf-8?B?U2lSOVpZb0xuY1U1eFo1cUdzR1pENG0rUExHSnJObDlRZDZmeURRbGdEcFVB?=
 =?utf-8?B?dWc3MDFWeTJrMVVnTFJMNXBvUWpmekwwV0xvdGJPTkdXWW1LQ2NVSEYyTTZV?=
 =?utf-8?B?UXZ3OXdtY3NVT2U1ZS9jcjRCdmFINkVUcDFUT3AweEtCT3BlZ0toS05UVmN5?=
 =?utf-8?B?eVc2WTAyMEdlVytkOExaN05LRFEwZUhIdWJDZ01ET3hPRzVEb1ZjUS90RTds?=
 =?utf-8?B?KzdVb1oyU1VlWnVoUy9JZ0d5SmozUElLQTRVamJsZEhYeW5oaGVpcEZqajRi?=
 =?utf-8?B?NFZGU1Z3QzdiM1B4VDh3Q3VQMDdMazVqVElta0wwMFI5NXU0TkpvNWpHRytW?=
 =?utf-8?B?R2M1TUpKUjlGTWxwSHFSVXdOS3h3NFdWZnJEUXJneGpNZVM0SmVEUmxjSFI4?=
 =?utf-8?B?dzZEOURzSERScTc4WnNKVnY0ZkU5U2F2Zm11aEgxUWxQbERTSFdjUGwvcEJV?=
 =?utf-8?B?c0VSR2hoSlBwWWMyNkxDNWtnNUYxNkxQaHJJZ3JpTVdaTG85SjRWOERqSW5L?=
 =?utf-8?B?OFQwZE81ZmFoTDZoUk5xZUJKQitiaCtsRVJCS3JaZE5RaE5BQlREYTVKeUNX?=
 =?utf-8?B?WGlGeHdoNk1zc2dMMHZFWmxMNXFlVGVSVi9vblc0OUVIclJkZnBQdmxTbjlV?=
 =?utf-8?B?b1BQcHNjT3dKeXlrcGhJRlVMTWc0WmZ0a21CWUExVmFxekk0blhOcVAwSTRl?=
 =?utf-8?B?ZE9GNG10WXo4NUZzREt5QU1WT0JNMC9XQjd2VldiNlZaTkFGU1dqemZwSDN5?=
 =?utf-8?B?bmIxUkNJNWxIZTZLbUNpaGVFc2ZUVnZsSyttYk9SM3YxaTJKWkhIQy91ckdX?=
 =?utf-8?B?NVcxWGJHWmNwVXN5blFhREI0Mkp6c1ByV1JsT0RyODcrRnlZS092NUd0RkE3?=
 =?utf-8?B?d2NaQXUyQ0tqSEFja3hiUVpobWJDclBaNUJDMXlBQ0xER3FtZ3JBdzl3M2U1?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ec43990-21c3-4a91-6911-08dc3a028531
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 15:16:07.9636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Tof1RnFcLWPvgvQFMva+OUNik977SNFt0EIkJOU2O88YDpO6Lmpk5cKlHRsD51PfqEagR8u4WTLgbKDH9n7Jz4mBPJb8Ny6YY0VriTN6DU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7131
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

I am currently working on some GGTT tests, but it may take a while to get
them upstreamed. As part of the work, I have extracted some generic helpers
that can already be upstreamed and used by others:
 - IS_ALIGNED macro, to check if one value is aligned to the other,
 - ioread64/iowrite64 to access 64-bit value from MMIO
 - xe_is_media_gt to indetify media gt

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

Piotr Piórkowski (3):
  lib/drmtest: Add IS_ALIGNED macro
  lib/intel_mmio: Add 64-bits ioread/iowrite
  lib/xe/xe_query: Add helper to check if given gt id point to media gt

 lib/drmtest.h     |  9 +++++++++
 lib/intel_io.h    |  2 ++
 lib/xe/xe_query.c | 21 +++++++++++++++++++++
 lib/xe/xe_query.h |  1 +
 4 files changed, 33 insertions(+)

-- 
2.34.1

