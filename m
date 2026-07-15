Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7FDC44508
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D19B10F037;
	Wed, 15 Jul 2026 12:30:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UNr9gGqp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F101610F024
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117755; x=1815653755;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wERf5lf/P/agVtZPSnK+JQWmmKIQFhmgWugfGZHP0hQ=;
 b=UNr9gGqpfdHAdCm5oprUtJ4+x35kwSEQ4r/aSKfzFTVV3tEcL08REEXy
 985b956jckWhdcS3ZisRuxxA/Jd2QiIuH6DR72PVqnrYqqsm3NlgWE4n3
 rJ7VO2Revu/kfkrwzqDgyUl9OlhG4PxxaE4ZwiaZHudD+N62QDGKsp9UA
 Q0PZjZkT1S535c+HwFkgv33LdvfUjxDI2zd5/rlIZJSe6M/+nIoX0phbC
 oWVSLFl8TwXK0+m1grNv3FYmoI2m0ZLki3P+vU2e0KLfp4AZeVcm5MHtS
 alVGil5snswg/DTGV5sGy5bJzj/oX7/DwIwWEdE3P2vc7QywztWPiCNIf Q==;
X-CSE-ConnectionGUID: TSF58AyBRmqIRS1AT8/SPA==
X-CSE-MsgGUID: iWo1yuyNSA2u3bLnboECOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84607079"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="84607079"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:55 -0700
X-CSE-ConnectionGUID: n4fgHiQeQ6GcDDqbNSJqXg==
X-CSE-MsgGUID: q6Dq802BQXagqH4Lvq/7xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="255659645"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:55 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:54 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:15:54 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FMJ2lY7nev3aCs+zjO3bEkr/JErliXvXjhGxzRpiS75ryaCa3ogQ+nlT8aVXTtZ6M64kzVLKi/V6HybE0ABjC7BkeNMDOh56HOo8+IZmSpHcOpBkkPWz9SQlfLc8HMsuqvZidnOE2D+JC96HcrZON9P2eUQOXuTO4mila67E8jLpNM+0z+RfCixfpdVDaUAjGTKB5sOZJ6AMfDFDv7Zd5ZOu0L534fHV9g2pqvVWVDcF+Et9Ud9Bpt9mnQT7ssy1czYNFp9mXm5K5JyTrAFpjQ6u4mxzPcsbl9f1o+brX/ONxQ4TUGjuZSH1rPVRuyBsMFbJp66ncA63/K++poZLsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tl0pW6ZdNm6vO1Wrst8hdWHuB6b0ptK9J6zIzZf7yLI=;
 b=aSP8SXHF5eXg53OCR+ygTFkfa00ZL2Nsi6CNu1QKB8piZu/wvdS00W0G3c0VZaWQ553W5+nG7JDcxN2SSY9o0hnuaMURrnI+V4T1ILCsHmw+5yl0sspAdHmrerVVs5Z9BTM6D1KEbDxJOPTr+jgAP9w8t2plw7w4InpD4j92hfzWVurqpINLR4FuXfHbVZS8TBGFnt95aSyg3fYpDq5q7+pEhl4pc/+IOrZKCzx5EMY9du05P3qzZLc+ZTyd3+qWH0B9SMjS3orAixrD7SSxkXhyVnRqbeCAtkqJAIw3pReQ+dNyeMLQrjNA++VeDu3mF1HzQLhT5BhfKwrGzUKbuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CH3PR11MB8096.namprd11.prod.outlook.com (2603:10b6:610:155::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 12:15:41 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:15:40 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 20/31] tools/intel_lid: link with minimal
 sub-libraries
Date: Wed, 15 Jul 2026 14:15:30 +0200
Message-ID: <7112af0f8df509f9fa064b093a45f6c4a913e268.1784117512.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1784117512.git.sebastian.brzezinka@intel.com>
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::13) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|CH3PR11MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: fef60715-1e82-4f50-b6a4-08dee26ac8fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|22082099003|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: SvZkN7VmcxQiMVxlFIFhOAPqKuSlkYXev+kq0Gg17u7DFtYrByV1TycCpmABHYQfD1K3jVNrHQRki+ysD+RowdV1MG4X712QR/bJA+pHp9V598WkDlMdmYyFjQ6p4YYpVzKSQqT0alH0HL0LtR+FPiNMNpw3Dy9e18SPoTio0zIXd18Ic+i78DmVUQzlkk9DVXeFiya7vGtSpsynVflO4wub0SfmH7vSmqx+4aXBJD/5f0QbxWo3hbP3JM3HejhBAwoXFhLui0shkIHLwj4yCUj0jrK4OOc+jphXb8HnVHrnO0MMX6Row8dFu54grTb5AJIEOxnmsCt/lIWjyNuqtDSWweSIvb+LA4f9GowxzXmFpQFeV4cloQ+hZuNnlahlGNtcWzliug8XE5bWyPUw+cE6Px5JGq6XPh5iCvwSeHuqs7+0A2sw7V+k2loyrA0m/RdOZ+Oh8ID9iw6TlmXnBjxw42lFBtJQDsNJzEVWd1u9I2gCGle2wKkzwnLH6QE0+1zxgtVpB7v/5mn678xyZIYZvu0mkWvcyXDHNATNE0W7qV+H1K/bboy56pRj341YP87t4U2IXRrIHSCQ9ePH3M9irhGWjBzS38Me7nYGAWxEla/2ainvBy/NW7SCC8bR9uPVALYBAgUUwVDmQuvfNdTWrtz1wPvVOtdj/P4e/EI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(22082099003)(18002099003)(56012099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HVJs8KdBnhowM8Z+eNBM7x43n3gY9a3dTQOPR9cX2aoUlv6aC8Zit9Kn9yQZ?=
 =?us-ascii?Q?WsueNLcMhvvpBdz9GNxHP75CulXsNE4gyLxzROGAnwfH4WPoo74u6tU5bMiT?=
 =?us-ascii?Q?0qW3U+mMukska5ocwgF0qNqyNwb/klyDrPMZ+C745ijt5NybEkUsIZxssOEt?=
 =?us-ascii?Q?ylffiPhmlq0wNO5RIxJNajg0aQYtbAQpMvV9oQigB5dZ0VfR/kJjEGuiROYW?=
 =?us-ascii?Q?l6smnPCZq1ywbiB5lURe1q3Q6J4sPtLHqL0w12eJZdPdkkH9lnCRqbfEJIMZ?=
 =?us-ascii?Q?7FcZxJwab5Jxk+6PItnp7Ve3GGM5kwIpoDInRqhavO/vxO2959/GDOA3U90g?=
 =?us-ascii?Q?dP78qRrhU2PdmZw5vxIQ1ILyadNxtAHYXy4ytpfnhWOspxv1I6REl79mP9Xv?=
 =?us-ascii?Q?UF7Cr+JzOUD7rI7jFzpxqztZ+elbJDgv/iLJPXFO5dCVm3XPBD2QlypaFzCr?=
 =?us-ascii?Q?cyS8JzlnPKP+6kB15yIykirMyY0cwf5PJYRkx0rbbpc/xB74XH6KNFX81NBp?=
 =?us-ascii?Q?wRIBYkhbXnW1YROTQAd31Fh4ii6hMz9EXaq2nboc4J96h3gT6IbfrIzttMgq?=
 =?us-ascii?Q?bvR7IwOlTw0BUTdJkrSF3zshBn/ImxBGmctqhmpl/f1BxtIz3KBeN0+ZfG+t?=
 =?us-ascii?Q?mhYwzTdNlyXUrn1iqxmf5uQMGWaxqf2myQs4txWXwKDyvrVvgx+ZDwk9fvkO?=
 =?us-ascii?Q?paJ9RrjsBzn4N829vVG0pSHTEewAoKtkvtEWg5XIotGA/xS6j7qtbT25DdPI?=
 =?us-ascii?Q?pQuAUJxY/FhvQMoHPCZ1LvEAwJOth+PA9jjKZ+R4aO6HCsbRI6d4jsFdmIXd?=
 =?us-ascii?Q?AuGaGYiljqDJOqyT6cs5CrzNQST8vp2A0cFnWu7t6cwllo7ZpA5gQU7XGSdo?=
 =?us-ascii?Q?I9Q7CwQMSzoGLUln8nXWbq6gg6qdKZ0OYVCWfGLizuSXy2VLcK5YP3Zn+Vy/?=
 =?us-ascii?Q?UCfFi0GN+TjDmlaZJ6MhjaykJKFtwn1Q2OkoGFPQIzilb/ojJbKlHMlzHRPT?=
 =?us-ascii?Q?A1BF+yc6JTfSJS6eKSLmc12MkWBY9h/xErHsK4kf6UEqxqeenYO77n41RCvu?=
 =?us-ascii?Q?S4n89ZQq4uMsR1xxky/5i5BPRoaZVLVdpkHvOkftYXYnKP4P72pw+HIM85k4?=
 =?us-ascii?Q?RG8Ldh09Ipn/HhZi68jmeSswMxEBuaHa9IKYdOGU/uAJny5xBBoWbrqumyI/?=
 =?us-ascii?Q?bIXhdP0SK0meV+mVOLCnBnnnsBqREY9Nb0VyKhCityj+s5DgIwaPk6kRwqXB?=
 =?us-ascii?Q?a1IwmDwqUx/S+b+zQcYNhUn2bKw7/+d791Q8O1uI02y+TgpQaYjhFtXREI+4?=
 =?us-ascii?Q?e0t7r8ZLnt9/P9b3p9Hs+Aq9OkabNzFx1sZxpMY/NWXh7+WXmuvYecuTf6gb?=
 =?us-ascii?Q?Bysgx5XfdpZWGemFpHqMrzFB59cSZgE+hqf6PihBCJqzuBs6SqsFZ2IudPgC?=
 =?us-ascii?Q?mf0eQlHy0qirJi/D4nqB1cZtuIGVocFev7DELvf65UeRuht0suTkG8jK1NhW?=
 =?us-ascii?Q?deHOgdEeiA3dsyaKl3xCQUUCeA4IhJcakgOL2wHRyZDxOqp1Zwewreod/nAP?=
 =?us-ascii?Q?e+gey2N1p8VCzOEr2uLemiLoHL6kzacZ1aXX9yunNhMQ6HvznfalvQc8H4vC?=
 =?us-ascii?Q?LQKFHEpJuLwLbtVZBW6V2b26U8StDiAfg37JtpDZn83gefsX1IjzMtGDaAd8?=
 =?us-ascii?Q?7UE1QOyIUtI1twkI43/pKEJteOqhM9TLherVY7ntMgMz/sWrZohz6uaVlccx?=
 =?us-ascii?Q?hVkrXukhNQ9ZdogOSqcMrGbequ5/ddw=3D?=
X-Exchange-RoutingPolicyChecked: STTvSexklYSqb3o79LcLui82mGqt4DSEtUgBgzAcND8Z0SPHKpOfYEa/5OfuCwiK1LL51xYS8Hl3BWgqEwTY4TOxtDCZe6O7k0l1uMUvPYy8XSlzt7uEbEBRr77qW29FDX8Q185WAJEfRpQxqX/yFYNU2ghDxnFVRRuI6GT/y8qwxHMASVKHcXB+tKn3LuF/FxxRnN8vcGfQV3vzYqMvYCfPPZ+/uk6qFWrwAKkOXFYI1nN/fs8t4LMkjH1BPrA0XrliMD0tIMMAx6sRmmYSkLC+AtSFgkFjsUAyusLW7Su+djGDbGV8SeoZ6CXN8XlO+x4WbsQNUaXS5v/1txXJmQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: fef60715-1e82-4f50-b6a4-08dee26ac8fa
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:15:40.4933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXiST3joeZ86RV7HTgXo6mZaxw+rj46Hg+dZTt8puws0TM6ogBJAfasgENuxtrhrir60OSjCuthw3MMuqyezWFstYdGwoGNsToxE50wvyTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8096
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

intel_lid only needs the register/MMIO helper subset, not the full
libigt.so stack.

Switch to linking against lib_igt_reg_tools.

ldd before: 35  (ldd | wc -l)
ldd after:   5  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 8899a5b49..0978f8f11 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -25,7 +25,6 @@ tools_progs = [
 	'intel_guc_logger',
 	'intel_hdcp',
 	'intel_infoframes',
-	'intel_lid',
 	'intel_opregion_decode',
 	'intel_panel_fitter',
 	'intel_perf_counters',
@@ -96,6 +95,11 @@ executable('intel_backlight', 'intel_backlight.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_lid', 'intel_lid.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

