Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CE1C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:39:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777EE10F83A;
	Fri,  3 Jul 2026 14:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HnLEsXbU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CEA10E2E7
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088930; x=1814624930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=M4Xoqe62A6/ivtdH/nt+xfF2k+1e8tKECkb6k3Hq7lI=;
 b=HnLEsXbU9uBlv/YZSziWQTo10nbxA88pYJ0z7bM/S+jnUFRdtfj54RdF
 1u7E/oneyIbZx+p+xzZlL2LI7pxljtH1nuNzsJug80Ugaqryi00cIzpla
 2kM/PnoPxuRKy6Xao4vXBZIc2r47hlus7d8+cFF7uP2SCVr6tEG+xxIO0
 G+Y/0ZIZgASQ776k7dpgZHPB9Y8p3rEqgW9ME5lFjISJIA9NPsNjThk7T
 s81TZN40V+HbLFLyXAkUGBOYyNySxSCbPWfxrZ8KpMyqpdBvwE0nj1MX8
 1dz3FuhDwAK9AVbp3f2mN/AT9N9MfXtFIHKBjrey8/BbXd1ozAycVoC43 w==;
X-CSE-ConnectionGUID: CJOsSB7aQ5qlqVV8H+O+cw==
X-CSE-MsgGUID: BikV7fZRTgyzRUMBpo/OPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="87523734"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="87523734"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:28:49 -0700
X-CSE-ConnectionGUID: 0xD1H5YsQz2N2WBoj04C0Q==
X-CSE-MsgGUID: hCj65RK5SIGn9MsQVQP8uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="250476089"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:28:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:28:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:28:49 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:28:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJwWYGgCo7biicz1M4UwtEmbssQj/4KiB8y6Oy8gr9auJkly1dWGFnySqrdNZZNzFI0UiBNz/Fw0x21yyTMg7NVhFqZdZrh42eGdZbZyrKhxt7vkUkTJIsNXGw+h8P8NKURx2hmPPqFlPl0p991V9yX4Uv8gPGICV2wetUAc+3YNK6fxLsTd4h+FsLf9RbTYi761tKfOSKAomLZOrH44MUJMr4krjIjRqcEJBFM1j5lmFbGgktB/KfVgwCxMi3kRL4VVKyYjX0kxvq4iQLPv9DyKipyRDfZqjcmqvbQsBlmXfr966AQ/NhkWm0oQk10e/qSpILHM+PrvPuY7eDnCzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ZyEZBwEkKkxF6PJKGgpSVQhKNc6ezRcMWQtsKJQdME=;
 b=iq9uIWvjtjSnTx2W0Ij96Ee7NubGl5RwNvrVRUAGqOjXZx8T+rlmOKUph4AKnsnnuBEeb9mOXkxlJrvuR76P2hOh9CWyFMOciBY/SmalbSo0fqyJxHaLsr9GgqFDypVJAcjKbpZn4vJeMDa9KfLg1jwCn/tQRGumc6BQvmkDJkU/F1iGdB9qweDSCITb3CsWn2+2LHhsDt/Iv1RiMztGRhe5Ysqc/lkQFrRZhRGioDgXK4QsWmuiUPEYmbK5wbe/LOVrvV472kvl+KpGVStLakm7z1xrjdlHuMBQ9HsAK9CNAleXHyFWpwpLZAnI3SBl1Jr4V9cFF9wzFzZI7pHnGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA3PR11MB8074.namprd11.prod.outlook.com (2603:10b6:806:302::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Fri, 3 Jul 2026
 14:28:44 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:28:44 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 04/31] tools/intel_firmware_decode: link with minimal
 sub-libraries
Date: Fri, 3 Jul 2026 16:28:38 +0200
Message-ID: <0bec7a4c3cea13d25059c26eebb4ac1446e161ea.1783088106.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1783088106.git.sebastian.brzezinka@intel.com>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0169.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::24) To MW4SPRMB0067.namprd11.prod.outlook.com
 (2603:10b6:303:221::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|SA3PR11MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e440c6e-1e7e-4f82-b117-08ded90f633e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: MV/Se2ZeVZYdqtRPDPMy+LRjACa+NNR8ECUvXUU2NqcnqzxM+aOGhO/rH3jofmxaGCoI0R5b9gB/cq8twsuKsBXZrlNX3PVFH3PSzHI4fKA/QMmaPOr4d1pzS3XdD1SUXk9J4f0l6rjgtA8eGaX3ex7mJtwGgBwru5e0eOOKPRgN7b3+P8FHMaL3HpyR4oSPY+9QHNWBOLkqsvwhLPThN347C5lrw4Ixtv0VVl2D1cxs6lvifKFsPy62a5cBmJFFsCt+5dpElYlhfRC2H83mZ2Oi8VK9gcYC24YHQq6o6srvPavV8wt7bMWg6X5qoSdhH7KIYijd9nGdrrdVGeak55YPUC0ISJzu4PIsNMsq4fM47mYIrYxztxn0Ifw5g/T71ODsZkA3CYOqjsfHcmCYoJtZ29QeGIIy0a+VgmPmvkKknJRP1d9Tnek5b1Fi0qHZ3OR6mVVsOUIHo/bRb7Q5P9R4Bcio3RzzB3s20pi6XZcpym57rIgbv/PX0gDRXXK9ubMWltOwV9qg1AZlbnoJLbDdbiZzIRxp6mxLKZvVomtBTKDX6RN1X1OPNmseP0V8qvXUuq9J6WSE/oVHgJ7qKTO73gzMjWXLwGTOIOR5t50ocUIv764cVyihBi+e5CZ/oMcoHfu4/Id0268ppI1pbp0ntdULABqqpDOGeNhQluk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+oXmNIdA0LrbNdVpj8RV6BsSgnqQgjrtPCa3j9bJrxkNoJ8KetEdup9qDmOp?=
 =?us-ascii?Q?X3dYDowhfsvc77bWKx3waLFyK9do6tU1IZLC771NsUccVRqkmE/Vftj9DB+G?=
 =?us-ascii?Q?fEEgrUYivm6aShIce+HUWXtkDRuo/jFJlojecTLgmOXOjM+WW19MDcHkE7ee?=
 =?us-ascii?Q?kAalzwu4xNMhURtBi/BMHjrWZVG/TuKd0wPn2OJCPWQ5Sc6/hk5QypcZkaPc?=
 =?us-ascii?Q?klWWFlEd7E643TCo4F7aVIcoV0SdwDqaUn43Ruruk8XYQaxbFgy3vdSxgoQl?=
 =?us-ascii?Q?rDAA/duec20x4WxIfI6lWLB1OE3LMJriw0s+7eNMA0Dr/x++sTXyz4hgxHHf?=
 =?us-ascii?Q?38Ecr3G1QBSa/r8THW8whOGvWjwI8hukonMg0Z71+uPnaBc8kK3mq2Kzzc8a?=
 =?us-ascii?Q?azRtcVX5RDk/dSwnwcuZwguj7Tglz8rvMPRyqO+Sw848Tx9qdj6SFkP+4ONk?=
 =?us-ascii?Q?MlLW+1iL3wEfbcjCwGBXvzJcDPIbeTD1sELMga5fNi7a3dI6A0dFF2X+z1ki?=
 =?us-ascii?Q?MhJnlqBr07cluO/tTUXX4qCS3+GCpebInvOh1Ua0VgUJLwNqlri8nLBb7W7q?=
 =?us-ascii?Q?IRVmbH6qKSwDEOk/Yu5hhTN/6ombQQm0GQab7q0TpmQuaw0SrYX/rtHr9MKV?=
 =?us-ascii?Q?/UMuJYQHl+CpmUUQC+JjSF8eudB1mxThc4h98bnSNc6nsb60cnHZBzGQ10gF?=
 =?us-ascii?Q?cS8nSmjPHeu8cJPIlA95Y2rYn3PdjvSvKxYfRlfzrx2BEXEvDjVVNo9OrANt?=
 =?us-ascii?Q?22GT2L0Yy0ZiOnycu7I1d/Gp1Hn2n7DJ1iglo2NpQPBgDlXBSES6mwx1iM15?=
 =?us-ascii?Q?pHAeoq8/LyRur+c8wmhVPaxvBdP/m1J5Tedr0XBUfdtuiivJLRbxol26Sj4d?=
 =?us-ascii?Q?IJwioArkXCzR7sBSWVV1+s+yCEE8PEln0T2bKkDD1+7MU8oGXPpkZxTHSR9M?=
 =?us-ascii?Q?CFhRgKg3BazffRSY7aA31qvHp/dcbU86MAv7kPKsMy4Q11SDkWjw1sRn+Txm?=
 =?us-ascii?Q?iCE0cHzMXrlqRQOblMve4XJ0MlM7KwgqEv6MFOg+2y2PrCMvnz2Sr94YKrt0?=
 =?us-ascii?Q?U0Tg2ai6e7JnVetp6wLk3BWpC7s+cFVdtMEDdABbsoUjJN5CfLongfzppv0m?=
 =?us-ascii?Q?VJHvs3y0BT/85ZTwesBylq3VH2MSG7ZGsItqOTPF5gzo+TABjHWW7xsrz9Ad?=
 =?us-ascii?Q?H74adyGgem265H1X+OaMA7nXcP5kmqlxyksJtQTPtSQb+eSXTO3OZQNny7vO?=
 =?us-ascii?Q?j/sGrk3PLaUYMFqm3xcijYvEgECpC+r22pHx9hH+qmWhxwoN+pWJyWrePED3?=
 =?us-ascii?Q?9C6CzdeqnGhH9ErOzD9TeG5vdAyt8+19xGMiDa+s1na7Bat+kYLMK3LmkUDW?=
 =?us-ascii?Q?RvPH6X34U3rXnCb87sX1FdtCZvpzxQfyrlvR4BlTpzpyQx8og8pYsOX6jyor?=
 =?us-ascii?Q?RXpzRBE1vQe1Do2hn8cMWQSGDsfp7761Y1jugdBSunKVr2dl9EhGsIe2AoFu?=
 =?us-ascii?Q?ijDZtHgbIg5WW3HJuT869ZssbRFhwAsMB8frUE9saFZVFRnuvVnV0wMqBrMU?=
 =?us-ascii?Q?tILjYpxujZXF/SUld6ceOuhdL97PAF2YhOxo9DuMaC+Od1R9Ho+wRdRsej3h?=
 =?us-ascii?Q?H2pKmeb6MSfrarmcM7IfGAbDSMOf1XHyNVKV57ZZCnIq5Y1mSbRvUjJr8RIV?=
 =?us-ascii?Q?pHyQq/ZoLqnlXj+4dGclANZ08IzfJDffvOokflSSdhzj0T3seYdYp6NZxxCp?=
 =?us-ascii?Q?GY1ovs+YnZ7iZpbCImakdChg8gCkUzg=3D?=
X-Exchange-RoutingPolicyChecked: laltxoGNp3a46hn+n3idQe8nD8mWBKAx9mysR89OBztrxzMLZjuS1fyqJgxAWX7Fn2010CG7p1BchYfprfO86gCD6I76PaplQw21aVzsh+9l7SyqoTGBhEBVFOdWJQx2cVvGyED1H9TBo4PMLg/V6cLikNMpzoGomXM+Qk+6vA15FBJnoaRSMpWk+8Y1Ye6BCWhE640yt7D13zaWkA+4K+Sj2S8HPULOefGO8RjH4gj+D+NGJEPcd5Qf377uIfb22nTxNcJCx6RYEVGm2gFy4gVgS1lVOrFunoXdd5qVgX7gShPzoIC9H2pvcRK1rMKnsuldiwbQTstBDvwFBv9W4Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e440c6e-1e7e-4f82-b117-08ded90f633e
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:28:44.8727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bcKH2hS16cEUp97umR0jN4N9rOolnjdcY7Bjq8MS4Q/qIYE60wOqg6krErGRkY1tDpyJsw5vDe7sfcvSN4IsUwikvpCK3jFv/P4byCzo5Sc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8074
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

intel_firmware_decode only needs the lightweight assert stub used by
igt_assert(), so the full libigt.so stack is unnecessary.

Switch to linking against lib_igt_tools_stub only.

ldd before: 35  (ldd | wc -l)
ldd after:   3   (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 286a718c8..4c67dde4f 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -24,7 +24,6 @@ tools_progs = [
 	'intel_error_decode',
 	'intel_forcewaked',
 	'intel_gpu_frequency',
-	'intel_firmware_decode',
 	'intel_framebuffer_dump',
 	'intel_gpu_time',
 	'intel_gtt',
@@ -62,6 +61,11 @@ executable('igt_stats', 'igt_stats.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_firmware_decode', 'intel_firmware_decode.c',
+	   dependencies : [lib_igt_tools_stub],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

