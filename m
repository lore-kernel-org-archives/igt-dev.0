Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9EEC53200
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:10:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D9110E390;
	Wed, 29 Jul 2026 11:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UPubJvBx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0FB10E982
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785323029; x=1816859029;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=AcReeq75NCn+sSpjdmOlTtWL/O5I5h90J8hz08wD9js=;
 b=UPubJvBxqmhP1NNCfFYjJf36xT/BrQuOg8Pmr+7QB6qnRzpaD2tMHwcf
 +Iw5ewbfk8deLD/q91okBoPZs04TcrtNy4BEb31L6dOOxyiZzuWvFGX6r
 wz71eiZy/kT1UPLgM9Lu7YUuFNTw0B2UrBJePhbQjmTiFI626z21/r5N1
 Q/Epg8MmGw9sdCeBw4ygxgxTqUJwE2+n1ItNPIuGsbkG1ei4hkaCJcROX
 5ZpEYUojEIltuHa+jpqt5Wki4FjQKXe+YzQuWx9ap7RBaUVVcwewkN0eq
 PkwRgD2A3++KBd8nr22jEYdD0N2Rhha/dY+Yq3eRSK0+ehP8S1BJqmffh g==;
X-CSE-ConnectionGUID: 5kiq0OglSlCtZ5lmdPr3aw==
X-CSE-MsgGUID: UVH8qMXCRS+tqRW6Bs9GXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89743526"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="89743526"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:42 -0700
X-CSE-ConnectionGUID: I4Ja55McRL2saEf97aLF/g==
X-CSE-MsgGUID: GLG4qaLZT4W96vx5OnE+iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="256652913"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:42 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:03:42 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ayjIAPBiQ9/ylqnIzymQUoX4hnDBUQIr99sHrbprE1Z8kcYya1NqCkrgJ4UVgxrW9KUWUbges1RysH6BitR/0EcOY/QWnE6cs4GGxUGwWvwxwEB3EGTKErDyDOman9mqzdFrbtYABF5uR87Ka++VWcpz2BuIbSq8JHJpZQGI6m78oQ3FU7o7/3RjG5XoTxqYpNihgnYgEtoyeDOlZoZh6ihEk8+uXK78wdZfkjCRjQI8QUs7Mx86qS5QI0sNH++mc6RCqjGYXczn0+WjZ6jbhcSvJsQ0ktur37BD/xypTc6NzvJKTcev6n1I+jxBIKMguSYA7nYKhS6gGxXCFGaCDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/g3UkL96RvSZB5F4BmSesZuk9DXteg8sAKonZ27uXE=;
 b=pMa9KktfbcuEegOw9Vg0x7A20gfH0xmoNAdX1ix/nvuRuCjFIyaD/SDXm9PbpR6PvcDmEpoVXqpNsQFOvm7lyoUj+7I4f7WpaFx4mMy8AV6svge/sgk0DUuFrFHVCHKrXix1aA+4Gl1TUWfpnENACHahwFptLJyaHyvLDjnSkFOAGnNX8M50uDXhcfxIxYraqDvEBqg675DnzYUWVGOM0IlAGyTQXw2qAao1QNVoqbKfX9lCVSQGweRAMCftpNN0Ovp7yXr32SxvYWkx6podLv9tuTASg6cLZvIvndm2/ybvHQyOJ/uNtgom85H48mQvx8Be25jxw61CjlMt0zDw0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MN0PR11MB6302.namprd11.prod.outlook.com (2603:10b6:208:3c2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:03:38 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:03:38 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 25/31] tools/intel_infoframes: link with
 minimal sub-libraries
Date: Wed, 29 Jul 2026 13:03:42 +0200
Message-ID: <02a3145e1c997965abeb23dfb1856dac7a09076d.1785152675.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|MN0PR11MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: 411ddabd-002a-4551-f9be-08deed610ad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: r4Ei6qeJxTAPg8xeYm21SUgHLi7KLaz8+ZspkXDWREVUicso/gQxKRQytRsOzEKD9wB8pFcC42xMVpiSLC6RbeYCVQMP8cyYlwcBtjjfpXIut4VptrnRwLR6E6Soc0nr1cKgz2JrAB+W9BungiF/ZFkE8Sj0jSmozEP6yVF5eeDjezBGYiXvtGRKuf+7nGOgsUlbOZLgcyfKKtD8BcZQzJ+VdF4yAQFRhIhAO0RBYu25sHUYhu3UjDLEK/+Q+iCElAtBedIkSTXUqdiW0GWjhlezdeXM1kPfFWdyW+Zl4yyA01QtyjtVqADyB6hQVY95S+7quD9tJMtyDY4I0oymtIUaeoymVlczh9NVMOvya6JnODRf2wNeKe3xAtpdwBq6kMc3wz+yfaEeUReHmk/2LKGb0NGdz6YRo0I8uLpwIUsX57EtcturQVb+l97g9TWLpta4p3UKPuuGSMiaKpZuy0hXTvihP5MUwBiupgtQCkS7B0Cc4r/TrxJFKpLncfzlbN5x7M7xItb2C+g3BTLtau7TFQTAKxZKzG//WWP4/c4G0mLC7DtYCNvPOhDPK9hqjevzZUn66HSN9QN9E/HmqUXuerCJZmUlkRNCC9QIEjYDMojulyiXQufDX/bpehumv98ggfIY8mQuUZRPwNbIeUqfWN6hYzOSU8w31zTgJIg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/RG6asE+qoai6u/Wjen771/LX+FybmngDL+jcoeT3/i60dyyL02TCbOae4MC?=
 =?us-ascii?Q?jKc06JpIeHj5SiZnB6WnwDAuq5RbZkS+/gMbRRJf8dSZRIrPAznKKKZzRu/2?=
 =?us-ascii?Q?DmSmwAAVktKeVAJIhEm82/oGWnEk3BlWmXYKM5Fnu0lbaYU5QHNssF1Eluaf?=
 =?us-ascii?Q?YE6rUVaLc69GAnQ6f1zn9MP+JPj8Bs6DchaJfNaVtQvdKvyOgPoAF0zpbuR+?=
 =?us-ascii?Q?K0OxKrxVnfj38yiiaDcTF61+iA4hycZw/IBjcD3284NwUKvvrzjEalHSUhQF?=
 =?us-ascii?Q?gXTVJyCtSsIK+P8bludt+o+Q2H4CLnEpSws5G/d1Jdd4tjPuCnHQQroCpOSP?=
 =?us-ascii?Q?Sd79cp5WNuaS5cpbi5HyQpv4H2ZKHVPPNkBDbTM4y1psUIjYTQcLQPmNWMBN?=
 =?us-ascii?Q?ANzjPI6qLY7Id2ug7fSJ3YwX4yClBLCmZQEKy3ea56B8TOPjy4ZnEGC8xBqE?=
 =?us-ascii?Q?fhiZDxM5TOBSSIUNJZNMczl28S5jZ/enEcs2K+cvQiaKghk3HnAkspONt2ea?=
 =?us-ascii?Q?RsryOZy/296DAtR0SEvDsiGP/CEPCjRgLVd2r4WLPPG4AXI22t1ksDbBUQoR?=
 =?us-ascii?Q?codDTlyAv6j5E2613v0w3JxpgOTU9863/v37taw0sZRQtVOQ799JjfGLnrYO?=
 =?us-ascii?Q?55CCg+pC9EcJ6VRjRdH2TdE8nPdcV0/4a1J9PPKiophHyPiPuNYmxC+60KwL?=
 =?us-ascii?Q?Jg+RjjLZCs4jY6d3S4MHQGDpJqEjPKSsT0njkpHAoyBCSigezhsd3FxIEILV?=
 =?us-ascii?Q?zSo4yQyYRCJ1tmkLGHuxpzZoZk2LI+ultNSALN3V9KzWRs39101kUeNoQ4Ug?=
 =?us-ascii?Q?KPHNkDu+FzXZ6RlpvyRWWUL7KQYhJFUdna9CR/oWAk1cBG0Bvodk9Mz6fNpC?=
 =?us-ascii?Q?rB2LltpvzW7AkXHnB9lyOgD+8gCMm/xbvKqunKlI+2l5m5Q8lQ18/5jtAsoy?=
 =?us-ascii?Q?i3tG2BLkzggJ7VtYwOReI3ff0eeHF5xPbNOKv4lGUqtLNsQ3f/AO5lwo3G0t?=
 =?us-ascii?Q?6MqAOlCZFW+xVxYVZ97g7ZFly9uQmJvjI7y6My816lzwp/VM9tHzqg5kYS0M?=
 =?us-ascii?Q?O1VIXybBHQYy0lQGbsh/T6A0VOJm35c1ByLs1nvl2JEfUrRYrL47tV9MQouA?=
 =?us-ascii?Q?xQmiBq8Jucig6JHSFoamYJ32BAdN/aTJ5nZohnG9evHlo6FmlVJxZwdjxgxH?=
 =?us-ascii?Q?n98lCGzaTnvMApu2HBWdXchhJTT5Ptr42R2wdfMYoVzG5BKE1ScGEizsP3Xc?=
 =?us-ascii?Q?DwKBzgkxXkQhy6vgGEv0Oc3z5kqcJFZ0nE7wsZW3sKFpg79QO+dAqTG0cFgZ?=
 =?us-ascii?Q?okX+WaNZ2aWUr057fdq+dxUwOyf8Vyq6pANmEJbsbyOSLxydPlnzunLb0Lj8?=
 =?us-ascii?Q?GS3JfqayW9PmYt8Zcl8+ko63c4ISlfVhZx97crtaOokrO8of5WaS8YIlM5QE?=
 =?us-ascii?Q?Qit7J6KgaXbl+0608mKsJe+/IjQWVOf/CkGFwZDG4puKiPpXgzYFbdIhKIYP?=
 =?us-ascii?Q?66q4nqN7qMpL9Xcb8v3pNr+gqhJ+D7+1VenVYLD8j62ayrpMgW6SsBLdmuaM?=
 =?us-ascii?Q?8Dp3JGSZrweXCqqMnx7DvDTetbhTvwGN26pDd+1mvDDjb5SjYCRLwrYb30yb?=
 =?us-ascii?Q?f+WVfQTXvy0HCAWFkzkQ4AWKg/iZbmDftJbQPuvkiyROc57Q9VVgvwkpBf99?=
 =?us-ascii?Q?yZY4YflAQddjBjKVy6eRXumuuC5rEMVrjeKN2U1LfzmUO89liw1hQDH8aSdy?=
 =?us-ascii?Q?tqq63rVy5ptHS8dBhvOAjOedkyAHQvw=3D?=
X-Exchange-RoutingPolicyChecked: PiD1oaiKdopJBubnF8n6nCLrLi5+RUCR7kBwNuITov+BQPSu/ad1drx74rKaUjA/J/Zid9NnPLXka16EAjAcxS4Sh8b+grfqMc1o7nzo2SImFfDc2LJO266dRpIrINIfRcoimccmLrYVg1nQObGWhGcJoxwM6OmjzFeXOb/g/WGQpyM7TMUlNuuy9SfaYxvDq4mseq8NOwV1f/pH3wde1w8Ez5JdPyS2Ue3I8eeMlw20smpiFDp0LQzndCsMH5znXnNw8RbSBmV9wHiBTjWUxnq86TJ6vCzf4ydAWaiUbgawh/YMpI4P8I+RKFLojAGbm+hrZjKLv3tNmBBNvy5ZsQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 411ddabd-002a-4551-f9be-08deed610ad7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:03:38.6167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d6GoI+7rtfpX353nxqfJq0v5L3ug0Mfz5REAfSnx8jwFYN3W0/Qf2zJ1aftzpQCAi34b10ZSrNfRz4V5ZOfgZj6pHA43DkGpCoDM7IyXVP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6302
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

intel_infoframes only needs the register/MMIO helper subset, not the
full libigt.so stack.

Switch to linking against lib_igt_reg_tools.

ldd before: 35  (ldd | wc -l)
ldd after:   5  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 32a345e9d..a31b6d0ed 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -20,7 +20,6 @@ tools_progs = [
 	'intel_display_poller',
 	'intel_framebuffer_dump',
 	'intel_hdcp',
-	'intel_infoframes',
 	'intel_opregion_decode',
 	'intel_panel_fitter',
 	'intel_perf_counters',
@@ -116,6 +115,11 @@ executable('intel_guc_logger', 'intel_guc_logger.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_infoframes', 'intel_infoframes.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

