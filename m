Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AD9C53200
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:07:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B400C10E631;
	Wed, 29 Jul 2026 11:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f6fv7lIq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6F710E961
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785322984; x=1816858984;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=LL5PXO8WaiAGkOskE9iSXefnTmf+0x1r1IngRdCw9Rc=;
 b=f6fv7lIqoHxuZQSAWcN3bnxs5sswc8hn3HQR8U/i5V7WPNiZY9hhf5ea
 VNDHXtmHtMzKSaFQ6nv+HQU67LVP2AgTUXk/Dhtgwcjtt84HAnug9pEFU
 Otg97fc2mWgoYeHoB02gFEbxuxbgBZyqcsHsPCJOxnmScC6YOFiDh6EUd
 jXLjE4kFR3RT0LKahXOf/YFWV6ICW/ZqpDCPv/ffRnajdcnNA6YjEV3EW
 tESUN5ZIB9Y3I6pU1VkfgNeK0x9B2gUQaJOMtgfm7hOpk6glOkEcKjffd
 NAx+RZrOLHGTCFYGBVkD0VVpAXse4RW6R7qbsc2NVM60JvGRCDxbo2JYP A==;
X-CSE-ConnectionGUID: H3ml8n8gTMOIELLreLtiCg==
X-CSE-MsgGUID: dOquzJRaRcOw8fk0Z0KOMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108718961"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="108718961"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:02:55 -0700
X-CSE-ConnectionGUID: rbpqAQuURUyR48vKU61Hqg==
X-CSE-MsgGUID: ZlbVqm7VQOilNZVaHIO02A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="258204755"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:02:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:02:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:02:54 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:02:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qGoGhJZ6YBN3V2g+zEz9cEJtPwMPoh700ZAJfT52p+lkgLfUhmlNFIw8et0YBiXeW04EMqvl0dstJ5DEzFZkwdTMt4OmzM8hRz+Fuum279xyW7PlL6lm5VS45r6Lq0K1dHFkwOiSfgUdisVK7feB+V4A8UorYYyiNj4rvDTyGe44jk8gMtj9m+BgGdH+E3ds2KD5+CVgDDo6tYjmSQ8OiRJee+t2QfUa7lqlDs76QLLEZiH4OhmSWWUE5fJ8sMPRbC0oyBNrEj1D6aa06B+FyT6cghNwqMBfKUCUsq7YmuX3zP4T13jLtH0B+8a5GpV2Y4PzdwfdwVhEpMwBro1ERQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iaLkcL6iTw38E09VNaOBygBleCPqwFl+2qFEFoWOWGM=;
 b=XY/NbSn80PFeRotiX8jJg6X5fiHewgUXQSYBnFym2d4p09mFn0zHER/vjDQMpzwzAWZfa6sPnBepz36mp6GuWSz9C6fENf1E+PH9JjErFLKNYdF+HvhOcbh9ohRMN9qhmL0I8YF197OnR0f3XVFzIXLznTOBT5z6YlVcNvegzhcXRUWvfKdLGJCsuCJGCDAY6dJ+wyPG86qpxQirk44cyHJJXEnl1psWysqQ/bBSauSBfldcPu/mwuBBMLk65Oxel2J8Flo07eegSnUaEy+7CqK2RqxTNzwNBt5KL6whCI42uS/zJdJ+Bv4j17959cYWllbAYOgvnepGjkRElr490Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MW4PR11MB7104.namprd11.prod.outlook.com (2603:10b6:303:22e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 29 Jul
 2026 11:02:52 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:02:52 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 04/31] tools/intel_firmware_decode: link with
 minimal sub-libraries
Date: Wed, 29 Jul 2026 13:03:21 +0200
Message-ID: <d8f95de17b606e199be6889987b8cf6596b90416.1785152675.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1785152675.git.sebastian.brzezinka@intel.com>
References: <cover.1785152675.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DB8P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::21) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|MW4PR11MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: f6c74e40-f600-438b-fba5-08deed60ef59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|10067099003|6133799003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: VcOX0s+o70JbCtRp6TDf36KYdpieqYwenfzISxPfMk6rrGI+RB3nVf0pShNBJnwzKYVy61OWBbr5hhEoH9TgKPrlj2z1Q8X7/67ILn01ZNzaWVgNVQp68UPhWzykse8vajqf71BSb8bM+6mHnzpV9xDdFQxL69SNV9BzSO1Fi0/4++SY7gDohNDKcAQbJIO8Oc8d+RucwWyZ60+sKa1e4dF77q3OapSWryRjK63SoFYuqjF9cM4c4IykQljf3mvBtzQiS0gYRZG8L9QjVDAxVrqowdGtAxC+C4oW7NW8OpfW+5Sq1Sh9P2d3SWleX+ofvBFeJSKZNWoyQpOpB9+XKbYP2kWp7T+9pDPDQBOXQGBqKND/I1wubf3sqllIw2tZ4vvO64tNx0opFoTntyChwcSaXAQm/wji56cOe5KqpKYE/URiY/brXm/E43Dn9wuHL3mmgI80O//vc5BVLSMkCH0j9KTEll5jMTE/psUbiRqG9zlvq6yenYPUynFHcJFS53KLLJsq6rUvUrr46YOCJG72M2H4gk5nKWC5jZRhgLUhIvN65m0yPwef3rti9k7b/O0+po/2jRwlg7uCij/7O/UbsKEmeGULI4amQLgbbA/3fZUQbCiSQz5fTs/r0QTaOmWyngg257DMoBRP/PozzGPI5AjKWV1cZSCuWTnU/ho=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(10067099003)(6133799003)(56012099006)(11063799006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JXU8ofG/kpNygADTC+86NYkn5PwL36AcbcZo5JDL/IUmL+z3uayBXcGfiSDC?=
 =?us-ascii?Q?NLz9y6IRW99zjr3gqmkOtzTgNmqR5XhUNhLTntfoGA7pBMC7ydCqNV0QGG1s?=
 =?us-ascii?Q?JvXzwKhV39e+r+zo+qHVLdlPLAbD+qyPjqcb5N0VOe9JkVK3Xk3W7Ka+gqNn?=
 =?us-ascii?Q?7WqM8auqiKqil40FwAuoVlI8ymsg58IRSwED0QI1mqHA3Buyp+j8ecX54nmJ?=
 =?us-ascii?Q?4PN86LC6KQSZLl8s2T8wIKIFsB6407BYGHZZ1zBi6uWtUR42eLp700d8ZGnB?=
 =?us-ascii?Q?VTllqXzfgH3A5Gw0FhX98UkHUfCdaY4DB5AB2fSrPR1TCzxYTUMJMI2hfFad?=
 =?us-ascii?Q?fx9FAorNpBAAfboyEzcfCrcd1G9s6sWpiWGEernQrN9rsJ/gsrg71Qs8tGw9?=
 =?us-ascii?Q?kIzmbhe/rG1PYTQJLb1Ank0JXD5URYpbKmqtKElyY0wQE/8OkeA8RyQJu2fV?=
 =?us-ascii?Q?NyOC+udi0a1/sS4aeVE/QgATa8VSPFqxcA2cswU8L1wGY+PMfwA8PfwzfG2h?=
 =?us-ascii?Q?yOLUMgWXpKsva6iC3MWQL9u6y/BaN8HX3unycaX05xQLmArmYCgzYKF0sR4C?=
 =?us-ascii?Q?eQdmwPlhFh5LsIiSRKHZlapqRn32Y1WSIYgAQfGKV//I3kksjCfCSZTTCocw?=
 =?us-ascii?Q?G6gYGQQzeJ9kkAzlQdvgto2XKxelvPZeK0WyGE5w0NqdaPghjB1S2IHR1sdj?=
 =?us-ascii?Q?s4uMLQ2kZpl56fE0UpQSvcp/oN2PajNVGliKutZeAxjtYx1xSNULTKNGn5yU?=
 =?us-ascii?Q?VaC9CFFt0zlyyFhwvCgQBCUrgu7jPSNUYwZCpmcV1lH98TlFf2/SAO6rhxl9?=
 =?us-ascii?Q?gIcbm8ZAUY87q/I/MSW7Bw2v9BlkiZlhLhKK6MJdOpCk0gPT0erJj3DWjjf+?=
 =?us-ascii?Q?jwEl/Tk19VR8JKTgGnj4tW5v0IouWAzbM0Dr1e1SXiHBH5LWD/+AH4RpZBgN?=
 =?us-ascii?Q?DTDvMqsUh7JL8gcEK+koN8JroOFqlKDfszgiowhwk/vz7LdMa76WHRSkOwI1?=
 =?us-ascii?Q?aFjfxqxxhlkZXvLnFIEEPDiJuLjX0/MiAjmaOeEesMeMefKsJDDl2yx2RWPU?=
 =?us-ascii?Q?vcaI8dqIBHOjnZc6mgIKx8tMOroU4nAKdzQ1RHnvbecGjyq1ONBUtI53mKFK?=
 =?us-ascii?Q?MuC+xaGFdB0OF15Sz2gYBO5kAQdHTLWTkQgjLlGqf4/n7erIXAljOorRAHy0?=
 =?us-ascii?Q?MDGWCMQDqlYesSVJ8p+IfH1BSqUYMTBOvwVRk+ygviWOJL+bJRTMo60ivDW2?=
 =?us-ascii?Q?frbw1ORY68Ej4YAuD2hWFaVmIdnQosHfXeSrvpUVLYgeyy5BHDOtUfl6wAMZ?=
 =?us-ascii?Q?WkIHmvNDR7ytliXNxlMBVPe8Td7UD2JNErWvGlj0p+pCYPccLx3Z2If0Ia6i?=
 =?us-ascii?Q?5yS81I5cfCnSVEGom6PuK6xD+0bO9yFhJVz3mlMQ+8bAXbrMAWwyJiboKpuM?=
 =?us-ascii?Q?Obas5mtthhyjyPygmak4lKgLWbBVy+gEKv1xjy0mGF4MX+OjeiFZpi5hIgRh?=
 =?us-ascii?Q?qBDEjBv/JphUgsmyhyv294579mKkWCG/7F106EZLl0cDj5rW/tcK1jEoDTpj?=
 =?us-ascii?Q?YkriPCBU1pCBCpEbVrwEs6Gm8XF6WSEwzl10QBrrf7zWwdFYtuZ37Ecy9wGe?=
 =?us-ascii?Q?+M98EX7OjIXDeNZC0aaL9MDCzvIFaiD55+xsWnKpdELSR64aXoXqaIexm08x?=
 =?us-ascii?Q?EIRyoFGWyq7IPAnBK/C8x45hHxMbMa+RlEqMUMoHxg9fNozx2MwGz295XSy/?=
 =?us-ascii?Q?xqIR8WOOxMepvXbmQ9a1bZ82QJQ0uVc=3D?=
X-Exchange-RoutingPolicyChecked: Ip6V1zbQp/dF4ENMO+WNHJ8C9kG3SYKc+7QepWR8vMVHO4KrnLgz6q6fyQBdvLNxtrcY5oPaLWl73GM4kJxcwzrGLmRJSjGer0Awlje70AusKov1G8l1tuGfgcGLsVnpnJtyxDBeF/+L2DCOcpS1DfdcACCPkvqYZjnNANigQX2+XlHBlCPRWXPF+KWYrtAif3QAGaMD7MCnDKWsuJIotVGKK/w8TVqTA5Qt7QSVZkToCMCApuzYilFlkE8AYKDRnmBp9xAP8QJ4AjT9xnHoD7F3grAf7HgE3noQMa2PB1qxeMuXnkED24KnX3GRQ4q1VfQ9SLbFAfLQB22ADGr4+A==
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c74e40-f600-438b-fba5-08deed60ef59
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:02:52.4614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04zhiLBtRI7GzpWMcS/Ylb5jvbrPeRC0WvIp+O5oHCsRml/Kz8gNAfRwE+OM0KMeIIM/UxQ8m4kdij5/wSpAPSvmID7BR8+IKGspN1BYrfs=
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

intel_firmware_decode only needs the lightweight assert stub used by
igt_assert(), so the full libigt.so stack is unnecessary.

Switch to linking against lib_igt_tools_stub only.

ldd before: 35  (ldd | wc -l)
ldd after:   3   (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
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

