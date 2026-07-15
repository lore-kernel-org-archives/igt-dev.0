Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D981C44507
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:21:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F2F10E126;
	Wed, 15 Jul 2026 12:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XVOs92Tm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10DD810F023
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117741; x=1815653741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=SRNkqtpF+vUgVCz0xy4zGP2unYBOkVc5Gt3s8DjYVbg=;
 b=XVOs92TmP61DxMY2uki3gxl3Zk922su9GMZqrlYcvIuwy7vxPMgCxJu2
 gxBPhOURVRuOpeF6YB2oMfDE0FK+/DjVIsddcXfuaHjY2WS2RYmPZSwyw
 /wJwqN30zaavVuzXLzCVx5N88Y02TMUswnjab7Fp4wS0UR/0oyR2hKeF9
 wz1+Lb2jfOSwJuChbpS9VY6b6lfg7HV9qRfzL353fUI8iST50BizpneyY
 NstkHfDqK/5V0cQmnUSU0+VcHAE14ssuwwadGX7WZGMJ0h3xG+HahRxxb
 EWQGBiFjtaI4W2seZzCqeGsytFzqt/Vkwpa0vpsvimv8j8av1DNIo2o+m Q==;
X-CSE-ConnectionGUID: MWUVMCbqQiqReCnBv7ay8g==
X-CSE-MsgGUID: lSAGRX12Rlyj7+y3kYKUgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84607053"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="84607053"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:41 -0700
X-CSE-ConnectionGUID: IMC46WxJQrGMbs2HtoG4kg==
X-CSE-MsgGUID: gFYsnhq8SK2SO7DXUq2tTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="255659584"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:15:40 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.64) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHlwdnjHDYIHYPTHooMgyBL9jzxjWAcv1tPtyE4Bdy553lish1XbhehpNmbuYey14BJ2L7P6YLulYjfmstQsrziLgBAI7gVKUVbwb9uWilm1QXyGLhJLQnCnQqteEE3R8IqPuAdjWnoUbt0EiJB/mNOZsHjsuslo3asHCXZU0undPtgoJYpc64zt0kxS6P3wtK+VTL4NaGPW9pQVcRHrJGw8hhdA+G8WErXR143qiG9zWUoQ8IYj9rwWjR13EhS7FWWLXh5Z/U44APWArEtq9BQCMIGCEDpNdzzXcofHEsWNfRFEBUVsoHUhjiP2VSmS6qX2RR3JfBACGF1uZptV6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rphj9JIpfcaXKV98ZoDmshdMf4rZf52ZRdTMlh0TTk0=;
 b=vBvS/khwJZ51boXfj3nD5qBJPYD3KdRyVTOYbS/ptICgd0ppt59IJSfjY82ZFVmS13CADFDWFQByHTyXEayos1m5yyLvi40d91kXMKn/pG22T17OkpYbKMSIi+RdpHqx0UjsGIwRvFYVynlmPhp8HIZ2hyQ7D7+M3Pk1JVcX9MWZJIh4Uitai83OImX3acRzJCD5XyZknrRJAcfHYNJ5wWVqcGGn6w3BRJJlz8vOh4neVsBew8Ro17JFx6zFMoxdYaYTPTW6yEGMTgu5o+pVUa7VDd7hzEIOG+XPh6ZnLnX/PRMlHpxHyluAzXmTO1OOLOaZB4rFhUwfnp5c9g4p8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CH3PR11MB8096.namprd11.prod.outlook.com (2603:10b6:610:155::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 12:15:38 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:15:38 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 19/31] tools/intel_backlight: link with minimal
 sub-libraries
Date: Wed, 15 Jul 2026 14:15:29 +0200
Message-ID: <79080311747e9ffd343b3b7cd21d97d63be4498f.1784117512.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4c0372d4-1bbb-4752-1345-08dee26ac790
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|22082099003|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: dA/FRchF+kDWZETYupp2ZiMkst888Rpw0sniDdrFxt4MbzVqTwHAZFmmjGHYO2axoWGISBDm9pziy9cfjYo/CvHxkLZXAJgqEEre6D4xzzyJQtH5gbanU3QEWt2SqfLFuiaOudmG1FLH3T1lKlWQ82fDGKetBZFxqdlU3sOfeFuFaRvjbMbYe6iXP0PIqG7VBewzJrig6E+aYsnc12tCSzaj4ghSMIow5fzPEht5DVlfD2mqurPBZcpzwmlXtEWapwVOgUvqa5xOB286SbRoxiJfsOTqm/tppQiXmgqfVvlWVFAAvCLlT1CW7tAZ9c9YNq7YxkY0QOvultG9UeqF8HXDT6xRJKbBxjC4HgV0kjGiCZFqKYDezUSKSHRuju+aDTNtAPjwttD26XbPaQrSaedlnaGicIHOiaC/kyKFpcxkb2tIOVYtJbQPer7X8ElHN6Tl0FfnkZfk2sfjfVEUj5NmUFEUHyeg0o8kdPMc20BJGpj8fuhJEN0xKnyCTHSG9Q9KjbFrGrknPNJmCNryrBs0Z9zo33yK+2en3823AOrs9kYV0oSrAI81S+9AzxsiGyErbRUTA6kSmrcc4KNP0IfiF9XbnPZp+c5B9cHpX4U877DEdbdRa8QtJGUaukxeWqER90He1ZV0YfzTqM/ke+CuMi/PQ94ipkO14vlcjuo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(22082099003)(18002099003)(56012099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rUASSjrLHeOn0YJo9yuXKJ+T8wVRdG+Y6ThIMLWAbZ0qIS0JVTge/ZsJApc/?=
 =?us-ascii?Q?Zbm3k4AmsL6Iy0+YirPMcwWih9PRuPVxlTJ0tDiRNRGYhHg/zhmKQvyX1Epk?=
 =?us-ascii?Q?ZZFy8xBUHLLTOOFlhmWSxmux2oqdeBvTShWOynzEvCWsbQpg3He9xPOZ/jQO?=
 =?us-ascii?Q?C/HWCbuhwaxG2Y7KYfE7CzQkfH/Hcr+rCu6sj/2pB7REUVoXLRWwSM7Zd+6p?=
 =?us-ascii?Q?sgr4wLZBfmNzyM2C/n5/BAEviWAu/WVGUm4JzDxoNEQzp/917Q5olVOe7b5J?=
 =?us-ascii?Q?XqJpMZgajfvHJKCCKn90bv33LAWX4dxgDzX9IhsiiWyBKhf6dOj/z53hd34u?=
 =?us-ascii?Q?0kUVV1q8bd4PWwAVBHdi4Et5XQw/mrliPBI56XTdoLq0ILdaMCn4OPiFYqTI?=
 =?us-ascii?Q?cEL/iNfzBLldPvudM2tNqhUy6kDmj/g23Oo3FwIXkiYCZBMGS5yiFlVMYWha?=
 =?us-ascii?Q?otTze5wdw1vcyk2BQ6TPpetYwJirilqIShUwLO7gzQNj+gttaJXHLwZa9OLl?=
 =?us-ascii?Q?bM+R8L37zsRpSeriPWml0FGz8NVxZ4LXBZQ4PXg4C089rCvCMJR2vK8nO4fc?=
 =?us-ascii?Q?Mar9/NQsKGyhkJoIgtwJJZ98qkeVgy/8QTqoZ5W1AJpBSvQX4REF2HBD0X2W?=
 =?us-ascii?Q?7xNNFjO6x7eRUle+1HTmvBMFT3lYfiMWsfTbikXDVC27TW/4eDUxsnjL3TYh?=
 =?us-ascii?Q?w0mgAbqjEwlN107w3dQv73b0UVaI38A+K0pc3lZY3O+o6WTLwQ96z9itryLu?=
 =?us-ascii?Q?vP4QyJIWCgUdez7+XL1bAGhjQh5A5s1I5r0jmrSmkizkr+zpfs8UJ2A8j9qx?=
 =?us-ascii?Q?IskTHggZqbMTGsYBKY/Hv/0iC+dUcl61ah4u6oS49xy0RsomftmVZDh3ClVf?=
 =?us-ascii?Q?tTMdvpsshQ+b+D+ZkdLT1haAvTmTOAq0l3Z4ucVrvZ/2VgVqcbtDV+cMbH2c?=
 =?us-ascii?Q?S7wfYOpKY09Y1zsLibfAdqXshkdZIE5N2HbdKg95QagvgSR537jUGnwzSeW5?=
 =?us-ascii?Q?eKGT9VSOMOAN+uDtitx6nbzOSIS3+zYf9AG+yYNbKaEem6XQIW+o+zkmTBaH?=
 =?us-ascii?Q?W/mLKxmB7JYKt08w1m5rrvWq4SvcxtFpdZ0ORr7AJSiHBlC6WFYfVP0gIg7M?=
 =?us-ascii?Q?4LKzDI4fUnSf2CLxLGs0puWAmRXM6jRH7j1AQ8zaNV4R4lXvYHyV9p3bczjT?=
 =?us-ascii?Q?E3NkPXc6PwLjZ+ecTYO/w0Gu3igzvsVEZIenkCRuFvKs8cOcYIZiikF9EaAU?=
 =?us-ascii?Q?yo6o0EvJchjKIVXvntYEsIYLyhXH8kX43H0X97Tb4i5OajakT1EaM5W4TjYL?=
 =?us-ascii?Q?oplHs+DHXJnbdw5Ojr482PyKItf07mhdUwJpvIGMoXkWqpNKboJOxkIKqX2V?=
 =?us-ascii?Q?DJlIybAtGtUOwkdOaHv5cYB0FjICp98iTWYxeyPvG5fvDj2uRhUEOLUQa6ER?=
 =?us-ascii?Q?xawy3jdqc5S1fL5TLe42x74LGqv9/4gDU9tPhgjY61Y4+2br9air57KrP1uN?=
 =?us-ascii?Q?Vv55xLX49yhk7ExNwGpbFqGirwwdhEYkb2IdCL/vkogU43KG+7792VKuESps?=
 =?us-ascii?Q?B0dWcpHeGZV8ScJjEFi4NB0rkew8NRvR7qzPpV/6UDERwxY6aVA9OXWZt8Ya?=
 =?us-ascii?Q?F08t9H5T2wEI+PE8kiBYpZrBmmGWGS98gCA4Pc/kPLiV4vidlHcVBhhiI9Ec?=
 =?us-ascii?Q?o19lXkuP+xZUyXKHVqVI7kBdtYSwg7qlI6xB89nOE+Nv/pPH0ekUvFwJQIu2?=
 =?us-ascii?Q?2ygzNAt3RyO/tD8yeOBlP/Rs2rsRAdo=3D?=
X-Exchange-RoutingPolicyChecked: IJihbSCoeUp88A0tuASIgwfJc8dfTJd8Zkb3SU618msuZk7c6EPmHwszWcZs2bHlTRfISKry0ljuD/FFhHs2phWKAErWLUqCt84VtXTyuaHIkWdJ32VbAXit/iJad5AAynXlJCA/TGSby/AzuBB6aXrVaqgxDauaLFMZQpa7yLeJgBg8HDYMzJBkgDUqOw2hYO6Z6SYtenGTs3ET6n1P94W0n2J2qDZOQJ0HniSF2xEHVhMCzC3Bt41sAWLF/BXQQcMJsomoHjGKvY3mut72ddeCBNIQ1dH6eEg6AbTqjA7PN7OBusA9xY4JX6pMwwaJaKvh9UO5svmdgIGqh5A0Kg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0372d4-1bbb-4752-1345-08dee26ac790
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:15:37.9168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vaEujkAfS79CfpGrUwqHKE7U61oNj0AcG+30Qr/OYNCDeZl557wrfXx4IvCox6xDdz1IAS5Ed/uVKmXDHHNQoUauR2IktMXaWw+G1o+1vYs=
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

intel_backlight only needs MMIO/register access helpers and the chipset
metadata they use. The full libigt.so stack is unnecessary.

Add lib_igt_reg_tools and link intel_backlight against it instead of
libigt.so.

ldd before: 35  (ldd | wc -l)
ldd after:   5  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 46cf1a717..8899a5b49 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -15,7 +15,6 @@ tools_progs = [
 	'igt_facts',
 	'igt_power',
 	'intel_audio_dump',
-	'intel_backlight',
 	'intel_bios_dumper',
 	'intel_display_bandwidth',
 	'intel_display_crc',
@@ -92,6 +91,11 @@ executable('intel_vbt_decode', 'intel_vbt_decode.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_backlight', 'intel_backlight.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

