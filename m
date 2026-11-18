Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA96606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 12:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C9p5Jw6F;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=J/UdrdmA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C7B10FB69;
	Wed, 18 Nov 2026 12:03:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F181110FB69
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 12:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795003317; x=1826539317;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=852WCxFSzeLXP1YfQJdPHReu6MfsAJhJpX6tiAvGuPA=;
 b=C9p5Jw6F0OMlsEC7uPqOMQ6MRNHc8p0Kc9vjUqBqdJztb9AMZfGGfWpH
 9zlYzKmaSoDVaWDFihtBRfAULeUr++OFQk/viQ+9He+SkRbH/a9W099oO
 grfz+TzRMEkwQApe5EeKpCOB06kUl2MRnIyks1FjufDY+uAXe16hR1Vft
 ucYvBqwV/yjqh0vzJ8sxLVZUh7JsDx0JW4MseSyogGyqsvzjC5ITSWpEN
 2TmwqHOadfQJMdmlSh0YKs4TpxSbi4+vMbSxr9g7pAZi+Q1KGV5z+3OU+
 Lr8WznvRSg5NU1iIhfSu9ihNI4KxgtEUyEoqvCVMA6aDYOIi+qWSG4yOJ A==;
X-CSE-ConnectionGUID: Ed1wSlTVT0qYBuNu8XlUZA==
X-CSE-MsgGUID: eyfIHTwUTjaxCmi/rhIu9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3726941"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3726941"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 04:01:38 -0800
X-CSE-ConnectionGUID: R8NzaoWtTBKWPVA3nOTHIw==
X-CSE-MsgGUID: MgD1PziQRQKOycBDasKynQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10144809"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 04:01:38 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 04:01:37 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 04:01:37 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 04:01:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxwEh8FfLD1//ayaiZzPGGpJ8Ft/ofBkGOFZrTKqm/WQSiDY31HFvb3umQBRLLPVNlGhS/eL3Ea0NYG3QHOctnXYMVoCRZ+929U4AuREwu4KR9mguaOOqhyeX4Vb260093JeEEsmLoYzXLmR6W4+eXrps1I8irWnNyl8ARrid1mcToRzDm19m7cSov8ZPsFkAwbsBSOPBQ0OyxXootD3wU16t1o/YZRwfDQVMQ6MaOal+FiApQiyuvRWT2JnCGURqMLEMcJ7GWMi54OiyqJn+P6O2GKj6KMvau0Fv5oJ5l/Aut5jKOIuj+KwN+24pBjwVX725ymWiVcghqtbrcoGLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyV6k2ZUlWWUp5W0vcHo27xsiTGcsL/30ozHVlVj9tc=;
 b=EzNuiIOoNauf6+GQ/5KKf70QTTbxZrrjuBMPtYoSt7nIhABBFcIrrRLtZr+ip9H2W5ASgKvBoMhhfgtsWNp6G/pimsMjb3syGD3hWBFk2vIraZBOyl7j/CtFlz8mvGPANs3/gU98ca4TXcS3WEf99T05slRmwtTCvcK2TIOwbdp19NiwzE9WD/zetnCM+yhuMjhP7N7lhRvr8A4EN0DaO3t82Griw2euB2IKf47yaS7XAMV8/z0NXKoIyi3waPUdhXo1E18CZRiqFVeXNs9zNkhb669ylXvQ9+Cywbcj699wdKSPuStn3rMjWvzwGNO8ZV2gpDdlrPuo9vnkqFEyoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyV6k2ZUlWWUp5W0vcHo27xsiTGcsL/30ozHVlVj9tc=;
 b=J/UdrdmA0lSFJ8sx+6kVY+EUu+rFfyGWXVowLmwDiT6LDI5SQicTPeldgL4w47FQ8crbiWAxRNOa5lvwJIEYlDN7bTA4oVXnllc6d1/xS+B9ymQ6iFwKazGSksWsCIsQhwFxE4+fI3sZl1eY/Sk6Yrb/BJIbaye17evk2zZxS1E=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PR11MB134916.namprd11.prod.outlook.com (2603:10b6:8:4f0::21)
 by CHBPR11MB656690.namprd11.prod.outlook.com (2603:10b6:610:40b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 12:01:33 +0000
Received: from DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4]) by DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 12:01:33 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>, Peter Senna Tschudin
 <peter.senna@intel.com>
Subject: [PATCH] tests/intel/i915_hangman: Add
 engine-error-state-skipped-capture
Date: Wed, 18 Nov 2026 13:01:12 +0100
Message-ID: <20261118120112.5434-1-sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.56.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0655.eurprd06.prod.outlook.com
 (2603:10a6:20b:46f::23) To DS4PR11MB134916.namprd11.prod.outlook.com
 (2603:10b6:8:4f0::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR11MB134916:EE_|CHBPR11MB656690:EE_
X-MS-Office365-Filtering-Correlation-Id: c4e5c7af-5a9a-43b0-eb49-08df456bb04b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|6133799003|18002099003|261009223027099003|11063799006|56012099006|261026121527099003|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info: p+fr7tGSMbI4wpxKf4zfG65dMLCyGiYlad4L1v+diXzYoqV/pwqNE/GBHXUbp/sTcPryi4PNRxXE9Qqw9YZBqci5lHFVc4+SDFIAlCVEv2OKG9l4rLpB5Or3Fla/KEIzs3L5DsMj7KU5YioccbWxutNAoQiFgtgkMiKh8wyVscnugQ5FL6kGcJWxrZpeFnBv99I11HO2LxKS9czQNXmJ7xicJw3FzNSQPWbeI7s7GYP94nZhMXlRj1VbYEtZl+9Iurjfa60NrzUi7k2yA2GRwurjgIlB95Fy+5GDKyC6ahFR1cpBiZkJYKCBguuy8297ee+3sTjpTw5S19c3UEG0FsxvsRbnsD/IBmGSHXreclG2f7Mt7ItdEtXHSv4+6+vZL+CpIKuPu4/s+hHPzcuGhHEUdPPEqly2WGxCH7QwcBVOoAx5XshVRRnVSltl/MIvIre5exzoxRmGwDtC/zJgtlmY7PG694Qefvb8W+3qzrc4bo05G+lp8jgzd+VQC6lGm9TeN/hNNaptaMy7J0zjoA8+Kwg07EWX0wMOnc5yg9P6JpfZaFBgEzQhu5KNuioMyrucucsj7uz6yADbQ9Bz6+lwTnmR/DzkxrfQNmiyXoxHqg6iUW2n37yR8FqWKqXIEScez4Kez0veCjwMAEAzNL5hdH4Q63Ijo8bHoxxQg/0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB134916.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(18002099003)(261009223027099003)(11063799006)(56012099006)(261026121527099003)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003)(261022075727099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hern8N8CUzFp9LlpwmR1//+vLFHHvgq0r9gGwwkIfNoakkHkYSAZgZrW4BPM?=
 =?us-ascii?Q?2/SF2+Qu1VJnGPp4NTnkRGH8kzkh4IU49jcaV+XAXj01l9YrBbfPzJQlBEVG?=
 =?us-ascii?Q?jYY/IqtW2rC7L09LmTc5Bwd6Is7vAEyBsGAV6m/QmYDkyVQ9b06TWZ4zhD4H?=
 =?us-ascii?Q?83oOYRYckibkyA8+I6BSfNa5XOAXvDofvlmiQrAPy5MQwHYTxmTNi3b0D10G?=
 =?us-ascii?Q?KYfn6XhEvK1uZjSkCJfG4DJD1rSa5ZZOsf0sRGuTD54cQYVJ53wwQeKbBmVj?=
 =?us-ascii?Q?gec0wA39aeNflOdXyIFiPe6RozNMc1vE95GBVEKjrRcg+dPLWV06Pg+8FPfW?=
 =?us-ascii?Q?R06v7qrEgF+CU5poU1rzHEH+2RNYY2MnMJ9gp3wf68dTXQYixnmSXqPgqNPu?=
 =?us-ascii?Q?9JGurBE3hFGh9ssOrggQGZepxon0a06xbk2cWjKfzzVLFM5/xKbF0GNmgG7p?=
 =?us-ascii?Q?EINrdgr9uS0X7SswR1qw/vVnl4E+F+ABb4MTErmI33MgGK/rdpnvK4Mqm9qX?=
 =?us-ascii?Q?ElCyvOOfIin+3e5cV/e4rGTguKKl33Cbzblvv0iagjw7p+MBLC3TzX383Ty5?=
 =?us-ascii?Q?l2sakXjfJyy3v6OUroKYoQFDhoqCnYxy7NtjB9sT/GjAdx3k67HtFRYaYwas?=
 =?us-ascii?Q?oQ+Dxt/GkQdSxF6yUn7I7I3dBwKQ4IOO7APePWYXkKrju2je4qCvtkrOJ+E+?=
 =?us-ascii?Q?gJP6on0SIUTA/8Mx3eA8VTQitayzWDvTn0i+9DRHNX9qKlqtkzrOyIGLAxiW?=
 =?us-ascii?Q?5YcPrf0PjLpyIgeU96vDNEnTgJmcSljKJQUny2StKNUdD3UBPq9iFOBBRPLW?=
 =?us-ascii?Q?eY/dwp37/Bh8JTUeWWr3NgIU+SzUx/xIGs2COrdKbhZ5+qJVqeQEEmrVUPIg?=
 =?us-ascii?Q?RUABmHLnHCnyl18APSvEieJYuwPuOZoK0bT+1ZJcRjJjR6aXMZ/0o2+6PZFW?=
 =?us-ascii?Q?gz9RqkkII6nKlOOdQNdbfMuEv0tbpoaItfuU68XUgKnL3iom5jKLt7bSTMe8?=
 =?us-ascii?Q?pM5wFlIDU5AjPKv1UwMeAgow8sxw6Oool11cDwzAWLkzi1fIPGpyCn9g8NCs?=
 =?us-ascii?Q?uooyGf/g4rWyHLYxqs7hePRnBG4ONaTwX9+6vtVVIMDtkWMFwPRx3Ym03Aon?=
 =?us-ascii?Q?7zDa9iCQjbjJs2DTliI2aQZFWuVaYiplzkHPp74ya0BUEIC8T8YgczbwqPLA?=
 =?us-ascii?Q?mNFaOnT8a325AV+ajV9V9aJ7iuVgmEMpJbR3YRqG+PuTatP9Qgyumemw1geM?=
 =?us-ascii?Q?tWR45+dpCZaGxBEBpWHBOX06OxXQrI862f0jYSzySIUYC21bKEGBO0I+oUWb?=
 =?us-ascii?Q?+OuwG97ws0qn5r84C0JOcJ3Tn1Yj8Pd80eYuy9kEaz8BpBDnsM6XVR88fs7k?=
 =?us-ascii?Q?VZU4DX2HXyVjxmhJ2iFQpbhXwl9vhs/4w74xoNI53O2whMF5G+TFXkcts9Sw?=
 =?us-ascii?Q?CSAtN4kpoNGx89P74bzPrCbqLYNziir5A4QdhezDaBfD8axBbDjkFp/jTjcn?=
 =?us-ascii?Q?HrMUjI8pITPBKHbSEXertaGhUXy8LtJn/FvLtFUgS86Y4Eau+HrZojpG6pIY?=
 =?us-ascii?Q?ljHHVZf2zIpLBj4Z7SwArqzHCwCR85AbtD9aY/Gt8LfIU+WNVyJymhlf3zbS?=
 =?us-ascii?Q?17XJt5a5BMgePBf6Xp7NRysSaqn13cR/qXnBjcdd/R/dftIZ47nvrtiC6MCY?=
 =?us-ascii?Q?JdlgBvbY26HtyDj1VB8CCvk5mv45zP8jozwrKQeDScdu6fxz3MEjxJZbTHj6?=
 =?us-ascii?Q?9BgV5gfLpFdgoMgJ4uInAOBKocoAI3Y=3D?=
X-Exchange-RoutingPolicyChecked: p/k4TrypBMbEfX2GWJfhjrofZzGvzynPtvpj8yxpMX1Vdr8+QQLpk3ihLkl34ftx+J2dVUtY5Xi6+RRQ9sGJUjcbJA2hjpsqRvDyXhW5Wgc03Jn1kMG9+10x0hEOP3wtkyoRO7ipt9c57b0qDHlCayftOdn+aLybNHh1eGeHD3T477W9/FY4cWicaytx1SQB7fv1G31mpg9UhvXwq+ekDtybJIrPqH33dn/oCyMW4oYrPEAGeiqvlEOuyX7FnUp1Z9xYYuckIqv94ugpCtGmFQFSdrbxkeuS66VwUwx+E4FgOCjh/++UE9p/MdkXfSNDpdImTyZ4SJ+cowHPva9/WQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c4e5c7af-5a9a-43b0-eb49-08df456bb04b
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB134916.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 12:01:33.2846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lq+S41kM+8jKIHwsed2bhWmK8sr43chHFJimN1cEDXE5uYfB7V/u0vn6aa4s3LDs9huMymu/Us/c+/jc0Qz0Vobg6hvxHEXLIdIUdfbIuQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR11MB656690
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Check that a hang whose error capture was skipped does not leak into
the error state of the next hang.

With error_capture off, hang a context on the first engine and keep
it busy there. Then turn error capture back on, clear the error state
and hang a second context on another engine. The new error state must
list only engines that hung. A stale engine->hung_ce left behind by the
skipped capture shows up as an extra engine with "hung: 0".

Needs GuC submission and the error_capture parameter, skips otherwise.

The test is based on the original written by Peter Senna Tschudin,
and was partly generated with the help of AI tools.

Co-developed-by: Peter Senna Tschudin <peter.senna@intel.com>
Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tests/intel/i915_hangman.c | 105 +++++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/tests/intel/i915_hangman.c b/tests/intel/i915_hangman.c
index 9414641a4..3e636e130 100644
--- a/tests/intel/i915_hangman.c
+++ b/tests/intel/i915_hangman.c
@@ -70,6 +70,12 @@
  *   Per engine error capture (engine reset)
  *   error detection
  *
+ * SUBTEST: engine-error-state-skipped-capture
+ * Description:
+ *   Check that a hang reported while error capture is off does not show
+ *   up in the error state of the next hang
+ *   error detection
+ *
  * SUBTEST: error-state-basic
  * Description:
  *   Basic error capture
@@ -441,6 +447,100 @@ test_engine_hang(const intel_ctx_t *ctx,
 	check_alive();
 }
 
+static void hang_engine(const intel_ctx_t *ctx,
+			const struct intel_execution_engine2 *e)
+{
+	uint64_t ahnd = get_reloc_ahnd(device, ctx->id);
+	igt_spin_t *spin;
+
+	spin = igt_spin_new(device,
+			    .ahnd = ahnd,
+			    .ctx = ctx,
+			    .engine = e->flags,
+			    .flags = (IGT_SPIN_FENCE_OUT |
+				      IGT_SPIN_NO_PREEMPTION));
+
+	igt_assert_eq(sync_fence_wait(spin->out_fence, 30000), 0);
+	igt_assert_eq(sync_fence_status(spin->out_fence), -EIO);
+
+	igt_spin_free(device, spin);
+	put_ahnd(ahnd);
+}
+
+static void test_error_state_skipped_capture(const intel_ctx_t *ctx)
+{
+	struct intel_execution_engine2 engines[2];
+	const struct intel_execution_engine2 *e;
+	const intel_ctx_t *ctx_a, *ctx_b;
+	unsigned int count = 0;
+	int hung = 0, not_hung = 0;
+	uint64_t ahnd;
+	igt_spin_t *spin;
+	char *error, *s;
+
+	/*
+	 * A skipped capture, here because error capture is off, must not
+	 * leave engine->hung_ce set. The next capture would report the old
+	 * context on an engine that did not hang, or use it after free.
+	 */
+	igt_require(gem_using_guc_submission(device));
+	igt_require(gem_scheduler_has_preemption(device));
+
+	for_each_ctx_engine(device, ctx, e) {
+		if (count < ARRAY_SIZE(engines))
+			engines[count++] = *e;
+	}
+	igt_require(count == ARRAY_SIZE(engines));
+
+	igt_require(igt_params_save_and_set(device, "error_capture", "%u", 0));
+
+	ctx_a = intel_ctx_create(device, &ctx->cfg);
+	context_unban(device, ctx_a->id);
+	ctx_b = intel_ctx_create(device, &ctx->cfg);
+	context_unban(device, ctx_b->id);
+
+	clear_error_state();
+	igt_info("Hang on %s with error capture off\n", engines[0].name);
+	hang_engine(ctx_a, &engines[0]);
+
+	/* Keep the first context busy on its engine */
+	ahnd = get_reloc_ahnd(device, ctx_a->id);
+	spin = igt_spin_new(device,
+			    .ahnd = ahnd,
+			    .ctx = ctx_a,
+			    .engine = engines[0].flags);
+
+	/* Start the second hang from a clean error state */
+	igt_assert(igt_params_set(device, "error_capture", "%u", 1));
+	clear_error_state();
+	igt_info("Hang on %s with error capture on\n", engines[1].name);
+	hang_engine(ctx_b, &engines[1]);
+
+	error = igt_sysfs_get(sysfs, "error");
+	igt_assert(error);
+	for (s = error; (s = strstr(s, "\n  hung: ")); s++) {
+		if (s[9] == '0')
+			not_hung++;
+		else
+			hung++;
+	}
+	free(error);
+	clear_error_state();
+
+	igt_spin_free(device, spin);
+	put_ahnd(ahnd);
+	intel_ctx_destroy(device, ctx_b);
+	intel_ctx_destroy(device, ctx_a);
+
+	igt_assert_f(hung, "no error state for the hang on %s\n",
+		     engines[1].name);
+	igt_assert_f(!not_hung,
+		     "the error state for the hang on %s lists %d engine(s) that did not hang\n",
+		     engines[1].name, not_hung);
+
+	check_alive();
+}
+
 static int hang_count;
 
 static void sig_io(int sig)
@@ -627,6 +727,11 @@ int igt_main()
 
 	do_tests("engine", "engine", ctx);
 
+	igt_describe("Check that a hang reported while error capture is off "
+		     "does not show up in the error state of the next hang");
+	igt_subtest("engine-error-state-skipped-capture")
+		test_error_state_skipped_capture(ctx);
+
 	igt_fixture() {
 		int i;
 
-- 
2.56.1

