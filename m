Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E14CC54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40AA10E53B;
	Wed, 29 Jul 2026 11:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQ5PPO7D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945A910E053
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785322999; x=1816858999;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=nE1rvd5F0kkN+Xd92Mp66Ym0AHOlNpDI/H4n3w2cIgU=;
 b=DQ5PPO7DjPr2TokgNxWQLv4tjjQ8WacXYyI4O2t+/QwtvuxbOoTda7TG
 eJv0HasBDiSwypFX3iC1quWkfZ6UP2GHwCQmg3BjDe8ZXsdviyICJmXtv
 u45kCAeqUZq9X/Mdok4Ga6sDnF3Le0LwrtEXjdh/XkzE+qF4R8P+5O8bH
 C/+O3c7961/nNFKBlZS6l9kt6uaU41evqv0yrQA9Vxir4M/scEgSs3b4z
 1K46a/3j2tj1rVLMSmk6oS2F5+xSx2Twn/0hmEqyj0d5M6hkyGWKZNR7X
 6moro2689egt2Ut+wRESvEFuviOCUlLdr07AnohmsAfPq+P+60ApnQApZ Q==;
X-CSE-ConnectionGUID: ITeNAr5oRzKuM88iwwWnKg==
X-CSE-MsgGUID: JGEt5PqoTs+Q7ogsnz7R5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89743486"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="89743486"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:19 -0700
X-CSE-ConnectionGUID: /GO83ZsnTWe2KuWgbnkbkw==
X-CSE-MsgGUID: MpL2HE33SGa3UKhJLSRHSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="256652816"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:19 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:03:19 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IJfENPoVIMeoxPO611gunp4qB3cUu5wLQDy8uuFakGaAnYzqS3S/HlimVrylPDeyySPAAqOccokRjb4ODiJST+qUjp3OcfEY6yCBclExAVxdKicyYWx2W+JmD1xrUsuBzVhXZjAw445e3gIjxnJkHS6N7rtZQhOJ5ZsW1e0OUs1N+dSGWVhR1Xt4QtPftvjg9zr8wZP+dQAqMV2fi4V5RBsPu491N09SrFm7bDS553pkEgK6G0IoS/BUvHAMWFH86hB10uoFXUVls/UhutNr1SOtP/VQIIHhoncuJXpy0aEevLqV7pxDbTCbxIjwyObAKuCezKwIyg512jTnJ2bz/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJXCHDA0Z7RTF1eEoQUWLj+53BRb+CzwZFUQd+w8vnM=;
 b=vxsD63FraozYZPtm0HFYDNpZ5FK0fJXzuQ3oBARQJCFKxNKrH8rQlMyAeiczM7O/YUW1sZEs9PnWHTmC7z3LhaBieJv/TokN69Bmnd8EA0waDU84t0Tnq56Zv2/2tVBFKWTX9HCOFKbPV9Y/wwxMI1hcrZCInJVy48+nOAvmc4/8GlchyB0NmMPeug3pBDVJYNsyDsgUcJ5/Pp5Uxm8REQwwt88f94S4h70O4+0c+lLCN4crJ/E7OIIlSo69Hyp6hGbO7pUp/+nM308gkAvFcZ9o0VC2TEG2jb9JMsB+38qKd1JbBqTvPataXZW+2YKH1pJmH3JEDICVWfWLg00gng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS7PR11MB6246.namprd11.prod.outlook.com (2603:10b6:8:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:03:16 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:03:16 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 15/31] tools/intel_gtt: link with minimal
 sub-libraries
Date: Wed, 29 Jul 2026 13:03:32 +0200
Message-ID: <be5f03a76753349f96f17f22427b55d8b175414d.1785152675.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: cb1efb4a-6bfe-4bc8-8869-08deed60fde7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: zl+Buav9xK5s6jzWDjNl+LoTdvVi2C6OoLC4qw8y1zz8MkkkhgAFUnLd0jQ6Osa46sEJCVLMF9g1ATODSc1znO+Ck8LVsmrIKOyJNFLyplbinmi1GrSr9hzA+b01+uDEB3rfVgH10U/fG0Epyx7SqluwAm3hTjeblpVTkXZyclOaz81jnCzpweyqj6qJdsx+9Seik7ayvbscycTYzk/HECVausF2SIlw/asPgwfP/wRRRqY3ZeGzPqZM8mSZJVogLY4n/BbHLP7dndrceP5rWmj9MahfZnVQJtLBl523jX8hCci8WN47+2pDbY9htgnnToKQiRREUv01QdI3DEdyQCxrsem6sD2U0ueCALsgnb0ZQycHUdfI+X/79N95QMevv4ahd2g0mgeQLjYNUSfYMLM4vInAw75qH4i/3X4W+l/ZwLJ5vStk1oJ41fDn6UaXvpzLfccGgwPPhgdt1H0yHIK1fpPLetr5N5m7CpD72XkwmxSDEZ+HxAIMXhR0fQHZQS6fyQw9+lZdXg16cNzssPY/GVQvnFCMg/8lqgHK/mFF08pYqo60S/343f8HuzMKMEOBkEdlTkCIH4TCNzYIPuslfEedbwVY+FPun+EhicsxUbmbHbIyJbP0Pnqg2dxdxa8uYxv4HJhnTxViYjOg3l/YaQ6tXmL07Bd0Xr71FFI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WhrR8TLIzPr0FjbsKHr10iJyC0ZSbhG2YsnBoHrBv5FAm8WlXeIheMlNBS6T?=
 =?us-ascii?Q?wgNwx0aNt+wpeKm4qifR5inJSVLoOjRLVw+rvr9RAfCXYmvYJ7lBi1+Loza2?=
 =?us-ascii?Q?f1GwWCjpdqS+ZfPRZVrpr/VY52ZvvC9YZzhACEnGDejhanBE8Pu6KEWIfJhJ?=
 =?us-ascii?Q?m8oZCwxK7idxjS6h8Xmizp33s43Z9xa8in0lnb1gp7Wb8E1fz8llJPdyee7Q?=
 =?us-ascii?Q?6fWDM4naoQNm6cEUIodExtHtU93QEq4cPbALUHRMDo98Y7vhKvYUe/elLsCg?=
 =?us-ascii?Q?ignPSZkFvC7xl3nmld6VBRe6IQAjozBBywpZokdCwybnOxnc7rrt19tx/y4w?=
 =?us-ascii?Q?bAyLQgsMplljJc5et3w2dDbc3ZM84MGD8nnKjPE6xXVKoB+95JQYM9yzYD9H?=
 =?us-ascii?Q?BaQn8m5SqZ/T+EgTPi5OUywMwnFprMlahiBka5ewH4Srv4nZtdVgonW206ox?=
 =?us-ascii?Q?rOBNauS3MkXf2djHZTSv+DXWd6DCFzgUahMMVSIhyK6lImoeIpcIwt/mddsZ?=
 =?us-ascii?Q?nsqlkgKI+gmGQNYOPybNhzh1o55IlEXohxzSvJ1BqU08/SwrBdnGUzGeKj/J?=
 =?us-ascii?Q?Tr6JFlpe/L+L9mB5BI4ZQbYw58eeUZbrW0cuHNrPF7ZtyxsZ5Q7KOG00zYZU?=
 =?us-ascii?Q?adUS0/F57Jx8BvI72E6d2KlkEZMU/p0LzcVy6psGhnYxE8pqLWUb5f+KY7ko?=
 =?us-ascii?Q?1BBfaa6T+l/PxA6b8RA9xUNJrL3vZLujoEELKVz/OWWPwCDvQLLAXlAXaajO?=
 =?us-ascii?Q?sIGxgio5Ed8b6XAxnwATxN1zE3mymVSx+/f1K0d7ngr+5EkvzS6ittzrI0zu?=
 =?us-ascii?Q?dmHgkySmYk7mda+8OH6uRumEE8vOdPdFxgX+EZMJSNNwXf5QIfGRvM154cqQ?=
 =?us-ascii?Q?EX31bsMAuKt5Klgfg6ERgxGGaO5wYu+/9t0MKbE9AOUA1X09Gj3yuBgVsGOW?=
 =?us-ascii?Q?VNRiFKXAKId6zWFkZh6HfscK0tMcf8Br5fPSZ5AYQ+uO3SYdgQ+nB67MM1yB?=
 =?us-ascii?Q?Ee6OR6qrf+YwSJS9mkY9eGq0MmnS3KiVFolYJFq2y2opO+G15nkKAui58H8h?=
 =?us-ascii?Q?vfNlOwHJmGHCWDA7ou3s8jrC0qjHlvKat2zw4mSohbeL+tvVd9LaYZOdkCQj?=
 =?us-ascii?Q?2soFZIe5zwkwmz20x9qyBqN5msPTLCbYN9OR+foOkXBO+NeMyCHwRGWEdxs4?=
 =?us-ascii?Q?M6G9NrCJUA/hKtXkvWkGYCha7RiHeDOkmHonAWo0xljG192+o0wo1wrKK8F4?=
 =?us-ascii?Q?cSROfrpRKQrQlTpKMyCYvMWb/vGSz3jGsU+RYTYR6Fi4ZGVFJv7gpC7ZM2df?=
 =?us-ascii?Q?cmunsYdQBk9Dw8k4ojD+Yvf/3Biw7jrUDQrgtJuIAU0tYLPaYjEThdvWaazq?=
 =?us-ascii?Q?qHpNLFwPwpKw78pq/ZleznEnQpAhB7VSvs8MQSwL8DLh37mN6wT8IVrhtUv5?=
 =?us-ascii?Q?Rgx7LptVPl1jToZQdUoDpItAYzjR5b3LNPpq8Kh4W1pzCeGYV+k0Lyy8i4Bt?=
 =?us-ascii?Q?ZcIGCCIOYAs5QhPacjoXSiW5Ovtt4nUZVSg90sS/PMwfXa2/BRCQO8hLy2Re?=
 =?us-ascii?Q?dw/KiWRFUAbAMxOd/GRXWTTrrArVd266hR50cSVVqaZ+1zunyLS/EhPvgaMe?=
 =?us-ascii?Q?hcDJSFYAHk8uKSc0uRMmZnASeJVw5dPnZLORqe43HiUon9xhxzFboBGNuRsZ?=
 =?us-ascii?Q?v8RmhplIpVuIaXVtZ9rjgUi7rWPm/Yx42z6B1Yo+c7yRCOhZfWsJfxlQCli5?=
 =?us-ascii?Q?N/DGUpZoIcjcgBBGNiv8+XqpA+S2f18=3D?=
X-Exchange-RoutingPolicyChecked: I10WG6vBSsnGZm9ZyNYdvpm1e/Ypc7//cdmv9wNAPAHEeapkliwJllhgtarlp6iSFMNjd46XikTjAcY59RO+XgNoNgg26h9uSu0FZmvsBJjJkmvafNIvv5WOlPNnJ80Sy+xMi5lDZLubxiNq6biFVj5iaa/KobM/hKdOjzgcNTWv6bWiF4LelHLyhGXxwiEWame92nT+c6Xc4N4yhwa7QEtm41IfQjU3n+AQrntuTj4jzbabDkgBohOvFxzY7bFt0O8RonBpJUYHQH0kEFBJg8ynJ5YulC2+bRu4+DzTr/FIfPd7ubT3jBbSf4Z9mA5BgwhauL9/8DyM7ZU+PGALhA==
X-MS-Exchange-CrossTenant-Network-Message-Id: cb1efb4a-6bfe-4bc8-8869-08deed60fde7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:03:16.7284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 766sbVjxZafpwS+rkQGJtOP/4WhOu3rZwfJ3RMjyMzucwZASeW1X/EPgku8gKlI4PSHwE0ZWOQyDeuOi6xtEkSyAULOn8dnWK2XK5P2Kdpc=
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

intel_gtt only needs the chipset helpers plus the small tool stubs they
rely on. The full libigt.so dependency chain is unnecessary.

Switch to linking against lib_igt_chipset, lib_igt_tools_stub,
lib_igt_drm_stub, pciaccess and libdrm.

ldd before: 35  (ldd | wc -l)
ldd after:   5  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tools/meson.build | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 8eb346321..a3fef87a9 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -25,7 +25,6 @@ tools_progs = [
 	'intel_forcewaked',
 	'intel_framebuffer_dump',
 	'intel_gpu_time',
-	'intel_gtt',
 	'intel_guc_logger',
 	'intel_hdcp',
 	'intel_infoframes',
@@ -75,6 +74,12 @@ executable('intel_stepping', 'intel_stepping.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_gtt', 'intel_gtt.c',
+	   dependencies : [lib_igt_chipset, lib_igt_tools_stub, lib_igt_drm_stub,
+	                    pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

