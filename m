Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84921C44501
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:29:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3438110F02C;
	Wed, 15 Jul 2026 12:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gxArjPJQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E509410F023
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117734; x=1815653734;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4ghsLRRbZQh8gz47c60ac/2qF7ta3nHttN/Qn70P3G0=;
 b=gxArjPJQR1tQfSjzbHKz0eQNUu6kv8G/v+4HI2NhENchkEHqbJnoyahQ
 EAYKUhzz4UfBgdk8XzKenkal+FSjvxatpPSYeubSdmgI3uksCi074pEtL
 icUP/1lsj0WgGQKErkmRdyy+46Axdi+P02gqCetVaOWnIA4znCN4IkH7P
 XTf2Jj23b7Zm0f9Cj2XjzHQtOlM1ekSQL29aqK6U40opAiK1jgbBl1LFA
 0kyOcvqnkMrfbnhpQTRYGR9Pduef+XIhzNGheviLW3ocgb/NSmRKD9BDh
 Ab8SxQmnnYD0nEcDDe1p8s7YXNEQbBBXeHztIMxU7LwCeOG1KcjLvXDAA g==;
X-CSE-ConnectionGUID: 4Fs4yaxFT3Wwg3/y0XCs+g==
X-CSE-MsgGUID: qYLK0co4Sv2z8Zn4WjOg4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="83872627"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="83872627"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:34 -0700
X-CSE-ConnectionGUID: cWfWkGBrSTqUreXfGPKC6w==
X-CSE-MsgGUID: bBHe4gGdR6uPI8aI0qpHSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="255046098"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:15:32 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.18) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o0PLNownyzx4aMx+8ngvOz70l4yObYUEUG+FKFdlhmF4yYu5eV8S1dRtt2vUemI9zxZNN/vOjibFltAMtUMucttNHvkiIOqrvKcejhajUBbSmWLor4KoaxE7sXJj63pKc4UcB9MCzfnqW8mvBbJZdIJOVAwQltjulL0kW8Qn+lwOshQAjiJJgBwNXD/zkPrqp22ip7yN1LE6dkAKkHmBK64sPCN3Dm8mW1R5XKcYSKYjqPHisV5bhA2RdiJY+lonsGzFg6UXMFIOmaV1PtBGkEEUPW0YGECs/iqoGfzyKV4QVMV5mzOfNkW9yyVrvG/FaGEj7gw4aOo14ZE2dd1/0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FeT1mFW5Mg2BzM8O7ISWktr7fnSnqakPViFjamOJsek=;
 b=QWDsC8iUlnev3G3OxvGb0MhJnrMtn7aJ3UFgovK3P7KCWj/y5LNzmgUGrX/zpIVCr6d+IHpm1OsOlXhROLZivXE/antkEbwrMNH60uNZPLzSR7PzMuF3gS/mx/Aoy7lHTKmYCWZUVdMEJPiyj/xzI5+sIO9A9xAp+e4FSG52Jtc0isdrk2Iq5By4sPRZ1GgYRuyAzzUqkm4+ZOIi1fmDhee20NOqcg99FvZFr5Pqz0EgC7hJtQipUspIRqy07oOIioCsnyW+lsm1OfPAApd9JJrO6umuDOs6tZ/+/F/MkTQsWOqzip5MmH4WF99tRKELhntI7+lU57lqbBCEmw1mvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CH3PR11MB8096.namprd11.prod.outlook.com (2603:10b6:610:155::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 12:15:30 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:15:30 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 16/31] tools/intel_dump_decode: link with minimal
 sub-libraries
Date: Wed, 15 Jul 2026 14:15:26 +0200
Message-ID: <e61776987a68bf192665057c3fd78b0e43384562.1784117512.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 19f4bd18-f416-4954-d0b9-08dee26ac2c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|22082099003|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: rHBO8FqtkczEI9GY1Fx1pqitPKf7KNGgwZj8ZTTrYDIjsZgCUj8AvSLSirYMsQYZoAmMuknxzDE2GIpnCgONngRPIh7QWdsavx3yK3zwKa9pZCHaDwo6OlwZBdOsZTLSLb3pm+o2BIT1FAbrMR0t/coXAd3xUFAZ3Xynn/JhsgbTiAb8HMFESE58SqFv36WjKblpCPWi97wBn+N14bfVQxCJcdfd94VKTqq8K8Rf5JYo7QUQTk4tyqq+nCjMZbzQ5yMQM34vJW/IakXF/SeccPKAgrz3xc3pu/cLOti4hw7hOl1MGgArQ6jr0VQCPfz24aVsRmhMJ3vg4JErfYObp00gteXrPfcn3ofkc3xEoS4dDuPZpVauI5uJwDSgDzEegi+uYYSj3pxrBQpbycrFGHnaxfH7wyXtlvQ/9NS2kfKDDAf3+R8ye4T1REHloV3E9ujM7/ke5xM38Oo6uAtOSVLXZD/Y5DfD89jE4BleslxbSacke/Czc5YQ0QCn7tEOpU6uof24HJ0qqUj9+3KRKlk3TdemWXyZXzrzyJn5fWXk506VQk4x1GEStdMt0tmaGHW3v1/y3yVVUIhq41zCEZBKH3CiaD509EfSqkP4u1YTkLpji/J/8Bhwsmb171QCLtb4+zK4+50mJSV5wuC3KVC76xGkyyCcrkGtYnVtIuM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(22082099003)(18002099003)(56012099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+u51NLT+KDUCq+TqqbK0fkARvbOUykLVdL64dvqMobB1DtGtflZkUcqXjWDg?=
 =?us-ascii?Q?w57XKcUDqqSZIgRUdbiUcfDSg8OhYaiXdX+SOsOMt5bR0YG9Qtcdh3sTgW9E?=
 =?us-ascii?Q?05iOSddkNGTjC3erlp/cpKXQzgtb5k//GuaxcqxJhQg2bj+hcEuCVUZBYDsO?=
 =?us-ascii?Q?Pukp6S4Kh1xV440PtkIhdc3J8H6f6MnPCSoX1SkvsH02FuR7OJiiliDWQn2G?=
 =?us-ascii?Q?YSfO1yzWRAgB8GYdoSSVifAWhgvf/1BlS/Hwe3xjq95TaVExAY/zKkWw9mb6?=
 =?us-ascii?Q?ZaYUBvYWI+Os0X/4gg88w6hkIS6A8CRvXq6kmKMPT0P8egHFwW/9qBEFmgLx?=
 =?us-ascii?Q?ya65B4BdxOQ4qgmaTsteYeu5a0qCFbnz/yhCL6L/oJvWaIKBgsoGyvR9jVlJ?=
 =?us-ascii?Q?CX4uZnFdm/MLxEUfM7JDpvlvN0O3yarb45Vm2MRVakZrZtEWKi8Sq+HKymII?=
 =?us-ascii?Q?HhHHsHRiMgLcPZtl1yedr0+bSn70eK4V9g5ngPhxZrgTI5J2Abw41Trj4VOp?=
 =?us-ascii?Q?A/QsYlniZBqEaCLP6k5YIYUAvmPaLHaDmJz0wxwrKa/y3OVJr2a3kUTYpUeL?=
 =?us-ascii?Q?xTEiuahLggwPkBBIjJfq8jRaILO9DVgIZTrBpRlPrq+c1Q8bjiKlVFOWMg2I?=
 =?us-ascii?Q?r9M3OOBEcXkUujompMofFkVm9atN2pFCDnsfD41rfUtLfKffXqJrA+81d5C5?=
 =?us-ascii?Q?qT+VJO9ai+DksMRZ+Ljyfs2DRTkFEmONBlTsPkMobwmtEHSoSjpr9ZjND6De?=
 =?us-ascii?Q?njQ1MhqXjw7aAdQwN4IeRtei+pa2ggk8/XfGgOOa3NivNio34kWqqs/Tn/E8?=
 =?us-ascii?Q?SViYSMDmgK6MkSghW8eS4+IJaukoZWsNQLvQXk8Ujzo1VMT68YqqqcNUpPex?=
 =?us-ascii?Q?Ljtskf+SvZ4hvWNVpJVMUleadVR5dL3CTH10FNeo+Mx/23b9Xd3lc9daLOCP?=
 =?us-ascii?Q?bauJNA7XWdx0b641Q1V901Car4xGXjirb7WWwlvacjqle3gz2R6gcF/YGdRB?=
 =?us-ascii?Q?TqhXfGSqy8lJZ9rocmcsGfoJSUw3Cs6lGKsY+9J01smdTb5wcLnZtf+cGVwc?=
 =?us-ascii?Q?WIL9GrwoXK/GeMK1WZVME7XXcUkcVS5wnWTsGeew+AqxgLV82YLB6EuG8inm?=
 =?us-ascii?Q?GqQW+29IUnAlWT0fbe9medIGVvYal7g+2IIIPSICic9g4K/plOoAOFFA5S4L?=
 =?us-ascii?Q?4isk1pqqi5fSDdftmp5ZlG9BCBoQ55rroTW00z/Srb2Mc3phnSH5OWiaRMp9?=
 =?us-ascii?Q?/2wuCumZKY8/txJnOy24boWEPE0ppgwvp5k2Xa1TTFb43lJx0krubMVu7nKz?=
 =?us-ascii?Q?koosGHfcLwAYHwc9htqYF7RvoG2sWRZbEkqZxm0jeuhUfbNOt1UfIs4ZYmli?=
 =?us-ascii?Q?UIOqMg/v4w/2L3rrNuciTGTAzpO/TXPSERSxyeLIKzwTDWzhHjScdDYvx7lu?=
 =?us-ascii?Q?iIuYeZmrjjHOHggqq6FEDe7nNofQqFqI2XwKC3TRpFnjAWg11PkL9fx+iabA?=
 =?us-ascii?Q?hONc5/oJTeXJs0JuExH45zCybQVKRMhHk0KDWW/qyK7ScPL5056IAXkE9m+E?=
 =?us-ascii?Q?iRztKfDCE4BoFOcpG1+vNmeSFzkhyzQk9O+kJxBL6sH0G16fnY2S5sAWq6vb?=
 =?us-ascii?Q?d4Zy97G9MlUcu/lyQeCM9rEcn0tBJ9kdV1k0vUoJu2141KbaqvqQhBk5z5gP?=
 =?us-ascii?Q?31UBTOY9azPylGwa69LOqi8XpcCUWPPeYOC/53V7EJJQsURwq5wyteuzTWH4?=
 =?us-ascii?Q?cRQ6xJT+2/zIOiuN/fkAnO/AejGtAP8=3D?=
X-Exchange-RoutingPolicyChecked: lkBqaOhEPUt00RdbaMBXyGISZQiZ9KTGXbDp8VGTCT5DwIKBUCDqo1wrHI52YGT2riA3atHn1GaVKz6pzFCL7zMsRncvrv9nAZ7cIJjOZZ8Qs1qwyA55rAKCab36lonGqqAAoI4iMLjk2Gs4ohT3IvuUrPhKkg18Q4npleLDCh5+dZTJmk5/dAsmGVaqh/1PxNIVoCrAGeWzWfyDe9H+bFOszK9pP6phF+PjK1G0wbnBrN/2cXXTPwIHHy5Pi09Mbw7HIGHCObntOH4HTwJfrLI/UvYs7tEPCk8bEWXWMcoA50Et0oW3vco3kNBojAf+3E2m+IMk9DlJK7DJlt8k/g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 19f4bd18-f416-4954-d0b9-08dee26ac2c3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:15:29.9716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9xrY7H6EmYkO0K4WDVRH5qd9vIltJY8z14rbD/YjuO/gxwdFViQPKe6NTEpl0MolRUZHZhIUN2VY66ctMxOOZoLo0a6WML7mr4ulBViByZk=
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

intel_dump_decode only needs the i915 decoder. Link it against
lib_i915_decode instead of the full libigt.so stack.

ldd before: 35  (ldd | wc -l)
ldd after:   4  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
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

