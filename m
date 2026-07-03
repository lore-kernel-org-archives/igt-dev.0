Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7F7C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DD310F829;
	Fri,  3 Jul 2026 14:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G+fN4DET";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB0910F820
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088952; x=1814624952;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mZai7muoV8VCvrBxPf2SJifYDNlI2XuP817XEmxydkU=;
 b=G+fN4DETcTMz02xuy7+Yv+qopSYoCyQ21yRlidsJM6jGJk06bQK237PV
 7aYYc62T4Igds7UNFtF3grH6Q9DGd0cv2ovjU0H/YF10yJ5Nv+QZwTXm8
 0vn/wqqizOr51+eoadcQs7faz8p1mo0JREKNLZGZkvyrXcMuoUq59a/1s
 4uG7X+vhoWepFKx8Dl5GudKMM7CztzfURx2PWuawLnxOmN4dPuau590xy
 6bVJTEGpTAvXGwqj81ptvSCse9qZwToc8EKEtsT+HzWiUcXHuO6cB1Qy+
 udD1Lal9Vn92huHtpkqM/92OH4vAKYpxI38RjEyg6eEzIU23FBwc7PFgy g==;
X-CSE-ConnectionGUID: +5DUVrcPRc+bmVJVOUnR0A==
X-CSE-MsgGUID: UXdtaf7KTcyltun4kfeU8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="101264073"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="101264073"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:12 -0700
X-CSE-ConnectionGUID: wtKkyEe5RQij5K3EkWOfVA==
X-CSE-MsgGUID: 9jbZ29vrTA+fDfby1h8WKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="257019502"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:11 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:29:11 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.61) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uBMsKI9VbZLkbGlWzm+1FhhK06a79LtNXTpzx5pcgAk4AI2q6/Reo8l48oBkFqFIB3Tcu7bMT2CDjh/Jclh0VGnEAMlC8q8jlhQtOBnbrk3CjVwastO3zAa5yc/Hqc7EnrclJhWTmHnwk8OEzRB7WkOyzgH/Ox9rKdYAE4cNINCp8VpT/XRbw3uEJwFsjeWwjWd2NRGDO3XQLUaWWnnxbrS156iEz47yp02ZK0K0JJBf29kcP25Drb9kU0XgbuqmYOX2YpIGyYiM31g1W/8NLbzJgPA/FWkp8nE8oqPlGAENxts9i9iKVesPOYqHQArLJWUGRWJ+i0EKHYdD/q3QJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zgRsVCCG36fFxRYVQ7gydoIlG/OUn+kboMHbvQ1j7Q=;
 b=gt63EOG0srksZKxSZk8r3R2NTmvyBbO3CGZlgy6/T4qXqM8i+ZUvkVrkK8SiaKO621jjUBDHV2fPoSjVrTOXbTvy3QcLBZxMNGK0N6AQduraRXsjN61ob8nuEstCKeQanHJGNuctaImrYpgqKXAfQoMkRELP7bs3rrL/zgFFvnPQCE1M8zjgAyxdrNV7VQsmXRNN6VJChGAvqiVIa+dGz+QX01Y0nT8yHQhoEg9KShxXBaofjTDv9gneWqWst5e+3MDWIVm8RpITJxgJLPNh9epyBbMJOTTdile3LBdRQ0jHw/qdasuM/k2KBnKTUmmvRqZmuB9Z5fxC8eXXupsccQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 14:29:09 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:29:09 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 16/31] tools/intel_dump_decode: link with minimal
 sub-libraries
Date: Fri, 3 Jul 2026 16:28:50 +0200
Message-ID: <71a8f67badf79b70dc76d4cb7e0d9133993670d1.1783088106.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|SA0PR11MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: a6d37581-5d09-41f6-574e-08ded90f71f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: ukbJ7P7Isaf3ytrGKDtM7m25NXUgZsQfNlTyJawz1lNslTAA5mlmj5bEvakrsSJOnt07XI8VyaOZ7io/771gmURYqpiq0GUduCKb/A7oi811TLCcpwm3uB4Hu+/l4Er3D9coOwdjrsN0hQmaRSiMqozSTZ2VtQ/9RBQ/faUKkhqzeJYGRc5iVUxaSgf651ql8tzw9mbIEZZh49Td0TveqkF7RnostjiUn4gt5ASdC6h1acEI8B6k9+UIDaHF0Y+KzE9U5QD/9KkcWH9jdwn0wsl1EWkrqc+s2zfWEAijp8T49lU36G5PuVmdqjafsNPFV0XQSCJBZCq4jeu8lQdwYGAUdjdgC3V4JlwpzMLHgH0Jk9taOfqhJdUSH+w5aRuDKNqPWnfV76DgBtLfbxpFD5oOhmeXYMCwumnmFnl053h0pW05e6HQMsW+LQUCcu9I2KQhFa5eeXtkt6OHzQmeECWlshfrD3mzW4I2cqu182eIb8dWjPyLX9eiMgLFmnxs4WmjzJ6swOiWCm/IzJDwjw5JMjCZa5wOxTbMC5xBza8r0cdUD+lN4yYbQYlRbWMhqhBkivYeruQOCnIaY46m1RnvAPg1yaUrCAagEvuhrEGxeSO4ozurU1ko/hbuA9bbXOc+1jdcp9yZu3RFy7aMJQTDz9wTwY+E9wbZXfnjqJ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lWc+o8fzkVpaqG0LYZ1pEYyGJfouD/b5dYH2c/EIPf+ZqVcvuREuwQJ75RZD?=
 =?us-ascii?Q?OBPZleg3FljqX8/V4+2W+P/teVDiKahTeav+JPvuN5zn7qFZTwIiMZSAyy1E?=
 =?us-ascii?Q?TVYqzSJg6pyIeiiZdo7ELAA7XG7YFIzIMs/wVySIeHV5AA5mRBeLv4vkB3Gw?=
 =?us-ascii?Q?t4y8D7Vy04b6VB8Yohu0WhP6CLXj4Vr0pxgt6UE6RyNa++x7L+CEwS6h+g6s?=
 =?us-ascii?Q?zRGau9adEQ+wXXAFmTgpJQbTEIl0WxOSOfzMlAFqxOqDrwOhn5x7Nm1O473b?=
 =?us-ascii?Q?iUCkubvGRtAKZpZUjYq7gYQJXIKO/4TahTqw+/vd/x2Ic3mP3/WPv27DvRUL?=
 =?us-ascii?Q?xiyCX6zpWOdnmTCMLxCNduru9oMYjYmAS9TCc57uOx0nmwFJvsLPuTAaa903?=
 =?us-ascii?Q?TYmEQVV31Ruomm6pgx/eU6del0Mm/jN0m0d1h33siibPfMb8gSYVh31Efmpk?=
 =?us-ascii?Q?GC0gK7C7it3+6CiyxgNPPrtOxlbTNozg6gJVyjdvP9zmMMqZumLSzRFSQcaJ?=
 =?us-ascii?Q?6K1tPJLOODNMWWctwagaYVpjKFhk4u49Fr9JaLYrI6PUGWgPYCt9+DRvjxEG?=
 =?us-ascii?Q?cT1Mf/wh/cPSIRZZ2P7XtX78nmsS7Mpx4Twz/TayRxMz/bWSos/BugH+B3rl?=
 =?us-ascii?Q?ItJH2mpWVuM/quIx63P94tXpVktMbVTyRSH9pc/blR6d6cqihGTNIah3B+TI?=
 =?us-ascii?Q?P8MDf5XfLiUrRXEAnG3Wp/TGaJIAXuxwes+1VFiCwE+SiBNSlG/M+FjOACLj?=
 =?us-ascii?Q?wk46+PszK0DI2rp47wB9bmR8OX7djjSGw9tFoGAgDAWsKUAArd4L86mhqSKy?=
 =?us-ascii?Q?z0zhSxv3ox3NJY8I76IbG8+esh5mZiKXFKYiLhApVsvp4z4Tk0MbBn1o1ENn?=
 =?us-ascii?Q?l4zUi1Ouy+LnpJWj+kvqJmGHPvlEYfYFTntu1C/s2DUEIFd+mlkeSbNz+4qS?=
 =?us-ascii?Q?IpZ+dDfBE70dpxy/jYfqiSarT59Zb7v9Rw8r5pPGiJKTrzPNVXtKv3jMJ2VZ?=
 =?us-ascii?Q?7JeRWUgCkQu7CvIDHQMAXYfv22Qri+umB5x87VkTlnOM+X91KbSXkvh1zouM?=
 =?us-ascii?Q?K3C4uzf5ASkCU0vZrIUiv0XCmfKJURovS/cKEw42no9ehDkCO/IWf7UAy7+O?=
 =?us-ascii?Q?gHMgt3lm6vbJ6pLIm+xP6J4UnvddH22Nj/lCkJ0vp7B9LNU0d9YlSplWPR5y?=
 =?us-ascii?Q?1E51nDpbLiwJgVW4Vp/QWvoPJ/PwkMpMjkpyUIRCQYb7hlZN0bK/5GG9hs/6?=
 =?us-ascii?Q?fUjzlzAE8xoIJml0FwMjCKXyVsJcx6JMmnby+HVHAKWQN5F2uanZj8c4Tcqv?=
 =?us-ascii?Q?2+pYdEykOoEBn+SX5bX1BM0C+zL1JEOetbLFO0B0IxawJNWbnvFc355eb2am?=
 =?us-ascii?Q?cdqQJszssCJ7xbdxhRDIuVBcuTwTr/FFALKRCwQrlVpGpwwy1GCbwlPziBMp?=
 =?us-ascii?Q?mDFaWMiGP7CgeLSAeTpk1AGsEAGl6Gj8ixuIctv2ZoQiIct6nhVWOKRlfXq9?=
 =?us-ascii?Q?VaE0xVTsWXN7uREleXgW8zIh0XywC2WfmLe6nOFSaUErx+u3J2UrqthDKBtg?=
 =?us-ascii?Q?7IqEmvKUxvAj+5th3GXulVzKVcjYR1wjtDUsus3vYiJDHkJpX4MKqpZuLQ1D?=
 =?us-ascii?Q?kseV8AUpDTQtwWd2wfhZ1hsSODviLfYhelML6xFdZ1GQ2taxEE0MswQVfdPf?=
 =?us-ascii?Q?jS5ff8ovaODkLAgfI0a/x/v1I//SfFKzlF8E/9UOYy8+6SmvU1fTGI/zaOvX?=
 =?us-ascii?Q?oKym/mKsZ6gE6xNYnTVJ/weHMQ9ldHo=3D?=
X-Exchange-RoutingPolicyChecked: TIHb9uj4x2HUxn3rEMLJU7NBXuU9bByMG/dcL+JriU3hZIgoo8N5VmQqkxMkdkGItKLWSRyzrFCv3dEBSm3t5FagZMyd377j3yEgnMoGZXWF2fhSN4woByzCFdwArkoHPnlWM5GHMPQgXADMXta2S6VsSzKQZJCsoVMTFTTLS6BumCk/lAsMqc575/VVbYmGeUs33pEl5WYvWGs4jfuuqsfRS8q36uUDX6WthqrC7CADMU4wYLF3zrrXm07TTmpBasw2sihXIfNMD/i8ViwZyrti9aF8Sc520IwEiNsF3ZX1wLAvJ5i8j+Iqey5PE6dXac0bS6Qy9lyhSug6uwsCTw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d37581-5d09-41f6-574e-08ded90f71f9
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:29:09.5832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z1XIkUC2rZ4IJOQh65PkE9ZI9WhHINbPbtWJWErnMffpkwHXa+ydqDDcqHd9k77lFA88HXDd5BoJyaAE8H9hPKhpjZSc4cQ8Txn2+wcfW8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4525
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

intel_dump_decode only needs the i915 decoder. Link it against
lib_i915_decode instead of the full libigt.so stack.

ldd before: 35  (ldd | wc -l)
ldd after:   4  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index a3fef87a9..467b8eea1 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -20,7 +20,6 @@ tools_progs = [
 	'intel_display_bandwidth',
 	'intel_display_crc',
 	'intel_display_poller',
-	'intel_dump_decode',
 	'intel_error_decode',
 	'intel_forcewaked',
 	'intel_framebuffer_dump',
@@ -80,6 +79,11 @@ executable('intel_gtt', 'intel_gtt.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_dump_decode', 'intel_dump_decode.c',
+	   dependencies : [lib_i915_decode],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

