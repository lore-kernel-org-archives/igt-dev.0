Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B923C44507
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:22:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0DD710E126;
	Wed, 15 Jul 2026 12:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XZk9qrRL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C9910F021
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117702; x=1815653702;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8AKmyVN18hkvGLkjkW/F4TV6XbaH1qygdlaqoxMO7q0=;
 b=XZk9qrRLhUf/XNw/joUKz/VbF6m8GW/OafINn6ENp2jgHE84YElDQCL2
 Mnu9YFtO84S799qv0rHdAoj8nl97DVtIxSZ9GUd2Ilds+gEXcmQpgVc96
 /DiXW+Dt65DFl4Y+1iqpqVrqySp/DBDyXFRkZJrI0wdX7uoXH9MD5lFYd
 AKJ/VsoK5IIGHeOs0JkMf/t3ltQxpkRRnwo7yY9neKWngS+ZhBRo1O93l
 xqoALvN7iZN7HJtddBa9Gt5g5YKsLTwnbs7GQ55+oR7izNeBB+SwH3mH/
 IYzKIlNUAmaEJ/GOzRwxvuCW8DenAzGODmvs3Na18ORlFh1RoKEtH5S3G g==;
X-CSE-ConnectionGUID: 0XKIdGB5TXuPmIkRr5LSqA==
X-CSE-MsgGUID: H3NKEh8STcayrHSdYZhApA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="102175856"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="102175856"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:02 -0700
X-CSE-ConnectionGUID: couu8KfnQU6XfZTKHgABYA==
X-CSE-MsgGUID: sj0M2t+vR5mnyiH4Vc22MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="259985002"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:15:01 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHMbXu+aaAUOL/pd5xRJ9WpxCw+pYlCQSYDe3eh+9/1OQrexUZuxn9WGLbeS9eVW2f7RJEBzHX1EZekOb4v9Wrfsdp47KojzyWH8Iz/UCRgzrUq/hWqwBnEuij/1hzvBZTv6Hmjbt1BUeM+Chmwrk/fFpOa9ebqDSnxDCzaeav78PaZ6dJ8BrfVne4mIR+DDpzJSOI3sMjq4nic2epVLZwc2+1r087i7PYe9ujigafiBhYpMDf7Jp/hSpfzOmlSlmUKKJSzD6dPYDu+NhaFog9NSadJT6TFq5/m64SDnksVCqkba2oWxwxzkw5qw7H309nuAhUSJDLSl9lmvujWinQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2pyRX8b1+FrC9hWukmAimWPGXGYw/9uXphN3t/6Eyo=;
 b=wbbGqGdelQhwy0mkaXLO1DrMWYRLJoeliqSAJU6MQi7GbyzRs2d7vbTqOhKpUjUjQ6P6D1e2SBt9K+Y3uaKS77j76poNLRv8Fwqno3c/LVgFGE2Yss5caEI/0K4ERpK7iyNLKX7Nk89L9h4qF5Iykuwx1h7hJWCmNxrvWvUBT26IFm3NDrK0AOunS0TGG/QYNzbu49CW5wqv2kFkkzgc6OJnOg1SHCAx0DGgdh/Mou2hq+q2+EAsrZgIzzNKAMCuXdox4U+ET6+rdBGhG7KQatDbrNaSZ/bv2O3RHyvHkphVjKFcfGVLv3VVV4ox7aM0WbHsbHDkQR7I0fcGwWMlBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS3PR11MB9867.namprd11.prod.outlook.com (2603:10b6:8:366::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 12:15:00 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:14:59 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 03/31] tools/igt_stats: link with minimal
 sub-libraries
Date: Wed, 15 Jul 2026 14:15:13 +0200
Message-ID: <c1d27ec2e7e1a346abd47f8d0069aa896e9fcc1c.1784117512.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DS3PR11MB9867:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b1b2844-4f3b-4329-8f27-08dee26ab0e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|11063799006|10067099003|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: tFqGXaxEpNjZSKecDVDgr4RdP5f+KYVgKgiPa3LP2cAn1HEsrwAzI7dBaW1tJnBLgzJwPX/NRC2ISFCa7fMQhhqzN1DhqHyOc7lzumfoheqf6Ay1vU9UPbV8UtJ5qi/z3MeXFyois7lmEZHcto4/nRHgqlbCP3BdnrY7bIQUz59nwDG6K2y3kklITcRa2810Kl49dfh0yMwsDPTkRslMHjRBUqBVCFmycP0sPE2Gw7XZJ1F4SVuGcRZRaNefK66J4kitk7zjVbsztNqj8GLtCdylxny2yt2NF+Qgtn7rnkjJgFvKgza9OCQKUsGPAwI/qb326soVw6tbcGRqBoEbAw+dZtt1LwdlANFdWfnPik3HLu6wrdMWDfxHn1ijUUwKY6XlyI1JG8cFB1LuZGM6p/jQQYQgW6ExrZ0Q4rBa/qYxfq5rqREcliXpUTQS/xTIqWaM8S0Ii/nsJXS6vZnKrH5vup0pxbVhYaAGW/yR7Ucdh6rlw9QR247LHUAH61YjtjKsnk+IBtmt1SO1GvRbe00jK+t1HUSRInv7OWMP7XXgkYB3+J9st0k0JlarIgA2WKZRv9H3Ze2+qk/W/Jtj9q6hx+zqvIjI+wMKsk4tobyUMcKeCa1hCN1aBMkXoPrNMY5nbPjGTH3tuNzWJfGepoXImUXnGyG2AceJUev7D54=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(10067099003)(6133799003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iFFh9cGPSDxiHDAyjFVAp7tlpfeM454iy/FepN838810NEFcWbTaJ8YezTyU?=
 =?us-ascii?Q?r7gh0Dejx8Mth7W8uQYit1ehNLGHekCRYTl5J6eHXGNze5kwOjqC2M8nlQ6u?=
 =?us-ascii?Q?JBVBIW4H45WGTeZmNnTFnW468ufXS4s7BUQEnXVpJZ+4MPrBUCbjPPdfIBVy?=
 =?us-ascii?Q?HT7aYtrtBUDRrZD8smvNZmH9cM8ML8pZV2fye7cLnGaf8fLAjfsEQpEPuG7P?=
 =?us-ascii?Q?l+dzibEFfZhWyLyG0EjhteDX3ZMHoaKIS91HLGIqoFTKcHAnt1fMDqVB7kLp?=
 =?us-ascii?Q?7ejv1QTBIfH61LlfUpuTktCGOKPoVrArXowfHXEhtmlPp9x1yTNGBSob3Fx3?=
 =?us-ascii?Q?2gf9ivWuhd53M8n6BxVjl8LiK0d0tyhy49L07JKS+ULQ7kJ1xRLCPg3DuZdD?=
 =?us-ascii?Q?DoQzOSA46CesEm+Zj82Fxg9YF7409Gb4iGIkJTQXaLLJ7Yog151eI3zc/GJB?=
 =?us-ascii?Q?S8k6lxJXoF6q8GRc70e8lKI9bGsIzvguVAkdMJyABf04hKRckIjKA6y9GkwM?=
 =?us-ascii?Q?nxb0sElyVshPohKNzhat5rce1qTlu9e3qB6Ee9gjpUg4Sf+t+foO9SHQOexv?=
 =?us-ascii?Q?CzIRjDa+OKw8NcyqEJ5P3pBZQVvVZvm23eMMgVBMfv6qgeVjYOnjKwZPhh8p?=
 =?us-ascii?Q?xgCJ73DtzVoYIJcvTvGOsl7TSrhBrkV+aSx+hDFxMiIqM3L1C6rQzXPbGf7K?=
 =?us-ascii?Q?fBAbxvn3BtNTDGr3x247pcgPW9kLyTgA1lKuLJ1Df1Y1+ciU5o9JB3QHxg5R?=
 =?us-ascii?Q?q7pvbmKXascUwHvOYoVzsOdl+zT4Qo6y9hRyejaes+OwPq1W2xSByy2KIXsz?=
 =?us-ascii?Q?EcASuO/Jrw4DLcrcuHYQmW1OUWC1tW3pmgFTns3OxIW9PRzWSBhKr8iUdaLa?=
 =?us-ascii?Q?XnIZIRaBpJ5NgkAo0ggiEOSr5APjrFmTf3KYepRr0ZUh5JEBd+ztd3LahT54?=
 =?us-ascii?Q?W55xw84a3XFwGIAxlenSYnePKWWfqHGVikASIgl+rjW902qA6VIiRoQluvR5?=
 =?us-ascii?Q?5AmsH/SlZUscXPetPSRPtX5yFRgdujp3iTBjqgiNoAEkoQ7cPBjquNHJpMzw?=
 =?us-ascii?Q?Yohn/BUmz1/HpOM8TLtfN+ZdKzaCw1olr1GFZ6c2KZ2s+dcJJ8rctLkjZVei?=
 =?us-ascii?Q?R72upBhy35N238yxxa4j62AqoFU7wyGAcdvx/CuoFVNQ8PNsCFg7hfij3giJ?=
 =?us-ascii?Q?fbvwZqrYtUX4uZBspFIrm5v6U7IYqEij/aqbXCX2GVP3niF/VuKYNr07oc60?=
 =?us-ascii?Q?zaKeoBYnSvAUjLGvGPg1xoEBC1yUgD8lIHfS1yMcOctDgGSmhRBv1XGk6kyh?=
 =?us-ascii?Q?YBcwqcpz2lV8L8xKltKoVD+EYetAKBi8TFmVmEGUx3ZBX80wHDW3qrKyStJp?=
 =?us-ascii?Q?c6K0LrV/XgteYdNLcVpxm25jxzJQ/jb9ET3uzAJER2V+ZuywwupIxG+nG3cn?=
 =?us-ascii?Q?Jr1FZqD4UfUh3RV2QP15NMHN0Bht/PSeerR3wj7Ajnx8Dgh8qetIf7jQtkLc?=
 =?us-ascii?Q?jZSC6AxBw768r9ok1nmjUnNP4N+zyJmSQDlsp8InKeOgM/nC2DBs+/HV8g+O?=
 =?us-ascii?Q?bTEm71A7xJZ5qB741pD37J7QSO6NobwcbU2wiEnpWFYlW4C5m6SG6RVMMeJl?=
 =?us-ascii?Q?YTZ+08n9nMxQzrm8G3rR5zFUPIT3eHLMnHg9V/QDu5clT/z62N7J0jvfzisQ?=
 =?us-ascii?Q?JnxwYHoAncw53UIZbHrT2Z2W8erxRD746sUcluTQuB8p5fKheFC36Gt9Vg0C?=
 =?us-ascii?Q?3LjV5eBJ7C47F7iDaSwxnkpKYUqZjj8=3D?=
X-Exchange-RoutingPolicyChecked: j/Ev4qZYHpNV1H1JFaXtKfw1wL5tWVJD/k8F4KcUvhmTAo7uV8T/BG6b4AfSKCYCieqgDaecEw3jQMCTfGT21Fe5yfElfwk3e6DoaCYtLzwxN0yXdQnB2PEDjQEwqUdqEM5eiGUdkIhI9ylMUTuEfA/0JOJ64MvDF9sVZM5JXGsapiM6/CCVLuiwI0KjFYiNgwywzkRK0+lPDxOY2MfJBWik94TyuvGckiuq4clUDC3SW1PJL8OQSWa5MMMcMWJCEXNf8ZyJFr8hgha5OpH8RAuNE6KwyzNFWgtl7dsXsBEdJaU9ZcrLTlRxjyhm4hwS2dKWv8T0wf87vzDUjOXp9A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b1b2844-4f3b-4329-8f27-08dee26ab0e8
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:14:59.8226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BAUM6W9NV52zOGKfs6r5IOg4S7IZDgl+2cDExnq6iq62eyTXBzEd8WkpeKc1xZvLHxcwWX6qwttuVHiFKfqKWeVx+6scmfcxPDKQ1vde3Mw=
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

igt_stats only needs the statistics helpers and a small assert stub.
Link it against lib_igt_stats and lib_igt_tools_stub instead of the
full libigt.so stack.

ldd before: 35  (ldd | wc -l)
ldd after:   4  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 8185ba160..286a718c8 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -14,7 +14,6 @@ endforeach
 tools_progs = [
 	'igt_facts',
 	'igt_power',
-	'igt_stats',
 	'intel_audio_dump',
 	'intel_backlight',
 	'intel_bios_dumper',
@@ -58,6 +57,11 @@ foreach prog : tools_progs
 		   install : true)
 endforeach
 
+executable('igt_stats', 'igt_stats.c',
+	   dependencies : [lib_igt_stats, lib_igt_tools_stub, math],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

