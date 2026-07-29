Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54488C53200
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:14:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F8F10E631;
	Wed, 29 Jul 2026 11:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S7LdKw7O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C384310E896
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785322989; x=1816858989;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=SFpWdJEc9zkCBJWeOjjyTnbfdqDk9c6ze14knnYlRwE=;
 b=S7LdKw7OnwBFh+UJddOqH2DHjimiev/dbpngv/cv5sFXGkiIOQCfLTsU
 in3TylybY8pYPLsQYcy+U4kKxkJtd1lZIbVPoKPvQoxdppXrGcD88RaRZ
 Ab9EINF+oTIIMDPpBXvU00YGnRS4IPY9xPxo3YeDM5BGj3jLSr51TyytS
 TBbm95VrrFVZfqA0pjQjJdLHb/YiGlFxlNcCah9BMtggw/qeTZudPM2/8
 omJE9PkLi8ED4f4qB9ZIX9Pjw46wGN87/UntUl5OPgYSjtJ5IazvwjxRI
 siujRHTWJ/6imeg446cQ8GGvxwO05fn9tTs74oLbqsKt661a6nh67XTE5 w==;
X-CSE-ConnectionGUID: B4U0OE5ZQdON8ig1Syg5wA==
X-CSE-MsgGUID: v7JS9a7qTumbUMRofo/dKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108718993"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="108718993"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:09 -0700
X-CSE-ConnectionGUID: NWPrxbjGT66r4uRrTkezsg==
X-CSE-MsgGUID: Gn9xaAYYTUO60e3QeeO2Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="258204775"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:03:08 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.61) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l07R8lWd+Y1JbQyAr3XGVA59WJj3tLSYpn02wjkCWI0QJyhQIJ1E0dz693rBv+SIZm3bYF24LPNeolBIh+nOYB760+hG/KM+6EF6CPh94wOJtROa8bBlyzEdKLa9pTeXXKgP0zHHsJHSFQK7OeW4jt7eLE0bq/TsNOpb+w+cNg69BQ85+wwPFtZ3CiRizjWsaO1yjr+cTRXZIfZG9PLvH4q2tt5hsjE5gtA7d1Mo9uxjBvZtWHAwvJXZIfqkfvDQIZuLWJaZpE3hPDMLm6hkSOXFayESSVroZcEOXdIjsB/51RbcavcbI7UjgUZE3Gb97+KhrWyGUmKjtm1W4v2lKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vrQGJjNSirq9JRRyGnAf5jhPa9pp+UtI7alc+6HNumQ=;
 b=XS996y/kVtQtPxhZA2IXrGtazwQTY9WqqCCAFmJpbZOoFfFsID78AU9X+B9V1k8QyNVf3QYAaqtVvM1y3V0+AATpSGBFboaOmpkcMmQw6WkD4z+sXMfDLhlQchOHSZSV9u0Q1RLS1cDLrq15l3wzggE8UUt9vz1tL0NWH20BY56nBKEIW+9JWZudq+thjxW+jfkez/OgKFdJgpOxGXK37twEfeEv/F3+rR4C+UX4xO9DqbxeY9QQMcp54s+19ZWaEmRqDVEDoT7hC8CZXqOgcVfixUZxQ+i+424tt82irEKSxRgXlOPaxgcT+e2FOK2rp6gAk1KS/Jd7JTp1kXq+hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS7PR11MB6246.namprd11.prod.outlook.com (2603:10b6:8:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:03:02 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:03:02 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 08/31] tools/intel_gpu_top: add explicit
 drm/tools-stub deps
Date: Wed, 29 Jul 2026 13:03:25 +0200
Message-ID: <d8226763005a985e163317e185b8187dddba58e8.1785152675.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DS7PR11MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: 60a3e9b6-f23e-4cbc-348e-08deed60f51e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: nTSVADqLtPr9r/xCSQKzHynFU52aGH6ptoh5Bbl3GRe8KuICBnQ+1OmqplE0STYQXgmvviBBpjvNEixf/uWv339+U94D0uNDEKdDANQjg0xpQFTJTZAwutOjavItfZHvi0WOLDnGW+DX/V1qyqJQD2WHFR5xuKcL+pMKYayp6qiTFuynmtPxtivSTo1g4Et0IhSrXDKalvMNoaHW13nIQ+wRo7N4c7zhiiWb6OoME2MGUVZpA0wzBVmKjjI/NWa5XRJhNhW+1mnq93KdxglIpCHpEN3QDUI4N+aaI8s7ew+OcNfJAat8lhlLgBEagpJsZBP7z3J768KT2RAM2t+5ceRw9Haca4ZYw4nO3nc7mXPY8KBuTF6PA1Oec0zsymhaWF/w7LOSRLOKDIG8GaL7H0cFbqsCa7mtUqzp4uedzi5ldqEI1RZR5jLvP1SSlFwgZHCA+DtW5gB8bdex1m5pRezsUslDqN6f5TxFGodruH+CE9iKPijbTj+oQlvCVMyKhsgdp64VJdMJrgM8y+G2egv1A0UODQN5StMx6AxbeyaPcnO+LIFZU/y89DPhxoH+FjkwlY8zjt2PdrRIwTinC+uLhs9KdRAxKQoJ0f2I+dJXF5Nz/1OQaLU1Re2/tGoVC/KnWwBH2Iq2VkL1C0fQDEsLzMFy1v52njQQvDD7dSE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?loADX5im6liIfEfOBXqRZjKQlOXvyR02rgk6BaCntDBG8Rk3dhuvJQcPlf4C?=
 =?us-ascii?Q?M0uXb9DUIC565ZviIayIGtz8z04zt7ACbvbiSoUHN1YZZdAqXsHxsNs416Im?=
 =?us-ascii?Q?+46AwYlsEcwJem45mAMdpdkP+TwxYD+dCC0O5OYZxzYRA808VdccuZHEbZ5g?=
 =?us-ascii?Q?5MIBS3hwjX7bsUP+AUxB2BM5AIf4FFH9yIsjQDm9rjS432ZyFlXa8REh/gLI?=
 =?us-ascii?Q?AzWlVV2LTwzpEw5xh5NhQX67pcJXptYkUFDsqBZyWLidRwFlQ5dySy2t80eC?=
 =?us-ascii?Q?dNAuyqQTqad+2mJfggI76BImAzs+Ifi2JMW4aQPSYXGUBnh8LTnRYKVEsNxZ?=
 =?us-ascii?Q?DTvqWZ8MzZ0ypn0YqWXgv6rFRQS0mqRcoAqBml7dNky1+02rRBfQ7QAU7xxq?=
 =?us-ascii?Q?667r9oXsSpN/ST4TZFRhtiwEU9An+J3nUu8QHNV+pwrhi7k4ZZGScAtdr3fK?=
 =?us-ascii?Q?Y/61siMYXNKxOPr1L8EwwjJY5RtlpjiIRokR+JHymKVHqvOCJ7bdB1pRZIFm?=
 =?us-ascii?Q?fXQcAr6lXGLfIl4RcPZMLzgBL8jSSlmp9ZgziZvUTJIzjeoMWhHIMPrSUYcm?=
 =?us-ascii?Q?Qt/SKGh/EjaugJ+DHpxUJWlnRR2Jjlj5gvKZ+KWqoH9jMmRvkatVJk/EmjBt?=
 =?us-ascii?Q?UkX2ZyC1r6I8ELXjOdNpTJUuiJGxvfPh4aCNLf9JFM715IJkYs4oGSnorUfj?=
 =?us-ascii?Q?exzMgh0yGwDMJ97DGlk3t5D33xNNe85GqM7ho4UKzsixDKEpRS73y0zs11aC?=
 =?us-ascii?Q?x5BHq8GAFIjH9vmPRArVx5T5NYu4YBrvLUF/x4Yw6h3g497loql4vCNcXkuC?=
 =?us-ascii?Q?++WPH0Vu466M87AmGVsor2IF34V6/RnVHLbN2bqfsDkiy8V6s0K9S1YvYF5g?=
 =?us-ascii?Q?Dp9vHT7YdmuaGOju/SNC6zWxo2duuZ6e0YJDxd8HP/+CpZjisVjrCmx8DTwM?=
 =?us-ascii?Q?BwUXVoyWqqu4cKNMvmdvs67/zUIBhCcgfvqDkASTPaUaok+xsWdzN7LYhi67?=
 =?us-ascii?Q?KWU/cET+A/p2SWGIp1qDtVbEu3ojeKIWB1wyhTS1xGBDbBs9Qy7Yk40P7yro?=
 =?us-ascii?Q?XJLViIXBK0sr2FL9SBJTb0u8Y9M0orvHiDRhoWOSbVxFaCDafKEZuY2tUAp7?=
 =?us-ascii?Q?eI7OMeG48ryhw8qLkgiNfWuaeacbvW65+taXI4I3W4QCRY9UHZ8wQ3HoYoSF?=
 =?us-ascii?Q?fG4Op9YWYutFihQYzWAAIEvjVkSzSZIIMaAqdWuEFbUvWW6pNq/mw8X2Lf8y?=
 =?us-ascii?Q?In3ANKlXsdSoCSy/L/MDxKzfHv9yGlJ2ahNGU0SbR5aOSJJ0J84AyLmZombL?=
 =?us-ascii?Q?RuzW2KLAu+Y5ql8BrPRI7n2LRzM3+953FNb2OeEnomp+GVpXfUBovkz0lXED?=
 =?us-ascii?Q?XZAInfkujjGj7/+DOjFmOwfZrHRRiST9zfPyDMTEPzd6DjUaytLJ2vPGKwFE?=
 =?us-ascii?Q?m9K4auDZDrO8jMDowwj6n0rgjkty13XXxQ96g95kXWKOqIB3Pw3J6CwiGarg?=
 =?us-ascii?Q?M9cV0aNs2+DvQmTnxGm1ilzr5w+9Aflp3TSKjP4nU4IklvKH2WvRw4+svDCo?=
 =?us-ascii?Q?pOhbiiH8siNlB38COu+YG2bsgUEIq9NObD/8B6udHZP1ddeqq7C8Wbtsp/OO?=
 =?us-ascii?Q?np20wF2G13FGTvu24Qg85IbTo0FbXHevtdJaJPo1OKK2QDpIpnVGcru1PQMA?=
 =?us-ascii?Q?5CyqavmY2X0lePWsPlTgI6L+bbOZN8rpQe83cj+1w3QMuTT5A/b9cPeQnGkp?=
 =?us-ascii?Q?f1E3tS+vMNjxsZdrUbGE7s4FlSloZSk=3D?=
X-Exchange-RoutingPolicyChecked: A1GCMn2ua7G8qE9BS4awrfFBHM58ijgsPTL4jgrK88QmhnUrwxnlA0/u6FrVNY8fJjX/eG76D+Kvqxb+g81h6V4bRDpHsYojfMpzgdLkO2gP9AKXGWmUWk4MjnEzYRi0S5KLNeYhxxOyICCryuDCTHsLtDCWlOCZeJndaS2le7erC3OZECiZ0BdhGvr6fkcdOPuHq85DD79mjoxpYM2LuBCUu4AfUKc5TCeLOnRUYi2siG74Odgzi6fDZq/ZqKA1MFUX2e3nzZBCrK88f2EupdizCU6c25LckpbPJ6M0LFylu1Yi4OLUzRxz/T7IPL06quihOQcQkKDparOLQvHs1w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a3e9b6-f23e-4cbc-348e-08deed60f51e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:03:01.9854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ACvw9Iz8L/hClqoxIr3BqLv78D33uzkNvJe+tJk3BxWApltsZeDfJxv9/ZtgBvnDEVWLn7Z7N79Zt4/fGkBimtpkOQef5mJsWe/hII1LYxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6246
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

Meson does not automatically propagate static library dependencies
to executables via link_with.  lib_igt_device_scan internally links
lib_igt_drm_stub and lib_igt_tools_stub but does not reexport them
through its declare_dependency.  As a result intel_gpu_top must list
them explicitly, otherwise the linker cannot resolve symbols such as
is_i915_device and igt_log at final link time.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tools/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 4c67dde4f..53aa31056 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -105,7 +105,8 @@ install_subdir('registers', install_dir : datadir)
 executable('intel_gpu_top', 'intel_gpu_top.c',
 	   install : true,
 	   install_rpath : bindir_rpathdir,
-	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,math])
+	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,
+	                   lib_igt_drm_stub, lib_igt_tools_stub, math])
 
 executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
 	   dependencies : [tool_deps],
-- 
2.53.0

